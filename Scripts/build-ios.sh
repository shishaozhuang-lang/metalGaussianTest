#!/bin/zsh
set -euo pipefail

project_dir=${0:A:h:h}
xcode_path=${XCODE27_PATH:-/Applications/Xcode-27.app}
developer_dir="$xcode_path/Contents/Developer"

if [[ ! -d "$developer_dir" ]]; then
  print -u2 "Xcode 27 not found at: $xcode_path"
  print -u2 "Set XCODE27_PATH to the installed Xcode 27 app path."
  exit 2
fi

if [[ -n "${DEVELOPMENT_TEAM_ID:-}" ]]; then
  archive_path="$project_dir/build/RealityKitSplatBenchmark.xcarchive"
  DEVELOPER_DIR="$developer_dir" xcodebuild \
    -project "$project_dir/RealityKitSplatBenchmark.xcodeproj" \
    -scheme RealityKitSplatBenchmark \
    -configuration Release \
    -destination 'generic/platform=iOS' \
    -archivePath "$archive_path" \
    DEVELOPMENT_TEAM="$DEVELOPMENT_TEAM_ID" \
    -allowProvisioningUpdates \
    archive
  print "Signed archive: $archive_path"
else
  DEVELOPER_DIR="$developer_dir" xcodebuild \
    -project "$project_dir/RealityKitSplatBenchmark.xcodeproj" \
    -scheme RealityKitSplatBenchmark \
    -configuration Release \
    -destination 'generic/platform=iOS' \
    -derivedDataPath "$project_dir/build/DerivedData" \
    CODE_SIGNING_ALLOWED=NO \
    build
  print "Unsigned app: $project_dir/build/DerivedData/Build/Products/Release-iphoneos/RealityKitSplatBenchmark.app"
fi
