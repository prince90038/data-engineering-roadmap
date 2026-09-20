"""
collections_examples.py

Examples for `collections` module: Counter, defaultdict, deque, namedtuple.
"""

from collections import Counter, defaultdict, deque, namedtuple


def top_k(items, k=1):
    return Counter(items).most_common(k)


if __name__ == "__main__":
    items = [1,2,2,3,3,3]
    print(top_k(items, 2))
