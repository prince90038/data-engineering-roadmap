"""Transformation strategy example.

This script demonstrates how a simple transformation task can be implemented with
Python, while comparing this approach to SQL and PySpark-style reasoning.
"""

from __future__ import annotations


def transform_with_python(rows):
    """Apply a simple Python-based transformation workflow."""
    cleaned = []
    for row in rows:
        cleaned.append({
            "customer_id": int(row["customer_id"]),
            "amount": float(row["amount"]),
            "country": str(row["country"]).upper(),
        })
    return cleaned


def summarize_rows(rows):
    """Compute a summary for downstream reporting."""
    return {
        "record_count": len(rows),
        "total_amount": round(sum(row["amount"] for row in rows), 2),
    }


if __name__ == "__main__":
    rows = [
        {"customer_id": "1", "amount": "100.0", "country": "us"},
        {"customer_id": "2", "amount": "250.5", "country": "uk"},
        {"customer_id": "3", "amount": "90.0", "country": "ca"},
    ]

    transformed = transform_with_python(rows)
    print("Transformed rows:", transformed)
    print("Summary:", summarize_rows(transformed))
