// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "RealityKitSplatBenchmark",
    platforms: [.macOS("27.0")],
    products: [
        .executable(name: "RealityKitSplatBenchmark", targets: ["RealityKitSplatBenchmark"]),
        .executable(name: "ModelValidator", targets: ["ModelValidator"]),
    ],
    targets: [
        .executableTarget(
            name: "RealityKitSplatBenchmark",
            path: "Sources/RealityKitSplatBenchmark"
        ),
        .executableTarget(
            name: "ModelValidator",
            path: "Sources/ModelValidator"
        ),
    ]
)
