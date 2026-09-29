"""Schema evolution example.

This script demonstrates a safe evolution pattern where a new optional field is added
without breaking the existing contract.
"""

from __future__ import annotations


def evolve_schema(rows, add_segment=False):
    """Add an optional field if requested; keep existing fields unchanged."""
    evolved = []
    for row in rows:
        new_row = dict(row)
        if add_segment:
            new_row["segment"] = "new_customer"
        evolved.append(new_row)
    return evolved


if __name__ == "__main__":
    rows = [
        {"customer_id": 1, "country": "US"},
        {"customer_id": 2, "country": "UK"},
    ]

    print("Before evolution:", rows)
    print("After evolution:", evolve_schema(rows, add_segment=True))
