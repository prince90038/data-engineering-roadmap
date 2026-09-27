"""Containerization example.

This script demonstrates a small runtime configuration pattern common in containerized ETL jobs.
"""

from __future__ import annotations
import os


def build_container_runtime():
    """Return a configuration based on the container's environment variables."""
    return {
        "environment": os.getenv("APP_ENV", "dev"),
        "source": os.getenv("SOURCE_NAME", "local_source"),
        "batch_size": int(os.getenv("BATCH_SIZE", "100")),
    }


if __name__ == "__main__":
    print(build_container_runtime())
