"""
multiprocessing_examples.py

Simple multiprocessing examples using Process and Pool for CPU-bound work.
"""

from multiprocessing import Pool


def cpu_work(x):
    return sum(i*i for i in range(x))


def run_pool():
    with Pool(4) as p:
        print(p.map(cpu_work, [10000, 20000, 30000, 40000]))


if __name__ == "__main__":
    run_pool()
