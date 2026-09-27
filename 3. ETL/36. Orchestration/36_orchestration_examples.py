"""Orchestration example.

This script models a simple DAG-like workflow where extraction, transformation,
validation, and loading all depend on the previous stage.
"""

from __future__ import annotations


def extract():
    """Simulate extraction."""
    return [{"id": 1, "amount": 100}, {"id": 2, "amount": 250}]


def transform(rows):
    """Simulate transformation."""
    return [{"id": row["id"], "amount": row["amount"] * 1.1} for row in rows]


def validate(rows):
    """Simulate validation before load."""
    return [row for row in rows if row["amount"] > 0]


def load(rows):
    """Simulate load to the target system."""
    return {"loaded_rows": rows}


def orchestrate():
    """Run task sequence in DAG order."""
    raw_rows = extract()
    transformed = transform(raw_rows)
    good_rows = validate(transformed)
    return load(good_rows)


if __name__ == "__main__":
    print(orchestrate())
