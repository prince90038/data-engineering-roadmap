"""Checkpointing example.

This script simulates saving progress for an incremental load and resuming later.
"""

from __future__ import annotations


def checkpoint_state(rows, last_processed_id):
    """Return new rows after the last processed ID and the new checkpoint value."""
    new_rows = [row for row in rows if row["id"] > last_processed_id]
    if new_rows:
        next_checkpoint = max(row["id"] for row in new_rows)
    else:
        next_checkpoint = last_processed_id
    return new_rows, next_checkpoint


if __name__ == "__main__":
    rows = [
        {"id": 1, "value": 10},
        {"id": 2, "value": 20},
        {"id": 3, "value": 30},
    ]
    last_processed_id = 1

    remaining_rows, next_checkpoint = checkpoint_state(rows, last_processed_id)
    print("Remaining rows:", remaining_rows)
    print("Next checkpoint:", next_checkpoint)
