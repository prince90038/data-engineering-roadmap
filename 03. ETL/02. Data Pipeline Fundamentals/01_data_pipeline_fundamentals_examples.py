"""Data pipeline fundamentals example.

This script models a simple data pipeline using a source dataset, validation,
transformation, and target loading steps.
"""

from __future__ import annotations


def validate_rows(rows):
    """Filter out records missing required values."""
    return [row for row in rows if row.get("customer_id") and row.get("amount") is not None]


def transform_rows(rows):
    """Apply a simple transformation to calculate order totals."""
    transformed = []
    for row in rows:
        transformed.append(
            {
                "customer_id": row["customer_id"],
                "amount": round(float(row["amount"]), 2),
                "amount_usd": round(float(row["amount"]) * 1.10, 2),
            }
        )
    return transformed


def load_rows(rows):
    """Simulate loading data to a target table."""
    return {"target_rows": rows}


def pipeline(rows):
    """Run the full pipeline: validate -> transform -> load."""
    validated = validate_rows(rows)
    transformed = transform_rows(validated)
    return load_rows(transformed)


if __name__ == "__main__":
    source_rows = [
        {"customer_id": 1, "amount": 100},
        {"customer_id": 2, "amount": 250},
        {"customer_id": 3, "amount": None},
    ]

    result = pipeline(source_rows)
    print(result)
