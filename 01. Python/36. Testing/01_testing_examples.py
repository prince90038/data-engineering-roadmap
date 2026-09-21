"""
testing_examples.py

Examples using pytest-style functions and unittest for basic testing
patterns. This file contains small examples; run tests locally with
`pytest` or `python -m unittest`.
"""

def add(a, b):
    return a + b


def test_add():
    assert add(1, 2) == 3


if __name__ == "__main__":
    test_add()
    print("Tests passed")
