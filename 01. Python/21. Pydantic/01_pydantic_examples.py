"""
pydantic_examples.py

Examples using Pydantic for data validation and parsing. This module
requires `pydantic` to be installed for full feature use; otherwise the
examples show intended usage.
"""

try:
    from pydantic import BaseModel, ValidationError
except Exception:  # pragma: no cover - optional dependency
    BaseModel = object
    ValidationError = Exception


class UserModel(BaseModel):
    id: int
    name: str
    email: str


def parse_user(data):
    try:
        return UserModel(**data)
    except ValidationError as e:
        print(f"Validation failed: {e}")
        raise


if __name__ == "__main__":
    user = {"id": 1, "name": "Alice", "email": "a@example.com"}
    print(parse_user(user))
