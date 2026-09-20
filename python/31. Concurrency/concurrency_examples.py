"""
concurrency_examples.py

Examples showcasing threading, multiprocessing, and asyncio patterns
with simple, illustrative tasks.
"""

import threading
import multiprocessing
import asyncio
from time import sleep


def threaded_task(n):
    print(f"Thread {n} start")
    sleep(0.1)
    print(f"Thread {n} done")


def process_task(n):
    print(f"Process {n} start")
    sleep(0.1)
    print(f"Process {n} done")


async def async_task(n):
    print(f"Async {n} start")
    await asyncio.sleep(0.1)
    print(f"Async {n} done")


def run_threading():
    threads = [threading.Thread(target=threaded_task, args=(i,)) for i in range(3)]
    for t in threads:
        t.start()
    for t in threads:
        t.join()


def run_multiprocessing():
    procs = [multiprocessing.Process(target=process_task, args=(i,)) for i in range(3)]
    for p in procs:
        p.start()
    for p in procs:
        p.join()


async def run_asyncio():
    await asyncio.gather(*(async_task(i) for i in range(3)))


if __name__ == "__main__":
    run_threading()
    # run_multiprocessing()  # uncomment to run processes
    asyncio.run(run_asyncio())
