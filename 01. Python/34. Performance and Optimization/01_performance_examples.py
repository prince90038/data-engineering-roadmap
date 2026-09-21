"""
performance_examples.py

Examples for profiling with `timeit` and `cProfile`, and using
`memory_profiler` when available. Keep these as local tools for
performance investigations.
"""

import timeit


def slow_sum(n):
    s = 0
    for i in range(n):
        s += i
    return s


def bench():
    print(timeit.timeit(lambda: slow_sum(10000), number=50))


if __name__ == "__main__":
    bench()
