"""
parameters.py

Example: using parameterized queries to avoid SQL injection and to
separate SQL from data.

This shows named and positional parameter usage compatible with
DB-API drivers. Always prefer parameters rather than string
interpolation when building queries.
"""

from typing import Dict, Tuple


def named_params_example() -> Tuple[str, Dict[str, str]]:
    """Return a parameterized query and parameters mapping.

    Returns:
        A tuple of (query, params) where `params` is a mapping for named
        parameters (driver-dependent placeholder style may vary).
    """
    query = "SELECT * FROM users WHERE username = :username"
    params = {"username": "alice"}
    return query, params


def positional_params_example() -> Tuple[str, Tuple[str]]:
    """Return a parameterized query and positional params tuple.

    Many drivers expect `?` or `%s` placeholders for positional args.
    """
    query = "SELECT * FROM users WHERE id = ?"
    params = (123,)
    return query, params
