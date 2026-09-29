# Data Warehousing for Data Engineering

## Objective

Learn how analytical data systems are designed and how raw operational data becomes reliable, queryable business data.

This section covers:

- OLTP vs OLAP
- Data warehouse architecture
- Data lakes and lakehouses
- Dimensional modeling
- Fact and dimension tables
- Grain
- Keys
- Star and snowflake schemas
- Slowly Changing Dimensions
- Incremental loading
- CDC
- Data marts
- Partitioning
- Performance
- AWS warehouse services

---

# 1. OLTP vs OLAP

## OLTP

Designed for transactions.

Characteristics:

- High write volume
- Short transactions
- Highly normalized
- Current operational state

Examples:

```text
Orders
Payments
Accounts
Customer transactions
```

## OLAP

Designed for analytics.

Characteristics:

- Read-heavy
- Large scans
- Aggregations
- Historical data
- Analytical queries

Examples:

```text
Revenue analysis
Customer analytics
Sales dashboards
Risk reporting
```

---

# 2. Data Warehouse

Understand a data warehouse as a centralized analytical data store.

Typical flow:

```text
Operational Sources
        ↓
ETL / ELT
        ↓
Data Warehouse
        ↓
BI / Analytics
```

Learn:

- Historical storage
- Analytical workloads
- Subject-oriented data
- Data integration
- Data quality
- Governance

---

# 3. Data Lake

Understand:

```text
Data Lake
```

as low-cost storage for large amounts of structured and unstructured data.

Typical architecture:

```text
Sources
   ↓
Object Storage
   ↓
Raw Data
   ↓
Processing
   ↓
Curated Data
```

AWS example:

```text
S3
```

---

# 4. Data Lake vs Data Warehouse

Understand the differences:

| Data Lake | Data Warehouse |
|---|---|
| Raw + processed data | Curated analytical data |
| Flexible schema | Structured schema |
| Cheap object storage | Analytical database |
| Many data types | Primarily structured |
| Schema-on-read common | Schema-on-write common |

Know why modern architectures often combine both.

---

# 5. Data Lakehouse

Understand the concept:

```text
Data Lake
    +
Warehouse capabilities
    ↓
Lakehouse
```

Learn the problems lakehouses try to solve:

- ACID transactions
- Schema enforcement
- Versioning
- Reliable analytical tables
- Data lake flexibility

Understand the concepts even if a specific lakehouse technology is not used.

---

# 6. Warehouse Architecture

Understand:

```text
Sources
   ↓
Staging
   ↓
Core Warehouse
   ↓
Data Marts
   ↓
BI
```

Typical layers:

```text
Raw
Staging
Core
Presentation
```

---

# 7. Staging Layer

Purpose:

- Temporary landing area
- Source-system representation
- Initial validation
- Transformation preparation

Understand:

> Staging is not necessarily the same thing as the raw data layer.

---

# 8. Core Warehouse

Contains integrated, cleaned business data.

Responsibilities:

- Standardization
- Integration
- Historical tracking
- Consistent business definitions

---

# 9. Data Marts

Understand:

```text
Enterprise Warehouse
        ↓
   Data Marts
   /   |   \
Sales Finance Marketing
```

Data marts are optimized for specific business domains.

---

# 10. Dimensional Modeling

Learn the basic dimensional model:

```text
           Dimension
               |
Dimension — Fact — Dimension
               |
           Dimension
```

Core concepts:

- Fact
- Dimension
- Measure
- Attribute
- Grain

---

# 11. Fact Tables

Fact tables contain measurable business events.

Examples:

```text
sales
orders
payments
transactions
shipments
```

Typical columns:

```text
date_key
customer_key
product_key
store_key
quantity
revenue
discount
```

---

# 12. Dimension Tables

Dimensions describe business entities.

Examples:

```text
customer
product
store
employee
date
location
```

Typical attributes:

```text
customer_name
city
segment
status
```

---

# 13. Fact Table Types

Learn:

### Transaction Fact

One row per business transaction.

### Periodic Snapshot

One row per entity per time period.

Example:

```text
daily_account_balance
```

### Accumulating Snapshot

Tracks a process through milestones.

Example:

```text
order_created
order_shipped
order_delivered
```

---

# 14. Grain

One of the most important warehouse concepts.

Grain answers:

> What does one row represent?

Examples:

```text
One row = one order
One row = one order item
One row = one customer per day
One row = one account per month
```

Always define grain before designing a fact table.

---

# 15. Measures

Learn:

### Additive

Can be summed across all dimensions.

Example:

```text
sales_amount
```

### Semi-additive

Can be summed across some dimensions but not time.

Example:

```text
account_balance
```

### Non-additive

Should not be summed.

Example:

```text
percentage
ratio
```

---

# 16. Keys

Learn:

- Primary key
- Foreign key
- Natural key
- Surrogate key
- Composite key
- Business key

Understand why warehouses frequently use surrogate keys.

---

# 17. Surrogate Keys

Example:

```text
customer_key = 10042
customer_id  = CUST-9876
```

Understand why surrogate keys help with:

- Historical tracking
- Source-system changes
- Slowly Changing Dimensions
- Integration across multiple sources

---

# 18. Star Schema

Learn:

```text
             dim_customer
                  |
dim_product — fact_sales — dim_date
                  |
             dim_location
```

Characteristics:

- Central fact table
- Denormalized dimensions
- Simple analytical queries
- BI-friendly

---

# 19. Snowflake Schema

Understand:

```text
fact
 ↓
dimension
 ↓
sub-dimension
```

Compared with star schema:

- More normalized
- More joins
- Potentially less redundancy
- More complex queries

Know the trade-off rather than assuming one is always better.

---

# 20. Normalization vs Denormalization

Understand:

### Normalization

Reduces redundancy.

Common in OLTP.

### Denormalization

Improves analytical query simplicity/performance in some designs.

Common in dimensional models.

---

# 21. Date Dimension

Very important.

Learn why warehouses commonly use:

```text
dim_date
```

Typical columns:

```text
date_key
date
day
month
month_name
quarter
year
week
day_of_week
is_weekend
fiscal_year
fiscal_quarter
```

---

# 22. Time Dimension

Understand when a separate time dimension is useful.

Example:

```text
time_key
hour
minute
second
shift
```

---

# 23. Slowly Changing Dimensions

Critical topic.

Learn:

```text
SCD Type 0
SCD Type 1
SCD Type 2
```

---

# 24. SCD Type 0

No historical changes.

Example:

```text
Original customer birth date
```

Once stored, it does not change.

---

# 25. SCD Type 1

Overwrite the old value.

Example:

```text
City:
Delhi → Pune
```

Only the latest value is retained.

---

# 26. SCD Type 2

Preserves history.

Example:

```text
customer_key
customer_id
city
effective_from
effective_to
is_current
```

Example:

```text
1001 | C123 | Delhi | 2025-01-01 | 2026-04-10 | false
1002 | C123 | Pune  | 2026-04-11 | NULL       | true
```

This is one of the most important warehouse interview topics.

---

# 27. SCD Type 3

Stores limited previous-state information.

Example:

```text
current_city
previous_city
```

Know the concept, but prioritize Type 1 and Type 2.

---

# 28. Factless Fact Tables

Understand fact tables without numerical measures.

Examples:

```text
student_attendance
customer_product_interaction
promotion_eligibility
```

Useful for representing events or relationships.

---

# 29. Degenerate Dimensions

Understand dimensions stored directly in a fact table.

Example:

```text
order_number
invoice_number
transaction_number
```

No separate dimension table is required.

---

# 30. Junk Dimensions

Understand combining low-cardinality flags into a single dimension.

Example:

```text
payment_status
order_status
customer_type
```

Useful for avoiding many tiny dimension tables.

---

# 31. Role-Playing Dimensions

Understand one dimension used in multiple roles.

Example:

```text
dim_date
   ↓
order_date
ship_date
delivery_date
```

---

# 32. Conformed Dimensions

Understand dimensions shared across multiple fact tables.

Example:

```text
dim_customer
     ↓
fact_sales
fact_returns
fact_payments
```

This enables consistent analytics across business processes.

---

# 33. Bus Matrix

Learn the concept of a dimensional bus matrix.

Map:

```text
Business Process
       ×
Conformed Dimensions
```

Example:

| Process | Customer | Product | Date | Store |
|---|---|---|---|---|
| Sales | ✓ | ✓ | ✓ | ✓ |
| Returns | ✓ | ✓ | ✓ | ✓ |
| Payments | ✓ | - | ✓ | - |

Useful for enterprise warehouse design.

---

# 34. ETL / ELT into Warehouse

Understand:

```text
Source
 ↓
Raw / Staging
 ↓
Clean
 ↓
Dimensions
 ↓
Facts
 ↓
Data Marts
```

Understand load order:

```text
Dimensions
    ↓
Facts
```

because fact tables reference dimension keys.

---

# 35. Full vs Incremental Warehouse Loads

Understand:

### Full Load

Rebuild the target.

### Incremental Load

Process only changed/new data.

Know when each is appropriate.

---

# 36. CDC in Warehouses

Understand:

```text
Source DB
   ↓
CDC
   ↓
Raw
   ↓
Warehouse
```

CDC events may include:

```text
INSERT
UPDATE
DELETE
```

Learn how CDC feeds:

- Dimensions
- Facts
- SCD Type 2

---

# 37. Late-Arriving Dimensions

Understand the problem:

```text
Fact arrives
    ↓
Dimension record not available yet
```

Learn strategies:

- Unknown/default dimension key
- Backfill dimension key
- Retry processing

---

# 38. Late-Arriving Facts

Understand facts that arrive after the expected reporting period.

Learn:

- Reprocessing
- Incremental corrections
- Snapshot updates

---

# 39. Data Quality in Warehouses

Validate:

```text
Primary keys
Foreign keys
Nulls
Duplicates
Valid ranges
Referential integrity
Source-target counts
Business rules
```

---

# 40. Referential Integrity

Understand:

```text
fact.customer_key
       ↓
dim_customer.customer_key
```

Every required foreign key should map to a valid dimension record or an intentional unknown/default key.

---

# 41. Partitioning

Learn partitioning by:

```text
date
month
region
business unit
```

Understand:

- Partition pruning
- Partition size
- Over-partitioning
- Under-partitioning

---

# 42. Clustering / Sorting

Understand concepts such as:

- Sort keys
- Clustering keys
- Data locality
- Query pruning

Exact implementation depends on the warehouse.

---

# 43. Columnar Storage

Understand why analytical warehouses often use columnar storage.

Benefits:

- Read only required columns
- Compression
- Efficient aggregation
- Analytical scans

---

# 44. Compression

Understand:

```text
Columnar data
    ↓
Compression
    ↓
Less storage
    ↓
Less I/O
```

Know why low-cardinality columns often compress well.

---

# 45. Query Performance

Learn:

- Partition pruning
- Column pruning
- Predicate pushdown
- Join optimization
- Distribution
- Clustering
- Statistics
- Materialized views

---

# 46. Materialized Views

Understand:

```text
Base tables
    ↓
Precomputed result
    ↓
Materialized View
```

Useful when expensive analytical queries are repeatedly executed.

Understand refresh strategies.

---

# 47. Aggregation Tables

Understand precomputed tables such as:

```text
daily_sales
monthly_sales
customer_summary
product_summary
```

Trade-off:

```text
Faster queries
vs
Additional storage + maintenance
```

---

# 48. Data Warehouse Performance

Be able to investigate:

```text
Slow query
   ↓
Query plan
   ↓
Scan volume
   ↓
Join strategy
   ↓
Partition pruning
   ↓
Data distribution
```

---

# 49. Data Warehouse Security

Learn:

- Authentication
- Authorization
- Roles
- Least privilege
- Row-level security
- Column-level security
- Data masking
- Encryption
- Auditing

---

# 50. PII and Sensitive Data

Understand handling of:

```text
Name
Email
Phone
Address
Account information
Identifiers
```

Learn:

- Masking
- Tokenization concepts
- Access control
- Encryption
- Data retention

---

# 51. Data Governance

Learn concepts:

- Data ownership
- Data lineage
- Metadata
- Data catalog
- Data classification
- Data retention
- Data quality
- Access control

---

# 52. Data Lineage

Understand:

```text
Source
 ↓
ETL
 ↓
Warehouse Table
 ↓
Dashboard
```

Lineage answers:

> Where did this number come from?

---

# 53. Metadata

Track:

```text
Table owner
Description
Column meaning
Data type
Refresh frequency
Source
Business definition
```

---

# 54. Data Warehouse Cost Optimization

Especially important in cloud warehouses.

Learn:

- Avoid unnecessary full scans
- Partition correctly
- Compress data
- Use appropriate warehouse size
- Avoid excessive materialized tables
- Optimize query frequency
- Separate workloads where appropriate

---

# 55. AWS Data Warehouse Mapping

Understand:

## Amazon Redshift

Cloud data warehouse for analytical workloads.

## Amazon Athena

Serverless SQL query service over data in S3.

## Amazon S3

Object storage commonly used as the data lake layer.

## AWS Glue

Data catalog + ETL capabilities.

Architecture:

```text
Sources
   ↓
S3 Raw
   ↓
Glue / PySpark
   ↓
S3 Curated
   ↓
Athena
   ↓
Redshift
   ↓
BI
```

---

# 56. Redshift Concepts to Learn

Later study:

- Redshift clusters / serverless concepts
- Tables
- Distribution styles
- Distribution keys
- Sort keys
- Compression
- Vacuum concepts
- Analyze/statistics
- Workload management
- Spectrum
- COPY
- UNLOAD

Do not memorize every setting before understanding warehouse fundamentals.

---

# 57. Athena Concepts to Learn

Learn:

- Querying S3
- Glue Data Catalog
- External tables
- Partitioning
- Parquet
- Compression
- Partition projection concepts
- Query cost based on data scanned

---

# 58. Warehouse Design Project

Build:

```text
                 dim_customer
                      |
                      |
dim_product ---- fact_sales ---- dim_date
                      |
                      |
                 dim_location
```

Source:

```text
customers.csv
products.csv
orders.csv
order_items.csv
```

Build:

```text
Raw
 ↓
Staging
 ↓
Dimensions
 ↓
Fact
 ↓
Data Mart
```

---

# 59. SCD Type 2 Project

Build:

```text
customer_source
      ↓
Detect changes
      ↓
Expire old record
      ↓
Insert new version
      ↓
dim_customer
```

Track:

```text
effective_from
effective_to
is_current
```

---

# 60. Sales Data Warehouse Project

Build:

### Dimensions

```text
dim_customer
dim_product
dim_date
dim_location
```

### Fact

```text
fact_sales
```

Metrics:

```text
quantity
revenue
discount
cost
profit
```

Queries:

- Daily revenue
- Monthly revenue
- Revenue by product
- Revenue by customer
- Revenue by region
- Top products
- Customer lifetime value

---

# 61. Recommended Learning Order

```text
1. OLTP vs OLAP
        ↓
2. Data Warehouse
        ↓
3. Data Lake
        ↓
4. Lakehouse
        ↓
5. Warehouse Architecture
        ↓
6. Dimensional Modeling
        ↓
7. Fact Tables
        ↓
8. Dimension Tables
        ↓
9. Grain
        ↓
10. Keys
        ↓
11. Star Schema
        ↓
12. Snowflake Schema
        ↓
13. SCD
        ↓
14. Advanced Dimensions
        ↓
15. Incremental Loads
        ↓
16. CDC
        ↓
17. Late Data
        ↓
18. Data Quality
        ↓
19. Partitioning
        ↓
20. Performance
        ↓
21. Security
        ↓
22. Governance
        ↓
23. Redshift
        ↓
24. Athena
        ↓
25. Warehouse Projects
```

---

# 62. Progress Tracker

## Fundamentals

- [ ] OLTP
- [ ] OLAP
- [ ] Data warehouse
- [ ] Data lake
- [ ] Lakehouse
- [ ] Staging
- [ ] Data marts

## Dimensional Modeling

- [ ] Fact tables
- [ ] Dimension tables
- [ ] Grain
- [ ] Measures
- [ ] Additive measures
- [ ] Semi-additive measures
- [ ] Non-additive measures
- [ ] Natural keys
- [ ] Surrogate keys

## Schemas

- [ ] Star schema
- [ ] Snowflake schema
- [ ] Normalization
- [ ] Denormalization
- [ ] Date dimension
- [ ] Role-playing dimension
- [ ] Conformed dimension
- [ ] Junk dimension
- [ ] Degenerate dimension
- [ ] Factless fact

## History

- [ ] SCD Type 0
- [ ] SCD Type 1
- [ ] SCD Type 2
- [ ] SCD Type 3
- [ ] CDC
- [ ] Late-arriving dimensions
- [ ] Late-arriving facts

## Performance

- [ ] Partitioning
- [ ] Partition pruning
- [ ] Columnar storage
- [ ] Compression
- [ ] Clustering / sorting
- [ ] Materialized views
- [ ] Aggregation tables
- [ ] Query optimization

## Governance

- [ ] Data quality
- [ ] Data lineage
- [ ] Metadata
- [ ] Data catalog
- [ ] Data ownership
- [ ] Data retention
- [ ] PII handling
- [ ] Row-level security
- [ ] Column-level security

## AWS

- [ ] S3
- [ ] Glue
- [ ] Glue Data Catalog
- [ ] Athena
- [ ] Redshift
- [ ] Redshift distribution
- [ ] Redshift sort keys
- [ ] Redshift Spectrum

## Projects

- [ ] Sales warehouse
- [ ] SCD Type 2
- [ ] Incremental warehouse load
- [ ] S3 → Glue → Athena
- [ ] S3 → Glue → Redshift

---

# 63. Interview Topics

Be able to explain:

- OLTP vs OLAP
- Data lake vs data warehouse
- Data lakehouse
- Fact vs dimension
- What is grain?
- Star vs snowflake schema
- Natural vs surrogate key
- SCD Type 1 vs Type 2
- Why use surrogate keys?
- What is a conformed dimension?
- What is a factless fact?
- What is a degenerate dimension?
- What is a role-playing dimension?
- Additive vs semi-additive measures
- Full vs incremental warehouse loads
- CDC
- Late-arriving dimensions
- Partitioning
- Columnar storage
- Materialized views
- Data marts
- Data lineage
- Warehouse security

---

# 64. Production Scenario Questions

### Scenario 1

A customer changes city three times. How should the warehouse preserve history?

### Scenario 2

A fact arrives before its dimension record. What do you do?

### Scenario 3

A dashboard suddenly becomes slow. How do you investigate?

### Scenario 4

A fact table grows from 100 million to 10 billion rows. What would you change?

### Scenario 5

The same business metric is calculated differently by two teams. How do you solve it?

### Scenario 6

A source system changes a customer identifier. How should the warehouse handle it?

### Scenario 7

You need historical reporting for the last five years. What modeling decisions matter?

---

# 65. Definition of Done

I should be able to:

- Explain OLTP vs OLAP.
- Explain data lake vs warehouse vs lakehouse.
- Design a basic warehouse architecture.
- Define fact table grain.
- Design fact and dimension tables.
- Build a star schema.
- Explain snowflake schema.
- Use surrogate keys.
- Implement SCD Type 1.
- Implement SCD Type 2.
- Explain CDC.
- Handle late-arriving dimensions.
- Design incremental warehouse loads.
- Explain partitioning and pruning.
- Understand columnar storage.
- Optimize analytical queries.
- Explain data lineage and governance.
- Understand warehouse security.
- Explain Redshift and Athena at a practical level.
- Design an end-to-end cloud warehouse.

---

# 66. Connection to the Next Topics

```text
Python
   ↓
SQL
   ↓
ETL / ELT
   ↓
PySpark
   ↓
Data Warehousing
   ↓
Airflow
   ↓
AWS S3
   ↓
AWS Glue
   ↓
Athena
   ↓
Redshift
   ↓
End-to-End AWS Data Engineering
```

The key goal is:

> Learn how to turn raw data into a well-modeled, historical, reliable, and performant analytical system.
