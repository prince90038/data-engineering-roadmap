"""Data pipeline architecture example.

This script simulates the component stages commonly present in a production data pipeline.
"""

from __future__ import annotations


def extract(rows):
    """Simulate extraction."""
    return rows


def validate(rows):
    """Simulate validation."""
    return [row for row in rows if row.get("id") is not None]


def transform(rows):
    """Simulate transformation."""
    return [{"id": row["id"], "status": "processed"} for row in rows]


def load(rows):
    """Simulate writing to target."""
    return {"loaded_count": len(rows)}


def run_pipeline(rows):
    """Run the pipeline through the main stages."""
    extracted = extract(rows)
    validated = validate(extracted)
    transformed = transform(validated)
    return load(transformed)


if __name__ == "__main__":
    data = [{"id": 1}, {"id": 2}, {"id": 3}]
    print(run_pipeline(data))
