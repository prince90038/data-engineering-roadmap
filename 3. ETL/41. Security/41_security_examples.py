"""Security example.

This script demonstrates masking sensitive data from logs and validating access rules.
"""

from __future__ import annotations


def redact(value: str, visible_chars: int = 2) -> str:
    """Mask a value so only the last characters remain visible."""
    if len(value) <= visible_chars:
        return "*" * len(value)
    return "*" * (len(value) - visible_chars) + value[-visible_chars:]


def can_access(user_role: str, resource: str) -> bool:
    """Simple role-based access check."""
    allowed = {
        "analyst": {"sales", "finance"},
        "engineer": {"sales", "finance", "raw"},
        "admin": {"sales", "finance", "raw", "secure"},
    }
    return resource in allowed.get(user_role, set())


if __name__ == "__main__":
    secret = "supersecretpassword"
    print({"masked_secret": redact(secret)})
    print({"can_access_sales": can_access("engineer", "sales")})
