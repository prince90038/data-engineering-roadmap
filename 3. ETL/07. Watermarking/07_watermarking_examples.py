"""Watermarking example.

This script simulates a pipeline that only processes records newer than the
last successful watermark.
"""

from __future__ import annotations


def extract_after_watermark(rows, watermark):
    """Return rows with a timestamp later than the current watermark."""
    return [row for row in rows if row["updated_at"] > watermark]


def update_watermark(rows, current_watermark):
    """Return the highest updated timestamp seen in the batch."""
    if not rows:
        return current_watermark
    return max(row["updated_at"] for row in rows)


def process_batch(rows, current_watermark):
    """Simulate the standard flow: read, filter, process, then advance watermark."""
    new_rows = extract_after_watermark(rows, current_watermark)
    next_watermark = update_watermark(new_rows, current_watermark)
    return new_rows, next_watermark


if __name__ == "__main__":
    rows = [
        {"id": 1, "updated_at": "2026-09-20T08:00:00"},
        {"id": 2, "updated_at": "2026-09-20T09:30:00"},
        {"id": 3, "updated_at": "2026-09-21T07:45:00"},
    ]

    current_watermark = "2026-09-20T08:45:00"
    new_rows, next_watermark = process_batch(rows, current_watermark)

    print("Rows after watermark:", new_rows)
    print("Next watermark:", next_watermark)
