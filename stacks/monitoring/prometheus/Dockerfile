FROM prom/prometheus:v2.51.0

LABEL maintainer="Zylarian <hostmaster@zylarian.com>"
LABEL org.opencontainers.image.source="https://github.com/prometheus/prometheus"
LABEL org.opencontainers.image.description="Prometheus for Zylarian Dockyard"

# Copy configuration
COPY prometheus.yml /etc/prometheus/prometheus.yml

# Healthcheck
HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
    CMD wget --spider http://localhost:9090/-/healthy || exit 1
