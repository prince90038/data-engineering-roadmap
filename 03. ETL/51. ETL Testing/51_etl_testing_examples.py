"""ETL testing example.

This script demonstrates two simple transformation checks that are easy to unit test.
"""

from __future__ import annotations


def clean_text(value):
    """Trim whitespace and normalize casing."""
    if value is None:
        return ""
    return str(value).strip().lower()


def validate_row(row):
    """Ensure required fields exist for downstream processing."""
    return bool(row.get("id")) and row.get("status") is not None


if __name__ == "__main__":
    row = {"id": 1, "status": "active"}
    print(clean_text("  ABC  "))
    print(validate_row(row))
