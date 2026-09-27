"""Dead-letter handling example.

This script demonstrates how invalid rows can be quarantined for later review.
"""

from __future__ import annotations


def route_rows(rows):
    """Split rows into valid and dead-letter records."""
    valid = []
    dead_letter = []
    for row in rows:
        if row.get("customer_id") is None or row.get("amount") is None:
            dead_letter.append({"row": row, "reason": "missing required field"})
        else:
            valid.append(row)
    return valid, dead_letter


if __name__ == "__main__":
    rows = [
        {"customer_id": 1, "amount": 100},
        {"customer_id": None, "amount": 25},
        {"customer_id": 3, "amount": None},
    ]

    valid_rows, dead_letter_rows = route_rows(rows)
    print("Valid rows:", valid_rows)
    print("Dead-letter rows:", dead_letter_rows)
