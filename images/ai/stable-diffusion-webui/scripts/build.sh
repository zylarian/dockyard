#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR/.."

# Read version
VERSION=$(cat VERSION)

echo "Building Stable Diffusion WebUI v${VERSION}..."

# Build for local architecture
docker build \
    -f build/Dockerfile.debian \
    -t zylarian/dockyard-stable-diffusion-webui:v${VERSION} \
    -t zylarian/dockyard-stable-diffusion-webui:latest \
    build/

echo "Build complete!"
echo "Image: zylarian/dockyard-stable-diffusion-webui:v${VERSION}"
