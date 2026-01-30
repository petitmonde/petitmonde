# Backend API

FastAPI backend serving processed relationship network data.

## Setup

```bash
# From root directory
make install-backend

# Or directly with UV
cd backend
uv sync
```

## Structure

```
backend/
├── app/
│   ├── __init__.py
│   ├── main.py            # FastAPI app entry point
│   ├── api/               # API routes
│   │   ├── __init__.py
│   │   └── v1/
│   │       ├── __init__.py
│   │       └── endpoints/
│   ├── core/              # Core configuration
│   │   ├── __init__.py
│   │   ├── config.py      # Settings
│   │   └── deps.py        # Dependencies
│   ├── models/            # Data models
│   │   └── __init__.py
│   └── services/          # Business logic
│       └── __init__.py
├── tests/
└── pyproject.toml
```

## Usage

```bash
# Run development server
uv run uvicorn app.main:app --reload --host 0.0.0.0 --port 8000

# Run tests
uv run pytest

# Linting
uv run ruff check .
uv run ruff format .
```

## API Documentation

Once running, visit:

- Swagger UI: http://localhost:8000/docs
- ReDoc: http://localhost:8000/redoc

## Environment Variables

Create a `.env` file:

```env
# Application
APP_NAME=PetitMonde Backend
DEBUG=true
API_V1_PREFIX=/api/v1

# CORS
BACKEND_CORS_ORIGINS=["http://localhost:9000"]

# Data paths
PROCESSING_OUTPUT_PATH=../processing/output
```
