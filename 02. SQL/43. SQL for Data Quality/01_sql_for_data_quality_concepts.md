# SQL for Data Quality

## 1. Why data quality matters

Data quality checks help ensure the data used in reporting and analysis is trustworthy.

If data quality is poor, dashboards, models, and operational decisions may be wrong even if the SQL is correct.

---

## 2. Common data quality checks

Typical SQL checks include:

- row count validation
- null counts
- duplicate counts
- invalid value detection
- referential integrity checks
- date range validation
- data freshness checks
- source-vs-target comparisons

---

## 3. Example checks

Common checks include:

```text
Row count mismatch
Null values in essential columns
Duplicate business keys
Unexpected negative values
Dates outside valid ranges
Missing foreign key matches
```

---

## 4. Result format for checks

A data quality framework often produces results like:

```text
check_name
status
failed_count
execution_time
```

This helps teams understand what failed and how severe the problem is.

---

## 5. Data validation in ETL and ELT

Data quality work usually happens during ETL or ELT stages to catch issues before reporting.

Examples include:

- checking that customer IDs exist in a master table
- ensuring orders do not have null totals
- identifying duplicate rows before a warehouse load

---

## 6. Example SQL quality rules

Data quality rules may ask:

- Are there null customer IDs?
- Are there duplicate order IDs?
- Are there invalid date values?
- Is the row count matching the source expectation?
- Are source totals consistent with target totals?

---

## 7. Key learning goals

By the end of this topic, you should be able to:

- explain what data quality means in analytics
- identify common SQL checks used in production pipelines
- describe why validation is important before publishing data
- create a simple quality-check pattern in SQL

---

## 8. Practice prompts

Try solving:

- write a SQL check for duplicate orders
- count null values in a critical column
- compare source row count to target row count
- identify invalid dates and reject them before loading

Data quality is essential because analytics is only as good as the data feeding it.
