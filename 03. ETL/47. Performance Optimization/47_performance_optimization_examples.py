"""Performance optimization example.

This script demonstrates filtering before expensive processing to reduce workload.
"""

from __future__ import annotations


def filter_rows(rows, min_amount=0):
    """Filter out rows that fail business conditions before data processing."""
    return [row for row in rows if row["amount"] >= min_amount]


def process_rows(rows, min_amount=0):
    """Simulate a pipeline stage that only touches relevant data."""
    filtered = filter_rows(rows, min_amount)
    return [{"id": row["id"], "amount": row["amount"]} for row in filtered]


if __name__ == "__main__":
    rows = [{"id": 1, "amount": 10}, {"id": 2, "amount": -3}, {"id": 3, "amount": 25}]
    print(process_rows(rows, min_amount=0))
