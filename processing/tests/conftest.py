"""Test configuration and fixtures."""

import pytest


@pytest.fixture
def sample_data():
    """Sample data for testing."""
    return {"name": "Test Person", "url": "https://fr.wikipedia.org/wiki/Test"}
