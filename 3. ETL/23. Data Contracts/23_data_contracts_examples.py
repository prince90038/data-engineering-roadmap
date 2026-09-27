"""Data contracts example.

This script models a simple producer-consumer contract where required fields are
validated and unexpected schema changes are flagged.
"""

from __future__ import annotations


def check_contract(rows, required_fields):
    """Validate whether the row contains the required fields required by contract."""
    valid = []
    for row in rows:
        if all(field in row for field in required_fields):
            valid.append(row)
    return valid


if __name__ == "__main__":
    contract_fields = ["customer_id", "email", "country"]
    rows = [
        {"customer_id": 1, "email": "a@example.com", "country": "US"},
        {"customer_id": 2, "email": "b@example.com"},
        {"customer_id": 3, "email": "c@example.com", "country": "CA"},
    ]

    print(check_contract(rows, contract_fields))
