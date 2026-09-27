# SQL for ETL / ELT

## 1. What is ETL?

ETL stands for Extract, Transform, Load.

In ETL, data is transformed before being loaded into the target system.

This pattern is often used when a system expects clean, standardized, and validated data before analysis.

---

## 2. What is ELT?

ELT stands for Extract, Load, Transform.

In ELT, raw data is usually loaded into a warehouse or data lake first, and the transformation happens after ingestion.

This is common in cloud ecosystems that can process large datasets efficiently.

---

## 3. SQL in ETL and ELT

SQL is heavily used in both patterns to:

- clean and normalize data
- remove duplicate records
- join reference data
- handle missing or invalid values
- standardize date and string values
- aggregate data into fact and dimension tables

---

## 4. Typical pipeline flow

A common SQL-driven pipeline looks like this:

```text
Raw Data
   ↓
Cleaning
   ↓
Deduplication
   ↓
Validation
   ↓
Business Transformation
   ↓
Analytics Output
```

---

## 5. Common SQL transformations

Examples include:

- `TRIM()` and `LOWER()` to standardize values
- `COALESCE()` to replace nulls
- `ROW_NUMBER()` to deduplicate
- `CASE` for business logic
- `JOIN` with reference data
- `GROUP BY` for aggregation
- `INSERT ... SELECT` and `MERGE` for loading outputs

---

## 6. ETL vs ELT in practice

ETL is often preferred when transformations are heavy or require pre-validated data before storage.

ELT is often preferred in modern data platforms because storage is cheap and compute can be scaled for transformations later.

---

## 7. Key learning goals

By the end of this topic, you should be able to:

- explain ETL and ELT
- identify the SQL operations used in transformation steps
- describe how raw data becomes analytics-ready data
- understand why data quality checks are part of transformation work

---

## 8. Practice prompts

Try solving:

- write SQL that cleans inconsistent customer names
- remove duplicate records from a raw sales feed
- join raw orders to a product dimension
- build a simple fact table from source data

ETL and ELT are central to how raw business data becomes usable for analytics.
