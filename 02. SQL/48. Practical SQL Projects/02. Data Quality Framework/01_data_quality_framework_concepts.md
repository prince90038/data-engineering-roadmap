# Data Quality Framework Project

## Goal

Create reusable SQL checks to detect data quality issues before data is published to a warehouse or dashboard.

---

## Common checks

Build checks for:

- null values
- duplicate rows
- invalid values
- missing foreign keys
- unexpected row counts
- stale data
- source-target mismatches

---

## Output format

A common result format is:

- check_name
- status
- failed_count
- execution_time

---

## Why this project matters

Data quality checks protect downstream analytics from bad or incomplete data.

This is a core data engineering skill because reporting is only as strong as the data behind it.

---

## SQL skills used

- `COUNT()` and filtering
- `GROUP BY`
- `CASE` logic
- joins for referential checks
- KPI-style validation output

This is a practical project for real warehouse and ETL validation.
