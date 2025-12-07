FROM gitea/gitea:1.21.11

LABEL maintainer="Zylarian <hostmaster@zylarian.com>"
LABEL org.opencontainers.image.source="https://github.com/go-gitea/gitea"
LABEL org.opencontainers.image.description="Gitea for Zylarian Dockyard"

# Healthcheck
HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
    CMD curl -f http://localhost:3000/api/v1/version || exit 1
