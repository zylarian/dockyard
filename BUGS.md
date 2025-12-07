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
