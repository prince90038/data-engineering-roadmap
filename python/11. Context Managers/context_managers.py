"""
11. Context Managers
Learn:

with
__enter__
__exit__
contextlib.contextmanager
Understand why context managers are useful for:

Files
Database connections
Locks
Transactions
Resources
Example:

with open("data.txt") as file:
    data = file.read()
"""

class MyContext:
    def __enter__(self):
        print("Entering")
        return self

    def __exit__(self, exc_type, exc_value, traceback):
        print("Exiting")


with MyContext():
    print("Inside context")
# Output:
# Entering
# Inside context
# Exiting
