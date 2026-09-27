"""Incremental load example.

This script demonstrates a simple incremental pipeline using a watermark.
It loads only records whose ID is greater than the last processed ID.
"""

from __future__ import annotations


def incremental_load(source_rows, last_max_id):
    """Return only new records after the last max processed ID."""
    new_rows = [row for row in source_rows if row["id"] > last_max_id]
    if new_rows:
        new_max_id = max(row["id"] for row in new_rows)
    else:
        new_max_id = last_max_id
    return new_rows, new_max_id


if __name__ == "__main__":
    source_rows = [
        {"id": 101, "customer": "Alice", "updated_at": "2026-09-01T09:00:00"},
        {"id": 102, "customer": "Bob", "updated_at": "2026-09-01T10:00:00"},
        {"id": 103, "customer": "Charlie", "updated_at": "2026-09-02T07:00:00"},
    ]

    last_max_id = 101
    new_rows, new_max_id = incremental_load(source_rows, last_max_id)

    print("New records:", new_rows)
    print("Updated watermark:", new_max_id)
