# Prometheus for Dockyard

Power your metrics and alerting with a leading open-source monitoring solution.

## Quick Start

```bash
make service prometheus start
```

Access the interface at http://localhost:9090

## Configuration

### Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| PORT | External port | 9090 |

### Scrape Configuration

To add more targets, modify `prometheus.yml` and rebuild the image, or map a custom configuration file:

```yaml
volumes:
  - ./my-prometheus.yml:/etc/prometheus/prometheus.yml
```
