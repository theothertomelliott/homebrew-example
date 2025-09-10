#!/bin/bash

set -e

VERSION="${1:-v0.0.1}"
DIST_DIR="dist"

if [ ! -d "$DIST_DIR" ]; then
    echo "No dist directory found. Run ./build.sh first."
    exit 1
fi

echo "Creating GitHub release $VERSION..."
gh release create "$VERSION" \
    --title "Release $VERSION" \
    --notes "Release $VERSION"

echo "Uploading binaries..."
gh release upload "$VERSION" "${DIST_DIR}"/*.tar.gz "${DIST_DIR}"/*.zip

echo "Release created: https://github.com/$(gh repo view --json owner,name -q '.owner.login + "/" + .name')/releases/tag/$VERSION"
