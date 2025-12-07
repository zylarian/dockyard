# Code Server - VS Code in the Browser

Production-ready Docker image for [Code Server](https://github.com/coder/code-server), allowing you to run VS Code on any remote machine and access it in the browser.

**Version:** 4.106.2 | **Architectures:** amd64, arm64

*Maintained by [Zylarian Innovations LLC](https://github.com/zylarian)*

## 🚀 Quick Start

```bash
# Pull and run
docker run -d \
  -p 8080:8080 \
  -v ~/.config/code-server:/home/coder/.config/code-server \
  -v "$PWD":/home/coder/project \
  -e PASSWORD=yourpassword \
  --name code-server \
  zylarian/dockyard-code-server:latest

# Access at http://localhost:8080
```

## 📦 Available Tags

| Tag | Description |
|-----|-------------|
| `latest` | Latest stable version |
| `4.106.2` | Specific version |
| `4.106.2-debian` | Specific version with explicit Debian tag |

## ⚙️ Configuration

### Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `PASSWORD` | Password for access | `coder` |
| `HASHED_PASSWORD` | Hashed password (overrides PASSWORD) | - |
| `SUDO_PASSWORD` | Password for sudo access | - |
| `SUDO_PASSWORD_HASH` | Hashed sudo password | - |
| `TZ` | Timezone | `UTC` |

### Persistent Data

Mount volumes to persist configuration and projects:

```yaml
volumes:
  - ./config:/home/coder/.config/code-server
  - ./project:/home/coder/project
```

## 🔧 Docker Compose

```yaml
version: '3.8'

services:
  code-server:
    image: zylarian/dockyard-code-server:latest
    container_name: code-server
    environment:
      - PASSWORD=password
      - TZ=UTC
    ports:
      - "8080:8080"
    volumes:
      - ./config:/home/coder/.config/code-server
      - ./project:/home/coder/project
    restart: unless-stopped
```

## 🔒 Security

- Runs as non-root user (`coder`, UID 1000)
- Supports password authentication
- HTTPS support via reverse proxy (Traefik/Nginx) recommended

## 🔗 Links

- [Code Server GitHub](https://github.com/coder/code-server)
- [Report Issues](https://github.com/zylarian/dockyard/issues)
