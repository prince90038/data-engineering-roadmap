"""
itertools_examples.py

Examples demonstrating useful `itertools` utilities for efficient
iteration and grouping.
"""

import itertools
from typing import Iterable


def chunked(iterable: Iterable, size: int):
    """Yield successive `size`-sized chunks from `iterable`."""
    it = iter(iterable)
    while True:
        chunk = list(itertools.islice(it, size))
        if not chunk:
            return
        yield chunk


if __name__ == "__main__":
    print(list(chunked(range(10), 3)))
