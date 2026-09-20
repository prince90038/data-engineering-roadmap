"""
file_handling.py

Examples demonstrating safe file reading/writing, using `pathlib`, and
streaming large files with generators to avoid high memory usage.
"""

from pathlib import Path
from typing import Iterator


def read_lines(path: Path) -> Iterator[str]:
    """Yield lines from a file lazily."""
    with path.open("r", encoding="utf-8") as f:
        for line in f:
            yield line.rstrip("\n")


def write_lines(path: Path, lines):
    """Write an iterable of lines to a file atomically (simple example)."""
    with path.open("w", encoding="utf-8") as f:
        for line in lines:
            f.write(f"{line}\n")


if __name__ == "__main__":
    p = Path("sample.txt")
    write_lines(p, ["a","b","c"]) 
    for l in read_lines(p):
        print(l)
