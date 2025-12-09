#!/usr/bin/env bash
# Script to wait for a Docker service to be healthy
# Usage: ./wait-for-health.sh <service_name> [timeout_seconds]

set -euo pipefail

SERVICE_NAME="${1:-}"
TIMEOUT="${2:-120}"  # Default 2 minutes timeout
INTERVAL=2  # Check every 2 seconds

if [ -z "$SERVICE_NAME" ]; then
    echo "Error: Service name is required"
    echo "Usage: $0 <service_name> [timeout_seconds]"
    exit 1
fi

echo "⏳ Waiting for $SERVICE_NAME to be healthy (timeout: ${TIMEOUT}s)..."

elapsed=0
while [ $elapsed -lt $TIMEOUT ]; do
    # Get container health status
    HEALTH_STATUS=$(docker inspect --format='{{.State.Health.Status}}' "$SERVICE_NAME" 2>/dev/null || echo "no-healthcheck")
    
    # Check if container is running (for services without healthcheck)
    RUNNING_STATUS=$(docker inspect --format='{{.State.Running}}' "$SERVICE_NAME" 2>/dev/null || echo "false")
    
    if [ "$HEALTH_STATUS" = "healthy" ]; then
        echo "✅ $SERVICE_NAME is healthy!"
        exit 0
    elif [ "$HEALTH_STATUS" = "no-healthcheck" ] && [ "$RUNNING_STATUS" = "true" ]; then
        # Service doesn't have a healthcheck, but it's running
        echo "✅ $SERVICE_NAME is running (no healthcheck configured)"
        exit 0
    elif [ "$HEALTH_STATUS" = "unhealthy" ]; then
        echo "❌ $SERVICE_NAME is unhealthy!"
        docker logs --tail 20 "$SERVICE_NAME"
        exit 1
    fi
    
    # Show progress
    if [ $((elapsed % 10)) -eq 0 ] && [ $elapsed -gt 0 ]; then
        echo "  Still waiting... ($elapsed/${TIMEOUT}s) - Status: $HEALTH_STATUS"
    fi
    
    sleep $INTERVAL
    elapsed=$((elapsed + INTERVAL))
done

echo "❌ Timeout waiting for $SERVICE_NAME to be healthy after ${TIMEOUT}s"
echo "Current status: $HEALTH_STATUS"
echo "Recent logs:"
docker logs --tail 30 "$SERVICE_NAME"
exit 1
