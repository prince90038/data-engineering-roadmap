"""ETL anti-patterns example.

This script models a naive pipeline that retries without safeguards and produces duplicate work.
"""

from __future__ import annotations


def naive_load(rows):
    """Bad pattern: blindly reprocesses rows every time."""
    return {"loaded_rows": len(rows), "duplicate_risk": "high"}


def safer_load(rows, seen_ids=None):
    """Better pattern: skip duplicates by checking prior IDs."""
    seen_ids = seen_ids or set()
    unique_rows = [row for row in rows if row["id"] not in seen_ids]
    return {"loaded_rows": len(unique_rows), "duplicate_risk": "low"}


if __name__ == "__main__":
    rows = [{"id": 1}, {"id": 2}, {"id": 2}, {"id": 3}]
    print(naive_load(rows))
    print(safer_load(rows, seen_ids={2}))
