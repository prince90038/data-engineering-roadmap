"""
cursor.py

Example: using cursors to execute queries and fetch results.

This demonstrates acquiring a cursor from a DB connection, executing a
query, iterating results, and closing the cursor. Works with DB-API
compatible drivers such as `sqlite3`, `psycopg2`, and `pymysql`.
"""

from typing import Iterable, Tuple
import sqlite3


def fetch_all(conn: sqlite3.Connection, query: str) -> Iterable[Tuple]:
    """Execute `query` using a cursor and yield all rows.

    Args:
        conn: DB connection object.
        query: SQL select query string.

    Yields:
        Rows returned by the query as tuples.
    """
    cur = conn.cursor()
    try:
        cur.execute(query)
        for row in cur.fetchall():
            yield row
    finally:
        cur.close()
