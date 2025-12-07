# Dify API - LLM App Development Platform

Production-ready Docker image for [Dify](https://dify.ai/) API (Backend), an open-source LLM app development platform.

**Version:** 0.10.1 | **Architectures:** amd64, arm64

*Maintained by [Zylarian Innovations LLC](https://github.com/zylarian)*

## 🚀 Quick Start

This image provides the **API backend** for Dify. It requires PostgreSQL and Redis to function.

### Docker Compose (Recommended)

```yaml
version: '3.8'

services:
  api:
    image: zylarian/dockyard-dify-api:latest
    ports:
      - "5001:5001"
    environment:
      - DB_USERNAME=dify
      - DB_PASSWORD=dify
      - DB_HOST=postgres
      - DB_PORT=5432
      - DB_DATABASE=dify
      - REDIS_HOST=redis
      - REDIS_PORT=6379
      - REDIS_DB=0
      - SECRET_KEY=sk-your-secret-key
    depends_on:
      - postgres
      - redis

  worker:
    image: zylarian/dockyard-dify-api:latest
    command: celery -A app.celery worker -P gevent -c 1 -Q dataset,generation,mail --loglevel INFO
    environment:
      - DB_USERNAME=dify
      - DB_PASSWORD=dify
      - DB_HOST=postgres
      - DB_PORT=5432
      - DB_DATABASE=dify
      - REDIS_HOST=redis
      - REDIS_PORT=6379
      - REDIS_DB=0
      - SECRET_KEY=sk-your-secret-key
    depends_on:
      - postgres
      - redis

  postgres:
    image: postgres:15-alpine
    environment:
      - POSTGRES_DB=dify
      - POSTGRES_USER=dify
      - POSTGRES_PASSWORD=dify
    volumes:
      - postgres-data:/var/lib/postgresql/data

  redis:
    image: redis:7-alpine
    volumes:
      - redis-data:/data

volumes:
  postgres-data:
  redis-data:
```

## 📦 Available Tags

| Tag | Description |
|-----|-------------|
| `latest` | Latest stable version |
| `0.10.1` | Specific version |
| `0.10.1-debian` | Specific version with explicit Debian tag |

## ⚙️ Configuration

### Environment Variables

Key variables:
- `DB_HOST`, `DB_PORT`, `DB_USER`, `DB_PASSWORD`, `DB_NAME`: Database connection
- `REDIS_HOST`, `REDIS_PORT`, `REDIS_PASSWORD`: Redis connection
- `SECRET_KEY`: Application secret key
- `LOG_LEVEL`: Logging level (INFO, DEBUG, etc.)

See [Dify Documentation](https://docs.dify.ai/) for full list.

## 🔗 Links

- [Dify Official Website](https://dify.ai/)
- [Dify GitHub](https://github.com/langgenius/dify)
- [Report Issues](https://github.com/zylarian/dockyard/issues)
