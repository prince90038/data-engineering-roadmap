"""
dataclasses_example.py

Example usage of `dataclasses` for simple value objects used in data
pipelines.
"""

from dataclasses import dataclass
from typing import Optional


@dataclass
class Record:
    id: int
    name: str
    value: Optional[float] = None


if __name__ == "__main__":
    r = Record(1, "alice", 3.14)
    print(r)
