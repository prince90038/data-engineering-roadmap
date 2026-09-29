"""Data loading example.

This script models common loading patterns: append, overlay, and upsert-style logic.
"""

from __future__ import annotations


def append_load(target_rows, new_rows):
    """Append new records to the target table."""
    return target_rows + new_rows


def overwrite_load(target_rows, new_rows):
    """Replace the table with a new snapshot."""
    return new_rows


def upsert_load(target_rows, new_rows):
    """Update matching keys and insert missing ones."""
    target_map = {row["id"]: row for row in target_rows}
    for row in new_rows:
        target_map[row["id"]] = row
    return list(target_map.values())


if __name__ == "__main__":
    target_rows = [
        {"id": 1, "value": 100},
        {"id": 2, "value": 250},
    ]
    new_rows = [
        {"id": 2, "value": 260},
        {"id": 3, "value": 500},
    ]

    print("Append load:", append_load(target_rows, new_rows))
    print("Overwrite load:", overwrite_load(target_rows, new_rows))
    print("Upsert load:", upsert_load(target_rows, new_rows))
