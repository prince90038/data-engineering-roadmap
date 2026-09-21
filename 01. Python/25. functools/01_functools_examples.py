"""
functools_examples.py

Examples for `functools` utilities like `lru_cache`, `partial`, and
`wraps` to improve performance and implement higher-order functions.
"""

from functools import lru_cache, partial


@lru_cache(maxsize=128)
def fib(n: int) -> int:
    if n < 2:
        return n
    return fib(n-1) + fib(n-2)


if __name__ == "__main__":
    print(fib(20))
    double = partial(lambda x, y: x * y, 2)
    print(double(5))
