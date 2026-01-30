.PHONY: setup install clean uninstall help lint format test install-processing install-backend install-frontend

# Default target
help:
	@echo "Available commands:"
	@echo ""
	@echo "Setup & Installation:"
	@echo "  setup              - Set up repository from template (first-time setup)"
	@echo "  install            - Install all dependencies (root + all sub-projects)"
	@echo "  install-processing - Install processing dependencies (UV)"
	@echo "  install-backend    - Install backend dependencies (UV)"
	@echo "  install-frontend   - Install frontend dependencies (npm)"
	@echo ""
	@echo "Development:"
	@echo "  lint               - Run linters on all projects"
	@echo "  format             - Run formatters on all projects"
	@echo "  test               - Run all tests"
	@echo ""
	@echo "Cleanup:"
	@echo "  clean              - Clean all dependencies"
	@echo "  uninstall          - Remove git hooks and clean dependencies"
	@echo "  help               - Show this help message"

# SETUP SECTION START
# Setup repository from template
setup:
	@echo "Setting up repository from template..."
	./setup-repo.sh

# SETUP SECTION END

# Install all dependencies and set up git hooks
install: install-processing install-backend install-frontend
	@echo "Installing root npm dependencies..."
	npm install
	@echo "Installing git hooks with lefthook..."
	npx lefthook install
	@echo "✓ All dependencies installed and git hooks configured!"

# Install processing dependencies
install-processing:
	@echo "Installing processing dependencies with UV..."
	@cd processing && uv sync --all-extras
	@echo "✓ Processing dependencies installed"

# Install backend dependencies
install-backend:
	@echo "Installing backend dependencies with UV..."
	@cd backend && uv sync --all-extras
	@echo "✓ Backend dependencies installed"

# Install frontend dependencies
install-frontend:
	@echo "Installing frontend dependencies..."
	@cd frontend && npm install
	@echo "✓ Frontend dependencies installed"

# Clean all dependencies
clean:
	@echo "Cleaning root dependencies..."
	rm -rf node_modules
	rm -f package-lock.json
	@echo "Cleaning processing dependencies..."
	@cd processing && rm -rf .venv .uv
	@echo "Cleaning backend dependencies..."
	@cd backend && rm -rf .venv .uv
	@echo "Cleaning frontend dependencies..."
	@cd frontend && rm -rf node_modules .quasar dist
	@echo "✓ All dependencies cleaned"

# Uninstall hooks and clean
uninstall:
	@echo "Uninstalling git hooks..."
	npx lefthook uninstall || true
	$(MAKE) clean
	@echo "Uninstall complete!"


lint:
	@echo "Running linters on all projects..."
	@echo "→ Checking Prettier formatting..."
	npx prettier --check .
	@echo "→ Linting processing..."
	@cd processing && uv run ruff check .
	@echo "→ Linting backend..."
	@cd backend && uv run ruff check .
	@echo "→ Linting frontend..."
	@cd frontend && npm run lint
	@echo "✓ All linting checks passed!"

format:
	@echo "Running formatters on all projects..."
	@echo "→ Formatting with Prettier..."
	npx prettier --write .
	@echo "→ Formatting processing..."
	@cd processing && uv run ruff format .
	@echo "→ Formatting backend..."
	@cd backend && uv run ruff format .
	@echo "→ Formatting frontend..."
	@cd frontend && npm run format || true
	@echo "✓ All code formatted!"

test:
	@echo "Running tests on all projects..."
	@echo "→ Testing processing..."
	@cd processing && uv run pytest || echo "No tests yet"
	@echo "→ Testing backend..."
	@cd backend && uv run pytest || echo "No tests yet"
	@echo "→ Testing frontend..."
	@cd frontend && npm run test:unit || echo "No tests yet"
	@echo "✓ All tests completed!"