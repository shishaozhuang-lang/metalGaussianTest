import Foundation

struct PLYSummary {
    let url: URL
    let vertexCount: Int
    let vertexStride: Int
    let headerLength: Int
    let properties: [String]
    let fileSize: Int64

    var requiredSize: Int64 {
        Int64(headerLength) + Int64(vertexCount) * Int64(vertexStride)
    }
}

enum ValidationError: LocalizedError {
    case missingHeader(URL)
    case unsupportedFormat(String)
    case malformed(String)
    case truncated(required: Int64, actual: Int64)

    var errorDescription: String? {
        switch self {
        case .missingHeader(let url): "Cannot read PLY header: \(url.path)"
        case .unsupportedFormat(let value): "Unsupported PLY format: \(value)"
        case .malformed(let value): "Malformed PLY: \(value)"
        case .truncated(let required, let actual): "Truncated file: requires \(required) bytes, has \(actual)"
        }
    }
}

func scalarSize(_ type: String) -> Int? {
    switch type {
    case "char", "uchar", "int8", "uint8": 1
    case "short", "ushort", "int16", "uint16": 2
    case "int", "uint", "float", "float32", "int32", "uint32": 4
    case "double", "float64", "int64", "uint64": 8
    default: nil
    }
}

func inspect(_ url: URL) throws -> PLYSummary {
    let handle = try FileHandle(forReadingFrom: url)
    defer { try? handle.close() }
    let prefix = try handle.read(upToCount: 256 * 1024) ?? Data()
    guard let marker = "end_header\n".data(using: .utf8),
          let range = prefix.range(of: marker),
          let header = String(data: prefix[..<range.upperBound], encoding: .utf8) else {
        throw ValidationError.missingHeader(url)
    }

    var inVertex = false
    var vertexCount = 0
    var vertexStride = 0
    var properties: [String] = []
    var format = ""
    for line in header.split(separator: "\n").map(String.init) {
        let fields = line.split(separator: " ").map(String.init)
        guard !fields.isEmpty else { continue }
        if fields[0] == "format", fields.count >= 2 {
            format = fields[1]
        } else if fields[0] == "element", fields.count >= 3 {
            inVertex = fields[1] == "vertex"
            if inVertex { vertexCount = Int(fields[2]) ?? 0 }
        } else if fields[0] == "property", inVertex, fields.count == 3 {
            guard let size = scalarSize(fields[1]) else {
                throw ValidationError.malformed("unsupported vertex scalar \(fields[1])")
            }
            vertexStride += size
            properties.append(fields[2])
        }
    }
    guard format == "binary_little_endian" else { throw ValidationError.unsupportedFormat(format) }
    guard vertexCount > 0, vertexStride > 0 else { throw ValidationError.malformed("missing vertex declaration") }
    let attrs = try FileManager.default.attributesOfItem(atPath: url.path)
    let fileSize = (attrs[.size] as? NSNumber)?.int64Value ?? 0
    let summary = PLYSummary(
        url: url,
        vertexCount: vertexCount,
        vertexStride: vertexStride,
        headerLength: range.upperBound,
        properties: properties,
        fileSize: fileSize
    )
    guard summary.requiredSize <= summary.fileSize else {
        throw ValidationError.truncated(required: summary.requiredSize, actual: summary.fileSize)
    }
    let required = ["x", "y", "z", "f_dc_0", "f_dc_1", "f_dc_2", "opacity", "scale_0", "scale_1", "scale_2", "rot_0", "rot_1", "rot_2", "rot_3"]
    let missing = required.filter { !properties.contains($0) }
    guard missing.isEmpty else { throw ValidationError.malformed("missing fields: \(missing.joined(separator: ", "))") }
    return summary
}

let defaultRoot = "/Users/shichen/Documents/Codex/2026-08-12/di/outputs/MetalSplatter-macOS15-adapted/SampleApp/Scenes"
let defaultModels = [
    "garden_images2_3k",
    "garden_images2_7k",
    "garden_images2_30k",
    "bicycle120w",
    "bicycle500w",
].map { URL(fileURLWithPath: defaultRoot).appending(path: $0).appending(path: "point_cloud.ply") }

let arguments = Array(CommandLine.arguments.dropFirst())
let urls = arguments.isEmpty ? defaultModels : arguments.map { URL(fileURLWithPath: $0) }
var failures = 0
for url in urls {
    do {
        let value = try inspect(url)
        let shRest = value.properties.filter { $0.hasPrefix("f_rest_") }.count
        let shDegree = max(0, Int(sqrt(Double(shRest / 3 + 1))) - 1)
        print("PASS \(url.deletingLastPathComponent().lastPathComponent): vertices=\(value.vertexCount) stride=\(value.vertexStride)B SH=\(shDegree) size=\(value.fileSize)")
    } catch {
        failures += 1
        print("FAIL \(url.path): \(error.localizedDescription)")
    }
}
exit(failures == 0 ? EXIT_SUCCESS : EXIT_FAILURE)
