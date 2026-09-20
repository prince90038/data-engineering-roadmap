"""
9. Generators
Generators are particularly useful when processing large datasets.

Learn:

yield
Generator functions
Generator expressions
Lazy evaluation
Memory efficiency
Example:

def read_large_file(path):
    with open(path) as file:
        for line in file:
            yield line
Understand why this is better than loading the entire file into memory.
"""

from typing import Iterator, Iterable
import os


def read_large_file(path: str) -> Iterator[str]:
    """Yield lines from a file lazily (one at a time)."""
    with open(path, 'r', encoding='utf-8') as file:
        for line in file:
            yield line.rstrip('\n')


def count_words_in_file(path: str) -> int:
    """Count words in a file using a generator to avoid loading file into memory."""
    total = 0
    for line in read_large_file(path):
        total += len(line.split())
    return total


def first_n(iterable: Iterable, n: int):
    """Return first n items from any iterable as a list (works with generators)."""
    result = []
    for i, item in enumerate(iterable):
        if i >= n:
            break
        result.append(item)
    return result


# Generator expression example (lazy): squares of numbers
square_gen = (x * x for x in range(10))


if __name__ == '__main__':
    # Simple demonstration when running this file directly.
    demo_file = 'demo.txt'
    # create a small demo file if not present
    if not os.path.exists(demo_file):
        with open(demo_file, 'w', encoding='utf-8') as f:
            for i in range(1, 101):
                f.write(f'Line {i} with number {i}\n')

    print('First 5 lines:', first_n(read_large_file(demo_file), 5))
    print('Word count:', count_words_in_file(demo_file))
    print('First 5 squares from generator:', first_n(square_gen, 5))