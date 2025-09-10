#!/bin/bash

set -e

APP_NAME="homebrew-example"
VERSION="${1:-v0.3.11}"
BUILD_DIR="build"
DIST_DIR="dist"

# Clean and create build directories
rm -rf "$BUILD_DIR" "$DIST_DIR"
mkdir -p "$BUILD_DIR" "$DIST_DIR"

# Build for a specific platform
build_platform() {
    local goos=$1
    local goarch=$2
    local ext=$3
    local archive_ext=$4
    
    local output_name="${APP_NAME}${ext}"
    local platform_name="${APP_NAME}-${goos}-${goarch}"
    local platform_dir="${BUILD_DIR}/${platform_name}"
    
    echo "Building for ${goos}/${goarch}..."
    
    mkdir -p "$platform_dir"
    
    # Build the binary
    GOOS=$goos GOARCH=$goarch go build -o "${platform_dir}/${output_name}" .
    
    # Create archive
    pushd "$BUILD_DIR" > /dev/null
    if [ "$archive_ext" = "zip" ]; then
        zip -r "../${DIST_DIR}/${platform_name}.zip" "${platform_name}/"
    else
        tar -czf "../${DIST_DIR}/${platform_name}.tar.gz" "${platform_name}/"
    fi
    popd > /dev/null
}

# Build all platforms
build_platform "darwin" "amd64" "" "tar.gz"
build_platform "darwin" "arm64" "" "tar.gz"
build_platform "linux" "amd64" "" "tar.gz"
build_platform "linux" "arm64" "" "tar.gz"
build_platform "linux" "arm" "" "tar.gz"
build_platform "windows" "amd64" ".exe" "zip"
build_platform "windows" "arm64" ".exe" "zip"

# Generate checksums
echo "Generating checksums..."
pushd "$DIST_DIR"
for file in *; do
    if [ -f "$file" ]; then
        sha256sum "$file" >> checksums.txt
    fi
done
popd

echo "Build complete! Artifacts in ${DIST_DIR}/"
