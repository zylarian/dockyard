#!/bin/bash
set -e

# Configuration
IMAGE_NAME="zylarian/dockyard-mattermost"
VERSION=$(cat version.txt)

# Build for local architecture
echo "🏗️  Building $IMAGE_NAME:$VERSION..."
docker build -t $IMAGE_NAME:local .
docker tag $IMAGE_NAME:local $IMAGE_NAME:$VERSION
docker tag $IMAGE_NAME:local $IMAGE_NAME:latest

echo "✅ Build complete!"
