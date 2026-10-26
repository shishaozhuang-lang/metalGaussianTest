# RealityKit GaussianSplatComponent Benchmark

本工程使用 Apple RealityKit 的 `GaussianSplatComponent` 渲染本地 3DGS PLY，目标是与
MetalSplatter 使用相同模型做 iPhone 性能、内存和功耗对比。

## 环境要求

- Xcode 27 和 iOS 27 SDK；
- iOS 27 物理 iPhone；
- Apple7 GPU family 或更新；
- Release 构建。Gaussian splat API 是 Beta，不能用当前 Xcode 26.6 构建。

## 模型

工程默认引用以下外部模型，不复制约 2 GB 数据：

| 名称 | 点数 |
|---|---:|
| garden_images2_3k | 621,986 |
| garden_images2_7k | 1,044,530 |
| garden_images2_30k | 1,153,429 |
| bicycle120w | 1,201,422 |
| bicycle500w | 4,868,799 |

移动端 `.xcodeproj` 把现有 `SampleApp/Scenes` 作为 folder resource 打入 App，保持
`Scenes/<name>/point_cloud.ply` 目录。当前资源总量约 2.1 GiB，只适合开发机真机测试。
源目录通过 Xcode 工程中的绝对 folder reference 指向现有模型位置。

两个 bicycle 场景使用相同初始变换：

```text
position = (-0.74738, 0.00310, -3.00962)
quaternion input order = (r,x,y,z)
quaternion = (0.012308, 0.992527, 0.001505, -0.121395)
```

## 当前 SDK 下验证模型

`ModelValidator` 不依赖 RealityKit 新 API，可在当前机器运行：

```bash
cd /Users/shichen/Project/3dgs/metalsplatting/RealityKitSplatBenchmark
swift run ModelValidator
```

它检查 binary little-endian 格式、点数、vertex stride、必需 3DGS 字段和文件截断。

## Xcode 27 下打包和安装 iOS App

1. 用 Xcode 27 打开 `RealityKitSplatBenchmark.xcodeproj`。
2. 在 Signing & Capabilities 选择开发团队；如有冲突，修改 bundle identifier。
3. 选择一台运行 iOS 27 的物理 iPhone。
4. 先普通 Run 验证模型，再使用 Product > Profile 启动 Instruments Release 测试。
5. 依次选择模型、250K/500K/1M/2M/Full、depth/distance sorting 和分辨率档。
6. 每个组合预热 30 秒、记录 60 秒，至少重复三次。

也可构建未签名 Release 包（需要 Xcode 27）：

```bash
DEVELOPER_DIR=/Applications/Xcode-27.app/Contents/Developer \
xcodebuild \
  -project RealityKitSplatBenchmark.xcodeproj \
  -scheme RealityKitSplatBenchmark \
  -configuration Release \
  -destination 'generic/platform=iOS' \
  CODE_SIGNING_ALLOWED=NO build
```

真机安装需要在 Xcode 中设置 Team，或向 `xcodebuild` 传入有效签名配置。

也可以使用打包脚本：

```bash
XCODE27_PATH=/Applications/Xcode-27.app \
DEVELOPMENT_TEAM_ID=你的TeamID \
./Scripts/build-ios.sh
```

传入 Team ID 时生成签名 `.xcarchive`；不传时只生成未签名 `.app`。

## 分辨率档

移动端使用 Apple 性能指南建议的 `ARView.contentScaleFactor` 调节真实 render target：

| UI 档位 | contentScaleFactor |
|---|---:|
| 100% | 设备原生 scale × 1.00 |
| 75% | 设备原生 scale × 0.75 |
| 50% | 设备原生 scale × 0.50 |
| 33% | 设备原生 scale × 0.33 |

面板显示当前估算的 drawable 像素宽高。改变分辨率不会重新解析 PLY，保证分辨率 A/B
测试只改变渲染成本。模型、点数或排序模式改变时才重新创建 resource。

## Instruments

分别采集：

- Game Performance：Displayed Surfaces、GPU interval、submission rate；
- Time Profiler：PLY 转换和 RealityKit CPU 开销；
- Game Memory：峰值和稳定 physical footprint；
- Power Profiler/Energy Log：平均功率、总能量、每帧能量；
- Points of Interest：`PLYLoad`、`ResourceBuild`、`RenderingChanged`。

`RenderingChanged` 会记录 RealityKit 内部 `.normal/.medium/.low` 状态；它是内部自动降载，
不是应用设置的点数档。必须同时记录输入点数和 RealityKit 状态。

建议先固定 `bicycle120w + Full + depth`，按 100%、75%、50%、33% 顺序测试；再用
`bicycle500w` 做压力测试。每次切换后等待帧率和温度稳定，记录面板中的实际像素尺寸。

## 数据说明

PLY 是标准 3DGS 布局：scale 为 log-space，opacity 为 logit，因此 resource 使用：

```swift
resource.scaleActivation = .exponential
resource.opacityActivation = .sigmoid
```

高阶 SH 从 PLY 的 channel-major 布局转为 RealityKit 所需的 RGB triplet 布局。点数档采用
确定性等间隔抽样，适合性能测试，但不代表最优视觉质量；产品 LOD 应使用离线贡献度剪枝。

## 参考

- [Apple “Gaussian splats on visionOS” sample](https://developer.apple.com/documentation/visionos/gaussian-splats-on-visionos)（代码许可见 `LICENSE-APPLE-SAMPLE.txt`）
- [Apple WWDC26 “Explore advances in RealityKit”](https://developer.apple.com/videos/play/wwdc2026/279/)
- [AryanRogye/SharpOnPhone](https://github.com/AryanRogye/SharpOnPhone)（MIT，Core AI 输出直连 RealityKit buffers）
