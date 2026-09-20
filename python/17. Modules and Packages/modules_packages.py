"""
modules_packages.py

Examples showing module vs package structure and safe entry points
using `if __name__ == "__main__"`.
"""

def useful_function(x):
    return x * 2


def main():
    print(useful_function(3))


if __name__ == "__main__":
    main()
