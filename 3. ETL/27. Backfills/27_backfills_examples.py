"""Backfill example.

This script shows how a date-range backfill can reprocess historical records.
"""

from __future__ import annotations


def backfill_rows(rows, start_date, end_date):
    """Return rows in the selected historical date range."""
    return [row for row in rows if start_date <= row["date"] <= end_date]


if __name__ == "__main__":
    rows = [
        {"id": 1, "date": "2026-09-20"},
        {"id": 2, "date": "2026-09-21"},
        {"id": 3, "date": "2026-09-22"},
        {"id": 4, "date": "2026-09-23"},
    ]

    start_date = "2026-09-21"
    end_date = "2026-09-22"
    print(backfill_rows(rows, start_date, end_date))
