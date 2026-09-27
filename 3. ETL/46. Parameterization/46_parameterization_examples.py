"""Parameterization example.

This script models a pipeline job that accepts runtime parameters such as dates and environment.
"""

from __future__ import annotations


def build_run_config(start_date, end_date, environment="dev"):
    """Return runtime configuration for a pipeline."""
    return {
        "start_date": start_date,
        "end_date": end_date,
        "environment": environment,
        "batch_size": 500 if environment == "prod" else 100,
    }


if __name__ == "__main__":
    config = build_run_config("2026-09-01", "2026-09-30", "prod")
    print(config)
