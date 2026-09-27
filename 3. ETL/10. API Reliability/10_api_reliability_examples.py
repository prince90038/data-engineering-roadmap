"""API reliability example.

This script demonstrates a simple retry policy with exponential backoff for
transient API failures.
"""

from __future__ import annotations

import time


def api_call_with_retry(request_count, max_retries=3):
    """Retry a failing API request with exponential backoff."""
    for attempt in range(1, max_retries + 1):
        if request_count < 2:
            return {"success": True, "attempts_used": attempt}

        wait_seconds = 2 ** (attempt - 1)
        print(f"Transient failure on attempt {attempt}. Retrying in {wait_seconds}s...")
        time.sleep(0.01)

    return {"success": False, "attempts_used": max_retries}


if __name__ == "__main__":
    result = api_call_with_retry(request_count=3, max_retries=4)
    print(result)
