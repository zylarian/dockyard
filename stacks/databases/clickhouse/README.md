# Clickhouse for Dockyard

Fast open-source OLAP database management system.

## Quick Start

```bash
make service clickhouse start
```

## Configuration

### Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| PORT | HTTP port | 8123 |
| PORT_NATIVE | Native client port | 9000 |
| CLICKHOUSE_USER | Database user | default |
| CLICKHOUSE_PASSWORD | Database password | (empty) |
| CLICKHOUSE_DB | Default database | default |
