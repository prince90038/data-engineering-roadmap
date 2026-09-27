# Pushdown Processing

## 1. What is pushdown?

Pushdown processing means moving computation closer to the system where the data lives.

Instead of reading a large amount of data into Python and filtering it later, you push filtering or aggregation down to the database or processing engine.

---

## 2. Why it matters

It reduces:

- network transfer
- memory pressure
- CPU work in the application layer
- processing time

---

## 3. Example

Bad pattern:

```text
Database -> millions of rows -> Python -> filter -> target
```

Better pattern:

```text
Database -> filter in SQL -> only needed rows -> Python -> target
```

---

## 4. Common pushdown operations

Examples include:

- WHERE clauses
- joins in SQL
- aggregations
- filtering on partition keys
- projection of only required columns

---

## 5. Trade-offs

Not every operation should be pushed down.

Complex Python logic, custom enrichment, and some transformations may be better done outside the source system.

---

## 6. Key learning goals

By the end of this topic, you should be able to:

- explain what pushdown processing means
- identify scenarios where it helps performance
- compare application-side vs source-side filtering
- reason about when pushdown is the best design choice

---

## 7. Practice prompts

Try solving:

- describe how a WHERE clause improves ETL performance
- explain why pushing a join lower in the stack may help
- identify cases where pushdown would be counterproductive

Pushdown is a performance optimization that matches workload to the right execution layer.
