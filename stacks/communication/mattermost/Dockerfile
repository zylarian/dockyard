FROM mattermost/mattermost-team-edition:latest

# Basic metadata
LABEL maintainer="Zylarian Dockyard"
LABEL description="Mattermost Team Edition for Zylarian Dockyard"

# Expose default port
EXPOSE 8065

# Healthcheck
HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
    CMD curl -f http://localhost:8065/api/v4/system/ping || exit 1
