#if os(iOS)
import Foundation
import Combine
import Observation
import os
import QuartzCore
import RealityKit
import SwiftUI
import UIKit

private let pointsLog = OSLog(subsystem: "RealityKitSplatBenchmark", category: .pointsOfInterest)

@MainActor @Observable
final class BenchmarkState {
    var selectedScene: BenchmarkScene
    var pointBudget = PointBudget.full
    var resolutionScale: ResolutionScale
    var useDistanceSorting = false
    var status = "Ready"
    var drawablePixels = "—"
    var renderingStatus = "unknown"
    var sourceCount = 0
    var renderedCount = 0
    var fileLoadSeconds = 0.0
    var resourceBuildSeconds = 0.0
    var updateRate = 0.0
    var isRenderingLimited = false
    var thermalState = ProcessInfo.processInfo.thermalState
    private var asset: RealityKitSplatAsset?
    private var anchor: AnchorEntity?
    private var cameraAnchor: AnchorEntity?
    private var cameraEntity: PerspectiveCamera?
    private var updateSubscription: (any Cancellable)?
    private var renderingSubscription: (any Cancellable)?
    private var lastUpdateSample = ContinuousClock.now
    private var updateCount = 0
    private var manualYaw: Float = 0
    private var manualPitch: Float = 0
    private var zoomScale: Float = 1
    private var sampleNumber = 0
    private var renderingChangedEventCount = 0

    private static let dragRotationRadiansPerPoint: Float = 0.006
    private static let initialCameraPosition = SIMD3<Float>(-0.74738, 0.00310, -3.00962)
    private static let initialCameraOrientation = simd_quatf(
        ix: 0.992527,
        iy: 0.001505,
        iz: -0.121395,
        r: 0.012308
    ).normalized
    private static let baseFieldOfViewDegrees: Float = 65

    init() {
        let arguments = ProcessInfo.processInfo.arguments
        func value(after option: String) -> String? {
            guard let index = arguments.firstIndex(of: option),
                  arguments.indices.contains(index + 1) else { return nil }
            return arguments[index + 1]
        }
        let model = value(after: "--model") ?? "bicycle120w"
        selectedScene = BenchmarkScene.builtIn.first { $0.id == model }
            ?? BenchmarkScene.builtIn.first { $0.id == "bicycle120w" }!
        let resolution = value(after: "--resolution") ?? "native"
        resolutionScale = ResolutionScale.allCases.first {
            $0.rawValue.caseInsensitiveCompare(resolution) == .orderedSame ||
            ($0.targetPixels.map { "\(Int($0.width))x\(Int($0.height))" } == resolution.lowercased())
        } ?? .native
    }

    func updateResolution(of view: ARView, nativeScale: CGFloat) {
        if let target = resolutionScale.targetPixels, view.bounds.width > 0 {
            // UIKit snaps the SwiftUI frame to the device's native pixel grid,
            // which can make a nominal 9:16 viewport one pixel short after a
            // custom content scale. Keep the ARView bounds at the exact target
            // aspect before RealityKit derives its drawable size.
            view.bounds.size.height = view.bounds.width * target.height / target.width
            view.contentScaleFactor = target.width / view.bounds.width
            (view.layer as? CAMetalLayer)?.drawableSize = target
        } else {
            view.contentScaleFactor = nativeScale
        }
        let actual = (view.layer as? CAMetalLayer)?.drawableSize
            ?? CGSize(width: view.bounds.width * view.contentScaleFactor,
                      height: view.bounds.height * view.contentScaleFactor)
        let width = Int(actual.width.rounded())
        let height = Int(actual.height.rounded())
        drawablePixels = "\(width) × \(height)"
    }

    func load(into view: ARView) async {
        configureCamera(in: view)
        status = "Loading \(selectedScene.id)"
        let loadID = OSSignpostID(log: pointsLog)
        os_signpost(.begin, log: pointsLog, name: "PLYLoad", signpostID: loadID)
        let loadStart = ContinuousClock.now
        do {
            let scene = selectedScene, budget = pointBudget.limit
            let loaded = try await Task.detached(priority: .userInitiated) {
                try loadPLYBuffers(url: scene.url, pointLimit: budget)
            }.value
            fileLoadSeconds = Self.elapsed(since: loadStart)
            sourceCount = loaded.sourceCount; renderedCount = loaded.renderedCount
            os_signpost(.end, log: pointsLog, name: "PLYLoad", signpostID: loadID, "points=%d", loaded.renderedCount)

            let resourceID = OSSignpostID(log: pointsLog)
            os_signpost(.begin, log: pointsLog, name: "ResourceBuild", signpostID: resourceID)
            let resourceStart = ContinuousClock.now
            let mode: GaussianSplatResource.SortingMode = useDistanceSorting ? .distance : .depth
            let newAsset = try RealityKitSplatAsset(buffers: loaded, sortingMode: mode,
                                                    position: scene.position, orientation: scene.orientation)
            resourceBuildSeconds = Self.elapsed(since: resourceStart)
            os_signpost(.end, log: pointsLog, name: "ResourceBuild", signpostID: resourceID, "points=%d", loaded.renderedCount)
            if let anchor { view.scene.removeAnchor(anchor) }
            let newAnchor = AnchorEntity(world: .zero)
            newAnchor.addChild(newAsset.entity); view.scene.addAnchor(newAnchor)
            anchor = newAnchor; asset = newAsset
            applyInteractionTransform()
            subscribe(scene: view.scene, entity: newAsset.entity)
            status = "Running"
        } catch {
            status = "Failed: \(error.localizedDescription)"
            os_signpost(.end, log: pointsLog, name: "PLYLoad", signpostID: loadID)
        }
    }

    func rotate(byX deltaX: Float, y deltaY: Float) {
        manualYaw += deltaX * Self.dragRotationRadiansPerPoint
        manualPitch = min(.pi / 2, max(-.pi / 2,
                                      manualPitch + deltaY * Self.dragRotationRadiansPerPoint))
        applyInteractionTransform()
    }

    func zoom(by scale: Float) {
        guard scale.isFinite, scale > 0 else { return }
        zoomScale = min(4, max(0.5, zoomScale * scale))
        applyInteractionTransform()
    }

    private func applyInteractionTransform() {
        guard let entity = asset?.entity else { return }
        let yaw = simd_quatf(angle: manualYaw, axis: [0, 1, 0])
        let pitch = simd_quatf(angle: manualPitch, axis: [1, 0, 0])
        entity.orientation = pitch * yaw * selectedScene.orientation
        cameraEntity?.camera.fieldOfViewInDegrees = Self.baseFieldOfViewDegrees / zoomScale
    }

    private func configureCamera(in view: ARView) {
        guard cameraEntity == nil else { return }
        let camera = PerspectiveCamera()
        camera.position = Self.initialCameraPosition
        camera.orientation = Self.initialCameraOrientation
        camera.camera.fieldOfViewInDegrees = Self.baseFieldOfViewDegrees
        let anchor = AnchorEntity(world: .zero)
        anchor.addChild(camera)
        view.scene.addAnchor(anchor)
        cameraAnchor = anchor
        cameraEntity = camera
    }

    private func subscribe(scene: RealityKit.Scene, entity: Entity) {
        updateCount = 0; lastUpdateSample = .now
        updateSubscription = scene.subscribe(to: SceneEvents.Update.self) { [weak self] _ in
            Task { @MainActor in self?.recordUpdate() }
        }
        renderingSubscription = scene.subscribe(to: GaussianSplatEvents.RenderingChanged.self, on: entity) { [weak self] event in
            Task { @MainActor in
                self?.renderingChangedEventCount += 1
                self?.isRenderingLimited = event.isRenderingLimited
                self?.renderingStatus = String(describing: event.renderingStatus)
                let message = "RK_RENDERING_CHANGED model=\(self?.selectedScene.id ?? "unknown") " +
                    "resolution=\(self?.resolutionScale.rawValue ?? "unknown") " +
                    "limited=\(event.isRenderingLimited) status=\(String(describing: event.renderingStatus))"
                NSLog("%@", message)
                os_signpost(.event, log: pointsLog, name: "RenderingChanged",
                            "limited=%{public}d status=%{public}@",
                            event.isRenderingLimited ? 1 : 0, String(describing: event.renderingStatus))
            }
        }
    }

    private func recordUpdate() {
        updateCount += 1
        let seconds = Self.elapsed(since: lastUpdateSample)
        guard seconds >= 1 else { return }
        updateRate = Double(updateCount) / seconds; updateCount = 0; lastUpdateSample = .now
        thermalState = ProcessInfo.processInfo.thermalState
        sampleNumber += 1
        let message = "BENCHMARK_SAMPLE index=\(sampleNumber) model=\(selectedScene.id) " +
              "resolution=\(resolutionScale.rawValue) pixels=\(drawablePixels.replacingOccurrences(of: " × ", with: "x")) " +
              "points=\(renderedCount) hz=\(String(format: "%.2f", updateRate)) " +
              "ply_s=\(String(format: "%.4f", fileLoadSeconds)) resource_s=\(String(format: "%.4f", resourceBuildSeconds)) " +
              "limited=\(isRenderingLimited) rk_status=\(renderingStatus) rk_events=\(renderingChangedEventCount) " +
              "thermal=\(String(describing: thermalState))"
        NSLog("%@", message)
    }
    private static func elapsed(since start: ContinuousClock.Instant) -> Double {
        let value = start.duration(to: .now).components
        return Double(value.seconds) + Double(value.attoseconds) / 1e18
    }
}

private final class BenchmarkRenderView: ARView {
    var didLayout: ((BenchmarkRenderView) -> Void)?

    override func layoutSubviews() {
        super.layoutSubviews()
        didLayout?(self)
    }
}

struct BenchmarkARView: UIViewRepresentable {
    let state: BenchmarkState
    final class Coordinator: NSObject, UIGestureRecognizerDelegate {
        var nativeScale: CGFloat = 1
        var lastLoadKey = ""
        weak var state: BenchmarkState?

        @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
            let translation = gesture.translation(in: gesture.view)
            state?.rotate(byX: Float(translation.x), y: Float(-translation.y))
            gesture.setTranslation(.zero, in: gesture.view)
        }

        @objc func handlePinch(_ gesture: UIPinchGestureRecognizer) {
            state?.zoom(by: Float(gesture.scale))
            gesture.scale = 1
        }

        func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
                               shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
            true
        }
    }
    func makeCoordinator() -> Coordinator { Coordinator() }
    func makeUIView(context: Context) -> ARView {
        let view = BenchmarkRenderView(frame: .zero, cameraMode: .nonAR, automaticallyConfigureSession: false)
        view.environment.background = .color(.black)
        context.coordinator.nativeScale = view.contentScaleFactor
        context.coordinator.state = state
        view.didLayout = { [weak coordinator = context.coordinator] view in
            guard let coordinator else { return }
            coordinator.state?.updateResolution(of: view, nativeScale: coordinator.nativeScale)
        }
        let pan = UIPanGestureRecognizer(target: context.coordinator,
                                         action: #selector(Coordinator.handlePan(_:)))
        let pinch = UIPinchGestureRecognizer(target: context.coordinator,
                                             action: #selector(Coordinator.handlePinch(_:)))
        pan.delegate = context.coordinator
        pinch.delegate = context.coordinator
        view.addGestureRecognizer(pan)
        view.addGestureRecognizer(pinch)
        return view
    }
    func updateUIView(_ view: ARView, context: Context) {
        state.updateResolution(of: view, nativeScale: context.coordinator.nativeScale)
        let key = "\(state.selectedScene.id)|\(state.pointBudget.rawValue)|\(state.useDistanceSorting)"
        guard context.coordinator.lastLoadKey != key else { return }
        context.coordinator.lastLoadKey = key
        Task { await state.load(into: view) }
    }
}

struct BenchmarkView: View {
    @State private var state = BenchmarkState()
    @State private var showControls = true
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color.black.ignoresSafeArea()
            GeometryReader { geometry in
                let viewport = state.resolutionScale.viewportSize(in: geometry.size)
                BenchmarkARView(state: state)
                    .frame(width: viewport.width, height: viewport.height)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
            }.ignoresSafeArea()
            if showControls { controls }
            Button(showControls ? "Hide" : "Controls") { showControls.toggle() }
                .buttonStyle(.borderedProminent).padding()
        }
    }
    private var controls: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("RealityKit 3DGS Benchmark").font(.headline)
                Picker("Model", selection: $state.selectedScene) {
                    ForEach(BenchmarkScene.builtIn) { Text($0.id).tag($0) }
                }
                Picker("Points", selection: $state.pointBudget) {
                    ForEach(PointBudget.allCases) { Text($0.rawValue).tag($0) }
                }
                Picker("Resolution", selection: $state.resolutionScale) {
                    ForEach(ResolutionScale.allCases) { Text($0.rawValue).tag($0) }
                }
                Toggle("Distance sorting", isOn: $state.useDistanceSorting)
                Divider()
                metric("State", state.status); metric("Source", state.sourceCount.formatted())
                metric("Rendered", state.renderedCount.formatted()); metric("Pixels", state.drawablePixels)
                metric("PLY", String(format: "%.3f s", state.fileLoadSeconds))
                metric("Resource", String(format: "%.3f s", state.resourceBuildSeconds))
                metric("Update", String(format: "%.1f Hz", state.updateRate))
                metric("RK status", state.renderingStatus); metric("Limited", state.isRenderingLimited ? "yes" : "no")
                metric("Thermal", String(describing: state.thermalState))
            }.padding(14)
        }.frame(width: 310, height: 570)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
            .padding(.top, 58).padding(.trailing)
    }
    @ViewBuilder private func metric(_ label: String, _ value: String) -> some View {
        LabeledContent(label, value: value).font(.system(.caption, design: .monospaced))
    }
}
#endif
