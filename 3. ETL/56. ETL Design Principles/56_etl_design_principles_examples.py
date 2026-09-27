"""ETL design principles example.

This script demonstrates how a pipeline can be structured around idempotent and observable stages.
"""

from __future__ import annotations


def extract(source_rows):
    """Simulate extraction."""
    return source_rows


def transform(rows):
    """Simulate transformation with idempotent logic."""
    return [{"id": row["id"], "status": row.get("status", "new").lower()} for row in rows]


def audit_status(rows):
    """Return a minimal operational summary."""
    return {
        "rows_processed": len(rows),
        "statuses": sorted({row["status"] for row in rows}),
    }


def run_pipeline(rows):
    """Run a basic, observable ETL workflow."""
    extracted = extract(rows)
    transformed = transform(extracted)
    return audit_status(transformed)


if __name__ == "__main__":
    sample_rows = [{"id": 1, "status": "NEW"}, {"id": 2, "status": "ok"}]
    print(run_pipeline(sample_rows))
