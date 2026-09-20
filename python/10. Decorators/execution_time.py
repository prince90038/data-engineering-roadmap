"""
execution_time.py

Example: decorator that measures and logs execution time.

Wrap functions to report runtime for simple performance checks.
"""

import functools
import time
from typing import Callable, Any


def log_execution_time(func: Callable) -> Callable:
    """Decorator that prints the elapsed time of `func` when called.

    Returns the original function's return value after logging the duration.
    """
    @functools.wraps(func)
    def wrapper(*args: Any, **kwargs: Any) -> Any:
        start = time.time()
        result = func(*args, **kwargs)
        elapsed = time.time() - start
        print(f"{func.__name__} took {elapsed:.4f} seconds")
        return result

    return wrapper


if __name__ == "__main__":
    @log_execution_time
    def wait():
        time.sleep(0.2)
        print("Slept")

    wait()
