"""
retry_decorator.py

Example: a parameterized retry decorator.

Shows how to write decorators that accept parameters (max_attempts,
delay) and preserves function metadata with `functools.wraps`.
"""

import functools
import time
from typing import Callable, Any


def retry(max_attempts: int = 3, delay: float = 1.0) -> Callable:
    """Return a decorator that retries the wrapped function on exception.

    Args:
        max_attempts: Maximum number of attempts before raising.
        delay: Seconds to wait between attempts.
    """
    def decorator(func: Callable) -> Callable:
        @functools.wraps(func)
        def wrapper(*args: Any, **kwargs: Any) -> Any:
            for attempt in range(max_attempts):
                try:
                    return func(*args, **kwargs)
                except Exception as e:
                    if attempt == max_attempts - 1:
                        raise
                    print(f"Attempt {attempt + 1} failed: {e}. Retrying in {delay}s...")
                    time.sleep(delay)
        return wrapper
    return decorator


if __name__ == "__main__":
    import random

    @retry(max_attempts=5, delay=0.2)
    def flaky():
        if random.random() < 0.8:
            raise RuntimeError("fail")
        return "ok"

    try:
        print(flaky())
    except RuntimeError as e:
        print(f"Flaky failed: {e}")
