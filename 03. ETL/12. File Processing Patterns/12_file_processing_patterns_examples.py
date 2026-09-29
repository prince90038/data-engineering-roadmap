"""File processing patterns example.

This script demonstrates single-file and partitioned-file processing patterns
using a simple directory-like structure.
"""

from __future__ import annotations


def process_single_file(file_rows):
    """Process one file and return a normalized representation."""
    return [{"id": row["id"], "value": float(row["value"])} for row in file_rows]


def process_partitioned_files(partition_map):
    """Process partitioned directory data by iterating over logical partitions."""
    result = []
    for partition_name, rows in partition_map.items():
        result.append({"partition": partition_name, "records": process_single_file(rows)})
    return result


if __name__ == "__main__":
    single_file_rows = [
        {"id": 1, "value": "10.5"},
        {"id": 2, "value": "11.7"},
    ]

    partition_map = {
        "year=2026/month=09": [
            {"id": 3, "value": "12.1"},
            {"id": 4, "value": "13.0"},
        ],
        "year=2026/month=10": [
            {"id": 5, "value": "14.5"},
        ],
    }

    print("Single file:", process_single_file(single_file_rows))
    print("Partitioned files:", process_partitioned_files(partition_map))
