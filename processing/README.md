# Processing Module

Python data processing pipeline for extracting and analyzing relationship networks.

## Setup

```bash
# From root directory
make install-processing

# Or directly with UV
cd processing
uv sync
```

## Structure

```
processing/
├── src/                    # Source code
│   ├── __init__.py
│   ├── api_utils.py       # LLM API interaction
│   ├── data_utils.py      # Wikipedia scraping
│   ├── relationships_utils.py  # Relationship extraction
│   └── graph_utils.py     # Graph export utilities
├── scripts/               # Executable scripts
│   └── create_graph.py    # Main pipeline script
├── tests/                 # Unit tests
├── output/                # Generated data (gitignored)
│   ├── raw_data/
│   └── graphs/
└── pyproject.toml         # UV dependencies
```

## Usage

```bash
# Activate environment and run scripts
uv run python scripts/create_graph.py

# Run tests
uv run pytest

# Linting
uv run ruff check .
uv run ruff format .
```

## Development

Dependencies are managed with UV. Add new dependencies:

```bash
uv add requests beautifulsoup4
uv add --dev pytest
```
