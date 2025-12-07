FROM mintplexlabs/anythingllm:master

LABEL maintainer="Zylarian <hostmaster@zylarian.com>"
LABEL org.opencontainers.image.source="https://github.com/Mintplex-Labs/anything-llm"
LABEL org.opencontainers.image.description="AnythingLLM for Zylarian Dockyard"

# Healthcheck
HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
    CMD curl -f http://localhost:3001/api/ping || exit 1
