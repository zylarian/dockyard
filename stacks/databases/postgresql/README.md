# PostgreSQL Database

Production-grade PostgreSQL database for Dockyard services.

## Quick Start

```bash
# Start PostgreSQL
make service postgresql start

# Access PostgreSQL
docker exec -it postgresql psql -U postgres

# View logs
make service postgresql logs
```

## Features

- PostgreSQL 16 (Alpine Linux)
- Persistent data storage
- Automatic initialization scripts
- Health checks
- Resource limits
- Multiple databases for services (metabase, outline)

## Configuration

Copy `.env.example` to `.env` and customize:

```bash
cp .env.example .env
```

### Environment Variables

- `POSTGRES_USER` - PostgreSQL superuser (default: postgres)
- `POSTGRES_PASSWORD` - Superuser password
- `POSTGRES_DB` - Default database name
- `TZ` - Timezone

## Databases

The following databases are created automatically:

- `postgres` - Default database
- `metabase` - For Metabase analytics
- `outline` - For Outline documentation

## Users

- `postgres` - Superuser
- `metabase` - Metabase service user
- `outline` - Outline service user

## Ports

- **5432** - PORT | External port | 5433

## Volumes

- `postgresql_data` - Database data
- `./init-scripts` - Initialization SQL scripts
- `./logs` - PostgreSQL logs

## Usage Examples

### Connect from another service

```yaml
environment:
  - DATABASE_URL=postgresql://metabase:metabase@postgresql:5432/metabase
```

### Run SQL commands

```bash
# Connect to PostgreSQL
docker exec -it postgresql psql -U postgres

# Connect to specific database
docker exec -it postgresql psql -U metabase -d metabase

# Run SQL file
docker exec -i postgresql psql -U postgres < backup.sql
```

### Backup database

```bash
# Backup
docker exec postgresql pg_dump -U postgres metabase > metabase_backup.sql

# Restore
docker exec -i postgresql psql -U postgres metabase < metabase_backup.sql
```

## Resource Usage

- **CPU**: 2 cores max, 0.5 reserved
- **Memory**: 4GB max, 512MB reserved

## Troubleshooting

### Connection issues

```bash
# Check if PostgreSQL is running
docker ps | grep postgresql

# Check logs
docker logs postgresql

# Test connection
docker exec postgresql pg_isready -U postgres
```

### Reset database

```bash
# Stop and remove
make service postgresql down

# Remove volume
docker volume rm postgresql_postgresql_data

# Start fresh
make service postgresql start
```

## Security

- Change default passwords in `.env`
- Limit network access with firewall rules
- Regular backups recommended
- Keep PostgreSQL updated

## Updates

```bash
# Pull latest image
docker pull postgres:16-alpine

# Recreate container
make service postgresql down
make service postgresql start
```
