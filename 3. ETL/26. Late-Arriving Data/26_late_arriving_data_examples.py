"""Late-arriving data example.

This script models how a pipeline may need to reprocess a window when records arrive
late after the normal batch cutoff.
"""

from __future__ import annotations


def process_batch(rows, cutoff_time):
    """Filter rows to those whose timestamps are on or before the cutoff."""
    return [row for row in rows if row["event_time"] <= cutoff_time]


def reprocess_for_late_rows(rows, cutoff_time, late_rows):
    """Merge late rows back into the processed dataset for a corrective re-run."""
    combined = rows + late_rows
    return sorted(combined, key=lambda row: row["event_time"])


if __name__ == "__main__":
    rows = [
        {"event_id": 1, "event_time": "2026-09-27T10:00:00"},
        {"event_id": 2, "event_time": "2026-09-27T10:05:00"},
    ]
    cutoff_time = "2026-09-27T10:04:00"
    late_rows = [{"event_id": 3, "event_time": "2026-09-27T10:06:00"}]

    normal_batch = process_batch(rows, cutoff_time)
    corrected_batch = reprocess_for_late_rows(normal_batch, cutoff_time, late_rows)

    print("Normal batch:", normal_batch)
    print("Corrected batch after late data:", corrected_batch)
