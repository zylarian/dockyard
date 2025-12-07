# Langfuse for Dockyard

Open source LLM engineering platform: observability, metrics, eval, prompt management, playground, datasets.

## Quick Start

```bash
make service langfuse start
```

Access the interface at http://localhost:3400

## Configuration

### Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| PORT | External port | 3400 |
| NEXTAUTH_SECRET | Auth secret | Change this! |
| SALT | Salt for encryption | Change this! |

### Dependencies

This service requires:
- **PostgreSQL**: For data storage (uses `postgresql` service)
- **Redis**: For caching and queues (uses `redis` service)
