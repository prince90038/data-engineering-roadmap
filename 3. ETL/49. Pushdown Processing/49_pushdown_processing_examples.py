"""Pushdown processing example.

This script reflects the principle of filtering early so the ETL pipeline reduces work before processing.
"""

from __future__ import annotations


def filter_rows(rows, min_amount):
    """Filter rows before expensive transformation logic takes place."""
    return [row for row in rows if row["amount"] >= min_amount]


def get_required_columns(rows):
    """Project only relevant fields similar to a pushdown-style selection."""
    return [{"id": row["id"], "amount": row["amount"]} for row in rows]


if __name__ == "__main__":
    rows = [{"id": 1, "amount": 100}, {"id": 2, "amount": 20}, {"id": 3, "amount": 80}]
    filtered = filter_rows(rows, 50)
    print(get_required_columns(filtered))
