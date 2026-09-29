# Idempotency

## 1. What is idempotency?

A process is idempotent if running it multiple times produces the same result as running it once.

In data engineering, this matters because pipelines often retry after failure.

---

## 2. Why idempotency is crucial

If a pipeline is not idempotent, retries may create duplicates or corrupt historical data.

This leads to:

- inflated counts
- duplicate rows
- inaccurate joins
- bad reporting

---

## 3. Common idempotent patterns

Typical ways to enforce idempotency include:

- deduplication by business key
- unique constraints
- MERGE statements
- upserts
- deterministic transformation logic
- storing run metadata

---

## 4. Business keys

A business key is a natural identifier used to determine if a record is the same as an existing one.

Examples:

- customer_id
- order_id
- email
- composite key such as transaction_id + date

---

## 5. Upserts and MERGE

An upsert updates a row when it already exists and inserts it when it does not.

This is an essential pattern for incremental pipeline loads.

---

## 6. Deduplication strategy

The usual approach is:

```text
Group by business key
Pick latest valid record
Store once
```

This prevents duplicate rows from being created during retries or overlapping runs.

---

## 7. Design checklist

A production pipeline should aim for:

- deterministic transformations
- unique keys on target records
- safe retries
- replayable loads
- traceable run logs

---

## 8. Key learning goals

By the end of this topic, you should be able to:

- define idempotency in a data pipeline
- explain why retries require idempotent logic
- describe common idempotency techniques
- design safer patterns for duplicate prevention

---

## 9. Practice prompts

Try solving:

- explain how a duplicate customer sync would happen without an upsert
- describe how a unique constraint helps pipeline safety
- design an idempotent pattern for an incremental sales load

Idempotency is what makes pipelines safe to rerun, retry, and backfill.
