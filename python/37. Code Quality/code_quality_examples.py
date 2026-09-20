"""
code_quality_examples.py

Notes and quick examples for using tools like `black`, `ruff`, and
`mypy`. These are commands you should run locally as part of CI or
pre-commit hooks.
"""

EXAMPLE_COMMANDS = [
    "black .",
    "ruff check .",
    "mypy src/",
    "pre-commit run --all-files",
]


if __name__ == "__main__":
    print("Run the example commands locally to enforce code quality")
