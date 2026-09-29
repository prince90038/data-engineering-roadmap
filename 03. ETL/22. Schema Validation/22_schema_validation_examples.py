"""Schema validation example.

This script validates required fields and field types before ingestion.
"""

from __future__ import annotations


def validate_schema(rows):
    """Filter records where required fields are missing or invalid."""
    valid = []
    for row in rows:
        try:
            record = {
                "customer_id": int(row["customer_id"]),
                "amount": float(row["amount"]),
                "country": str(row["country"]).strip().upper(),
            }
        except (KeyError, TypeError, ValueError):
            continue
        valid.append(record)
    return valid


if __name__ == "__main__":
    rows = [
        {"customer_id": "101", "amount": "10.5", "country": " us "},
        {"customer_id": "bad", "amount": "15.0", "country": "uk"},
        {"customer_id": "103", "amount": "x", "country": "de"},
    ]

    print(validate_schema(rows))
