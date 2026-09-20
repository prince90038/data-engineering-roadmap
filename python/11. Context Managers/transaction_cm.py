"""
transaction_cm.py

Example: transaction context manager that commits on success and rolls
back on exception. Intended to demonstrate the pattern; replace the
`database` object with a real DB connection supporting `commit()` and
`rollback()`.
"""

from contextlib import contextmanager


@contextmanager
def transaction(database):
    """Yield a database connection within a transaction.

    Commits when the context block exits normally, rolls back on
    exception, and always performs any necessary cleanup.
    """
    try:
        yield database
        database.commit()
    except Exception:
        database.rollback()
        raise


if __name__ == "__main__":
    class MockDB:
        def commit(self):
            print("Mock commit")
        def rollback(self):
            print("Mock rollback")

    db = MockDB()
    try:
        with transaction(db) as t:
            print("Do work")
            # raise RuntimeError("fail")
    except Exception:
        pass
