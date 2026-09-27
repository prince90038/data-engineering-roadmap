"""ETL metadata example.

This script creates a metadata dictionary for a single pipeline run.
"""

from __future__ import annotations


def build_run_metadata(pipeline_name, run_id, status, records_read, records_processed):
    """Return metadata for an ETL run."""
    return {
        "pipeline_name": pipeline_name,
        "run_id": run_id,
        "status": status,
        "records_read": records_read,
        "records_processed": records_processed,
        "records_failed": max(0, records_read - records_processed),
    }


if __name__ == "__main__":
    print(build_run_metadata("customer_daily_sync", "run_001", "success", 1000, 980))
