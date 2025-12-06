# Redis Cache

High-performance in-memory cache for Dockyard services.

## Quick Start

```bash
# Start Redis
make service redis start

# Test connection
docker exec redis redis-cli ping

# View logs
make service redis logs
```

## Features

- Redis 7 (Alpine Linux)
- AOF persistence enabled
- RDB snapshots
- LRU eviction policy
- Optimized for caching
- Health checks

## Configuration

The `redis.conf` file contains optimized settings for caching workloads.

### Key Settings

- **Max Memory**: 1GB with allkeys-lru eviction
- **Persistence**: Both AOF and RDB enabled
- **AOF Fsync**: Every second (good balance)
- **IO Threads**: 4 threads for better performance

## Ports

- **6379** - Redis port

## Volumes

- `redis_data` - Persistent data (AOF & RDB files)
- `./logs` - Redis logs

## Usage Examples

### Connect from services

```yaml
environment:
  - REDIS_URL=redis://redis:6379/0
```

### Redis CLI commands

```bash
# Connect to Redis
docker exec -it redis redis-cli

# Get all keys
docker exec redis redis-cli KEYS '*'

# Get memory stats
docker exec redis redis-cli INFO memory

# Monitor commands
docker exec redis redis-cli MONITOR

# Flush all data
docker exec redis redis-cli FLUSHALL
```

### Databases

Redis has 16 databases (0-15). Services can use different databases:

```bash
# Connect to database 1
docker exec redis redis-cli -n 1
```

## Performance

### Memory Usage

```bash
# Check memory
docker exec redis redis-cli INFO memory | grep used_memory_human

# Check keys
docker exec redis redis-cli DBSIZE
```

### Slow queries

```bash
# View slow queries
docker exec redis redis-cli SLOWLOG GET 10
```

## Backup & Restore

### Manual backup

```bash
# Trigger RDB snapshot
docker exec redis redis-cli BGSAVE

# Copy RDB file
docker cp redis:/data/dump.rdb ./redis_backup.rdb
```

### Restore

```bash
# Stop Redis
make service redis stop

# Copy backup
docker cp ./redis_backup.rdb redis:/data/dump.rdb

# Start Redis
make service redis start
```

## Resource Usage

- **CPU**: 1 core max, 0.25 reserved
- **Memory**: 2GB max, 256MB reserved

## Troubleshooting

### Connection issues

```bash
# Test connection
docker exec redis redis-cli ping

# Check config
docker exec redis redis-cli CONFIG GET maxmemory

# View info
docker exec redis redis-cli INFO
```

### Reset Redis

```bash
# Flush all data
docker exec redis redis-cli FLUSHALL

# Or restart fresh
make service redis down
docker volume rm redis_redis_data
make service redis start
```

## Security

- Protected mode enabled
- Only accessible from Docker network
- No password by default (add if exposed)

## Updates

```bash
# Pull latest
docker pull redis:7-alpine

# Recreate
make service redis restart
```
