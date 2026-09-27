# Source-to-Target Reconciliation

## 1. What is reconciliation?

Source-to-target reconciliation compares what exists in the source system with what exists in the target system.

This helps confirm that the pipeline loaded the correct amount of data.

---

## 2. What to compare

Typical comparisons include:

- record counts
- sums
- minimum and maximum dates
- distinct keys
- checksums when appropriate

---

## 3. Why it matters

A pipeline may say it succeeded while delivering incomplete or incorrect data.

Reconciliation helps catch the difference between:

- pipeline success
- data correctness

---

## 4. Example discrepancy

```text
Source count = 1,000,000
Target count = 999,850
```

This signals a likely failure, missed records, or late-arriving data problem.

---

## 5. Best practices

Strong reconciliation includes:

- row count checks
- metric checks
- uniqueness checks
- business key validation
- alerting on mismatches

---

## 6. Key learning goals

By the end of this topic, you should be able to:

- explain source-to-target reconciliation
- identify what should be compared between source and target
- describe how reconciliation reduces silent data loss
- reason about metric-based validation in production pipelines

---

## 7. Practice prompts

Try solving:

- design a reconciliation check for a daily sales table
- explain how a row count mismatch can be missed if a pipeline only logs success
- list both row-level and aggregate-level checks you would run

Reconciliation is one of the most practical ways to confidence-check a pipeline.
