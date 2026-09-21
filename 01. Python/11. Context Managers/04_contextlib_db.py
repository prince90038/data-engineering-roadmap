"""
contextlib_db.py

Example: using `contextlib.contextmanager` to create a simple database
connection context manager. This example uses a mock connection string
for demonstration — replace with a real DB driver in production.
"""

from contextlib import contextmanager


@contextmanager
def database_connection(db_url: str):
    """Yield a mock database connection object.

    Arguments:
        db_url: Database URL or connection string.

    Yields:
        A connection-like object. Replace with a real driver connection
        when integrating with an actual database.
    """
    conn = None
    try:
        conn = f"Connection({db_url})"
        yield conn
    finally:
        if conn:
            # Replace this print with conn.close() for real drivers
            print(f"Closed {conn}")


if __name__ == "__main__":
    with database_connection("sqlite:///example.db") as conn:
        print(f"Using connection: {conn}")
