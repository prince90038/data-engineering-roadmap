"""Data sources examples.

This example shows how to model different source types in a lightweight way:
- database table data
- file-based data
- API-like data
"""

from __future__ import annotations


def extract_database_rows():
    """Simulate rows extracted from a database table."""
    return [
        {"customer_id": 1, "name": "Alice", "city": "London"},
        {"customer_id": 2, "name": "Bob", "city": "Paris"},
    ]


def extract_file_rows():
    """Simulate rows read from a CSV or JSON file."""
    return [
        {"customer_id": 3, "name": "Charlie", "city": "Berlin"},
        {"customer_id": 4, "name": "Diana", "city": "Rome"},
    ]


def extract_api_rows():
    """Simulate rows returned by a paginated API endpoint."""
    return [
        {"customer_id": 5, "name": "Eva", "city": "Madrid"},
    ]


if __name__ == "__main__":
    sources = {
        "database": extract_database_rows(),
        "file": extract_file_rows(),
        "api": extract_api_rows(),
    }

    for source_name, rows in sources.items():
        print(f"{source_name}: {rows}")
