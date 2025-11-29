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
