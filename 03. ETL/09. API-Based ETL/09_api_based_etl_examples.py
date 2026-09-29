"""API-based ETL example.

This script models pagination and incremental API extraction for a SaaS source.
"""

from __future__ import annotations


def fetch_page(page_number, page_size, total_items):
    """Simulate a paginated API response for one page of items."""
    start = (page_number - 1) * page_size
    end = min(start + page_size, total_items)
    return [
        {"id": item_id, "updated_at": f"2026-09-{item_id % 28 + 1:02d}T00:00:00"}
        for item_id in range(start + 1, end + 1)
    ]


def fetch_all_pages(total_items, page_size):
    """Fetch all pages for a paginated API."""
    pages = []
    page_number = 1
    while (page_number - 1) * page_size < total_items:
        page = fetch_page(page_number, page_size, total_items)
        pages.append(page)
        page_number += 1
    return [item for page in pages for item in page]


def incremental_api_fetch(rows, last_seen_id):
    """Return only records with an ID greater than the last seen value."""
    return [row for row in rows if row["id"] > last_seen_id]


if __name__ == "__main__":
    all_rows = fetch_all_pages(total_items=12, page_size=4)
    last_seen_id = 8
    new_rows = incremental_api_fetch(all_rows, last_seen_id)

    print("All rows:", all_rows)
    print("Rows after last seen ID:", new_rows)
