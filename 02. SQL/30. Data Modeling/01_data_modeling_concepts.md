# Data Modeling in SQL

## 1. What is data modeling?

Data modeling is the process of organizing data so it is accurate, efficient, and easy to query.

It defines:

- what entities exist
- how they relate to each other
- how fields are stored
- how data is updated and queried

Good data models make systems easier to maintain and faster to analyze.

---

## 2. OLTP vs OLAP

### OLTP

OLTP systems are optimized for transactions.

They usually have:

- many small writes
- strong consistency
- normalized schemas
- frequent updates and inserts

Examples include banking systems, order systems, and user account databases.

### OLAP

OLAP systems are optimized for analytics.

They usually have:

- large read-heavy queries
- aggregate reporting
- historical tracking
- star or snowflake schema patterns

Examples include warehouses and BI dashboards.

---

## 3. Normalization

Normalization organizes data to reduce duplication and improve integrity.

Common normal forms include:

- 1NF: no repeating groups
- 2NF: no partial dependency
- 3NF: no transitive dependency

Normalized data is often ideal for OLTP systems.

---

## 4. Denormalization

Denormalization intentionally adds duplication to improve query performance.

This is common in analytics systems where read speed matters more than storage efficiency.

Examples:

- combining customer and order data into one reporting table
- storing product category names directly in a fact table
- materializing pre-aggregated totals

---

## 5. Star schema

A star schema has:

- one or more fact tables
- several dimension tables
- simple joins between them

This is very common in data warehouse design.

---

## 6. Snowflake schema

A snowflake schema is a more normalized version of a star schema.

Dimension tables may be split into additional tables, which reduces duplication but adds join complexity.

---

## 7. Why modeling matters

A weak data model causes:

- duplicate data
- inconsistent reports
- slow queries
- difficult maintenance

A strong model reduces complexity and improves long-term scalability.

---

## 8. Key learning goals

By the end of this topic, you should be able to:

- explain the difference between OLTP and OLAP
- describe normalization and denormalization
- identify common modeling patterns such as star schemas
- explain why data modeling choices affect performance and maintainability

---

## 9. Practice prompts

Try solving:

- design a normalized schema for customers and orders
- explain why a warehouse may use denormalized aggregates
- compare a star schema and a snowflake schema
- decide whether a system should prioritize transactional consistency or analytical speed

Data modeling is one of the foundational skills behind reliable, scalable SQL systems.
