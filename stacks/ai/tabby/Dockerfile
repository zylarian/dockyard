FROM tabbyml/tabby:0.19.0

LABEL maintainer="Zylarian <hostmaster@zylarian.com>"
LABEL org.opencontainers.image.source="https://github.com/TabbyML/tabby"
LABEL org.opencontainers.image.description="Tabby for Zylarian Dockyard"

# Healthcheck
HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
    CMD curl -f http://localhost:8080/v1/health || exit 1
