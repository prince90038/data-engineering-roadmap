"""
validate_decorator.py

Example: a decorator factory that validates keyword argument types.

Use `validate_types(field=int, name=str)` to check types before calling
the wrapped function. Raises `TypeError` on mismatch.
"""

import functools
from typing import Callable, Any


def validate_types(**type_checks: type) -> Callable:
    """Return a decorator that enforces types for specified kwargs.

    Args:
        type_checks: Mapping of parameter names to expected types.
    """
    def decorator(func: Callable) -> Callable:
        @functools.wraps(func)
        def wrapper(*args: Any, **kwargs: Any) -> Any:
            for param, expected in type_checks.items():
                if param in kwargs and not isinstance(kwargs[param], expected):
                    raise TypeError(f"{param} must be {expected.__name__}")
            return func(*args, **kwargs)
        return wrapper
    return decorator


if __name__ == "__main__":
    @validate_types(count=int, data=list)
    def process(data=None, count=None):
        print(f"Processing {count} items from {data}")

    process(data=[1,2,3], count=3)
