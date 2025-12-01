# Flowise - LLM Flow Builder

Production-ready Docker image for [Flowise](https://flowiseai.com/), a drag & drop UI to build customized LLM flows with LangChain.

**Version:** 2.1.3 | **Architectures:** amd64, arm64

*Maintained by [Zylarian Innovations LLC](https://github.com/zylarian)*

## 🚀 Quick Start

```bash
# Pull and run
docker run -d \
  -p 3000:3000 \
  --name flowise \
  zylarian/dockyard-flowise:latest

# Access at http://localhost:3000
```

## 📦 Available Tags

| Tag | Description |
|-----|-------------|
| `latest` | Latest stable version (recommended) |
| `2.1.3` | Specific version |
| `2.1.3-debian` | Specific version with explicit Debian tag |
| `latest-debian` | Latest with explicit Debian tag |

## ⚙️ Configuration

### Environment Variables

```bash
docker run -d \
  -p 3000:3000 \
  -e PORT=3000 \
  -e FLOWISE_USERNAME=admin \
  -e FLOWISE_PASSWORD=admin123 \
  -e DATABASE_PATH=/app/data \
  -v flowise-data:/app/data \
  zylarian/dockyard-flowise:latest
```

**Common Variables:**
- `PORT` - Port to listen (default: `3000`)
- `FLOWISE_USERNAME` - Admin username (default: `admin`)
- `FLOWISE_PASSWORD` - Admin password (default: `admin`)
- `DATABASE_PATH` - Database storage path (default: `/app/data`)
- `APIKEY_PATH` - API keys storage path (default: `/app/data`)
- `SECRETKEY_PATH` - Secret keys storage path (default: `/app/data`)
- `LOG_PATH` - Logs storage path (default: `/app/data/logs`)
- `BLOB_STORAGE_PATH` - Blob storage path (default: `/app/data/storage`)
- `CORS_ORIGINS` - CORS allowed origins (comma-separated)
- `IFRAME_ORIGINS` - iFrame allowed origins (comma-separated)

### Persistent Data

Mount a volume to persist flows, credentials, and data:

```bash
docker run -d \
  -p 3000:3000 \
  -v flowise-data:/app/data \
  zylarian/dockyard-flowise:latest
```

## 🔧 Docker Compose

```yaml
version: '3.8'

services:
  flowise:
    image: zylarian/dockyard-flowise:latest
    container_name: flowise
    ports:
      - "3000:3000"
    environment:
      - PORT=3000
      - FLOWISE_USERNAME=admin
      - FLOWISE_PASSWORD=changeme
      - DATABASE_PATH=/app/data
      - CORS_ORIGINS=*
    volumes:
      - flowise-data:/app/data
    restart: unless-stopped

volumes:
  flowise-data:
```

## 🏥 Health Check

The image includes a built-in health check:

```bash
# Check container health
docker inspect --format='{{.State.Health.Status}}' flowise
```

## 🔒 Security

- Runs as non-root user (`flowise:flowise`, UID/GID 1000)
- Minimal base image (Node.js Debian slim)
- Built-in authentication support
- HTTPS support via reverse proxy

## 📊 Resource Requirements

**Minimum:**
- CPU: 2 cores
- RAM: 2GB
- Disk: 5GB

**Recommended:**
- CPU: 4+ cores
- RAM: 4GB+
- Disk: 10GB+

## 🔗 Database Support

Flowise supports PostgreSQL for production deployments:

```yaml
version: '3.8'

services:
  postgres:
    image: postgres:16-alpine
    environment:
      - POSTGRES_DB=flowise
      - POSTGRES_USER=flowise
      - POSTGRES_PASSWORD=flowise
    volumes:
      - postgres-data:/var/lib/postgresql/data
    restart: unless-stopped

  flowise:
    image: zylarian/dockyard-flowise:latest
    depends_on:
      - postgres
    ports:
      - "3000:3000"
    environment:
      - DATABASE_TYPE=postgres
      - DATABASE_HOST=postgres
      - DATABASE_PORT=5432
      - DATABASE_NAME=flowise
      - DATABASE_USER=flowise
      - DATABASE_PASSWORD=flowise
      - FLOWISE_USERNAME=admin
      - FLOWISE_PASSWORD=changeme
    volumes:
      - flowise-data:/app/data
    restart: unless-stopped

volumes:
  postgres-data:
  flowise-data:
```

## 🐛 Troubleshooting

**Container won't start:**
```bash
# Check logs
docker logs flowise

# Check permissions
docker exec flowise ls -la /app/data
```

**Port already in use:**
```bash
# Use different port
docker run -d -p 8080:3000 zylarian/dockyard-flowise:latest
```

**Flows not persisting:**
```bash
# Ensure volume is mounted
docker inspect flowise | grep Mounts -A 10
```

## 📝 License

Flowise is licensed under the Apache 2.0 License. This Docker image is provided as-is.

## 🔗 Links

- [Flowise Official Website](https://flowiseai.com/)
- [Flowise Documentation](https://docs.flowiseai.com/)
- [Flowise GitHub](https://github.com/FlowiseAI/Flowise)
- [Report Issues](https://github.com/zylarian/dockyard/issues)
