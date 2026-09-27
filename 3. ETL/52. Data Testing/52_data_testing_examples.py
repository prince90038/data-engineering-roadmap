"""Data testing example.

This script validates a few common data quality checks.
"""

from __future__ import annotations


def validate_dataset(rows, required_columns):
    """Check whether all required columns are present and values are non-null."""
    if not rows:
        return {"status": "warning", "message": "No rows available"}

    for col in required_columns:
        if any(row.get(col) is None for row in rows):
            return {"status": "failed", "message": f"Missing values in {col}"}

    return {"status": "passed", "row_count": len(rows)}


if __name__ == "__main__":
    data = [{"id": 1, "customer_id": 101}, {"id": 2, "customer_id": 102}]
    print(validate_dataset(data, ["id", "customer_id"]))
