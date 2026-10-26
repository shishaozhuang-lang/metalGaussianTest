#!/usr/bin/env ruby

require "json"
require "rexml/document"
require "rexml/xpath"

APP = "RealityKitSplatBenchmark"

def load_rows(path)
  document = REXML::Document.new(File.read(path))
  ids = {}
  REXML::XPath.each(document, "//*[@id]") { |element| ids[element.attributes["id"]] = element }
  rows = REXML::XPath.match(document, "//row").map { |row| row.elements.to_a }
  [rows, ids]
end

def resolve(element, ids)
  while element&.attributes&.[]( "ref")
    element = ids[element.attributes["ref"]]
  end
  element
end

def text_at(row, index, ids)
  element = resolve(row[index], ids)
  return nil unless element
  element.attributes["fmt"] || element.text
end

def number_at(row, index, ids)
  element = resolve(row[index], ids)
  return nil unless element
  Float(element.text)
rescue ArgumentError, TypeError
  nil
end

def median(values)
  sorted = values.compact.sort
  return nil if sorted.empty?
  middle = sorted.length / 2
  sorted.length.odd? ? sorted[middle] : (sorted[middle - 1] + sorted[middle]) / 2.0
end

def analyze(directory)
  app_rows, app_ids = load_rows(File.join(directory, "metal-application-intervals.xml"))
  roots = app_rows.select do |row|
    text_at(row, 2, app_ids)&.include?(APP) &&
      text_at(row, 5, app_ids)&.match?(/Initial CB \d+ \(Frame \d+\)/)
  end
  raise "No Gaussian command buffers in #{directory}" if roots.empty?

  # Avoid first/last incomplete frames by taking the middle command buffer.
  root = roots[roots.length / 2]
  label = text_at(root, 5, app_ids)
  command_buffer = text_at(root, 11, app_ids)
  frame = label[/\(Frame (\d+)\)/, 1].to_i
  cpu_start = number_at(root, 0, app_ids)
  cpu_command_ns = number_at(root, 1, app_ids)

  submit_rows, submit_ids = load_rows(File.join(directory, "metal-application-command-buffer-submissions.xml"))
  submission = submit_rows.find { |row| text_at(row, 14, submit_ids) == command_buffer }
  cpu_encoder_ns = submission && number_at(submission, 6, submit_ids)

  complete_rows, complete_ids = load_rows(File.join(directory, "metal-command-buffer-completed.xml"))
  completion = complete_rows.find { |row| text_at(row, 1, complete_ids) == command_buffer }
  completion_ns = completion && number_at(completion, 0, complete_ids)

  gpu_rows, gpu_ids = load_rows(File.join(directory, "metal-gpu-intervals.xml"))
  selected_gpu = gpu_rows.select do |row|
    text_at(row, 10, gpu_ids)&.include?(APP) && text_at(row, 15, gpu_ids) == command_buffer
  end
  gpu_items = selected_gpu.map do |row|
    {
      "label" => text_at(row, 6, gpu_ids).to_s.sub(/ \(.*/, "").sub(/^.*:/, "").strip,
      "start_ns" => number_at(row, 0, gpu_ids),
      "duration_ns" => number_at(row, 1, gpu_ids),
      "start_latency_ns" => number_at(row, 4, gpu_ids)
    }
  end.select { |item| item["start_ns"] && item["duration_ns"] }
  gpu_start = gpu_items.map { |item| item["start_ns"] }.min
  gpu_end = gpu_items.map { |item| item["start_ns"] + item["duration_ns"] }.max

  memory_rows, memory_ids = load_rows(File.join(directory, "metal-current-allocated-size.xml"))
  memory_bytes = memory_rows.map do |row|
    next unless text_at(row, 3, memory_ids)&.include?(APP)
    number_at(row, 4, memory_ids)
  end.compact.max

  thermal_rows, thermal_ids = load_rows(File.join(directory, "device-thermal-state-intervals.xml"))
  thermal = thermal_rows.map { |row| text_at(row, 3, thermal_ids) }.compact.uniq.join(", ")

  present_rows, present_ids = load_rows(File.join(directory, "ca-client-present-request.xml"))
  present_times = present_rows.map do |row|
    next unless row.any? { |cell| (resolve(cell, present_ids)&.attributes&.[]( "fmt") || resolve(cell, present_ids)&.text).to_s.include?(APP) }
    number_at(row, 0, present_ids)
  end.compact.sort
  present_intervals = present_times.each_cons(2).map { |a, b| b - a }.select { |value| value > 0 }

  {
    "case" => File.basename(directory).sub(/-export$/, ""),
    "frame" => frame,
    "label" => label,
    "command_buffer" => command_buffer,
    "cpu_command_ms" => cpu_command_ns && cpu_command_ns / 1_000_000.0,
    "cpu_encoder_ms" => cpu_encoder_ns && cpu_encoder_ns / 1_000_000.0,
    "submission_to_completion_ms" => completion_ns && (completion_ns - cpu_start - cpu_command_ns) / 1_000_000.0,
    "queue_to_gpu_ms" => gpu_start && (gpu_start - cpu_start - cpu_command_ns) / 1_000_000.0,
    "gpu_active_span_ms" => gpu_start && (gpu_end - gpu_start) / 1_000_000.0,
    "gpu_encoders_ms" => gpu_items.group_by { |item| item["label"] }.transform_values do |items|
      items.sum { |item| item["duration_ns"] } / 1_000_000.0
    end,
    "memory_gib" => memory_bytes && memory_bytes / (1024.0**3),
    "thermal" => thermal,
    "median_present_interval_ms" => median(present_intervals)&./(1_000_000.0)
  }
end

puts JSON.pretty_generate(ARGV.sort.map { |directory| analyze(directory) })
