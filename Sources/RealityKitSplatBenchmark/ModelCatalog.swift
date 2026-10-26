import Foundation
import simd

struct BenchmarkScene: Identifiable, Hashable {
    let id: String
    let url: URL
    let position: SIMD3<Float>
    let orientation: simd_quatf

    #if os(iOS)
    private static func modelURL(_ name: String) -> URL {
        Bundle.main.url(forResource: "point_cloud", withExtension: "ply", subdirectory: "Scenes/\(name)")!
    }
    #else
    static let sourceRoot = URL(fileURLWithPath: "/Users/shichen/Documents/Codex/2026-08-12/di/outputs/MetalSplatter-macOS15-adapted/SampleApp/Scenes")
    private static func modelURL(_ name: String) -> URL {
        sourceRoot.appending(path: name).appending(path: "point_cloud.ply")
    }
    #endif

    private static let names = [
        "garden_images2_3k",
        "garden_images2_7k",
        "garden_images2_30k",
        "bicycle120w",
        "bicycle500w",
    ]

    static let builtIn: [BenchmarkScene] = names.map { name in
        return BenchmarkScene(
            id: name,
            url: modelURL(name),
            // The reference iOS renderer keeps splats in their source coordinate system
            // and applies the requested pose to the camera, not to the model.
            position: .zero,
            orientation: simd_quatf(angle: 0, axis: [0, 1, 0])
        )
    }
}

enum ResolutionScale: String, CaseIterable, Identifiable {
    case native = "Native max"
    case fullHD = "1080 × 1920"
    case halfHD = "540 × 960"

    var id: Self { self }
    var targetPixels: CGSize? {
        switch self {
        case .native: nil
        case .fullHD: CGSize(width: 1080, height: 1920)
        case .halfHD: CGSize(width: 540, height: 960)
        }
    }

    func viewportSize(in available: CGSize) -> CGSize {
        guard let targetPixels else { return available }
        let aspect = targetPixels.width / targetPixels.height
        let width = min(available.width, available.height * aspect)
        return CGSize(width: width, height: width / aspect)
    }
}

enum PointBudget: String, CaseIterable, Identifiable {
    case k250 = "250K"
    case k500 = "500K"
    case m1 = "1M"
    case m2 = "2M"
    case full = "Full"

    var id: Self { self }
    var limit: Int? {
        switch self {
        case .k250: 250_000
        case .k500: 500_000
        case .m1: 1_000_000
        case .m2: 2_000_000
        case .full: nil
        }
    }
}
