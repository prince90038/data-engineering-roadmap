# Data Engineering SQL Interview Questions

## 1. Why this topic matters

Data engineering interviews often test whether you understand how SQL fits into real pipeline and warehouse work.

The goal is not only to write correct SQL, but to explain how it applies in real systems.

---

## 2. Core concepts to be able to explain

You should be able to explain:

- ETL vs ELT
- full load vs incremental load
- CDC
- idempotent pipeline design
- deduplication
- late-arriving data
- null handling
- source-to-target validation
- SCD Type 2
- fact-table design
- grain of a fact table
- star schema vs snowflake schema
- OLTP vs OLAP
- data lake vs data warehouse

---

## 3. ETL vs ELT

ETL transforms before loading.

ELT loads first and transforms later.

In modern cloud data platforms, ELT is often the preferred pattern because storage and compute can scale efficiently.

---

## 4. Incremental processing and CDC

Interviewers often ask how you would implement incremental pipelines and how you avoid reprocessing the full data set.

You should be able to describe:

- timestamp watermarks
- ID-based checkpoints
- CDC patterns
- upsert logic
- merge-based synchronization

---

## 5. Idempotency and duplicates

A good data engineering answer explains how to avoid duplicate rows and maintain consistency across reruns.

This usually involves:

- deduplication logic
- stable business keys
- merge/upsert patterns
- validation checks

---

## 6. Fact tables and grain

A fact table stores measurable events.

You should be able to explain:

- what the grain is
- how to model fact tables
- why dimensions matter
- how to choose the right reporting granularity

---

## 7. OLTP vs OLAP and warehouse design

You should know the difference between transactional systems and analytical systems.

This includes understanding:

- normalized OLTP design
- read-heavy analytical design
- star vs snowflake schema
- why modeling affects performance and maintainability

---

## 8. Key learning goals

By the end of this topic, you should be able to:

- explain the most common architecture questions in data engineering interviews
- connect SQL concepts to real pipeline design concerns
- talk about incremental processing, deduplication, and performance trade-offs
- demonstrate practical understanding of warehouse modeling

---

## 9. Practice prompts

Try solving:

- explain how you would make an incremental sales pipeline idempotent
- describe how you would implement SCD Type 2 in SQL
- explain the difference between a full load and an incremental load
- define the grain for a fact table of payments

These are the kinds of questions that show real-world SQL and data engineering reasoning.
