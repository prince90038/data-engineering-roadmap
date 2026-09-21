"""
sqlalchemy_examples.py

Mini-examples using SQLAlchemy Core and ORM patterns. This is a
lightweight illustration—install `sqlalchemy` for full functionality.
"""

try:
    from sqlalchemy import Table, Column, Integer, String, MetaData, create_engine
    from sqlalchemy.orm import registry, Session
except Exception:  # pragma: no cover - optional
    Table = Column = Integer = String = MetaData = create_engine = None
    registry = Session = None


def core_example():
    if create_engine is None:
        print("SQLAlchemy not installed; skipping core example")
        return
    engine = create_engine("sqlite:///:memory:")
    meta = MetaData()
    users = Table("users", meta, Column("id", Integer, primary_key=True), Column("name", String))
    meta.create_all(engine)
    with engine.connect() as conn:
        conn.execute(users.insert().values(name="alice"))
        res = conn.execute(users.select()).fetchall()
        print(res)


if __name__ == "__main__":
    core_example()
