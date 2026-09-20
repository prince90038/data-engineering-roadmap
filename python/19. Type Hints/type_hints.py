"""
type_hints.py

Examples introducing basic type hints, Optional, Union, and typing
aliases to improve code clarity and enable static checking with mypy.
"""

from typing import Optional, Union, List, Dict


def find_user(users: List[Dict[str, Union[int, str]]], user_id: int) -> Optional[Dict[str, Union[int, str]]]:
    for u in users:
        if u.get("id") == user_id:
            return u
    return None


if __name__ == "__main__":
    users = [{"id": 1, "name": "a"}]
    print(find_user(users, 1))
