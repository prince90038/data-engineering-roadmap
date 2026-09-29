# Amazon Athena

## 1. Learn

- Serverless SQL
- External tables
- Glue Data Catalog
- Views
- CTAS
- Workgroups
- Query result locations
- Partitioned tables

## 2. Architecture

```text
S3
 ↓
Glue Catalog
 ↓
Athena
 ↓
SQL
```

## 3. Query S3 data

Practice querying:

- CSV
- JSON
- Parquet

Focus heavily on Parquet.

## 4. Cost optimization

Athena cost is strongly influenced by data scanned.

Learn:

- Partition pruning
- Column pruning
- Parquet
- Compression
- CTAS
- Avoid SELECT *
- Appropriate partitions

## 5. Practical SQL

Practice:

- GROUP BY
- Window functions
- CTEs
- JOINs
- Aggregations
- Date functions

## 6. Project

Build:

```text
S3 Raw
 ↓
Glue ETL
 ↓
S3 Parquet
 ↓
Glue Catalog
 ↓
Athena
```

Create 15-20 analytical queries.

## 7. Interview

- Athena vs Redshift
- External table
- Partition pruning
- Why Parquet?
- How to reduce Athena cost?
- Glue Catalog relationship
