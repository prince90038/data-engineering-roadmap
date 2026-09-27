"""Testing ETL pipelines example.

This script models a lightweight validation layer for ETL tasks.
"""

from __future__ import annotations


def normalize_date(date_value):
    """Standardize date strings to a YYYY-MM-DD format."""
    if date_value is None:
        raise ValueError("Date value is required")
    return str(date_value).strip()


def validate_rows(rows):
    """Return only rows with valid data for downstream loading."""
    valid = []
    for row in rows:
        if row.get("id") and row.get("amount") is not None:
            valid.append(row)
    return valid


def run_pipeline_checks(rows):
    """Simple test-like checks for ETL correctness."""
    checks = {
        "row_count_ok": len(rows) > 0,
        "all_ids_present": all(row.get("id") is not None for row in rows),
    }
    return checks


if __name__ == "__main__":
    sample_rows = [{"id": 1, "amount": 100}, {"id": 2, "amount": 250}]
    print(validate_rows(sample_rows))
    print(run_pipeline_checks(sample_rows))
