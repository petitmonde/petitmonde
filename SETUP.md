# Development Setup Summary

This document provides a quick reference for the project setup.

## Architecture Overview

```
petitmonde/
├── processing/    # Python pipeline with UV
├── backend/       # FastAPI with UV
├── frontend/      # Vue 3 + Quasar
└── .github/       # CI/CD workflows
```

## Initial Setup

```bash
# 1. Install UV (if not already installed)
curl -LsSf https://astral.sh/uv/install.sh | sh

# 2. Install all dependencies
make install

# 3. Copy environment files
cp backend/.env.example backend/.env
cp frontend/.env.example frontend/.env
```

## Running Services

### Processing

```bash
cd processing
uv run python scripts/create_graph.py
```

### Backend

```bash
cd backend
uv run uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
```

API docs: http://localhost:8000/docs

### Frontend

```bash
cd frontend
npm run dev
```

App: http://localhost:9000

## Development Workflow

### Code Quality

```bash
make lint    # Check linting
make format  # Format code
make test    # Run tests
```

### Git Workflow

1. Commits are automatically formatted (Lefthook hooks)
2. Commit messages must follow conventional format
3. CI checks run on push/PR

### Adding Dependencies

**Python (processing/backend):**

```bash
cd processing  # or backend
uv add package-name
uv add --dev pytest
```

**Frontend:**

```bash
cd frontend
npm install package-name
```

## Project Standards

### Python

- Python 3.12
- Ruff for linting + formatting
- Line length: 88
- Type hints recommended

### TypeScript/Vue

- Composition API with `<script setup>`
- Strict TypeScript mode
- ESLint + Prettier
- Quasar components

### Commits

Format: `type(scope): message`

- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation
- `style`: Formatting
- `refactor`: Code restructuring
- `test`: Tests
- `chore`: Maintenance
