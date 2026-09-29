"""Data quality example.

This script checks basic quality rules for incoming records before they are loaded.
"""

from __future__ import annotations


def validate_quality(rows):
    """Return only rows that pass basic data quality checks."""
    valid = []
    for row in rows:
        customer_id = row.get("customer_id")
        amount = row.get("amount")
        if customer_id is None or amount is None:
            continue
        if float(amount) <= 0:
            continue
        valid.append({
            "customer_id": int(customer_id),
            "amount": float(amount),
            "country": str(row.get("country", "")).strip().upper(),
        })
    return valid


if __name__ == "__main__":
    rows = [
        {"customer_id": 1, "amount": 100.0, "country": "us"},
        {"customer_id": 2, "amount": -10.0, "country": "uk"},
        {"customer_id": 3, "amount": None, "country": "ca"},
        {"customer_id": 4, "amount": 250.0, "country": "de"},
    ]

    print(validate_quality(rows))
