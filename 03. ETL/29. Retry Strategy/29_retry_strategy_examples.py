"""Retry strategy example.

This script simulates exponential backoff for transient errors.
"""

from __future__ import annotations


def retry_delay(attempt):
    """Return an exponential backoff delay in seconds."""
    return 2 ** (attempt - 1)


def retry_policy(max_attempts):
    """Return recommended retry delays for a series of attempts."""
    return [retry_delay(i) for i in range(1, max_attempts + 1)]


if __name__ == "__main__":
    print(retry_policy(5))
