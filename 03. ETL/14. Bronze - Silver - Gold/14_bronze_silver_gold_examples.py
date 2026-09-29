"""Bronze / Silver / Gold example.

This script models a medallion-style pipeline where raw records are cleaned and then
aggregated into a business-ready output.
"""

from __future__ import annotations


def bronze_layer_rows():
    """Simulate raw source records stored in the bronze layer."""
    return [
        {"customer_id": "1", "amount": "100.0", "country": "us"},
        {"customer_id": "1", "amount": "100.0", "country": "us"},
        {"customer_id": "2", "amount": "250.5", "country": "uk"},
    ]


def silver_layer_transform(rows):
    """Deduplicate and normalize bronze data into a cleaner silver layer."""
    unique_rows = {}
    for row in rows:
        unique_rows[row["customer_id"]] = {
            "customer_id": int(row["customer_id"]),
            "amount": float(row["amount"]),
            "country": row["country"].upper(),
        }
    return list(unique_rows.values())


def gold_layer_aggregate(rows):
    """Aggregate silver data into business-ready metrics."""
    total_amount = sum(row["amount"] for row in rows)
    return {"records": rows, "total_amount": round(total_amount, 2)}


if __name__ == "__main__":
    bronze_rows = bronze_layer_rows()
    silver_rows = silver_layer_transform(bronze_rows)
    gold_output = gold_layer_aggregate(silver_rows)

    print("Bronze rows:", bronze_rows)
    print("Silver rows:", silver_rows)
    print("Gold output:", gold_output)
