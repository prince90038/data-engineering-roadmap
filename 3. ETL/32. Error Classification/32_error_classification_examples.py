"""Error classification example.

This script distinguishes retryable errors from permanent failures.
"""

from __future__ import annotations


def classify_error(code):
    """Return the failure category for an HTTP-like error code."""
    retryable = {429, 500, 503, 504}
    if code in retryable:
        return "transient"
    return "permanent"


def choose_action(code):
    """Return an action based on the error category."""
    if classify_error(code) == "transient":
        return "retry_with_backoff"
    return "log_and_quarantine"


if __name__ == "__main__":
    for code in [429, 400, 503, 401]:
        print(code, "->", classify_error(code), choose_action(code))
