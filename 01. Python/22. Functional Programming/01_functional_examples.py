"""
functional_examples.py

Examples illustrating `map`, `filter`, `reduce`, comprehensions, and
`functools.partial` usage in data processing.
"""

from functools import reduce, partial
from typing import List


def sum_values(values: List[int]) -> int:
    return reduce(lambda a, b: a + b, values, 0)


def apply_transform(values: List[int]):
    return list(map(lambda x: x * 2, values))


if __name__ == "__main__":
    vals = [1,2,3]
    print(sum_values(vals))
    print(apply_transform(vals))
