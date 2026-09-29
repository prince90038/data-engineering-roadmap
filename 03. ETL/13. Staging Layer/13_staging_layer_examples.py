"""Staging layer example.

This script simulates extracting raw source rows into a staging table and then
applying a simple transformation before moving to a curated table.
"""

from __future__ import annotations


def extract_raw_rows():
    """Simulate reading source rows into a raw staging area."""
    return [
        {"order_id": 1, "customer_name": " Alice ", "amount": "100.00"},
        {"order_id": 2, "customer_name": "Bob", "amount": "250.50"},
    ]


def clean_staging_rows(rows):
    """Normalize staging records for downstream transformation."""
    cleaned = []
    for row in rows:
        cleaned.append({
            "order_id": row["order_id"],
            "customer_name": row["customer_name"].strip().title(),
            "amount": float(row["amount"]),
        })
    return cleaned


def load_curated_table(rows):
    """Simulate moving cleaned staging data to a curated table."""
    return {"curated_table": rows}


if __name__ == "__main__":
    raw_rows = extract_raw_rows()
    cleaned_rows = clean_staging_rows(raw_rows)
    curated = load_curated_table(cleaned_rows)

    print("Raw staging rows:", raw_rows)
    print("Curated rows:", curated)
