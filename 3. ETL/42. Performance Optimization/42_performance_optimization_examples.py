"""Performance optimization example.

This script demonstrates chunking large work into manageable batches for ETL jobs.
"""

from __future__ import annotations


def process_in_batches(rows, batch_size):
    """Split a large list into chunks to reduce memory and improve control."""
    for i in range(0, len(rows), batch_size):
        yield rows[i:i + batch_size]


def optimize_rows(rows, batch_size=100):
    """Return only valid rows while processing in batches."""
    valid_rows = []
    for batch in process_in_batches(rows, batch_size):
        valid_rows.extend(row for row in batch if row["amount"] > 0)
    return valid_rows


if __name__ == "__main__":
    records = [{"id": idx, "amount": idx % 3} for idx in range(1, 25)]
    print(optimize_rows(records, batch_size=5))
