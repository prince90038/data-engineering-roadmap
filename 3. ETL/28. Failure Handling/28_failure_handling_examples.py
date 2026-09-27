"""Failure handling example.

This script demonstrates a simple decision flow for transient versus permanent failures.
"""

from __future__ import annotations


def classify_failure(error_code):
    """Return the failure class based on the error code."""
    if error_code in {429, 500, 503, 504}:
        return "transient"
    return "permanent"


def handle_failure(error_code):
    """Return a recommended action for the failure type."""
    failure_type = classify_failure(error_code)
    if failure_type == "transient":
        return {"type": failure_type, "action": "retry_with_backoff"}
    return {"type": failure_type, "action": "log_and_stop"}


if __name__ == "__main__":
    for error_code in [429, 400, 500, 401]:
        print(error_code, "->", handle_failure(error_code))
