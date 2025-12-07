FROM grafana/grafana:11.0.0

LABEL maintainer="Zylarian <hostmaster@zylarian.com>"
LABEL org.opencontainers.image.source="https://github.com/grafana/grafana"
LABEL org.opencontainers.image.description="Grafana for Zylarian Dockyard"

# Healthcheck
HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
    CMD curl -f http://localhost:3000/api/health || exit 1
