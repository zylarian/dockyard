# 🚢 Zylarian Dockyard

> Open collection of curated, pre-configured Docker images and stacks with reasonable presets, ready to deploy services in minutes.

**Zylarian Dockyard** provides two types of ready-to-use Docker resources:

### 📦 Stacks
Multi-service configurations with:
- 🐋 Pre-configured `docker-compose.yml`
- 🔐 Example `.env` files with sensible defaults
- 📝 Clear documentation and usage guides
- ⚡ Zero to running in minutes

### 🎯 Images
Standalone pre-configured images with:
- 🔧 Optimized configurations
- 🛡️ Security hardening
- 📚 Ready-to-use presets
- 🚀 Drop-in replacements for official images

## 📁 Directory Structure

```
dockyard/
├── stacks/         # Managed services and stacks
│   ├── ai/         # AI/ML stacks and images (Langflow, Dify...)
│   ├── automation/ # Automation tools (n8n...)
│   ├── databases/  # Databases (PostgreSQL, QDant...)
│   ├── devtools/   # Development tools (Code Server...)
│   ├── monitoring/ # Monitoring (Grafana, Prometheus...)
│   └── networking/ # Networking tools
├── tools/          # Development and management tools
│   └── portainer/  # Portainer with custom templates
└── templates/      # Templates for creating new stacks/imagess
```

## 🛠️ Tools

### Portainer - Container Management UI

Pre-configured Portainer with custom templates for all Zylarian Dockyard images and stacks.

**Quick Start:**
```bash
cd tools/portainer
./start.sh
```

Access at: http://localhost:9000

See [tools/portainer/README.md](tools/portainer/README.md) for details.

## 🌟 Philosophy

- **Simplicity First**: Configurations should be simple and understandable
- **Security by Default**: Secure defaults, not afterthoughts
- **Documentation Matters**: Every stack/image must be well-documented
- **Production Ready**: All resources tested and ready for production use

## 🤝 Contributing

Contributions are welcome! See [CONTRIBUTING.md](./docs/CONTRIBUTING.md) for guidelines.

## 📄 License

MIT License - see [LICENSE](LICENSE) file for details.

---

Made with ❤️ by the Zylarian Innovations LLC
