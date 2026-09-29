"""Data transformation example.

This script demonstrates common transformations such as filtering, type conversion,
aggregation, and output shaping.
"""

from __future__ import annotations


def transform_rows(rows):
    """Filter invalid rows, convert values, and compute a total."""
    valid_rows = [row for row in rows if row.get("amount") is not None]
    cleaned = []
    for row in valid_rows:
        cleaned.append({
            "customer_id": int(row["customer_id"]),
            "amount": float(row["amount"]),
            "country": str(row["country"]).upper(),
        })

    total_amount = sum(r["amount"] for r in cleaned)
    return {"rows": cleaned, "total_amount": round(total_amount, 2)}


if __name__ == "__main__":
    rows = [
        {"customer_id": "1", "amount": "100.00", "country": "us"},
        {"customer_id": "2", "amount": "250.50", "country": "uk"},
        {"customer_id": "3", "amount": None, "country": "ca"},
    ]

    result = transform_rows(rows)
    print(result)
