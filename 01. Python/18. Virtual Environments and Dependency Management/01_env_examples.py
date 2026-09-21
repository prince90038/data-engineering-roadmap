"""
env_examples.py

Examples and notes on creating virtual environments and recording
dependencies with `requirements.txt`. This file contains examples and
commands (not executed here) that you can run locally.
"""

EXAMPLE_COMMANDS = [
    "python -m venv .venv",
    ".venv\Scripts\activate  # Windows",
    "python -m pip install -r requirements.txt",
    "pip freeze > requirements.txt",
]


def note():
    print("See EXAMPLE_COMMANDS for common venv and dependency commands")


if __name__ == "__main__":
    note()
