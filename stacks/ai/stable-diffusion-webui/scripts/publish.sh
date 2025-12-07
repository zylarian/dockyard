#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR/.."

# Read version
VERSION=$(cat VERSION)

echo "Publishing Stable Diffusion WebUI v${VERSION} (multi-arch)..."

# Build and push multi-architecture image
docker buildx build \
    --platform linux/amd64,linux/arm64 \
    -f build/Dockerfile.debian \
    -t zylarian/dockyard-stable-diffusion-webui:v${VERSION} \
    -t zylarian/dockyard-stable-diffusion-webui:latest \
    --push \
    build/

echo "Publish complete!"
echo "Pushed: zylarian/dockyard-stable-diffusion-webui:v${VERSION}"
