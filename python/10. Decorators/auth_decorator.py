"""
auth_decorator.py

Example: simple authentication decorator that checks for a `user`
keyword argument. Replace with real auth checks in production.
"""

import functools
from typing import Callable, Any


def require_auth(func: Callable) -> Callable:
    """Decorator that requires `user` kwarg to be present.

    Raises `PermissionError` when `user` is missing or falsy.
    """
    @functools.wraps(func)
    def wrapper(*args: Any, **kwargs: Any) -> Any:
        user = kwargs.get("user")
        if not user:
            raise PermissionError("Authentication required")
        print(f"User {user} authenticated")
        return func(*args, **kwargs)

    return wrapper


if __name__ == "__main__":
    @require_auth
    def sensitive_action(user: str = None):
        return f"Action for {user}"

    try:
        print(sensitive_action(user="admin"))
    except PermissionError as e:
        print(e)
