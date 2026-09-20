"""
lock_manager.py

Example: context manager for acquiring and releasing a threading lock.

Wraps a `threading.Lock` to ensure the lock is released even if the
protected block raises an exception.
"""

import threading
from typing import Optional


class LockManager:
    def __init__(self, lock: Optional[threading.Lock] = None):
        self.lock = lock or threading.Lock()

    def __enter__(self):
        self.lock.acquire()
        return self.lock

    def __exit__(self, exc_type, exc_val, exc_tb):
        self.lock.release()
        # do not suppress exceptions
        return False


if __name__ == "__main__":
    lock = threading.Lock()
    with LockManager(lock):
        print("In critical section")
