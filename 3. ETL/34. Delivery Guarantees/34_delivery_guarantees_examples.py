"""Delivery guarantees example.

This script models how deduplication can help approximate exactly-once behavior in
an at-least-once delivery system.
"""

from __future__ import annotations


def deduplicate_events(events):
    """Deduplicate by event_id, keeping the first or latest event."""
    unique = {}
    for event in events:
        unique[event["event_id"]] = event
    return list(unique.values())


def process_events(events):
    """Simulate at-least-once ingestion followed by deduplication."""
    return deduplicate_events(events)


if __name__ == "__main__":
    events = [
        {"event_id": 1, "value": 100},
        {"event_id": 1, "value": 100},
        {"event_id": 2, "value": 250},
    ]

    print(process_events(events))
