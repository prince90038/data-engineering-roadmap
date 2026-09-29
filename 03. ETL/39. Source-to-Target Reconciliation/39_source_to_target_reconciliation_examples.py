"""Source-to-target reconciliation example.

This script compares source row count versus target row count and flags mismatches.
"""

from __future__ import annotations


def reconcile_counts(source_count, target_count):
    """Return a simple reconciliation summary."""
    mismatch = source_count - target_count
    if mismatch == 0:
        return {"status": "ok", "difference": 0}
    return {"status": "mismatch", "difference": mismatch}


if __name__ == "__main__":
    print(reconcile_counts(1000, 985))
