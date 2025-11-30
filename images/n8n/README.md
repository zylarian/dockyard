# n8n - Workflow Automation Tool

Production-ready Docker image for [n8n](https://n8n.io/), a powerful workflow automation tool that helps you connect apps and automate tasks.

**Version:** 1.122.3 | **Architectures:** amd64, arm64

*Maintained by [Zylarian Innovations LLC](https://github.com/zylarian)*

## 🚀 Quick Start

```bash
# Pull and run
docker run -d \
  -p 5678:5678 \
  --name n8n \
  zylarian/dockyard-n8n:latest

# Access at http://localhost:5678
```

## 📦 Available Tags

| Tag | Description |
|-----|-------------|
| `latest` | Latest stable version (recommended) |
| `1.122.3` | Specific version |
| `1.122.3-debian` | Specific version with explicit Debian tag |
| `latest-debian` | Latest with explicit Debian tag |

## ⚙️ Configuration

### Environment Variables

```bash
docker run -d \
  -p 5678:5678 \
  -e N8N_HOST=0.0.0.0 \
  -e N8N_PORT=5678 \
  -e N8N_PROTOCOL=http \
  -e WEBHOOK_URL=http://localhost:5678/ \
  -v n8n-data:/home/node/.n8n \
  zylarian/dockyard-n8n:latest
```

**Common Variables:**
- `N8N_HOST` - Host to bind (default: `0.0.0.0`)
- `N8N_PORT` - Port to listen (default: `5678`)
- `N8N_PROTOCOL` - Protocol (http or https)
- `WEBHOOK_URL` - Base URL for webhooks
- `N8N_BASIC_AUTH_ACTIVE` - Enable basic auth (`true`/`false`)
- `N8N_BASIC_AUTH_USER` - Basic auth username
- `N8N_BASIC_AUTH_PASSWORD` - Basic auth password
- `EXECUTIONS_DATA_SAVE_ON_ERROR` - Save failed executions (`all`/`none`)
- `EXECUTIONS_DATA_SAVE_ON_SUCCESS` - Save successful executions (`all`/`none`)
- `EXECUTIONS_DATA_SAVE_MANUAL_EXECUTIONS` - Save manual executions (`true`/`false`)

### Persistent Data

Mount a volume to persist workflows and credentials:

```bash
docker run -d \
  -p 5678:5678 \
  -v n8n-data:/home/node/.n8n \
  zylarian/dockyard-n8n:latest
```

## 🔧 Docker Compose

```yaml
version: '3.8'

services:
  n8n:
    image: zylarian/dockyard-n8n:latest
    container_name: n8n
    ports:
      - "5678:5678"
    environment:
      - N8N_HOST=0.0.0.0
      - N8N_PORT=5678
      - N8N_PROTOCOL=http
      - WEBHOOK_URL=http://localhost:5678/
      - N8N_BASIC_AUTH_ACTIVE=true
      - N8N_BASIC_AUTH_USER=admin
      - N8N_BASIC_AUTH_PASSWORD=changeme
    volumes:
      - n8n-data:/home/node/.n8n
    restart: unless-stopped

volumes:
  n8n-data:
```

## 🏥 Health Check

The image includes a built-in health check:

```bash
# Check container health
docker inspect --format='{{.State.Health.Status}}' n8n
```

## 🔒 Security

- Runs as non-root user (`n8n:n8n`, UID/GID 1000)
- Minimal base image (Node.js Debian slim)
- Built-in basic authentication support
- HTTPS support via reverse proxy

## 📊 Resource Requirements

**Minimum:**
- CPU: 1 core
- RAM: 2GB
- Disk: 5GB

**Recommended:**
- CPU: 2+ cores
- RAM: 4GB+
- Disk: 10GB+

## 🔗 Database Support

n8n supports multiple databases. Use PostgreSQL for production:

```yaml
version: '3.8'

services:
  postgres:
    image: postgres:16-alpine
    environment:
      - POSTGRES_DB=n8n
      - POSTGRES_USER=n8n
      - POSTGRES_PASSWORD=n8n
    volumes:
      - postgres-data:/var/lib/postgresql/data
    restart: unless-stopped

  n8n:
    image: zylarian/dockyard-n8n:latest
    depends_on:
      - postgres
    ports:
      - "5678:5678"
    environment:
      - DB_TYPE=postgresdb
      - DB_POSTGRESDB_HOST=postgres
      - DB_POSTGRESDB_PORT=5432
      - DB_POSTGRESDB_DATABASE=n8n
      - DB_POSTGRESDB_USER=n8n
      - DB_POSTGRESDB_PASSWORD=n8n
    volumes:
      - n8n-data:/home/node/.n8n
    restart: unless-stopped

volumes:
  postgres-data:
  n8n-data:
```

## 🐛 Troubleshooting

**Container won't start:**
```bash
# Check logs
docker logs n8n

# Check permissions
docker exec n8n ls -la /home/node/.n8n
```

**Port already in use:**
```bash
# Use different port
docker run -d -p 8080:5678 zylarian/dockyard-n8n:latest
```

**Workflows not persisting:**
```bash
# Ensure volume is mounted
docker inspect n8n | grep Mounts -A 10
```

## 📝 License

n8n is licensed under the Sustainable Use License. This Docker image is provided as-is.

## 🔗 Links

- [n8n Official Website](https://n8n.io/)
- [n8n Documentation](https://docs.n8n.io/)
- [n8n GitHub](https://github.com/n8n-io/n8n)
- [Report Issues](https://github.com/zylarian/dockyard/issues)
