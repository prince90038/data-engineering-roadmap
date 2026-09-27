"""Batch processing example.

This script simulates a scheduled batch pipeline that extracts, transforms, and loads
records in one run.
"""

from __future__ import annotations


def extract_batch():
    """Simulate extracting a batch of rows from a source."""
    return [
        {"customer_id": 1, "amount": 100},
        {"customer_id": 2, "amount": 250},
        {"customer_id": 3, "amount": 320},
    ]


def transform_batch(rows):
    """Apply a simple transformation to batch data."""
    return [{"customer_id": row["customer_id"], "amount": float(row["amount"]) * 1.1} for row in rows]


def load_batch(rows):
    """Simulate loading a batch to a target table."""
    return {"loaded_rows": rows}


def run_batch_pipeline():
    """Execute the complete batch flow."""
    extracted = extract_batch()
    transformed = transform_batch(extracted)
    return load_batch(transformed)


if __name__ == "__main__":
    result = run_batch_pipeline()
    print(result)
