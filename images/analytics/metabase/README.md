# Metabase

Business Intelligence and Analytics Platform.

## Quick Start

```bash
# Ensure PostgreSQL is running
make service postgresql start

# Start Metabase
make service metabase start

# Access (first time takes 2-3 minutes to initialize)
open http://localhost:3050
```

## Features

- Interactive dashboards
- SQL query editor
- Multiple database connections
- Automated reports
- Email alerts
- User management

## First Time Setup

1. Access http://localhost:3050
2. Create admin account
3. Add database connections
4. Start creating questions and dashboards

## Ports

- **3050** - Web interface

## Database

Metabase uses PostgreSQL for its application database (already configured).

## Resource Usage

- CPU: 2 cores max, 0.5 reserved
- Memory: 4GB max, 1GB reserved
- First startup requires more resources

## Links

- [Official Docs](https://www.metabase.com/docs/)
