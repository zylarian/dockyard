#!/bin/bash
set -e

# Configuration
IMAGE_NAME="zylarian/dockyard-anything-llm"
VERSION=$(cat version.txt)

# Build image
echo "Building $IMAGE_NAME:$VERSION..."
docker build -t $IMAGE_NAME:$VERSION -t $IMAGE_NAME:latest -t $IMAGE_NAME:local .
