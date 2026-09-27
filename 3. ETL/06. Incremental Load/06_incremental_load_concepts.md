# Incremental Load

## 1. Why incremental load matters

A full load copies every row every time, which is expensive at scale.

An incremental load reads only new or changed data since the last run.

This is a core production pattern in data engineering.

---

## 2. Typical incremental flow

```text
Initial load
   ↓
Store watermark
   ↓
Read new or updated records
   ↓
Transform
   ↓
Load to target
```

This reduces cost and improves runtime for large datasets.

---

## 3. Watermarks and state

Incremental pipelines usually maintain state such as:

- last_updated timestamp
- max record ID
- last processed batch number
- last successful run date

This state tells the system what it already processed.

---

## 4. Timestamp-based extraction

Common when a source table has an updated_at column.

Example:

```sql
SELECT *
FROM orders
WHERE updated_at > :last_watermark;
```

This is simple and widely used.

---

## 5. ID-based extraction

For tables without reliable timestamps, a max ID can be used.

Example:

```sql
SELECT *
FROM orders
WHERE order_id > :last_max_id;
```

This works well for append-only event tables.

---

## 6. CDC-based extraction

Change Data Capture is used when the database can provide changed rows directly.

This is often more reliable than timestamp polling for critical systems.

---

## 7. Trade-offs

Incremental loads are efficient, but they can be harder to design correctly.

You must handle:

- late-arriving data
- source updates
- missing records
- reprocessing after failures

---

## 8. Key learning goals

By the end of this topic, you should be able to:

- explain why incremental load is preferred at scale
- describe watermark and ID-based strategies
- recognize the challenges of incremental design
- reason about when to use CDC or polling

---

## 9. Practice prompts

Try solving:

- design an incremental load plan for a sales transactions table
- explain why a timestamp watermark can fail with out-of-order updates
- compare full, incremental, and CDC-based extraction patterns

Incremental load is one of the most important patterns in production data pipelines.
