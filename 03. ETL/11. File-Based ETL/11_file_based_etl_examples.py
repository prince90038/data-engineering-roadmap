"""File-based ETL example.

This script simulates loading records from a file source into a staging layer.
It focuses on validation and record extraction, which are common in file ETL jobs.
"""

from __future__ import annotations


def validate_file_rows(rows):
    """Remove rows with missing fields before processing."""
    return [row for row in rows if row.get("customer_id") and row.get("amount") is not None]


def parse_csv_rows(raw_rows):
    """Convert raw strings to simple typed data."""
    cleaned = []
    for row in raw_rows:
        cleaned.append({
            "customer_id": int(row["customer_id"]),
            "amount": float(row["amount"]),
            "country": row["country"].strip().upper(),
        })
    return cleaned


def load_to_staging(rows):
    """Simulate writing validated rows to a staging table."""
    return {"staging_rows": rows}


def file_etl_pipeline(raw_rows):
    """Run validation, parse, and staging load."""
    parsed_rows = parse_csv_rows(raw_rows)
    validated = validate_file_rows(parsed_rows)
    return load_to_staging(validated)


if __name__ == "__main__":
    raw_rows = [
        {"customer_id": "101", "amount": "25.50", "country": " us "},
        {"customer_id": "102", "amount": "", "country": "uk"},
        {"customer_id": "103", "amount": "80.00", "country": " CA "},
    ]

    result = file_etl_pipeline(raw_rows)
    print(result)
