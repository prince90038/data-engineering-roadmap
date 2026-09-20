"""
file_manager.py

Example: context manager for file handling implemented as a class.

This mirrors the behavior of the built-in `open(... )` context manager,
showing how to open a file in `__enter__` and ensure it's closed in
`__exit__` even when exceptions occur.
"""

class FileManager:
    def __init__(self, filename, mode="r"):
        self.filename = filename
        self.mode = mode
        self.file = None

    def __enter__(self):
        self.file = open(self.filename, self.mode)
        return self.file

    def __exit__(self, exc_type, exc_val, exc_tb):
        if self.file:
            self.file.close()
        # Returning False ensures exceptions (if any) propagate
        return False


if __name__ == "__main__":
    with FileManager("test_output.txt", "w") as f:
        f.write("Hello from FileManager\n")
