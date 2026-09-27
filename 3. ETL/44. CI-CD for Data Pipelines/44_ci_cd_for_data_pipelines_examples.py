"""CI/CD example for data pipelines.

This script models a simple release gate used before promoting ETL changes.
"""

from __future__ import annotations


def check_release_gate(unit_tests_passed, schema_checks_passed, data_quality_passed):
    """Evaluate whether a pipeline release can proceed."""
    return unit_tests_passed and schema_checks_passed and data_quality_passed


def create_release_summary(environment, checks):
    """Summarize the current release status."""
    status = "approved" if checks else "blocked"
    return {"environment": environment, "status": status}


if __name__ == "__main__":
    result = check_release_gate(True, True, False)
    print(create_release_summary("production", result))
