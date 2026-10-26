# Test results

Updated: 2026-10-23 (Asia/Shanghai)

## 2026-10-23 on-device render re-test — passed

Fresh signed install and render run after the August profiles expired. The
personal team identifier changed from `798J7T9M4C` to `P6R787G285` (same Apple
ID `shishaozhuang@gmail.com`, same development certificate
`FCE0C4D6…`, which the new profile embeds — signature chain verified with
`codesign --verify --deep --strict`). Install path: Xcode 27.0 beta (27A5237l)
via `Scripts/build-ios.sh` + `DEVELOPMENT_TEAM_ID=P6R787G285`, then
`devicectl device install app`. Phone-side prerequisites had to be redone:
Developer Mode re-enabled (with reboot) and the new developer profile trusted;
first launch initially failed with "无法验证 App"/RequestDenied and passed
after a phone restart. Screenshots in `build/sim-test-2026-10-23/`.

| Model | Points | Drawable | Samples | Stable median rate | Range | PLY load | RenderingChanged | Thermal |
|---|---:|---|---:|---:|---|---:|---:|---|
| bicycle120w | 1,201,422 | 1320 × 2868 | 213 | 51.0 Hz | 43.5–55.8 | 0.105 s | 0 | nominal→fair |
| bicycle500w | 4,868,799 | 1320 × 2868 | 284 | 14.8 Hz | 10.3–18.8 | 1.077 s (cold) | 0 | fair |

Both scenes verified visually from `devicectl device capture screenshot` —
the bicycle/garden splat renders correctly at both point counts. Behavior
matches August qualitatively: 120w runs near the display ceiling, 500w is
GPU-bound, and `GaussianSplatEvents.RenderingChanged` never fires. Absolute
rates are ~15% below the August cold-device numbers (51.0 vs 60.0,
14.8 vs 17.4), consistent with a warm device after repeated installs/reboots
in this session rather than a code change. The 500w PLY load of 1.077 s vs
0.239 s in August is a cold-cache first read. Free-team note: the embedded
profile expires 2026-10-29; after that the app stops launching until
re-archived with a fresh profile.

## 2026-10-20 local re-test (no device connected)

Environment: `/Applications/Xcode.app` 26.6 (17F113) is the only installed
toolchain at the default path; Xcode 27.0 beta (27A5237l) survives only as
`~/Downloads/Xcode-beta.app`. iPhone 17 Pro Max not connected
(`devicectl` state `unavailable`). All five PLY models are still present at the
referenced `Scenes` path (2.1 GiB total).

- `swift run -c release ModelValidator` (Xcode 26.6): 5/5 PASS, same vertex
  counts/strides/sizes as the August run.
- `swift build --product RealityKitSplatBenchmark` (Xcode 26.6): fails as
  documented — `GaussianSplatResource` not in the 26.6 SDK.
- iOS app Release build with `DEVELOPER_DIR=~/Downloads/Xcode-beta.app`,
  destination `iPhone 17 Pro, OS=27.0`: **BUILD SUCCEEDED** (unsigned,
  `Release-iphoneos`, 2.1 GiB bundle). Note: with this beta,
  `-destination 'platform=iOS Simulator,id=…'` fails to resolve even though the
  UDID is listed, and a name-based destination silently produced a device
  binary; pass `-sdk iphonesimulator` explicitly if a simulator build is wanted.
- **Simulator rendering is impossible in this beta.** SDK-level check of
  RealityFoundation swiftinterfaces: `GaussianSplat*` exists only in iPhoneOS
  (device) and XROS (device) SDKs; iPhoneSimulator, XRSimulator and MacOSX
  SDKs do not expose it. The simulator build fails with
  `cannot find type 'GaussianSplatResource'`. A real render run therefore
  requires the physical iPhone (connected + unlocked, plus a signing Team for
  install, or Xcode GUI Run).

## Fixed-resolution retest — completed

This is the current primary resolution matrix. `Native max` uses the complete
iPhone drawable. The two 9:16 modes use a centered 9:16 ARView and explicitly
lock the RealityKit Metal drawable; the actual drawable size was read back at
runtime rather than inferred from a percentage.

| Model | Points | Resolution mode | Actual drawable | Stable update rate | PLY load | RenderingChanged events | Reported Status |
|---|---:|---|---:|---:|---:|---:|---|
| bicycle120w | 1,201,422 | Native max | 1320 × 2868 | 60.0 Hz | 0.074 s | 0 | no event / unknown |
| bicycle120w | 1,201,422 | 1080 × 1920 | 1080 × 1920 | 60.0 Hz | 0.065–0.071 s | 0 | no event / unknown |
| bicycle120w | 1,201,422 | 540 × 960 | 540 × 960 | 60.0 Hz | 0.058 s | 0 | no event / unknown |
| bicycle500w | 4,868,799 | Native max | 1320 × 2868 | 17.4 Hz | 0.239 s | 0 | no event / unknown |
| bicycle500w | 4,868,799 | 1080 × 1920 | 1080 × 1920 | 19.0 Hz | 0.233 s | 0 | no event / unknown |
| bicycle500w | 4,868,799 | 540 × 960 | 540 × 960 | 21.5 Hz | 0.239 s | 0 | no event / unknown |

The 120w runs remained at the display's 60 Hz ceiling in all three modes. For
500w, reducing Native max to 1080 × 1920 improved update rate by about 9%, and
reducing to 540 × 960 improved it by about 24%. This modest scaling compared
with the 4× and 7.3× pixel-count reductions indicates that splat count, sorting,
and Gaussian processing dominate over final pixel fill for this scene.

No `GaussianSplatEvents.RenderingChanged` event was received in any of these six
runs, including the Native max 500w case at approximately 17.4 Hz. Therefore no
`Status` difference was observed between the models or fixed resolutions.

## Xcode single-frame Metal trace matrix — completed

The six configurations above were recaptured on 2026-08-26 with Xcode's
`Metal System Trace` on the same physical iPhone. Each row below is one complete
Gaussian command buffer selected near the middle of its trace. “Submit → GPU” is
queue latency after CPU encoding/commit; “submit → complete” includes both that
queue latency and GPU execution, so it must not be interpreted as CPU time or as
the app's frame interval.

| Model | Points | Actual drawable | Stable update rate | Selected frame | CPU command encoding | Metal encoder CPU | Submit → GPU queue | GPU active span | GPU sort | Gaussian render | Submit → complete | Metal memory | Thermal |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---|
| bicycle120w | 1,201,422 | 1320 × 2868 | 60.0 Hz | 25 | 0.142 ms | 0.075 ms | 1.800 ms | 15.933 ms | 6.406 ms | 8.410 ms | 17.864 ms | 0.52 GiB | Nominal |
| bicycle120w | 1,201,422 | 1080 × 1920 | 60.0 Hz | 29 | 1.295 ms | 0.681 ms | 7.826 ms | 16.833 ms | 7.599 ms | 8.649 ms | 24.794 ms | 0.47 GiB | Nominal |
| bicycle120w | 1,201,422 | 540 × 960 | 60.0 Hz | 32 | 1.161 ms | 0.597 ms | 0.688 ms | 10.694 ms | 6.730 ms | 3.837 ms | 11.488 ms | 0.43 GiB | Fair |
| bicycle500w | 4,868,799 | 1320 × 2868 | 17.4 Hz | 16 | 0.977 ms | 0.529 ms | 46.123 ms | 63.868 ms | 36.431 ms | 26.038 ms | 110.098 ms | 1.46 GiB | Nominal |
| bicycle500w | 4,868,799 | 1080 × 1920 | 19.0 Hz | 27 | 1.068 ms | 0.568 ms | 55.498 ms | 68.960 ms | 40.746 ms | 27.318 ms | 124.589 ms | 1.41 GiB | Fair |
| bicycle500w | 4,868,799 | 540 × 960 | 21.5 Hz | 32 | 1.233 ms | 0.661 ms | 47.062 ms | 56.824 ms | 39.415 ms | 17.223 ms | 104.059 ms | 1.37 GiB | Fair |

The profiler capture and the stable-rate run are intentionally reported as two
different measurements. Metal tracing adds device-side instrumentation overhead,
and the six traces were taken sequentially; their CAMetalDrawable median present
intervals were 16.64–16.68 ms for 120w and 51.58–66.74 ms for 500w. Therefore the
single-frame durations explain the workload but must not replace the lower-overhead
stable update rates in the first table.

### Bottleneck conclusion

This is not an application CPU bottleneck. Across all six traces, CPU command-buffer
encoding is only 0.142–1.295 ms and Metal encoder CPU work is only 0.075–0.681 ms.
The 500w frames instead spend 56.824–68.960 ms executing on the GPU. The largest
single pass is RealityKit's internal `A3DGS.GPUSortWorker.Sort` at
36.431–40.746 ms, followed by `A3DGS.encodeRender` at 17.223–27.318 ms.

The large gap between GPU active span and submit-to-complete lifetime is GPU queue
pressure: RealityKit keeps multiple command buffers in flight, so the selected
command buffer waits 46.123–55.498 ms for earlier GPU work before it starts. That
waiting can overlap the execution of other frames; adding it to GPU active time
does not produce an independent end-to-end CPU frame time. The low-resolution
500w case still spends 39.415 ms sorting, which also explains why reducing pixel
count improves performance much less than proportionally.

No project-side CPU wait, excess per-frame asset upload, or synchronous readback
was found, so no source change was made before this matrix. The dominant passes
belong to RealityKit's private Gaussian implementation rather than an app-owned
pipeline or shader. Meaningful project-level performance levers are point-count
LOD/culling, avoiding unnecessary re-sorts when the view is static, and reducing
drawable resolution; replacing the internal sort would require a custom renderer.

Raw captures and exported tables are under `build/traces-2026-08-26/`. The
machine-readable aggregate is `build/traces-2026-08-26/summary.json`, and
`Scripts/analyze-metal-traces.rb` reproduces the extraction from the exported XML.

## Earlier percentage-scale matrix — completed

Environment:

- Xcode 27.0 beta (27A5237l), iOS 27 SDK
- Physical iPhone 17 Pro Max (`iPhone18,2`), portrait orientation
- Release build, depth sorting, full point count, fixed initial camera
- Native portrait drawable: 1320 × 2868
- Each row is a fresh process and approximately 10 stable one-second samples
- Frame/update rate is measured from `SceneEvents.Update`

| Model | Points | Scale | Drawable pixels | Stable update rate | PLY load | RenderingChanged events | Reported Status |
|---|---:|---:|---:|---:|---:|---:|---|
| bicycle120w | 1,201,422 | 100% | 1320 × 2868 | ~60 Hz cold; ~43 Hz after sustained matrix | 0.066–0.079 s | 0 | no event / unknown |
| bicycle120w | 1,201,422 | 75% | 990 × 2151 | 60.0 Hz | 0.067 s | 0 | no event / unknown |
| bicycle120w | 1,201,422 | 50% | 660 × 1434 | 60.0 Hz | 0.074 s | 0 | no event / unknown |
| bicycle120w | 1,201,422 | 33% | 435 × 946 | 60.0 Hz | 0.071 s | 0 | no event / unknown |
| bicycle500w | 4,868,799 | 100% | 1320 × 2868 | 17.6 Hz | 0.239 s | 0 | no event / unknown |
| bicycle500w | 4,868,799 | 75% | 990 × 2151 | 18.9 Hz | 0.240 s | 0 | no event / unknown |
| bicycle500w | 4,868,799 | 50% | 660 × 1434 | 21.0 Hz | 0.228 s | 0 | no event / unknown |
| bicycle500w | 4,868,799 | 33% | 435 × 946 | 22.2 Hz | 0.848 s first cold-cache run | 0 | no event / unknown |

The device reported `NSProcessInfoThermalState(rawValue: 1)` (fair) throughout the
matrix. The repeated 120w/100% run after the four 500w runs fell to approximately
43 Hz even though the public thermal state remained fair, so the cold 60 Hz result
and sustained-load result are both retained rather than presenting a misleading
single average.

`GaussianSplatEvents.RenderingChanged` did not fire in any of the eight cases.
Consequently, `unknown` means “no RenderingChanged event was received”; it is not
an Apple enum case and the locally initialized `limited = false` must not be treated
as an affirmative framework report. In particular, the 500w/100% case ran near
17.6 Hz without an event, demonstrating that `RenderingChanged.Status` isn't a
simple FPS or resolution performance tier.

## Model validation — passed

Command:

```bash
swift run -c release ModelValidator
```

| Model | Vertices | Vertex stride | SH degree | File bytes | Result |
|---|---:|---:|---:|---:|---|
| garden_images2_3k | 621,986 | 248 B | 3 | 154,254,059 | PASS |
| garden_images2_7k | 1,044,530 | 248 B | 3 | 259,044,972 | PASS |
| garden_images2_30k | 1,153,429 | 248 B | 3 | 286,051,924 | PASS |
| bicycle120w | 1,201,422 | 248 B | 3 | 297,954,188 | PASS |
| bicycle500w | 4,868,799 | 248 B | 3 | 1,207,463,684 | PASS |

The validator confirmed binary little-endian PLY, required Gaussian fields,
vertex counts and strides, SH3 coefficient layout, and sufficient body length.

## RealityKit render build — passed

Command:

```bash
swift build --product RealityKitSplatBenchmark
```

The Xcode 27 Release build, automatic signing, physical-device installation, launch,
Gaussian rendering, gesture interaction, and resolution matrix all passed.

## iOS packaging structure — passed

`xcodebuild -list -project RealityKitSplatBenchmark.xcodeproj` successfully parses the
mobile project and reports the `RealityKitSplatBenchmark` target and shared scheme.
Build settings resolve to `iphoneos`, deployment target 27.0, and bundle identifier
`com.shichen.RealityKitSplatBenchmark`. The resource phase references the complete
2.1 GiB existing `Scenes` folder.

The signed app contains all five PLY resources and installs successfully on iOS 27.
The matrix above measures frame/update behavior; a dedicated Instruments Power
Profiler capture remains a separate test because update rate is not a power metric.
