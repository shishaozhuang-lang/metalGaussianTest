/*
 Derived from Apple's "Gaussian splats on visionOS" sample.
 See ../../LICENSE-APPLE-SAMPLE.txt for licensing information.
*/

import Foundation
import Metal
import RealityKit
import simd

enum SplatLoadError: LocalizedError {
    case invalid(String)

    var errorDescription: String? {
        switch self { case .invalid(let reason): reason }
    }
}

struct LoadedSplatBuffers: @unchecked Sendable {
    let sourceCount: Int
    let renderedCount: Int
    let degree: UInt8
    let coefficientCount: Int
    let positions: LowLevelBuffer
    let scales: LowLevelBuffer
    let rotations: LowLevelBuffer
    let opacities: LowLevelBuffer
    let sphericalHarmonics: LowLevelBuffer
}

private struct Field {
    var index = -1
    var width = 0
}

private struct Header {
    var vertexCount = 0
    var bodyOffset = 0
    var stride = 0
    var position = Field()
    var scale = Field()
    var rotation = Field()
    var opacity = Field()
    var dc = Field()
    var rest = Field()
    var restCount = 0
    var inVertex = false
    var format = ""
}

private func parseHeader(_ data: Data) throws -> Header {
    var header = Header()
    var line = ""
    for (offset, byte) in data.enumerated() {
        if byte == 0x0A {
            let fields = line.split(separator: " ").map(String.init)
            if fields.first == "format", fields.count >= 2 {
                header.format = fields[1]
            } else if fields.first == "element", fields.count >= 3 {
                header.inVertex = fields[1] == "vertex"
                if header.inVertex { header.vertexCount = Int(fields[2]) ?? 0 }
            } else if fields.first == "property", header.inVertex, fields.count == 3 {
                guard fields[1] == "float" || fields[1] == "float32" else {
                    throw SplatLoadError.invalid("Only float vertex properties are supported; found \(fields[1])")
                }
                let property = fields[2]
                let index = header.stride
                switch property {
                case "x": header.position = Field(index: index, width: 3)
                case "f_dc_0": header.dc = Field(index: index, width: 3)
                case "opacity": header.opacity = Field(index: index, width: 1)
                case "scale_0": header.scale = Field(index: index, width: 3)
                case "rot_0": header.rotation = Field(index: index, width: 4)
                case "f_rest_0": header.rest = Field(index: index, width: 0)
                default: break
                }
                if property.hasPrefix("f_rest_") { header.restCount += 1 }
                header.stride += 1
            } else if line == "end_header" {
                header.bodyOffset = offset + 1
                break
            }
            line.removeAll(keepingCapacity: true)
        } else {
            line.unicodeScalars.append(UnicodeScalar(byte))
        }
    }
    guard header.format == "binary_little_endian" else {
        throw SplatLoadError.invalid("Only binary_little_endian PLY is supported")
    }
    guard header.vertexCount > 0, header.bodyOffset > 0, header.stride > 0 else {
        throw SplatLoadError.invalid("PLY has no valid vertex data")
    }
    for (name, field) in [("position", header.position), ("scale", header.scale), ("rotation", header.rotation), ("opacity", header.opacity), ("SH DC", header.dc)] where field.index < 0 {
        throw SplatLoadError.invalid("PLY is missing \(name)")
    }
    return header
}

private func makeFloatBuffer(_ count: Int) throws -> LowLevelBuffer {
    let bytes = count * MemoryLayout<Float>.stride
    return try LowLevelBuffer(descriptor: .init(capacity: (bytes + 15) & ~15, sizeMultiple: 16))
}

private func finite(_ value: Float) -> Float { value.isFinite ? value : 0 }

/// Loads standard 3DGS binary PLY data and deinterleaves it into RealityKit buffers.
/// Point limiting uses deterministic uniform sampling so runs are repeatable.
func loadPLYBuffers(url: URL, pointLimit: Int?) throws -> LoadedSplatBuffers {
    let data = try Data(contentsOf: url, options: [.mappedIfSafe])
    let header = try parseHeader(data)
    let availableBytes = data.count - header.bodyOffset
    let requiredBytes = header.vertexCount * header.stride * MemoryLayout<Float>.stride
    guard availableBytes >= requiredBytes else {
        throw SplatLoadError.invalid("Truncated PLY body: expected \(requiredBytes), got \(availableBytes)")
    }

    let outputCount = min(pointLimit ?? header.vertexCount, header.vertexCount)
    guard outputCount > 0 else { throw SplatLoadError.invalid("Point budget is zero") }
    let tupleCount = header.restCount / 3
    let coefficientCount = tupleCount + 1
    let degree = UInt8(max(0, Int(sqrt(Double(coefficientCount))) - 1))

    let positions = try makeFloatBuffer(outputCount * 3)
    let scales = try makeFloatBuffer(outputCount * 3)
    let rotations = try makeFloatBuffer(outputCount * 4)
    let opacities = try makeFloatBuffer(outputCount)
    let sh = try makeFloatBuffer(outputCount * coefficientCount * 3)

    data.withUnsafeBytes { rawData in
        // PLY headers don't guarantee that the binary body begins at a 4-byte
        // aligned address, so use unaligned loads instead of binding the Data
        // pointer directly to Float.
        @inline(__always)
        func sourceFloat(_ floatIndex: Int) -> Float {
            let byteOffset = header.bodyOffset + floatIndex * MemoryLayout<UInt32>.stride
            let bits = rawData.loadUnaligned(fromByteOffset: byteOffset, as: UInt32.self)
            return Float(bitPattern: UInt32(littleEndian: bits))
        }
        positions.withUnsafeMutableBytes { positionBytes in
            scales.withUnsafeMutableBytes { scaleBytes in
                rotations.withUnsafeMutableBytes { rotationBytes in
                    opacities.withUnsafeMutableBytes { opacityBytes in
                        sh.withUnsafeMutableBytes { shBytes in
                            let positionOut = positionBytes.bindMemory(to: Float.self)
                            let scaleOut = scaleBytes.bindMemory(to: Float.self)
                            let rotationOut = rotationBytes.bindMemory(to: Float.self)
                            let opacityOut = opacityBytes.bindMemory(to: Float.self)
                            let shOut = shBytes.bindMemory(to: Float.self)

                            for outputIndex in 0..<outputCount {
                                let sourceIndex = outputIndex * header.vertexCount / outputCount
                                let base = sourceIndex * header.stride
                                for component in 0..<3 {
                                    positionOut[outputIndex * 3 + component] = finite(sourceFloat(base + header.position.index + component))
                                    scaleOut[outputIndex * 3 + component] = finite(sourceFloat(base + header.scale.index + component))
                                }
                                for component in 0..<4 {
                                    rotationOut[outputIndex * 4 + component] = finite(sourceFloat(base + header.rotation.index + component))
                                }
                                opacityOut[outputIndex] = finite(sourceFloat(base + header.opacity.index))

                                let shBase = outputIndex * coefficientCount * 3
                                for channel in 0..<3 {
                                    shOut[shBase + channel] = finite(sourceFloat(base + header.dc.index + channel))
                                }
                                guard tupleCount > 0 else { continue }
                                for tuple in 0..<tupleCount {
                                    for channel in 0..<3 {
                                        shOut[shBase + (tuple + 1) * 3 + channel] = finite(
                                            sourceFloat(base + header.rest.index + channel * tupleCount + tuple)
                                        )
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    return LoadedSplatBuffers(
        sourceCount: header.vertexCount,
        renderedCount: outputCount,
        degree: degree,
        coefficientCount: coefficientCount,
        positions: positions,
        scales: scales,
        rotations: rotations,
        opacities: opacities,
        sphericalHarmonics: sh
    )
}

@MainActor
final class RealityKitSplatAsset {
    let entity: Entity
    let resource: GaussianSplatResource
    let buffers: LoadedSplatBuffers

    init(buffers: LoadedSplatBuffers, sortingMode: GaussianSplatResource.SortingMode,
         position: SIMD3<Float>, orientation: simd_quatf) throws {
        self.buffers = buffers
        func descriptor(_ buffer: LowLevelBuffer, _ format: MTLAttributeFormat, _ stride: Int) -> GaussianSplatResource.BufferDescriptor {
            .init(buffer: buffer, format: format, stride: stride, offset: 0)
        }
        let resourceBuffers = try GaussianSplatResource.BufferResource(
            count: buffers.renderedCount,
            position: descriptor(buffers.positions, .float3, 12),
            scale: descriptor(buffers.scales, .float3, 12),
            rotation: descriptor(buffers.rotations, .float4, 16),
            opacity: descriptor(buffers.opacities, .float, 4),
            sphericalHarmonics: (
                descriptor(buffers.sphericalHarmonics, .float3, buffers.coefficientCount * 12),
                .init(rawValue: buffers.degree) ?? .zero
            )
        )
        resource = GaussianSplatResource(resourceBuffers)
        // Standard 3DGS PLY stores scale in log space and opacity as logits.
        resource.scaleActivation = .exponential
        resource.opacityActivation = .sigmoid
        resource.sortingMode = sortingMode

        entity = Entity()
        entity.name = "GaussianSplatComponentBenchmark"
        entity.position = position
        entity.orientation = orientation
        entity.components.set(GaussianSplatComponent(resource))
    }
}
