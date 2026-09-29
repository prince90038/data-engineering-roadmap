"""Batch vs streaming example.

This script contrasts a scheduled batch job with a lightweight near-real-time trigger.
"""

from __future__ import annotations


def run_batch_job(rows):
    """Batch job processes rows together on a schedule."""
    return {"mode": "batch", "row_count": len(rows), "total": sum(row["value"] for row in rows)}


def run_streaming_job(rows):
    """Streaming-like job processes each row with minimal delay."""
    return [{"mode": "streaming", "row": row["id"], "value": row["value"]} for row in rows]


if __name__ == "__main__":
    rows = [
        {"id": 1, "value": 15},
        {"id": 2, "value": 25},
        {"id": 3, "value": 35},
    ]

    print(run_batch_job(rows))
    print(run_streaming_job(rows))
