FROM ghcr.io/invoke-ai/invokeai:latest

LABEL maintainer="Zylarian <hostmaster@zylarian.com>"
LABEL org.opencontainers.image.source="https://github.com/invoke-ai/InvokeAI"
LABEL org.opencontainers.image.description="InvokeAI for Zylarian Dockyard"

# Healthcheck
HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
    CMD curl -f http://localhost:9090/api/v1/app/version || exit 1
