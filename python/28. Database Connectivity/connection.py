"""
connection.py

Example: creating a database connection.

This module shows a simple pattern for opening a DB connection using
`sqlite3` as an example. In production you would replace sqlite3 with
your driver of choice (psycopg2, pymysql, cx_Oracle, pyodbc, etc.) and
move configuration (host, user, password) to secure configuration.

Usage:
    from connection import get_connection

    conn = get_connection('example.db')
    # use the connection
    conn.close()
"""

import sqlite3
from typing import Optional


def get_connection(db_path: str) -> sqlite3.Connection:
    """Return a new sqlite3 connection to `db_path`.

    Args:
        db_path: Filesystem path to the SQLite database file.

    Returns:
        sqlite3.Connection: An open database connection.
    """
    conn = sqlite3.connect(db_path)
    return conn
