"""Tests for main application."""


def test_health_check(client):
    """Test health check endpoint."""
    response = client.get("/health")
    assert response.status_code == 200
    assert response.json()["status"] == "healthy"


def test_api_root(client):
    """Test API v1 root endpoint."""
    response = client.get("/api/v1/")
    assert response.status_code == 200
    assert "message" in response.json()
