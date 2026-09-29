"""Observability example.

This script aggregates a few standard operational metrics that pipelines often track.
"""

from __future__ import annotations


def pipeline_metrics(records_read, records_written, records_rejected, runtime_seconds):
    """Return a summary of key pipeline metrics."""
    return {
        "records_read": records_read,
        "records_written": records_written,
        "records_rejected": records_rejected,
        "runtime_seconds": runtime_seconds,
        "throughput_per_second": round(records_read / runtime_seconds, 2) if runtime_seconds else 0,
    }


if __name__ == "__main__":
    metrics = pipeline_metrics(10000, 9800, 200, 30)
    print(metrics)
