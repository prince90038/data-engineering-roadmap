"""Configuration and secrets management example.

This script shows how environment-specific configuration and masked secrets can be handled.
"""

from __future__ import annotations
import os


def load_config(env_name):
    """Return environment-specific configuration values."""
    configs = {
        "dev": {"db_host": "localhost", "batch_size": 100},
        "prod": {"db_host": "prod-db.internal", "batch_size": 1000},
    }
    return configs.get(env_name, {"db_host": "unknown", "batch_size": 100})


def load_secret(secret_name):
    """Read a secret from an environment variable if available."""
    return os.getenv(secret_name, "NOT_SET")


def mask_secret(secret_value):
    """Redact a secret for safe logging."""
    if not secret_value or secret_value == "NOT_SET":
        return "<missing>"
    if len(secret_value) <= 4:
        return "*" * len(secret_value)
    return "*" * (len(secret_value) - 4) + secret_value[-4:]


if __name__ == "__main__":
    config = load_config("prod")
    secret_value = load_secret("API_TOKEN")
    print({"config": config, "masked_secret": mask_secret(secret_value)})
