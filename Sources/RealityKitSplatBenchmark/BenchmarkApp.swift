import SwiftUI

#if os(iOS)
@main
struct RealityKitSplatBenchmarkApp: App {
    var body: some Scene {
        WindowGroup("RealityKit Gaussian Splat Benchmark") {
            BenchmarkView()
        }
    }
}
#endif
