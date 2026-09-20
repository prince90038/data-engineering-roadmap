"""
memory_examples.py

Examples and notes on shallow vs deep copy and memory considerations
when handling large data structures.
"""

import copy


def shallow_vs_deep():
    a = [1, [2,3]]
    b = a.copy()
    c = copy.deepcopy(a)
    a[1].append(4)
    return a, b, c


if __name__ == "__main__":
    print(shallow_vs_deep())
