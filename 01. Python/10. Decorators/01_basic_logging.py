"""
basic_logging.py

Example: Basic function-logging decorator.

Demonstrates a simple decorator implemented with `functools.wraps` to
preserve the wrapped function's metadata. Use this pattern to add
lightweight logging around function calls.

Usage:
    from basic_logging import log_execution

    @log_execution
    def my_func():
        ...
"""

import functools
from typing import Callable, Any


def log_execution(func: Callable) -> Callable:
    """Decorator that logs before and after function execution.

    Args:
        func: The function to wrap.

    Returns:
        The wrapped function.
    """
    @functools.wraps(func)
    def wrapper(*args: Any, **kwargs: Any) -> Any:
        print(f"Calling function: {func.__name__}")
        result = func(*args, **kwargs)
        print(f"Function {func.__name__} completed")
        return result

    return wrapper


if __name__ == "__main__":
    @log_execution
    def greet(name: str) -> None:
        print(f"Hello, {name}")

    greet("Alice")
