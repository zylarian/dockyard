.PHONY: help validate validate-dockerfiles validate-stacks lint build-image test clean service portainer portainer-start portainer-stop portainer-restart portainer-logs portainer-templates

# Colors for output
BLUE := \033[0;34m
GREEN := \033[0;32m
YELLOW := \033[0;33m
RED := \033[0;31m
NC := \033[0m # No Color

help: ## Show this help message
	@echo "$(BLUE)Zylarian Dockyard - Available Commands$(NC)"
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  $(GREEN)%-20s$(NC) %s\n", $$1, $$2}'

validate: validate-dockerfiles validate-stacks ## Validate all files

validate-dockerfiles: ## Validate all Dockerfiles
	@echo "$(BLUE)Validating Dockerfiles...$(NC)"
	@./scripts/validate-dockerfiles.sh

validate-stacks: ## Validate all stacks
	@echo "$(BLUE)Validating stacks...$(NC)"
	@./scripts/validate-stacks.sh

lint: ## Run all linters
	@echo "$(BLUE)Running linters...$(NC)"
	@./scripts/lint.sh

build-image: ## Build a specific image (usage: make build-image IMAGE=nginx)
	@if [ -z "$(IMAGE)" ]; then \
		echo "$(RED)Error: IMAGE variable required$(NC)"; \
		echo "Usage: make build-image IMAGE=nginx"; \
		exit 1; \
	fi
	@echo "$(BLUE)Building image: $(IMAGE)$(NC)"
	@cd images/$(IMAGE) && docker build -t zylarian/$(IMAGE):local .

build-all-images: ## Build all images
	@echo "$(BLUE)Building all images...$(NC)"
	@./scripts/build-all-images.sh

# Publish all images (builds and pushes to Docker Hub)
publish-all: ## Build and publish all images + update docs
	@echo "🚀 Publishing all images..."
	@for dir in $$(find images -mindepth 2 -maxdepth 2 -type d | sort); do \
		if [ -f "$$dir/scripts/publish.sh" ]; then \
			echo "📦 Publishing $$(basename $$dir)..."; \
			(cd $$dir && ./scripts/publish.sh) || exit 1; \
		fi \
	done
	@$(MAKE) update-hub-docs
	@echo "✅ All images published!"

# Update Docker Hub documentation (README.md)
update-hub-docs: ## Sync README.md to Docker Hub
	@echo "📝 Updating Docker Hub documentation..."
	@if ! docker pushrm --version > /dev/null 2>&1; then \
		echo "⚠️  docker-pushrm not found. Running setup..."; \
		./scripts/setup-pushrm.sh; \
	fi
	@for dir in $$(find images -mindepth 2 -maxdepth 2 -type d | sort); do \
		if [ -f "$$dir/README.md" ]; then \
			IMAGE_NAME="zylarian/dockyard-$$(basename $$dir)"; \
			echo "📄 Updating docs for $$IMAGE_NAME..."; \
			if [ "$$(basename $$dir)" = "langflow" ]; then \
				docker pushrm $$IMAGE_NAME -f $$dir/README.md --short "Production-ready Langflow - Visual AI workflow builder powered by LangChain" || echo "⚠️  Failed to update docs for $$IMAGE_NAME"; \
			elif [ "$$(basename $$dir)" = "n8n" ]; then \
				docker pushrm $$IMAGE_NAME -f $$dir/README.md --short "Production-ready n8n - Powerful workflow automation tool for technical teams" || echo "⚠️  Failed to update docs for $$IMAGE_NAME"; \
			else \
				docker pushrm $$IMAGE_NAME -f $$dir/README.md || echo "⚠️  Failed to update docs for $$IMAGE_NAME"; \
			fi \
		fi \
	done
	@echo "✅ Docker Hub docs updated!"

# Setup docker-pushrm
setup-pushrm: ## Install docker-pushrm plugin
	@./scripts/setup-pushrm.sh

test: ## Run tests
	@echo "$(BLUE)Running tests...$(NC)"
	@./scripts/test.sh

test-stack: ## Test a specific stack (usage: make test-stack STACK=databases/postgresql)
	@if [ -z "$(STACK)" ]; then \
		echo "$(RED)Error: STACK variable required$(NC)"; \
		echo "Usage: make test-stack STACK=databases/postgresql"; \
		exit 1; \
	fi
	@echo "$(BLUE)Testing stack: $(STACK)$(NC)"
	@cd stacks/$(STACK) && \
		cp .env.example .env 2>/dev/null || true && \
		docker compose config && \
		rm -f .env

clean: ## Clean up generated files
	@echo "$(BLUE)Cleaning up...$(NC)"
	@find . -name ".env" -not -name ".env.example" -type f -delete
	@echo "$(GREEN)Cleanup complete$(NC)"

setup: ## Install development dependencies
	@echo "$(BLUE)Setting up development environment...$(NC)"
	@./scripts/setup-dev.sh
	@echo "$(GREEN)Setup complete$(NC)"

pre-commit: validate lint ## Run pre-commit checks
	@echo "$(GREEN)All pre-commit checks passed!$(NC)"

# AI Services
AIServices := ollama comfyui dify flowise langflow open-webui stable-diffusion-webui anything-llm tabby langfuse invokeai

# Automation Services
AutomationServices := n8n

# Analytics Services
AnalyticsServices := metabase

# Database Services
DatabaseServices := chromadb qdrant postgresql redis clickhouse

# Documentation Services
DocumentationServices := outline

# Communication Services
CommunicationServices := mattermost

# Monitoring Services
MonitoringServices := uptime-kuma grafana prometheus

# Development Tools
DevToolsServices := jupyter-lab code-server gitea

# Service management (generic for any service)
service: ## Manage services (usage: make service <name> <start|stop|restart|logs>)
	@SERVICE_NAME="$(word 2,$(MAKECMDGOALS))"; \
	ACTION="$(word 3,$(MAKECMDGOALS))"; \
	if [ "$$SERVICE_NAME" = "list" ]; then \
		echo "$(BLUE)Available Zylarian Dockyard Services:$(NC)"; \
		echo ""; \
		echo "  $(GREEN)AI Services:$(NC)"; \
		for service in $(AIServices); do echo "    - $$service"; done; \
		echo ""; \
		echo "  $(GREEN)Automation Services:$(NC)"; \
		for service in $(AutomationServices); do echo "    - $$service"; done; \
		echo ""; \
		echo "  $(GREEN)Communication Services:$(NC)"; \
		for service in $(CommunicationServices); do echo "    - $$service"; done; \
		echo ""; \
		echo "  $(GREEN)Analytics Services:$(NC)"; \
		for service in $(AnalyticsServices); do echo "    - $$service"; done; \
		echo ""; \
		echo "  $(GREEN)Database Services:$(NC)"; \
		for service in $(DatabaseServices); do echo "    - $$service"; done; \
		echo ""; \
		echo "  $(GREEN)Documentation Services:$(NC)"; \
		for service in $(DocumentationServices); do echo "    - $$service"; done; \
		echo ""; \
		echo "  $(GREEN)Monitoring Services:$(NC)"; \
		for service in $(MonitoringServices); do echo "    - $$service"; done; \
		echo ""; \
		echo "  $(GREEN)Development Tools:$(NC)"; \
		for service in $(DevToolsServices); do echo "    - $$service"; done; \
		echo ""; \
		exit 0; \
	fi; \
	if [ -z "$$SERVICE_NAME" ] || [ -z "$$ACTION" ]; then \
		echo "$(YELLOW)Usage: make service <name> <action>$(NC)"; \
		echo ""; \
		echo "$(BLUE)Available services:$(NC)"; \
		echo "  $(GREEN)AI:$(NC)"; \
		echo "    - dify, flowise, langflow, ollama, comfyui"; \
		echo "  $(GREEN)Automation:$(NC)"; \
		echo "    - n8n"; \
		echo "  $(GREEN)Databases:$(NC)"; \
		echo "    - chromadb, qdrant"; \
		echo "  $(GREEN)DevTools:$(NC)"; \
		echo "    - code-server, jupyter-lab"; \
		echo ""; \
		echo "$(BLUE)Available actions:$(NC)"; \
		echo "  $(GREEN)start$(NC)      - Start the service"; \
		echo "  $(GREEN)stop$(NC)       - Stop the service"; \
		echo "  $(GREEN)restart$(NC)    - Restart the service"; \
		echo "  $(GREEN)logs$(NC)       - View service logs"; \
		echo "  $(GREEN)up$(NC)         - Start in detached mode"; \
		echo "  $(GREEN)down$(NC)       - Stop and remove containers"; \
		exit 1; \
	fi; \
	SERVICE_PATH=$$(find images -type f -path "*/$$SERVICE_NAME/docker-compose.yml" | head -n 1); \
	if [ -z "$$SERVICE_PATH" ]; then \
		echo "$(RED)Error: Service '$$SERVICE_NAME' not found$(NC)"; \
		exit 1; \
	fi; \
	SERVICE_DIR=$$(dirname $$SERVICE_PATH); \
	case "$$ACTION" in \
		start) \
			echo "$(BLUE)🚀 Starting $$SERVICE_NAME...$(NC)"; \
			cd $$SERVICE_DIR && docker compose up -d; \
			sleep 2; \
			PORT=$$(docker ps --filter name=$$SERVICE_NAME --format '{{.Ports}}' | grep -oP '0\.0\.0\.0:\K[0-9]+' | head -1); \
			echo "$(GREEN)✅ $$SERVICE_NAME started$(NC)"; \
			if [ -n "$$PORT" ]; then \
				echo "$(BLUE)🌐 Listening on: http://localhost:$$PORT$(NC)"; \
			fi; \
			;; \
		stop) \
			echo "$(BLUE)🛑 Stopping $$SERVICE_NAME...$(NC)"; \
			cd $$SERVICE_DIR && docker compose stop; \
			echo "$(GREEN)✅ $$SERVICE_NAME stopped$(NC)"; \
			;; \
		restart) \
			echo "$(BLUE)🔄 Restarting $$SERVICE_NAME...$(NC)"; \
			cd $$SERVICE_DIR && docker compose restart; \
			sleep 1; \
			PORT=$$(docker ps --filter name=$$SERVICE_NAME --format '{{.Ports}}' | grep -oP '0\.0\.0\.0:\K[0-9]+' | head -1); \
			if [ -n "$$PORT" ]; then \
				echo "$(GREEN)✅ $$SERVICE_NAME restarted$(NC)"; \
				echo "$(BLUE)🌐 Listening on: http://localhost:$$PORT$(NC)"; \
			else \
				echo "$(GREEN)✅ $$SERVICE_NAME restarted$(NC)"; \
			fi; \
			;; \
		logs) \
			echo "$(BLUE)📋 Viewing logs for $$SERVICE_NAME...$(NC)"; \
			cd $$SERVICE_DIR && docker compose logs -f; \
			;; \
		up) \
			echo "$(BLUE)🚀 Starting $$SERVICE_NAME (detached)...$(NC)"; \
			cd $$SERVICE_DIR && docker compose up -d; \
			sleep 1; \
			PORT=$$(docker ps --filter name=$$SERVICE_NAME --format '{{.Ports}}' | grep -oP '0\.0\.0\.0:\K[0-9]+' | head -1); \
			if [ -n "$$PORT" ]; then \
				echo "$(GREEN)✅ $$SERVICE_NAME is up$(NC)"; \
				echo "$(BLUE)🌐 Listening on: http://localhost:$$PORT$(NC)"; \
			else \
				echo "$(GREEN)✅ $$SERVICE_NAME is up$(NC)"; \
			fi; \
			;; \
		down) \
			echo "$(BLUE)🗑️  Stopping and removing $$SERVICE_NAME containers...$(NC)"; \
			cd $$SERVICE_DIR && docker compose down; \
			echo "$(GREEN)✅ $$SERVICE_NAME is down$(NC)"; \
			;; \
		*) \
			echo "$(RED)Error: Unknown action '$$ACTION'$(NC)"; \
			echo "$(YELLOW)Available actions: start, stop, restart, logs, up, down$(NC)"; \
			exit 1; \
			;; \
	esac

# Portainer management
portainer: ## Manage Portainer (usage: make portainer start|stop|restart|logs|templates)
	@ACTION="$(filter-out $@,$(MAKECMDGOALS))"; \
	if [ -z "$$ACTION" ]; then \
		echo "$(YELLOW)Usage: make portainer [start|stop|restart|logs|templates]$(NC)"; \
		echo ""; \
		echo "$(BLUE)Available commands:$(NC)"; \
		echo "  $(GREEN)start$(NC)      - Generate templates and start Portainer"; \
		echo "  $(GREEN)stop$(NC)       - Stop Portainer"; \
		echo "  $(GREEN)restart$(NC)    - Restart Portainer with updated templates"; \
		echo "  $(GREEN)logs$(NC)       - View Portainer logs"; \
		echo "  $(GREEN)templates$(NC)  - Generate templates from images"; \
		exit 1; \
	fi; \
	case "$$ACTION" in \
		start) $(MAKE) portainer-start ;; \
		stop) $(MAKE) portainer-stop ;; \
		restart) $(MAKE) portainer-restart ;; \
		logs) $(MAKE) portainer-logs ;; \
		templates) $(MAKE) portainer-templates ;; \
		*) echo "$(RED)Unknown action: $$ACTION$(NC)"; exit 1 ;; \
	esac

portainer-start: ## Internal: Start Portainer
	@echo "$(BLUE)🔧 Generating Portainer templates...$(NC)"
	@cd tools/portainer && ./scripts/generate-templates.sh
	@echo "$(BLUE)🚀 Starting Portainer...$(NC)"
	@cd tools/portainer && ./start.sh

portainer-stop: ## Internal: Stop Portainer
	@echo "$(BLUE)🛑 Stopping Portainer...$(NC)"
	@cd tools/portainer && docker compose down

portainer-restart: ## Internal: Restart Portainer
	@echo "$(BLUE)🔧 Generating Portainer templates...$(NC)"
	@cd tools/portainer && ./scripts/generate-templates.sh
	@echo "$(BLUE)🔄 Restarting Portainer...$(NC)"
	@cd tools/portainer && docker compose restart portainer
	@echo "$(GREEN)✅ Portainer restarted with updated templates$(NC)"

portainer-logs: ## Internal: View Portainer logs
	@cd tools/portainer && docker compose logs -f portainer

portainer-templates: ## Internal: Generate templates
	@echo "$(BLUE)🔧 Generating Portainer templates...$(NC)"
	@cd tools/portainer && ./scripts/generate-templates.sh

%:
	@:
