# UPSERT and MERGE

## 1. What is UPSERT?

UPSERT means performing an `INSERT` or `UPDATE` depending on whether the target row already exists.

This is especially useful when you want to keep a table synchronized with incoming data.

---

## 2. Why UPSERT is important

In pipelines, data can arrive multiple times or be retried.

UPSERT logic ensures that:

- new rows are inserted
- existing rows are updated
- rows are not duplicated unnecessarily

This is essential for incremental and idempotent loading patterns.

---

## 3. What is MERGE?

`MERGE` is a SQL statement that combines `INSERT`, `UPDATE`, and sometimes `DELETE` behavior in one operation.

It is commonly used to synchronize a target table with a staging table or source dataset.

---

## 4. Typical MERGE pattern

A typical pattern looks like this:

```sql
MERGE INTO target_table t
USING source_table s
ON t.id = s.id
WHEN MATCHED THEN
    UPDATE SET ...
WHEN NOT MATCHED THEN
    INSERT (...)
```

This pattern is often used in warehouse and ETL processes.

---

## 5. Conflict handling

Merging data requires careful handling of:

- duplicate source records
- late-arriving updates
- conflicting values
- primary key collisions
- partial data quality issues

---

## 6. Idempotency

A pipeline is idempotent when re-running it does not create duplicate results.

UPSERT and MERGE help achieve this by making updates repeatable instead of blindly inserting duplicates.

---

## 7. Database differences

The exact syntax for `MERGE` and UPSERT varies by database.

Some databases support a standard `MERGE`; others rely on patterns using `INSERT ... ON CONFLICT` or equivalent features.

The concept is the same even when syntax differs.

---

## 8. Key learning goals

By the end of this topic, you should be able to:

- explain what UPSERT means
- describe how MERGE works
- understand why these patterns are useful in incremental pipelines
- recognize the importance of idempotent ETL logic

---

## 9. Practice prompts

Try solving:

- merge new customer records into a warehouse table
- update changed pricing rows without duplicating keys
- explain how `MERGE` helps avoid duplicate sales data
- design an idempotent pipeline for daily incremental loads

UPSERT and MERGE are essential tools for reliable data synchronization in modern pipelines.
