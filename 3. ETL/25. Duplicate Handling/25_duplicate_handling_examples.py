"""Duplicate handling example.

This script shows a simple deduplication strategy based on a business key.
"""

from __future__ import annotations


def deduplicate_rows(rows):
    """Return deduplicated records using a stable business key."""
    unique = {}
    for row in rows:
        unique[row["order_id"]] = row
    return list(unique.values())


def load_with_deduplication(target_rows, incoming_rows):
    """Simulate an idempotent load by keeping the most recent version per order."""
    target_map = {row["order_id"]: row for row in target_rows}
    for row in incoming_rows:
        target_map[row["order_id"]] = row
    return list(target_map.values())


if __name__ == "__main__":
    target_rows = [
        {"order_id": 1, "amount": 100},
        {"order_id": 2, "amount": 250},
    ]
    incoming_rows = [
        {"order_id": 2, "amount": 250},
        {"order_id": 3, "amount": 400},
        {"order_id": 3, "amount": 400},
    ]

    deduped = deduplicate_rows(incoming_rows)
    final_target = load_with_deduplication(target_rows, deduped)

    print("Deduped rows:", deduped)
    print("Final target:", final_target)
