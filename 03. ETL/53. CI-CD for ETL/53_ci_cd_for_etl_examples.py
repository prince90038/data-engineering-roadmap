"""CI/CD for ETL example.

This script models a simple release gate used before promoting a pipeline change.
"""

from __future__ import annotations


def release_approved(test_status, lint_status, schema_status):
    """Approve a release only if all critical gates pass."""
    return test_status and lint_status and schema_status


if __name__ == "__main__":
    print({"release_approved": release_approved(True, True, True)})
