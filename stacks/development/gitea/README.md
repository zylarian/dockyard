# Gitea for Dockyard

Git with a cup of tea. Painless self-hosted all-in-one software development service.

## Quick Start

```bash
make service gitea start
```

Access the interface at http://localhost:3700

## Configuration

### Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| PORT | External web port | 3700 |
| SSH_PORT | External SSH port | 3702 |

### Database

This service is configured to use the shared **PostgreSQL** service.
It will attempt to connect to database `gitea` using user `postgres`.
You may need to manually create the database `gitea` if it doesn't exist, or configure Gitea on first launch to use `postgres` database if preferred (though separate DB is recommended).

## Features

- Git repository hosting
- Code review
- CI/CD actions
- Project management
- Package registry
