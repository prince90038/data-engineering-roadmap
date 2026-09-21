"""
queries.py

Example: organizing SQL queries separately from code.

Keeping SQL in a single module or configuration makes it easier to
maintain, test, and swap queries for different databases or optimizations.
"""

GET_ALL_USERS = "SELECT id, username, email FROM users ORDER BY id"

INSERT_USER = """
INSERT INTO users (username, email, created_at)
VALUES (:username, :email, CURRENT_TIMESTAMP)
"""

UPDATE_USER_EMAIL = "UPDATE users SET email = :email WHERE id = :id"
