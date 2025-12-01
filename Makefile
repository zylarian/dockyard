.PHONY: help validate validate-dockerfiles validate-stacks lint build-image test clean

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
