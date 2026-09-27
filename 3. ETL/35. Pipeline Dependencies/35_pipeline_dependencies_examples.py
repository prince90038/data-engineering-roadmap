"""Pipeline dependencies example.

This script models a simple DAG: extract -> transform -> validate -> load.
"""

from __future__ import annotations


def extract_rows():
    """Simulate reading raw source rows."""
    return [{"id": 1, "amount": 100}, {"id": 2, "amount": 250}]


def transform_rows(rows):
    """Apply simple transformation."""
    return [{"id": row["id"], "amount": float(row["amount"]) * 1.1} for row in rows]


def validate_rows(rows):
    """Reject invalid rows before final load."""
    return [row for row in rows if row["amount"] > 0]


def load_rows(rows):
    """Simulate the final target load."""
    return {"target_rows": rows}


def pipeline():
    """Run the pipeline in dependency order."""
    raw_rows = extract_rows()
    transformed = transform_rows(raw_rows)
    valid_rows = validate_rows(transformed)
    return load_rows(valid_rows)


if __name__ == "__main__":
    print(pipeline())
