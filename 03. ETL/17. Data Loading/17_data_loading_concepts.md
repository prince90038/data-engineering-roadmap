# Data Loading

## 1. What is data loading?

Loading is the process of writing transformed data to a destination system.

The target could be:

- a warehouse table
- a lake table
- a staging table
- a reporting table
- a downstream database

---

## 2. Common loading patterns

Common patterns include:

- insert
- bulk insert
- batch insert
- upsert
- merge
- append
- replace
- overwrite

---

## 3. Append

An append load adds new rows without replacing existing data.

This is common for event logs, fact tables, and incremental loads.

---

## 4. Overwrite

An overwrite replaces the current target data with a new snapshot.

This is common when the entire dataset should be refreshed.

---

## 5. Upsert

An upsert updates existing rows when a key matches and inserts when it does not.

This is a very common pattern in incremental pipelines.

---

## 6. Merge

A merge operation combines source and target logic in one statement.

This is often used for dimension loads and slowly changing data patterns.

---

## 7. Operational concerns

Loading patterns should consider:

- transaction boundaries
- duplicate handling
- row counts
- load failures
- validation after load

---

## 8. Key learning goals

By the end of this topic, you should be able to:

- explain common load strategies
- compare append, overwrite, upsert, and merge
- reason about which pattern fits a given business requirement
- connect loading choices to pipeline reliability

---

## 9. Practice prompts

Try solving:

- choose an appropriate load method for a fact table
- explain why upsert is better than append for dimension tables
- compare replace and merge in a daily warehouse refresh

Loading is the final operational step that turns a pipeline into usable data.
