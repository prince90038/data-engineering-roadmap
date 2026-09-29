# AWS Glue

## 1. Learn

- Glue Data Catalog
- Databases
- Tables
- Crawlers
- Glue Jobs
- DynamicFrames
- DataFrames
- Job bookmarks
- Triggers
- Workflows
- Connections
- Glue Data Quality

## 2. Architecture

```text
S3 Raw
  ↓
Glue Crawler
  ↓
Glue Catalog
  ↓
Glue PySpark Job
  ↓
S3 Curated
```

## 3. Glue Catalog

Understand:

- Schema
- Location
- Partitions
- Tables
- Databases

## 4. Crawlers

Learn:

- Schema discovery
- Partition discovery
- Scheduling
- Schema changes
- When explicit schemas are preferable

## 5. Glue ETL

Practice:

```text
S3 CSV
 ↓
Glue PySpark
 ↓
Clean
 ↓
Transform
 ↓
Write Parquet
```

Learn:

- Job parameters
- Worker types
- Retries
- Logging
- Bookmarks
- Partitioned output

## 6. DynamicFrame vs DataFrame

Know:

- DynamicFrame use cases
- Conversion to Spark DataFrame
- Schema handling
- Performance considerations

## 7. Optimization

Learn:

- Predicate pushdown
- Partition pruning
- Broadcast joins
- Repartition vs coalesce
- File sizing
- Avoiding unnecessary shuffles

## 8. Data quality

Validate:

- Nulls
- Duplicates
- Schema
- Record counts
- Business rules
- Freshness

## 9. Project

Build an incremental S3 → Glue → S3 pipeline with:

- Parquet
- Partitions
- Bookmark/incremental logic
- Data quality
- Retry
- Logging

## 10. Interview

- Glue vs EMR
- Crawler purpose
- Glue Catalog
- Bookmarks
- DynamicFrame
- Glue job optimization
- Serverless ETL
