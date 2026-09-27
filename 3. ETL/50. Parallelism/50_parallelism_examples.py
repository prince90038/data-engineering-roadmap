"""Parallelism example.

This script models independent work items that can be processed in parallel.
"""

from __future__ import annotations


def process_item(item):
    """Simulate transform work for one item."""
    return {"id": item["id"], "processed": True}


def process_items(items):
    """Process a list of independent items sequentially.

    In a real system, this step could be parallelized when needed.
    """
    return [process_item(item) for item in items]


if __name__ == "__main__":
    data = [{"id": 1}, {"id": 2}, {"id": 3}]
    print(process_items(data))
