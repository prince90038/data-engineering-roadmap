"""Micro-batching example.

This script processes data in small windows instead of one large batch.
"""

from __future__ import annotations


def create_micro_batches(rows, batch_size):
    """Split a list of rows into small batches."""
    return [rows[i:i + batch_size] for i in range(0, len(rows), batch_size)]


def process_batch(batch):
    """Simulate processing one micro-batch."""
    return {"batch_size": len(batch), "total": sum(row["value"] for row in batch)}


def process_micro_batches(rows, batch_size):
    """Process all micro-batches and return the result summary."""
    batches = create_micro_batches(rows, batch_size)
    return [process_batch(batch) for batch in batches]


if __name__ == "__main__":
    rows = [
        {"id": 1, "value": 10},
        {"id": 2, "value": 20},
        {"id": 3, "value": 30},
        {"id": 4, "value": 40},
    ]

    print(process_micro_batches(rows, batch_size=2))
