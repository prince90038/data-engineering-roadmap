"""Transactions and partial loads example.

This script simulates a staging-table pattern where data is prepared before a final
atomic publish to the target table.
"""

from __future__ import annotations


def prepare_staging(rows):
    """Prepare validated rows in a staging table."""
    return [row for row in rows if row.get("amount") is not None]


def atomic_publish(staging_rows, target_rows):
    """Simulate a final successful publish after full validation."""
    if not staging_rows:
        return target_rows
    return target_rows + staging_rows


if __name__ == "__main__":
    target_rows = [{"id": 1, "amount": 100}]
    incoming_rows = [
        {"id": 2, "amount": 250},
        {"id": 3, "amount": None},
    ]

    staging_rows = prepare_staging(incoming_rows)
    final_rows = atomic_publish(staging_rows, target_rows)

    print("Staging rows:", staging_rows)
    print("Final target rows:", final_rows)
