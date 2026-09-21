# SQL for Data Engineering

## Objective

Build strong SQL skills required for:

- Python Data Engineer roles
- AWS Data Engineer roles
- ETL / ELT development
- Data warehouse development
- Data quality validation
- Query optimization
- Technical interviews

The goal is to move beyond basic SELECT queries and become comfortable writing complex, optimized SQL for large-scale data systems.

---

# 1. SQL Fundamentals

Learn:

- Database concepts
- Tables, rows, columns
- Primary keys and foreign keys
- Constraints
- NULL
- Data types
- Schemas
- Views
- SELECT, FROM, WHERE
- ORDER BY
- GROUP BY
- HAVING
- DISTINCT
- LIMIT

Practice explaining:

- Primary key vs foreign key
- WHERE vs HAVING
- DISTINCT vs GROUP BY
- NULL and its behavior

---

# 2. SQL Data Types

Understand:

- INTEGER
- BIGINT
- DECIMAL / NUMERIC
- FLOAT
- VARCHAR
- TEXT
- BOOLEAN
- DATE
- TIME
- TIMESTAMP
- TIMESTAMP WITH TIME ZONE
- JSON / JSONB

Learn:

- Type conversion
- CAST
- Precision
- Date/time handling

---

# 3. Filtering

Learn:

```sql
WHERE
AND
OR
NOT
IN
NOT IN
BETWEEN
LIKE
IS NULL
IS NOT NULL
```

Understand SQL NULL behavior and three-valued logic.

---

# 4. Aggregations

Learn:

```sql
COUNT()
SUM()
AVG()
MIN()
MAX()
```

Understand:

```sql
COUNT(*)
COUNT(column)
COUNT(DISTINCT column)
```

Practice:

- Total sales
- Average transaction value
- Number of customers
- Unique customers
- Daily transaction counts

---

# 5. GROUP BY and HAVING

Practice:

- Sales by customer
- Sales by month
- Transactions by category
- Customers with more than N transactions
- Departments with average salary above a threshold

---

# 6. CASE Expressions

Learn conditional logic:

```sql
CASE
    WHEN condition THEN result
    ELSE result
END
```

Use for:

- Categorization
- Conditional aggregation
- Data transformation
- Business rules

---

# 7. Joins

This is one of the most important SQL topics.

Learn:

```text
INNER JOIN
LEFT JOIN
RIGHT JOIN
FULL OUTER JOIN
CROSS JOIN
SELF JOIN
```

Understand:

- Join conditions
- Multiple joins
- Join cardinality
- One-to-one
- One-to-many
- Many-to-many

Important interview questions:

- What happens when join columns contain duplicates?
- Why can a join unexpectedly increase row count?
- How do you find unmatched records?

---

# 8. Advanced Joins

Learn:

- Equi joins
- Non-equi joins
- Range joins
- Multi-column joins
- Joins involving NULLs
- Semi joins
- Anti joins
- EXISTS
- NOT EXISTS

---

# 9. Subqueries

Learn:

- Scalar subqueries
- Single-row subqueries
- Multi-row subqueries
- Correlated subqueries
- Subqueries in SELECT
- Subqueries in FROM
- Subqueries in WHERE

Understand when a CTE or JOIN is clearer.

---

# 10. Common Table Expressions

Learn:

```sql
WITH ...
```

Topics:

- Multiple CTEs
- Chained CTEs
- Recursive CTEs
- Readability
- Performance considerations

---

# 11. Set Operations

Learn:

```sql
UNION
UNION ALL
INTERSECT
EXCEPT
```

Understand:

- Duplicate handling
- Column compatibility
- Data type compatibility
- Performance differences

Especially know `UNION` vs `UNION ALL`.

---

# 12. NULL Handling

Learn:

```sql
IS NULL
IS NOT NULL
COALESCE()
NULLIF()
```

Understand:

- Three-valued logic
- NULL comparisons
- NULL in aggregates
- NULL in joins
- NULL sorting
- NULL arithmetic

Be able to explain why:

```sql
NULL = NULL
```

does not evaluate to TRUE.

---

# 13. String Functions

Learn common functions:

```text
LOWER
UPPER
TRIM
LTRIM
RTRIM
LENGTH
SUBSTRING
REPLACE
CONCAT
CONCAT_WS
SPLIT_PART
POSITION
```

Practice cleaning names, standardizing values, extracting IDs, and parsing strings.

---

# 14. Date and Time Functions

Learn concepts and database-specific equivalents for:

```text
CURRENT_DATE
CURRENT_TIMESTAMP
DATE_TRUNC
DATE_PART / EXTRACT
INTERVAL
DATE_ADD / DATE_SUB
```

Practice:

- Daily sales
- Monthly sales
- Yearly sales
- Week-over-week growth
- Month-over-month growth
- Last 7 days
- Previous month
- Customer tenure
- Processing duration

---

# 15. Window Functions

## Critical Topic

Window functions are among the highest-priority SQL topics for Data Engineering interviews.

Learn:

```sql
OVER()
PARTITION BY
ORDER BY
```

Functions:

```text
ROW_NUMBER()
RANK()
DENSE_RANK()
NTILE()
LAG()
LEAD()
FIRST_VALUE()
LAST_VALUE()
SUM() OVER()
AVG() OVER()
COUNT() OVER()
```

---

# 16. Ranking Problems

Practice:

> Find the top 3 highest-paid employees in every department.

Understand the differences between:

```text
ROW_NUMBER()
RANK()
DENSE_RANK()
```

---

# 17. Running Totals and Window Frames

Learn:

- Running totals
- Cumulative counts
- Moving averages
- Previous/next rows
- Window frames
- ROWS BETWEEN
- RANGE BETWEEN

---

# 18. LAG and LEAD

Use for:

- Previous transaction
- Next transaction
- Month-over-month comparison
- Detecting changes
- Time-series analysis

---

# 19. Deduplication

Extremely important for Data Engineering.

Learn how to identify duplicates using `ROW_NUMBER()`.

Practice:

- Keep latest record
- Keep earliest record
- Remove exact duplicates
- Deduplicate using business keys

Example:

```sql
WITH ranked AS (
    SELECT
        *,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY updated_at DESC
        ) AS rn
    FROM customers
)
SELECT *
FROM ranked
WHERE rn = 1;
```

---

# 20. Conditional Aggregation

Learn:

```sql
SUM(CASE WHEN ... THEN 1 ELSE 0 END)
```

Use for:

- Success/failure counts
- Percentages
- Multiple metrics in one query
- Data quality reporting

---

# 21. Pivot and Unpivot

Understand:

```text
Rows → Columns
Columns → Rows
```

Learn database-specific `PIVOT` / `UNPIVOT` where available, and conditional aggregation as a portable alternative.

---

# 22. Transactions and ACID

Learn:

```text
BEGIN
COMMIT
ROLLBACK
SAVEPOINT
```

Understand:

```text
A — Atomicity
C — Consistency
I — Isolation
D — Durability
```

---

# 23. Isolation Levels

Understand:

```text
Read Uncommitted
Read Committed
Repeatable Read
Serializable
```

Also understand:

- Dirty reads
- Non-repeatable reads
- Phantom reads

Database behavior can vary by engine.

---

# 24. Constraints

Learn:

```text
PRIMARY KEY
FOREIGN KEY
UNIQUE
NOT NULL
CHECK
DEFAULT
```

Understand:

- Referential integrity
- Composite keys
- Constraint enforcement

---

# 25. Indexes

Critical for performance.

Learn:

- What an index is
- B-tree indexes
- Composite indexes
- Unique indexes
- Covering indexes
- Partial/filtered indexes where supported
- Index write overhead

Understand:

> Why can too many indexes make a database slower?

---

# 26. Query Execution Plans

Learn:

```sql
EXPLAIN
EXPLAIN ANALYZE
```

Understand:

- Sequential scan
- Index scan
- Index-only scan
- Nested loop join
- Hash join
- Merge join
- Sort
- Aggregate
- Estimated vs actual rows
- Query cost

Practice identifying why a query is slow.

---

# 27. Query Optimization

Learn:

- Proper indexing
- Avoiding unnecessary columns
- Avoiding unnecessary joins
- Filtering appropriately
- Understanding join cardinality
- Avoiding unnecessary DISTINCT
- Efficient aggregation
- Query plans
- Partition pruning
- Predicate pushdown
- Statistics

Do not memorize optimization tricks without understanding execution plans.

---

# 28. Views and Materialized Views

Learn:

- Views
- Materialized views
- Refresh strategies
- When to use a view vs a table

---

# 29. Stored Procedures and Functions

Understand:

- Stored procedures
- User-defined functions
- Parameters
- Variables
- Control flow
- Exception handling

Focus on concepts first; syntax is database-specific.

---

# 30. Temporary Tables

Learn:

- Temporary tables
- Temporary views
- Staging tables
- Intermediate datasets

Understand when a temporary table is better than a CTE.

---

# 31. Data Modeling

Learn:

## OLTP

```text
Normalized
Transaction-oriented
High write volume
```

## OLAP

```text
Analytical
Read-heavy
Large-scale aggregations
```

Understand:

- Normalization
- Denormalization
- 1NF
- 2NF
- 3NF
- Star schema
- Snowflake schema

---

# 32. Fact and Dimension Tables

## Fact Tables

Examples:

```text
sales
transactions
orders
payments
```

## Dimension Tables

Examples:

```text
customer
product
location
date
```

Understand:

- Grain
- Measures
- Dimensions
- Surrogate keys
- Natural keys

---

# 33. Slowly Changing Dimensions

Very important.

Learn:

```text
SCD Type 0
SCD Type 1
SCD Type 2
```

Focus heavily on Type 2.

Understand:

```text
customer_id
attribute
effective_from
effective_to
is_current
```

Practice implementing SCD Type 2 using SQL.

---

# 34. Incremental Data Processing

Learn how to process only new or changed records.

Methods:

- Timestamp watermark
- ID watermark
- CDC
- Change tracking
- MERGE / UPSERT

Understand:

```text
Full Load
vs
Incremental Load
```

---

# 35. UPSERT and MERGE

Learn:

```text
INSERT
UPDATE
UPSERT
MERGE
```

Practice:

- Insert new records
- Update existing records
- Handle conflicts
- Implement incremental loads

Syntax varies by database.

---

# 36. Change Data Capture

Understand:

```text
Source DB
   ↓
Change Events
   ↓
CDC
   ↓
Data Pipeline
   ↓
Target
```

Learn:

- Insert events
- Update events
- Delete events
- Log-based CDC
- Snapshot vs incremental CDC

---

# 37. Partitioning

Very important for large-scale Data Engineering.

Learn:

- Horizontal partitioning
- Range partitioning
- List partitioning
- Hash partitioning
- Partition pruning

Understand how partitioning affects query performance.

---

# 38. Sharding

Understand:

- Horizontal sharding
- Shard keys
- Data distribution
- Hot partitions
- Trade-offs

Deep database administration knowledge is not required initially.

---

# 39. Data Lakes and SQL

Understand querying:

```text
CSV
JSON
Parquet
ORC
```

Understand:

```text
Data Lake
Data Warehouse
Data Lakehouse
```

This prepares you for:

- AWS S3
- AWS Athena
- AWS Glue
- AWS Redshift

---

# 40. Parquet and Columnar Storage

Understand:

- Row-based storage
- Columnar storage
- Compression
- Predicate pushdown
- Column pruning

Know why Parquet is generally better suited than CSV for analytical workloads.

---

# 41. SQL Dialects

Start with **PostgreSQL-style SQL** as a strong general-purpose dialect.

Then understand differences in:

- PostgreSQL
- MySQL
- SQL Server
- Oracle
- Amazon Redshift
- Amazon Athena / Trino-style SQL

Focus on transferable SQL concepts rather than memorizing every dialect.

---

# 42. SQL for ETL / ELT

Practice:

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
Analytics Table
```

Practice:

- Standardizing values
- Handling NULLs
- Removing duplicates
- Joining reference data
- Calculating derived columns
- Aggregating data
- Generating dimensions
- Generating fact tables

---

# 43. SQL for Data Quality

Build reusable checks for:

```text
Row count
Null count
Duplicate count
Invalid values
Referential integrity
Date ranges
Data freshness
Source vs target count
Source vs target totals
```

Create a result format such as:

```text
check_name
status
failed_count
execution_time
```

---

# 44. Advanced Analytical SQL

Practice:

- Cohort analysis
- Retention analysis
- Rolling averages
- Running totals
- Percentiles
- Ranking
- Moving windows
- Sessionization
- Gaps-and-islands
- Time-series analysis

---

# 45. Important SQL Interview Problems

## Basic

- Second highest salary
- Employees earning more than department average
- Duplicate records
- Customers without orders
- Employees without departments

## Intermediate

- Top 3 salaries per department
- Consecutive login days
- Customers with consecutive purchases
- Duplicate transactions
- Missing dates
- Employees who changed departments
- Latest record per customer

## Advanced

- Running totals
- Moving averages
- Month-over-month growth
- Year-over-year growth
- Gaps and islands
- Sessionization
- Customer retention
- Cohort analysis
- SCD Type 2
- Incremental load
- Deduplication with window functions

---

# 46. Data Engineering SQL Interview Questions

Be able to explain:

- ETL vs ELT
- Full load vs incremental load
- What is CDC?
- How do you implement an incremental pipeline?
- How do you make an ETL pipeline idempotent?
- How do you deduplicate data?
- How do you handle late-arriving data?
- How do you handle NULL values?
- How do you validate source and target data?
- How do you implement SCD Type 2?
- How do you design a fact table?
- What is the grain of a fact table?
- Star schema vs snowflake schema
- OLTP vs OLAP
- Data lake vs data warehouse

---

# 47. SQL Performance Interview Questions

Be able to answer:

- Why is my query slow?
- How do indexes improve performance?
- When will an index not help?
- What is an execution plan?
- What is a sequential scan?
- What is a hash join?
- What is a nested loop join?
- What is partition pruning?
- What is predicate pushdown?
- Why can DISTINCT be expensive?
- Why can a join unexpectedly multiply rows?
- How do you optimize a query on a billion-row table?

---

# 48. Practical SQL Projects

## Project 1 — Sales Analytics

Tables:

```text
customers
products
orders
order_items
payments
```

Build:

- Total sales
- Monthly sales
- Top customers
- Top products
- Average order value
- Customer lifetime value
- Repeat customers
- Revenue by category

---

## Project 2 — Data Quality Framework

Create SQL checks for:

```text
Null values
Duplicates
Invalid values
Missing foreign keys
Unexpected row counts
Data freshness
```

Output:

```text
check_name
status
failed_count
execution_time
```

---

## Project 3 — Incremental ETL

Create:

```text
source_table
target_table
```

Implement:

```text
Initial full load
        ↓
New records
        ↓
Updated records
        ↓
Deleted records
```

Use:

- Watermarks
- MERGE / UPSERT
- Deduplication

---

## Project 4 — SCD Type 2

Build a customer dimension:

```text
customer_id
name
city
status
effective_from
effective_to
is_current
```

Implement historical tracking.

---

## Project 5 — Data Warehouse

Build:

```text
             dim_customer
                  │
                  │
dim_product ─ fact_sales ─ dim_date
                  │
                  │
             dim_location
```

Practice analytical queries against it.

---

# 49. Recommended Learning Order

```text
1. SQL Fundamentals
        ↓
2. Filtering + Aggregations
        ↓
3. GROUP BY + HAVING
        ↓
4. Joins
        ↓
5. Subqueries
        ↓
6. CTEs
        ↓
7. CASE + NULL Handling
        ↓
8. String + Date Functions
        ↓
9. Window Functions
        ↓
10. Deduplication
        ↓
11. Conditional Aggregation
        ↓
12. Transactions + ACID
        ↓
13. Indexes
        ↓
14. Execution Plans
        ↓
15. Query Optimization
        ↓
16. Data Modeling
        ↓
17. Fact + Dimension Tables
        ↓
18. SCD
        ↓
19. Incremental Loads + CDC
        ↓
20. Partitioning
        ↓
21. Data Lake / Warehouse Concepts
        ↓
22. Advanced Analytical SQL
        ↓
23. Data Engineering Projects
```

---

# 50. Progress Tracker

## SQL Fundamentals

- [ ] SELECT
- [ ] WHERE
- [ ] ORDER BY
- [ ] DISTINCT
- [ ] LIMIT
- [ ] Data types
- [ ] NULL
- [ ] CASE
- [ ] Aggregations
- [ ] GROUP BY
- [ ] HAVING

## Joins

- [ ] INNER JOIN
- [ ] LEFT JOIN
- [ ] RIGHT JOIN
- [ ] FULL OUTER JOIN
- [ ] CROSS JOIN
- [ ] SELF JOIN
- [ ] EXISTS
- [ ] NOT EXISTS
- [ ] Anti join
- [ ] Semi join

## Intermediate SQL

- [ ] Subqueries
- [ ] CTEs
- [ ] Recursive CTEs
- [ ] UNION
- [ ] UNION ALL
- [ ] INTERSECT
- [ ] EXCEPT
- [ ] String functions
- [ ] Date functions
- [ ] NULL handling

## Window Functions

- [ ] ROW_NUMBER
- [ ] RANK
- [ ] DENSE_RANK
- [ ] NTILE
- [ ] LAG
- [ ] LEAD
- [ ] FIRST_VALUE
- [ ] LAST_VALUE
- [ ] Running totals
- [ ] Window frames

## Data Engineering SQL

- [ ] Deduplication
- [ ] Data quality checks
- [ ] Conditional aggregation
- [ ] Incremental loads
- [ ] MERGE / UPSERT
- [ ] CDC concepts
- [ ] SCD Type 1
- [ ] SCD Type 2
- [ ] Late-arriving data
- [ ] Idempotent SQL pipelines

## Performance

- [ ] Indexes
- [ ] Composite indexes
- [ ] Execution plans
- [ ] EXPLAIN
- [ ] EXPLAIN ANALYZE
- [ ] Query optimization
- [ ] Join optimization
- [ ] Partition pruning
- [ ] Predicate pushdown
- [ ] Column pruning

## Data Modeling

- [ ] OLTP
- [ ] OLAP
- [ ] Normalization
- [ ] Denormalization
- [ ] Star schema
- [ ] Snowflake schema
- [ ] Fact tables
- [ ] Dimension tables
- [ ] Grain
- [ ] Surrogate keys

## Projects

- [ ] Sales analytics
- [ ] Data quality framework
- [ ] Incremental ETL
- [ ] SCD Type 2
- [ ] Data warehouse

---

# 51. Definition of Done

Before moving deeper into Data Engineering, I should be able to:

- Write complex SQL without relying on examples.
- Use joins confidently.
- Solve problems using CTEs and subqueries.
- Use window functions comfortably.
- Deduplicate data using SQL.
- Handle NULLs correctly.
- Write analytical queries.
- Implement incremental data processing.
- Explain CDC.
- Implement SCD Type 2.
- Design basic fact and dimension tables.
- Read an execution plan.
- Identify common query performance problems.
- Explain indexes and their trade-offs.
- Write data quality validation queries.
- Work with large analytical datasets.
- Solve medium and advanced SQL interview problems.

---

# 52. Connection to the Next Topics

```text
SQL
 ↓
ETL / ELT
 ↓
Data Warehousing
 ↓
PySpark
 ↓
Airflow
 ↓
AWS Glue
 ↓
Athena
 ↓
Redshift
```

Strong SQL knowledge is especially important because AWS Data Engineering services such as Athena and Redshift rely heavily on SQL.

The objective is not just to memorize SQL syntax.

The objective is to understand **how data is stored, transformed, joined, validated, aggregated, and queried efficiently at scale**.
