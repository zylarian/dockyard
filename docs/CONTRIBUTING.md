# Contributing to Zylarian Dockyard

Thank you for your interest in contributing! This guide will help you create high-quality stacks.

> 💡 **Quick Start**: Check [Tooling Documentation](./tooling.md) for development tools and workflows.

## 📝 Stack Guidelines

### 1. Directory Structure

Place your stack in the appropriate category:

```
stacks/
├── apps/           # End-user applications
├── databases/      # Database systems
├── devtools/       # Development tools
├── monitoring/     # Monitoring & logging
├── networking/     # Reverse proxies, load balancers
└── storage/        # File storage & backup
```

### 2. Required Files

Each stack MUST include:

- **`docker-compose.yml`** - The main compose file
- **`.env.example`** - Example environment variables with comments
- **`README.md`** - Documentation specific to the stack

### 3. Environment Variables

- Use meaningful variable names
- Provide secure defaults where appropriate
- Add comments explaining each variable
- Never commit actual `.env` files

Example `.env.example`:
```bash
# Application settings
APP_NAME=MyApp
APP_ENV=production

# Database credentials
DB_HOST=postgres
DB_PORT=5432
DB_NAME=myapp
DB_USER=myapp
# SECURITY: Change this to a strong password
DB_PASSWORD=changeme

# Ports
HTTP_PORT=8080
HTTPS_PORT=8443
```

### 4. Docker Compose Best Practices

#### Use Version 3.8+
```yaml
version: '3.8'
```

#### Use Named Volumes
```yaml
volumes:
  app_data:
  db_data:
```

#### Use Networks
```yaml
networks:
  frontend:
  backend:
```

#### Set Resource Limits
```yaml
services:
  app:
    deploy:
      resources:
        limits:
          cpus: '1'
          memory: 1G
```

#### Use Health Checks
```yaml
services:
  db:
    healthcheck:
      test: ["CMD", "pg_isready", "-U", "postgres"]
      interval: 10s
      timeout: 5s
      retries: 5
```

### 5. README Template

```markdown
# [Stack Name]

Brief description of what this stack provides.

## 🚀 Quick Start

\`\`\`bash
cp .env.example .env
# Edit .env with your settings
docker-compose up -d
\`\`\`

## 📋 Services

- **Service 1**: Description (Port: 8080)
- **Service 2**: Description (Port: 5432)

## ⚙️ Configuration

Explain key configuration options.

## 🔐 Security Notes

Important security considerations.

## 📊 Default Credentials

List any default credentials (if applicable).

## 🔗 Useful Links

- [Official Documentation](https://example.com)
```

### 6. Security Checklist

- [ ] No hardcoded passwords in compose file
- [ ] Strong password defaults in `.env.example`
- [ ] Security warnings in README
- [ ] Non-root user where possible
- [ ] Minimal port exposure
- [ ] Health checks configured

### 7. Testing

Before submitting:

1. Test `docker-compose up` works
2. Test `docker-compose down` cleans up properly
3. Verify all services are accessible
4. Check logs for errors
5. Test with `.env.example` values

## 🔄 Pull Request Process

1. **Fork** the repository
2. **Create** a feature branch (`git checkout -b stack/my-awesome-stack`)
3. **Follow** the guidelines above
4. **Test** your stack thoroughly
5. **Commit** your changes (`git commit -m 'Add MyAwesomeStack'`)
6. **Push** to your fork (`git push origin stack/my-awesome-stack`)
7. **Open** a Pull Request

### PR Description Template

```markdown
## Stack: [Name]

**Category**: apps/databases/devtools/monitoring/networking/storage

**Description**: Brief description of what this stack provides

**Services Included**:
- Service 1 (version)
- Service 2 (version)

**Testing Done**:
- [ ] Starts successfully with `docker-compose up`
- [ ] All services healthy
- [ ] Stops cleanly with `docker-compose down`
- [ ] Documentation is clear and complete

**Additional Notes**:
Any special considerations or setup requirements
```

## 📧 Questions?

Open an issue or reach out to the maintainers.

Thank you for contributing! 🚀
