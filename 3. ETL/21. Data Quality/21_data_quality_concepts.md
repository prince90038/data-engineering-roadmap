# Data Quality

## 1. What is data quality?

Data quality is the condition of data based on how useful, trusted, and valid it is for business use.

High-quality data supports accurate reporting, analytics, and automation.

---

## 2. Core dimensions of data quality

Common quality dimensions include:

- completeness
- accuracy
- consistency
- validity
- uniqueness
- timeliness

---

## 3. Why it matters in ETL

If a pipeline loads poor-quality data, downstream systems will produce unreliable results.

This can affect reporting, product metrics, and business operations.

---

## 4. Typical data quality checks

Common checks include:

- null checks
- duplicate checks
- schema validation
- range checks
- referential integrity checks
- row count checks
- reconciliation between source and target

---

## 5. Example quality rules

Examples:

- customer_id cannot be null
- order_total must be positive
- email must match a valid format
- row count must match expected values after filtering

---

## 6. Best practices

A good pipeline validates early and often, including:

- source validation before transformation
- data contract checks
- row and aggregate reconciliation
- logging failures for investigation

---

## 7. Key learning goals

By the end of this topic, you should be able to:

- explain what data quality means in a pipeline
- identify the major dimensions of quality
- list common data quality rules and checks
- describe why quality checks are necessary before loading data into reporting systems

---

## 8. Practice prompts

Try solving:

- list five quality rules for a sales table
- explain how a duplicate record can distort reporting
- outline a quality validation step for a daily customer file

Data quality is not optional in production data engineering.
