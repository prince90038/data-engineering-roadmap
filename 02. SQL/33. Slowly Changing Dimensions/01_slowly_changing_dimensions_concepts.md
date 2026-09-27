# Slowly Changing Dimensions

## 1. What are slowly changing dimensions?

Slowly Changing Dimensions (SCDs) describe how dimension attributes change over time.

In a warehouse, customer or product attributes may change, but history must be preserved.

Examples include:

- customer address changes
- product category changes
- employee title updates

---

## 2. SCD Type 0

Type 0 means no history is tracked.

The current value is always used and the attribute is never updated in the warehouse logic.

---

## 3. SCD Type 1

Type 1 overwrites the old value with the new value.

This is simple but loses historical context.

Use it when history is not important.

---

## 4. SCD Type 2

Type 2 keeps historical records by creating a new row when a tracked attribute changes.

Common fields include:

```text
customer_id
attribute_name
attribute_value
effective_from
effective_to
is_current
```

This allows the warehouse to answer questions like:

- what was a customer’s status on a specific date?
- which version of the record was active at time X?

---

## 5. Why Type 2 matters

Type 2 is often the most important SCD pattern in analytics because it preserves history while still allowing current-state reporting.

It is widely used in:

- customer dimension tables
- product dimension tables
- employee dimension tables

---

## 6. Typical Type 2 design

A Type 2 table often includes:

- surrogate key
- natural key
- current attribute values
- effective start date
- effective end date
- active flag or current flag

This lets the warehouse reconstruct the state at any point in time.

---

## 7. Trade-offs

SCD Type 2 provides richer history but increases table size and requires careful ETL logic.

SCD Type 1 is simpler but less informative.

---

## 8. Key learning goals

By the end of this topic, you should be able to:

- explain the purpose of SCDs
- differentiate Type 0, Type 1, and Type 2
- describe the fields used in a Type 2 dimension
- explain why historical tracking matters in warehouses

---

## 9. Practice prompts

Try solving:

- implement a Type 2 customer dimension table
- show how a name or address change creates a new record
- explain when Type 1 is sufficient and when Type 2 is required
- write SQL that selects the active customer row as of a date

Slowly changing dimensions are essential for preserving historical context in analytical data models.
