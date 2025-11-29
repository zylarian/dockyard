# Getting Started with Zylarian Dockyard

Welcome to Zylarian Dockyard! This guide will help you get started with deploying Docker stacks quickly and easily.

## Prerequisites

Before you begin, ensure you have:

- **Docker** installed (version 20.10+)
- **Docker Compose** installed (version 2.0+)
- Basic understanding of Docker concepts
- Terminal/command line access

### Check Your Installation

```bash
# Check Docker version
docker --version

# Check Docker Compose version
docker-compose --version
```

## Basic Workflow

### 1. Choose a Stack

Browse the `stacks/` directory to find the service you need:

```bash
cd zylarian-dockyard
ls stacks/
```

Categories available:
- `apps/` - Applications (WordPress, Nextcloud, etc.)
- `databases/` - Databases (PostgreSQL, MySQL, MongoDB, etc.)
- `devtools/` - Development tools (Gitea, Jenkins, etc.)
- `monitoring/` - Monitoring solutions (Grafana, Prometheus, etc.)
- `networking/` - Network tools (Traefik, Nginx, etc.)
- `storage/` - Storage solutions (MinIO, Seafile, etc.)

### 2. Navigate to Your Chosen Stack

```bash
cd stacks/databases/postgresql
```

### 3. Read the Documentation

Each stack has its own README with specific instructions:

```bash
cat README.md
# or
less README.md
```

### 4. Configure Environment

Copy the example environment file:

```bash
cp .env.example .env
```

Edit the `.env` file with your preferred editor:

```bash
nano .env
# or
vim .env
# or
code .env
```

**Important:** Always change default passwords and secrets!

### 5. Deploy the Stack

Start all services:

```bash
docker-compose up -d
```

The `-d` flag runs containers in detached mode (background).

### 6. Verify Deployment

Check that all containers are running:

```bash
docker-compose ps
```

You should see all services with "Up" status.

### 7. View Logs

Check logs to ensure everything started correctly:

```bash
# All services
docker-compose logs

# Follow logs (Ctrl+C to exit)
docker-compose logs -f

# Specific service
docker-compose logs app
```

## Common Commands

### Starting Services

```bash
# Start all services
docker-compose up -d

# Start specific service
docker-compose up -d postgres
```

### Stopping Services

```bash
# Stop all services (keeps data)
docker-compose stop

# Stop and remove containers (keeps data)
docker-compose down

# Stop and remove everything INCLUDING VOLUMES (data loss!)
docker-compose down -v
```

### Restarting Services

```bash
# Restart all services
docker-compose restart

# Restart specific service
docker-compose restart app
```

### Updating Services

```bash
# Pull latest images
docker-compose pull

# Recreate containers with new images
docker-compose up -d
```

### Viewing Status

```bash
# Service status
docker-compose ps

# Resource usage
docker stats

# Inspect specific service
docker-compose exec app env
```

## Directory Structure

Understanding the stack structure:

```
stack-name/
├── docker-compose.yml      # Main configuration
├── .env.example            # Environment template
├── .env                    # Your config (DO NOT COMMIT)
├── README.md               # Stack documentation
├── configs/                # Custom configurations
│   └── app.conf
└── data/                   # Persistent data (auto-created)
    ├── app_data/
    └── db_data/
```

## Environment Variables

### Why They Matter

Environment variables keep sensitive data (passwords, keys) out of your configuration files.

### Best Practices

1. **Never commit `.env` files** - They contain secrets
2. **Use strong passwords** - Generate random ones
3. **Document all variables** - Comments in `.env.example`
4. **Use project names** - Set `COMPOSE_PROJECT_NAME` to avoid conflicts

### Generate Secure Values

```bash
# Random password (32 characters)
openssl rand -base64 32

# Random hex string (for keys)
openssl rand -hex 32

# UUID
uuidgen
```

## Networking

### Container-to-Container Communication

Containers in the same Docker Compose project can communicate using **service names** as hostnames:

```yaml
# In docker-compose.yml
services:
  app:
    environment:
      - DB_HOST=postgres  # Use service name, not localhost
```

### Exposing Ports

Ports are mapped as `HOST_PORT:CONTAINER_PORT`:

```yaml
ports:
  - "8080:80"  # Access via http://localhost:8080
```

### Custom Networks

Most stacks define custom networks for security:

```yaml
networks:
  frontend:    # Public-facing
  backend:     # Internal only
```

## Data Persistence

### Volumes

Docker volumes persist data even when containers are removed:

```bash
# List volumes
docker volume ls

# Inspect volume
docker volume inspect postgres_postgres_data

# Backup volume (example)
docker run --rm -v postgres_data:/data -v $(pwd):/backup alpine tar czf /backup/backup.tar.gz /data
```

### Backup Strategy

1. **Regular backups** - Schedule automated backups
2. **Test restores** - Verify backups work
3. **Off-site storage** - Store backups externally

## Troubleshooting

### Container Won't Start

```bash
# Check logs
docker-compose logs service-name

# Common issues:
# - Port already in use → Change port in .env
# - Missing environment variable → Check .env
# - Permission denied → Check volume permissions
```

### Port Already in Use

```bash
# Find what's using the port
sudo lsof -i :8080

# Change the port in .env
echo "APP_PORT=8081" >> .env
docker-compose up -d
```

### Permission Issues

```bash
# Check container user
docker-compose exec app id

# Fix volume permissions (if needed)
sudo chown -R 1000:1000 ./data
```

### Cannot Connect to Service

```bash
# From host
curl http://localhost:8080

# Check if port is exposed
docker-compose ps

# Check service is healthy
docker-compose exec app wget -O- http://localhost:80
```

### Clean Reset

```bash
# Stop and remove everything
docker-compose down -v

# Remove orphaned containers
docker-compose down --remove-orphans

# Start fresh
docker-compose up -d
```

## Production Considerations

### Security

- [ ] Change all default passwords
- [ ] Use Docker secrets for sensitive data
- [ ] Enable HTTPS/TLS
- [ ] Limit port exposure
- [ ] Keep images updated
- [ ] Use non-root users
- [ ] Enable security scanning

### Performance

- [ ] Set resource limits
- [ ] Configure health checks
- [ ] Enable logging rotation
- [ ] Monitor resource usage
- [ ] Optimize images (alpine, slim)

### Reliability

- [ ] Configure restart policies
- [ ] Implement backups
- [ ] Test disaster recovery
- [ ] Monitor uptime
- [ ] Set up alerts

## Next Steps

1. **Explore stacks** - Browse `stacks/` directory
2. **Deploy your first stack** - Try PostgreSQL or Redis
3. **Customize configurations** - Adapt to your needs
4. **Contribute** - Add your own stacks!

## Getting Help

- **Documentation**: Each stack has detailed README
- **Issues**: Check existing GitHub issues
- **Contributing**: See [CONTRIBUTING.md](./CONTRIBUTING.md)

Happy deploying! 🚀
