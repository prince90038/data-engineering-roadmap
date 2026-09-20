"""
commit_rollback.py

Example: explicit commit and rollback operations.

Shows when to call `commit()` and `rollback()` manually and how to
handle exceptions that require rolling back a transaction before re-raising.
"""

import sqlite3


def insert_user_and_commit(conn: sqlite3.Connection, username: str, email: str) -> int:
    """Insert a user and commit the change.

    Returns the last inserted row id.
    """
    cur = conn.cursor()
    try:
        cur.execute(
            "INSERT INTO users (username, email, created_at) VALUES (?, ?, CURRENT_TIMESTAMP)",
            (username, email),
        )
        conn.commit()
        return cur.lastrowid
    except Exception:
        conn.rollback()
        raise
    finally:
        cur.close()
