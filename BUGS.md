# Known Bugs and Unresolved Issues

## 🚨 Critical

### Langfuse Startup Error
- **Status:** Unresolved
- **Service:** Langfuse
- **Severity:** Critical
- **Description:** Langfuse fails to start correctly, crashing with `TypeError: Cannot set property message of ZodError which has only a getter`. This appears to be a compatibility issue between Next.js 14.2.x and Zod in the Langfuse Docker image.
- **Logs:**
  ```
  Failed to prepare server [TypeError: Cannot set property message of ZodError which has only a getter]
  ⨯ unhandledRejection:  [TypeError: Cannot set property message of ZodError which has only a getter]
  ```
- **Attempted Fixes:**
  - Added `ENCRYPTION_KEY` variable.
  - Verified `CLICKHOUSE_URL` and `CLICKHOUSE_PASSWORD`.
  - Disabled Clickhouse clustering (`CLICKHOUSE_CLUSTER_ENABLED=false`).
  - Forced container recreation.

### InvokeAI Publishing Failure
- **Status:** Unresolved
- **Service:** InvokeAI
- **Severity:** High
- **Description:** Docker Hub publish fails with `400 Bad Request` due to a large layer size (>4GB).
- **Workaround:** Image covers 11GB locally and works, but cannot be pushed to Docker Hub standard repository.

## ⚠️ Service Limitations

### Tabby Requires NVIDIA GPU
- **Status:** Known Limitation
- **Service:** Tabby
- **Severity:** Medium
- **Description:** The official `tabbyml/tabby:0.19.0` Docker image only includes CUDA-compiled binaries. Even the `/opt/tabby/bin/tabby-cpu` binary internally calls `llama-server` which requires `libcuda.so.1`, making it impossible to run on CPU-only systems.
- **Error:** `error while loading shared libraries: libcuda.so.1: cannot open shared object file`
- **Attempted Fixes:**
  - Removed GPU deploy configuration from `docker-compose.yml`
  - Set `TABBY_DEVICE=cpu` environment variable
  - Changed entrypoint to `/opt/tabby/bin/tabby-cpu`
  - All approaches failed - the underlying `llama-server` binary is CUDA-only
- **Root Cause:** TabbyML official images are built with CUDA support only, with no dedicated CPU-only variant available.
- **Recommendation:** Tabby requires a system with NVIDIA GPU and NVIDIA Container Toolkit installed.
- **References:** 
  - [Feature Request: CPU-only Docker tag](https://github.com/TabbyML/tabby/issues/...)
  - See TabbyML documentation for CPU-only builds from source
