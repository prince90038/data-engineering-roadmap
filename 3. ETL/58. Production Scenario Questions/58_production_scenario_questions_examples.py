"""Production scenario questions example.

This script models a handful of common operational decisions faced by ETL pipelines.
"""

from __future__ import annotations


def decide_on_retry(status_code, retries):
    """Return an action based on error type and current retry count."""
    if status_code == 429:
        return "backoff_and_retry" if retries < 5 else "fail_and_alert"
    if status_code >= 500:
        return "retry_with_exponential_backoff"
    return "fail_fast"


def reconcile_counts(source_count, target_count):
    """Return a status summary for source-target validation."""
    delta = source_count - target_count
    if delta == 0:
        return "balanced"
    return f"mismatch_delta_{delta}"


if __name__ == "__main__":
    print(decide_on_retry(429, 3))
    print(reconcile_counts(1000, 985))
