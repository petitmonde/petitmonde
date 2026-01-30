"""FastAPI application configuration and settings."""

from functools import lru_cache
from pathlib import Path
from typing import Any

from pydantic import field_validator
from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    """Application settings."""

    model_config = SettingsConfigDict(
        env_file=".env",
        env_file_encoding="utf-8",
        case_sensitive=True,
        extra="ignore",
    )

    # Application
    APP_NAME: str = "PetitMonde Backend"
    DEBUG: bool = False
    API_V1_PREFIX: str = "/api/v1"

    # CORS
    BACKEND_CORS_ORIGINS: list[str] = ["http://localhost:9000"]

    @field_validator("BACKEND_CORS_ORIGINS", mode="before")
    @classmethod
    def parse_cors_origins(cls, v: Any) -> list[str]:
        """Parse CORS origins from string or list."""
        if isinstance(v, str):
            return [origin.strip() for origin in v.split(",")]
        return v

    # Data paths
    PROCESSING_OUTPUT_PATH: Path = Path("../processing/output")


@lru_cache
def get_settings() -> Settings:
    """Get cached settings instance."""
    return Settings()
