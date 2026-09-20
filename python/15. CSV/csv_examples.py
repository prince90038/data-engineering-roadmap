"""
csv_examples.py

Examples for reading and writing CSV data using the `csv` module and
streaming large CSV files efficiently.
"""

import csv
from pathlib import Path
from typing import Iterator


def read_csv(path: Path) -> Iterator[dict]:
    with path.open("r", encoding="utf-8", newline="") as f:
        reader = csv.DictReader(f)
        for row in reader:
            yield row


def write_csv(path: Path, rows, fieldnames):
    with path.open("w", encoding="utf-8", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        writer.writeheader()
        for r in rows:
            writer.writerow(r)


if __name__ == "__main__":
    p = Path("sample.csv")
    rows = [{"id":1, "name":"a"}, {"id":2, "name":"b"}]
    write_csv(p, rows, fieldnames=["id","name"]) 
    for r in read_csv(p):
        print(r)
