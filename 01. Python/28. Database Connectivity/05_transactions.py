"""
transactions.py

Example: transaction management patterns using DB-API.

Shows manual transaction control as well as a convenience context manager
that commits on success and rolls back on error.
"""

from contextlib import contextmanager
import sqlite3
from typing import Iterator


@contextmanager
def transaction(conn: sqlite3.Connection) -> Iterator[sqlite3.Connection]:
    """Context manager for a transaction.

    Usage:
        with transaction(conn) as tx:
            tx.execute(...)  # multiple operations

    Commits if the block exits normally, rolls back on exception.
    """
    try:
        yield conn
        conn.commit()
    except Exception:
        conn.rollback()
        raise
