"""Practical projects example.

This script models a mini ETL workflow for a realistic project structure.
"""

from __future__ import annotations


def extract_csv_rows():
    """Simulate reading source rows."""
    return [{"id": 1, "amount": 120}, {"id": 2, "amount": 30}, {"id": 3, "amount": 90}]


def validate_rows(rows):
    """Reject rows that fail basic validation."""
    return [row for row in rows if row.get("amount") is not None and row["amount"] > 0]


def transform_rows(rows):
    """Transform rows into a warehouse-ready form."""
    return [{"id": row["id"], "amount_usd": row["amount"]} for row in rows]


def load_to_target(rows):
    """Return a summary of the completed project flow."""
    return {"loaded_records": len(rows), "target": "warehouse"}


def run_project():
    """Run the practical ETL project flow."""
    source_rows = extract_csv_rows()
    validated = validate_rows(source_rows)
    transformed = transform_rows(validated)
    return load_to_target(transformed)


if __name__ == "__main__":
    print(run_project())
