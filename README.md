# PetitMonde

French Power Networks Relationship Graph Builder & Visualization Platform

Extract, analyze, and visualize relationship networks among French political figures, business leaders, and media personalities.

## Project Structure

```
petitmonde/
├── processing/          # Data processing pipeline (Python + UV)
│   ├── src/            # Core processing modules
│   ├── scripts/        # Executable scripts
│   ├── tests/          # Unit tests
│   └── output/         # Generated data
├── backend/            # FastAPI REST API (Python + UV)
│   ├── app/            # Application code
│   │   ├── api/        # API endpoints
│   │   ├── core/       # Configuration
│   │   ├── models/     # Data models
│   │   └── services/   # Business logic
│   └── tests/          # API tests
└── frontend/           # Vue 3 + Quasar web app (Node 24)
    └── src/
        ├── components/ # Vue components
        ├── composables/# Composition functions
        ├── pages/      # Page components
        ├── stores/     # Pinia stores
        └── services/   # API services
```

## Tech Stack

### Processing

- Python 3.12 with UV (dependency management)
- BeautifulSoup4 (web scraping)
- Pandas (data manipulation)
- Ruff (linting + formatting)

### Backend

- Python 3.12 with UV
- FastAPI (REST API framework)
- Uvicorn (ASGI server)
- Pydantic (data validation)
- Ruff (linting + formatting)

### Frontend

- Vue 3 (Composition API)
- Quasar Framework (UI components)
- TypeScript (strict mode)
- Pinia (state management)
- Vite (build tool)
- ESLint + Prettier (code quality)

## Quick Start

### Prerequisites

- Python 3.12+
- Node.js 24+
- UV (`curl -LsSf https://astral.sh/uv/install.sh | sh`)
- Make

### Installation

```bash
# Install all dependencies (root + all sub-projects)
make install

# Or install individually
make install-processing
make install-backend
make install-frontend
```

### Development

```bash
# Run processing scripts
cd processing
uv run python scripts/create_graph.py

# Start backend API
cd backend
uv run uvicorn app.main:app --reload --port 8000
# API docs at http://localhost:8000/docs

# Start frontend dev server
cd frontend
npm run dev
# App at http://localhost:9000
```

### Code Quality

```bash
# Lint all projects
make lint

# Format all projects
make format

# Run all tests
make test
```

## Development Workflow

The repository uses automated tools for code quality:

- **Commitlint**: Enforces conventional commit messages
- **Lefthook**: Git hooks for pre-commit checks
  - Prettier formatting (all files)
  - Ruff linting + formatting (Python)
  - ESLint (Vue/TypeScript)
- **Automatic formatting**: Code is formatted on commit

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) and [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md).

## License

This project is licensed under the [GNU General Public License v3.0](LICENSE).
