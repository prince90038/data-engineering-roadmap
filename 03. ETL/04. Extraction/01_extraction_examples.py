"""Extraction examples.

This script demonstrates common extraction patterns:
- full extraction
- incremental extraction by last_updated timestamp
- watermark tracking
"""

from __future__ import annotations


def full_extract(rows):
    """Read all rows from a source, regardless of change state."""
    return rows


def incremental_extract(rows, watermark):
    """Return rows modified after a known last processed timestamp."""
    return [row for row in rows if row.get("updated_at") > watermark]


def extract_with_watermark(rows, watermark):
    """Simulate extraction using a watermark and report the new watermark."""
    new_rows = incremental_extract(rows, watermark)
    latest_watermark = max((row["updated_at"] for row in rows), default=watermark)
    return new_rows, latest_watermark


if __name__ == "__main__":
    source_rows = [
        {"id": 1, "updated_at": "2024-01-01T10:00:00"},
        {"id": 2, "updated_at": "2024-01-02T11:30:00"},
        {"id": 3, "updated_at": "2024-01-03T15:00:00"},
    ]

    watermark = "2024-01-02T00:00:00"

    full_rows = full_extract(source_rows)
    incremental_rows = incremental_extract(source_rows, watermark)
    new_rows, latest_watermark = extract_with_watermark(source_rows, watermark)

    print("Full Extract:", full_rows)
    print("Incremental Extract:", incremental_rows)
    print("Watermarked Extract:", new_rows)
    print("Latest Watermark:", latest_watermark)
