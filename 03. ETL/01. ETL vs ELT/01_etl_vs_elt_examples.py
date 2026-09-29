"""ETL vs ELT example.

This script shows the basic difference between two pipeline patterns:
- ETL: transform before loading
- ELT: load first, transform later

It creates a small in-memory dataset and demonstrates the movement of raw and
transformed records using Python.
"""

from __future__ import annotations


def transform_customer_rows(rows):
    """Normalize and clean records before they are loaded into a target."""
    cleaned = []
    for row in rows:
        cleaned.append(
            {
                "customer_id": row["customer_id"],
                "customer_name": row["customer_name"].strip().title(),
                "country": row["country"].strip().upper(),
            }
        )
    return cleaned


def load_to_target(rows):
    """Simulate loading transformed data into a final warehouse table."""
    return [{"loaded": True, **row} for row in rows]


def etl_example(raw_rows):
    """ETL flow: clean and transform data before loading."""
    transformed = transform_customer_rows(raw_rows)
    return load_to_target(transformed)


def elt_example(raw_rows):
    """ELT flow: load raw rows first, then transform later."""
    staged_rows = [{"staged": True, **row} for row in raw_rows]
    transformed = transform_customer_rows(raw_rows)
    return {"staged": staged_rows, "transformed": transformed}


if __name__ == "__main__":
    raw_rows = [
        {"customer_id": 1, "customer_name": " alice smith ", "country": " us "},
        {"customer_id": 2, "customer_name": "bob jones", "country": " uk "},
    ]

    etl_result = etl_example(raw_rows)
    elt_result = elt_example(raw_rows)

    print("ETL Result:")
    for row in etl_result:
        print(row)

    print("\nELT Result:")
    print(elt_result)
