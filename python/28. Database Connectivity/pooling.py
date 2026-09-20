"""
pooling.py

Example: simple connection pooling using a queue for lightweight reuse.

For production use consider a battle-tested pool from a library or the
driver itself (e.g., `psycopg2.pool`, `sqlalchemy.pool`, or the
database driver's built-in pool).
"""

import queue
import sqlite3
from typing import Optional


class SimplePool:
    """A tiny thread-safe connection pool backed by queue.Queue.

    This pool demonstrates the idea of reusing connections. It is not
    intended to be feature-complete.
    """

    def __init__(self, db_path: str, maxsize: int = 5):
        self._db_path = db_path
        self._pool = queue.Queue(maxsize)
        for _ in range(maxsize):
            self._pool.put(sqlite3.connect(db_path))

    def get(self, block: bool = True, timeout: Optional[float] = None) -> sqlite3.Connection:
        return self._pool.get(block, timeout)

    def put(self, conn: sqlite3.Connection):
        try:
            self._pool.put(conn, block=False)
        except queue.Full:
            conn.close()

    def closeall(self):
        while not self._pool.empty():
            conn = self._pool.get_nowait()
            conn.close()
