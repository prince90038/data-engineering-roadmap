# Incremental ETL Project

## Goal

Implement an incremental loading workflow that only processes new or updated records instead of reloading the entire dataset.

---

## Typical workflow

```text
Initial full load
   ↓
New records
   ↓
Updated records
   ↓
Deleted records
```

---

## Tools and techniques

Use:

- watermarks
- timestamps
- IDs
- MERGE / UPSERT
- deduplication logic

---

## Why this matters

Incremental loads reduce compute costs and improve pipeline speed for large datasets.

This is a standard real-world design pattern in modern data engineering.

---

## SQL skills used

- `MERGE` or `UPSERT`
- incremental filtering
- change detection
- deduplication
- validations

This project helps you understand how production warehouses stay fresh without full reloads.
