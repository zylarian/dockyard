FROM clickhouse/clickhouse-server:24.3.3.102

LABEL maintainer="Zylarian <hostmaster@zylarian.com>"
LABEL org.opencontainers.image.source="https://github.com/ClickHouse/ClickHouse"
LABEL org.opencontainers.image.description="Clickhouse for Zylarian Dockyard"

# Healthcheck
HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
    CMD wget --spider http://localhost:8123/ping || exit 1
