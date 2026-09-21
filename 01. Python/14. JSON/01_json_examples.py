"""
json_examples.py

Examples for JSON serialization, deserialization, and streaming JSON
lines (JSON Lines) for large datasets.
"""

import json
from pathlib import Path
from typing import Iterator, Any


def read_json(path: Path) -> Any:
    with path.open("r", encoding="utf-8") as f:
        return json.load(f)


def write_json(path: Path, obj: Any):
    with path.open("w", encoding="utf-8") as f:
        json.dump(obj, f, ensure_ascii=False, indent=2)


def read_json_lines(path: Path) -> Iterator[Any]:
    with path.open("r", encoding="utf-8") as f:
        for line in f:
            yield json.loads(line)


if __name__ == "__main__":
    p = Path("data.json")
    write_json(p, {"a": 1, "b": [1,2,3]})
    print(read_json(p))
