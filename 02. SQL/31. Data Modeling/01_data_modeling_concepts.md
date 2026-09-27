# Data Modeling in SQL

## 1. What is data modeling?

Data modeling is the process of designing how data should be structured so it remains accurate, accessible, and efficient to query.

A good model defines:

- entities and their relationships
- data types and constraints
- rules for updates and deletes
- how data is organized for reads and writes

---

## 2. Why data modeling matters

The data model influences:

- query performance
- data quality
- reporting reliability
- system maintainability
- ability to scale over time

Poor design often leads to duplication, inconsistent reporting, and difficult downstream processing.

---

## 3. OLTP systems

OLTP stands for Online Transaction Processing.

These systems are optimized for frequent, small transactions such as:

- customer updates
- order inserts
- payments
- account balance changes

Typical characteristics:

```text
Normalized
Write-heavy
Strong consistency
Transactional focus
```

---

## 4. OLAP systems

OLAP stands for Online Analytical Processing.

These systems support analytical queries such as:

- sales trends over time
- product performance by region
- cohort analysis
- KPI reporting

Typical characteristics:

```text
Read-heavy
Aggregated results
Large-scale data analysis
Dimension-based reporting
```

---

## 5. Normalization

Normalization reduces redundancy and improves integrity by splitting data into logical tables.

Common normal forms include:

- 1NF
- 2NF
- 3NF

This makes OLTP systems easier to maintain and less error-prone.

---

## 6. Denormalization

Denormalization intentionally duplicates data to optimize reads.

It is common in data warehouses and reporting layers, where analytical queries are more important than minimizing storage.

---

## 7. Star and snowflake schemas

A star schema uses fact tables and dimension tables with simple joins.

A snowflake schema is more normalized, with dimensions split into multiple related tables.

Star schemas are often easier to query; snowflake schemas can reduce redundancy but add complexity.

---

## 8. Design trade-offs

The right model depends on the workload.

Use OLTP-oriented modeling when transaction correctness is the priority.

Use OLAP-oriented modeling when reporting and analytics are the priority.

---

## 9. Key learning goals

By the end of this topic, you should be able to:

- explain the difference between OLTP and OLAP
- describe normalization and denormalization
- recognize star and snowflake schemas
- explain why data modeling decisions affect query performance and system behavior

---

## 10. Practice prompts

Try solving:

- model a customer-orders-products system in third normal form
- discuss why a warehouse may use denormalized reporting structures
- identify whether a system is transactional or analytical
- design a simple star schema for sales reporting

Data modeling is foundational for building reliable and scalable SQL systems.
