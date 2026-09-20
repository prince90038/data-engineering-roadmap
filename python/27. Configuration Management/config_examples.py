"""
config_examples.py

Examples showing simple configuration loading from environment
variables and `.env` files (via `dotenv` when available). Never store
secrets in source control; use secret managers for production.
"""

import os
from pathlib import Path


def load_from_env(key: str, default=None):
    return os.environ.get(key, default)


def load_dotenv(path: Path):
    try:
        from dotenv import load_dotenv
        load_dotenv(dotenv_path=path)
    except Exception:
        print("python-dotenv not installed; skipping .env load")


if __name__ == "__main__":
    load_dotenv(Path('.env'))
    print(load_from_env('MY_SETTING', 'default'))
