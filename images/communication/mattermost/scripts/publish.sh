#!/bin/bash
set -e

# Configuration
IMAGE_NAME="zylarian/dockyard-mattermost"
VERSION=$(cat version.txt)

# Login to Docker Hub if needed
if ! docker info | grep -q "Username"; then
    echo "🔑 Logging into Docker Hub..."
    docker login
fi

# Create builder if it doesn't exist
if ! docker buildx ls | grep -q "dockyard-builder"; then
    echo "🏗️  Creating buildx builder..."
    docker buildx create --name dockyard-builder --use
fi

# Build and push multi-arch image
echo "🚀 Building and pushing $IMAGE_NAME:$VERSION..."
docker buildx build \
    --platform linux/amd64,linux/arm64 \
    --tag $IMAGE_NAME:$VERSION \
    --tag $IMAGE_NAME:latest \
    --push \
    .

echo "✅ Publish complete!"
