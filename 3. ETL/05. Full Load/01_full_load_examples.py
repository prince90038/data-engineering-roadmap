"""Full load example.

This script demonstrates a full refresh pattern where all rows from a source are
copied into a target table. It also shows a simple comparison of full load versus
incremental loading for a small dataset.
"""

from __future__ import annotations


def full_load(source_rows):
    """Copy all rows to a target as a full snapshot."""
    return {"target_table": source_rows}


def incremental_load(source_rows, last_loaded_ids):
    """Load only rows not already present in the target."""
    new_rows = [row for row in source_rows if row["id"] not in last_loaded_ids]
    return {"target_table": new_rows}


if __name__ == "__main__":
    source_rows = [
        {"id": 1, "name": "Alice", "amount": 100},
        {"id": 2, "name": "Bob", "amount": 250},
        {"id": 3, "name": "Charlie", "amount": 370},
    ]

    last_loaded_ids = {2}

    full_snapshot = full_load(source_rows)
    incremental_snapshot = incremental_load(source_rows, last_loaded_ids)

    print("Full Load:")
    print(full_snapshot)

    print("\nIncremental Load:")
    print(incremental_snapshot)
