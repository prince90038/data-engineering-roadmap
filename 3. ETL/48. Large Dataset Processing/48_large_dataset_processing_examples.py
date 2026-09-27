"""Large dataset processing example.

This script demonstrates chunked processing to avoid loading everything at once.
"""

from __future__ import annotations


def chunk_rows(rows, chunk_size):
    """Yield rows in manageable chunks."""
    for i in range(0, len(rows), chunk_size):
        yield rows[i:i + chunk_size]


def process_in_chunks(rows, chunk_size=3):
    """Process large data one chunk at a time."""
    total = 0
    for chunk in chunk_rows(rows, chunk_size):
        total += len(chunk)
    return {"processed_rows": total, "chunk_size": chunk_size}


if __name__ == "__main__":
    rows = [{"id": idx} for idx in range(1, 16)]
    print(process_in_chunks(rows, chunk_size=5))
