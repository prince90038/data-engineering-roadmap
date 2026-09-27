"""Audit table example.

This script models the kind of operational metadata recorded in an ETL audit log.
"""

from __future__ import annotations


def create_audit_record(run_id, pipeline_name, status, source_count, target_count, error_message=None):
    """Return a record suitable for an ETL audit table."""
    return {
        "run_id": run_id,
        "pipeline_name": pipeline_name,
        "status": status,
        "source_count": source_count,
        "target_count": target_count,
        "failed_count": max(0, source_count - target_count),
        "error_message": error_message,
    }


if __name__ == "__main__":
    print(create_audit_record("run_002", "orders_daily_load", "success", 5000, 4950))
