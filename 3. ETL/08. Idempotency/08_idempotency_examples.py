"""Idempotency example.

This example models a pipeline that should not duplicate records when re-run.
It uses a deduplication strategy based on a business key.
"""

from __future__ import annotations


def deduplicate_rows(rows):
    """Remove duplicate records by order_id while keeping the latest version."""
    ordered = {}
    for row in rows:
        ordered[row["order_id"]] = row
    return list(ordered.values())


def upsert_target(target_rows, incoming_rows):
    """Simulate an upsert process by keeping all unique business keys."""
    target_map = {row["order_id"]: row for row in target_rows}
    for row in incoming_rows:
        target_map[row["order_id"]] = row
    return list(target_map.values())


if __name__ == "__main__":
    target_rows = [
        {"order_id": 1, "amount": 100, "status": "paid"},
        {"order_id": 2, "amount": 250, "status": "pending"},
    ]

    incoming_rows = [
        {"order_id": 2, "amount": 250, "status": "paid"},
        {"order_id": 3, "amount": 400, "status": "paid"},
        {"order_id": 3, "amount": 400, "status": "paid"},
    ]

    deduplicated = deduplicate_rows(incoming_rows)
    final_target = upsert_target(target_rows, deduplicated)

    print("Deduplicated rows:", deduplicated)
    print("Final target state:", final_target)
