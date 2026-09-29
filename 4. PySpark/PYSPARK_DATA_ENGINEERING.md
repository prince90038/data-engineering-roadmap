# PySpark for Data Engineering

## Objective

Learn PySpark as the distributed data-processing layer between Python/SQL fundamentals and production-scale Data Engineering.

The goal is to understand not only PySpark syntax, but also:

- Distributed processing
- DataFrames
- Spark SQL
- Transformations and actions
- Joins and aggregations
- Partitioning
- Shuffles
- Caching
- File formats
- Performance tuning
- Fault tolerance
- ETL pipelines
- AWS Glue / Spark integration

---

# 1. Why PySpark?

Understand:

```text
Pandas
  ↓
Single machine
  ↓
Limited by machine resources
```

versus:

```text
PySpark
  ↓
Distributed cluster
  ↓
Large datasets
  ↓
Parallel processing
```

Know when to use:

- Pandas
- SQL
- PySpark

Do not use Spark just because the dataset is large. Spark introduces overhead and operational complexity.

---

# 2. Apache Spark Architecture

Understand the major components:

```text
Driver
  ↓
Cluster Manager
  ↓
Executors
  ↓
Tasks
```

Learn:

- Driver
- Executor
- Worker node
- Cluster manager
- Application
- Job
- Stage
- Task

Understand how a Spark application is executed.

---

# 3. SparkSession

Learn:

```python
from pyspark.sql import SparkSession

spark = (
    SparkSession.builder
    .appName("DataPipeline")
    .getOrCreate()
)
```

Understand:

- Creating SparkSession
- Spark configuration
- Reading data
- Running SQL
- Writing data
- Stopping the application

---

# 4. RDD vs DataFrame vs Dataset

Understand:

```text
RDD
 ↓
DataFrame
 ↓
Dataset
```

Focus heavily on DataFrames.

Know:

- RDD characteristics
- DataFrame advantages
- Dataset concept
- Type safety
- Catalyst optimization
- Tungsten execution concepts

For PySpark, DataFrames are the primary abstraction you should use.

---

# 5. DataFrame Fundamentals

Learn:

```python
df.show()
df.printSchema()
df.columns
df.dtypes
df.count()
df.describe()
```

Understand:

- Schema
- Rows
- Columns
- Nulls
- Data types

---

# 6. Creating DataFrames

Learn how to create DataFrames from:

- Python lists
- Tuples
- RDDs
- CSV
- JSON
- Parquet
- ORC
- JDBC

Practice both:

```python
spark.createDataFrame(...)
```

and file-based loading.

---

# 7. Reading Data

Learn:

```python
spark.read.csv(...)
spark.read.json(...)
spark.read.parquet(...)
spark.read.orc(...)
```

Understand options such as:

```text
header
inferSchema
schema
mode
delimiter
multiline
```

Prefer explicit schemas for production pipelines.

---

# 8. Writing Data

Learn:

```python
df.write
```

Understand:

```text
append
overwrite
ignore
error
```

Practice writing:

- CSV
- JSON
- Parquet
- ORC

---

# 9. Transformations

Learn common DataFrame transformations:

```text
select
filter
where
withColumn
drop
distinct
dropDuplicates
orderBy
sort
limit
alias
```

Understand that most transformations are lazy.

---

# 10. Actions

Learn:

```text
show
count
collect
take
first
head
write
```

Important:

> Actions trigger Spark execution.

Be careful with:

```python
df.collect()
```

because it brings all data to the driver.

---

# 11. Lazy Evaluation

Understand:

```text
Transformation
   ↓
Transformation
   ↓
Transformation
   ↓
Action
   ↓
Execution
```

Spark builds a logical execution plan before actually processing data.

Understand why lazy evaluation is useful for optimization.

---

# 12. Narrow vs Wide Transformations

Learn:

## Narrow

Examples:

```text
map
filter
select
withColumn
```

No major data redistribution is required.

## Wide

Examples:

```text
groupBy
join
distinct
orderBy
```

Usually require a shuffle.

This distinction is critical for performance.

---

# 13. Spark SQL

Learn:

```python
df.createOrReplaceTempView("orders")
```

Then:

```sql
SELECT
    customer_id,
    SUM(amount)
FROM orders
GROUP BY customer_id;
```

Understand when SQL is cleaner than DataFrame APIs.

---

# 14. Column Expressions

Learn:

```python
from pyspark.sql.functions import col

df.select(
    col("customer_id"),
    col("amount") * 1.18
)
```

Practice:

- Arithmetic
- Conditions
- Aliases
- Expressions
- Nested expressions

---

# 15. Filtering

Learn:

```python
df.filter(...)
df.where(...)
```

Practice:

- Multiple conditions
- NULL handling
- Date filtering
- String filtering
- Range filtering

---

# 16. withColumn

Learn how to create or modify columns.

Examples:

```python
df.withColumn("total", col("price") * col("quantity"))
```

Understand the performance implications of creating many sequential `withColumn` operations.

---

# 17. Aggregations

Learn:

```text
groupBy
agg
sum
avg
count
min
max
countDistinct
```

Practice:

- Revenue by customer
- Sales by day
- Orders by category
- Average transaction amount

---

# 18. Joins

Critical topic.

Learn:

```text
inner
left
right
full
cross
left_semi
left_anti
```

Understand:

- Join keys
- Duplicate join keys
- Null behavior
- Join cardinality
- Join explosion

---

# 19. Broadcast Joins

Understand:

```text
Large Dataset
      +
Small Dataset
      ↓
Broadcast Small Dataset
      ↓
Avoid expensive shuffle
```

Learn:

```python
from pyspark.sql.functions import broadcast

df_large.join(
    broadcast(df_small),
    "customer_id"
)
```

Understand when broadcasting is unsafe.

---

# 20. Window Functions

Learn:

```text
Window
partitionBy
orderBy
```

Functions:

```text
row_number
rank
dense_rank
lag
lead
first
last
sum
avg
```

Use cases:

- Latest record per customer
- Deduplication
- Running totals
- Previous transaction
- Ranking

---

# 21. Deduplication

Learn:

```python
dropDuplicates()
```

and deterministic deduplication using:

```text
row_number()
over(Window...)
```

Practice:

> Keep the latest record for every customer.

---

# 22. Null Handling

Learn:

```text
isNull
isNotNull
fillna
dropna
coalesce
when
otherwise
```

Understand how NULL affects:

- Joins
- Aggregations
- Filters
- Expressions

---

# 23. Date and Time

Learn Spark functions for:

- Date parsing
- Timestamp parsing
- Date arithmetic
- Date difference
- Date truncation
- Time zones

Practice:

- Daily aggregations
- Monthly aggregations
- Rolling periods
- Incremental processing

---

# 24. String Functions

Learn:

```text
lower
upper
trim
regexp_replace
substring
split
concat
concat_ws
regexp_extract
```

Use for cleansing and parsing source data.

---

# 25. Complex Data Types

Learn:

```text
Array
Map
Struct
```

Practice:

- Nested JSON
- Exploding arrays
- Accessing nested fields
- Transforming complex schemas

Important functions:

```text
explode
posexplode
explode_outer
from_json
to_json
```

---

# 26. Schema Management

Learn:

- Explicit schemas
- StructType
- StructField
- DataType
- Schema validation
- Schema evolution

Prefer:

```text
Explicit schema
```

over blindly relying on:

```text
inferSchema
```

for production pipelines.

---

# 27. UDFs

Understand:

```text
Python UDF
Pandas UDF
Built-in Spark functions
```

Know why built-in Spark functions are generally preferred.

Avoid Python UDFs when the same transformation can be expressed using native Spark functions.

---

# 28. Pandas UDF

Understand:

- Vectorized execution
- Arrow
- When Pandas UDFs help
- Limitations

Do not use them automatically.

---

# 29. Parquet

Critical Data Engineering topic.

Understand:

- Columnar storage
- Compression
- Schema
- Predicate pushdown
- Column pruning
- Partitioning

Know why Parquet is generally preferable to CSV for analytical workloads.

---

# 30. Partitioning

Understand:

```text
Logical partitions
      ↓
Parallel processing
```

Learn:

```text
repartition()
coalesce()
partitionBy()
```

Understand the difference between:

- DataFrame partitions
- File partitions
- Table partitions

---

# 31. Repartition vs Coalesce

Know:

### repartition()

- Can increase or decrease partitions
- Usually causes shuffle

### coalesce()

- Primarily reduces partitions
- Usually avoids a full shuffle

Understand when each is appropriate.

---

# 32. Shuffle

One of the most important Spark concepts.

Understand:

```text
Executor A
   ↓
Shuffle
   ↓
Executor B
```

Operations that can trigger shuffle:

- groupBy
- join
- distinct
- orderBy
- repartition

Learn why shuffle is expensive.

---

# 33. Data Skew

Understand:

```text
Normal:
Partition 1 → 1M rows
Partition 2 → 1M rows
Partition 3 → 1M rows

Skewed:
Partition 1 → 20M rows
Partition 2 → 500K rows
Partition 3 → 400K rows
```

Learn:

- Hot keys
- Skewed joins
- Salting
- Broadcast joins
- Adaptive Query Execution

---

# 34. Caching and Persistence

Learn:

```python
df.cache()
df.persist()
```

Understand:

- When caching helps
- When caching hurts
- Memory pressure
- Storage levels
- Unpersisting

Do not cache everything.

---

# 35. Catalyst Optimizer

Understand conceptually:

```text
SQL / DataFrame API
       ↓
Logical Plan
       ↓
Optimized Logical Plan
       ↓
Physical Plan
       ↓
Execution
```

Know that Spark can optimize transformations automatically.

---

# 36. Tungsten

Understand at a high level:

- Memory management
- Binary processing
- CPU efficiency
- Whole-stage code generation

You do not need to memorize Spark internals.

---

# 37. Adaptive Query Execution

Learn the purpose of AQE.

Understand how Spark can adapt execution based on runtime statistics.

Know concepts such as:

- Dynamic partition coalescing
- Join strategy changes
- Skew handling

---

# 38. Execution Plans

Learn:

```python
df.explain()
```

Understand:

- Parsed logical plan
- Analyzed logical plan
- Optimized logical plan
- Physical plan

Learn to identify:

```text
Exchange
BroadcastHashJoin
SortMergeJoin
Filter
Project
Aggregate
```

---

# 39. Performance Optimization

Learn:

- Filter early
- Select only required columns
- Avoid unnecessary shuffles
- Use partition pruning
- Use broadcast joins appropriately
- Avoid unnecessary UDFs
- Use Parquet
- Control partition counts
- Handle skew
- Cache only when useful
- Use AQE
- Avoid collect()

---

# 40. Small Files Problem

Understand:

```text
1 million tiny files
```

can be worse than:

```text
a reasonable number of large files
```

Learn:

- File sizing
- Coalescing
- Compaction
- Partition design

---

# 41. Checkpointing

Understand:

```python
df.checkpoint()
```

and the difference between:

- Cache
- Persist
- Checkpoint

Checkpointing is useful for breaking long lineage chains and improving recovery in appropriate workloads.

---

# 42. Fault Tolerance

Understand why Spark can recover failed work.

Learn:

- Lineage
- Task retries
- Executor failure
- Stage retry
- Checkpointing

---

# 43. Spark ETL Architecture

Be able to build:

```text
Source
  ↓
Read
  ↓
Validate
  ↓
Transform
  ↓
Deduplicate
  ↓
Aggregate
  ↓
Write
  ↓
Data Quality
```

---

# 44. Incremental Processing with Spark

Learn patterns using:

- Watermarks
- Partition dates
- Updated timestamps
- CDC
- MERGE
- Event IDs

Example:

```text
S3 raw
  ↓
Only new partitions
  ↓
PySpark
  ↓
Curated Parquet
```

---

# 45. Spark Structured Streaming

Learn later after batch Spark fundamentals.

Topics:

- Streaming DataFrame
- Source
- Sink
- Trigger
- Checkpoint
- Output mode
- Watermark
- Window
- Stateful processing

Sources:

- Kafka
- Files
- Kinesis concepts

---

# 46. Structured Streaming Semantics

Understand:

```text
At-least-once
Exactly-once concepts
Checkpointing
Watermarking
Late events
State
```

Do not confuse event-time processing with processing-time processing.

---

# 47. Testing PySpark

Learn:

- Unit testing transformations
- Test fixtures
- Small deterministic DataFrames
- Schema assertions
- Row-level assertions
- Integration testing

Tools:

```text
pytest
```

---

# 48. Production PySpark Practices

Learn:

- Config-driven jobs
- Environment separation
- Logging
- Metrics
- Data quality checks
- Error handling
- Parameterization
- Retry strategy
- Idempotency
- Monitoring

---

# 49. AWS Connection

Later map PySpark to AWS:

```text
PySpark
   ↓
AWS Glue
   ↓
Spark
   ↓
S3
   ↓
Athena / Redshift
```

Understand:

- Glue Jobs
- Glue Data Catalog
- Glue Crawlers
- S3
- Athena
- Redshift
- EMR

---

# 50. Practical Projects

## Project 1 — CSV to Parquet

```text
CSV
 ↓
PySpark
 ↓
Validation
 ↓
Transformation
 ↓
Parquet
```

Include:

- Explicit schema
- Logging
- Data quality checks

---

## Project 2 — Large Sales Dataset

Build:

```text
Raw sales
   ↓
PySpark
   ↓
Clean
   ↓
Deduplicate
   ↓
Aggregate
   ↓
Parquet
```

Practice:

- Joins
- Windows
- Partitioning
- Performance optimization

---

## Project 3 — Incremental Pipeline

```text
Raw partitions
      ↓
Identify new data
      ↓
PySpark
      ↓
Transform
      ↓
Merge / Append
      ↓
Curated
```

Include:

- Watermark
- Idempotency
- Audit metadata

---

## Project 4 — AWS Glue Job

Later build:

```text
S3
 ↓
AWS Glue / PySpark
 ↓
S3 Curated
 ↓
Glue Catalog
 ↓
Athena
```

This should be one of the main projects for AWS Data Engineering preparation.

---

# 51. Interview Topics

Be able to explain:

- Spark vs Hadoop
- Spark vs Pandas
- RDD vs DataFrame
- Driver vs Executor
- Transformation vs Action
- Lazy evaluation
- Narrow vs wide transformation
- Shuffle
- Partitioning
- Repartition vs coalesce
- Broadcast join
- Sort-merge join
- Data skew
- Caching
- Checkpointing
- Catalyst optimizer
- AQE
- UDF vs built-in functions
- Parquet
- Predicate pushdown
- Partition pruning
- Small files problem
- Fault tolerance
- Structured Streaming

---

# 52. Production Scenario Questions

Be able to answer:

### Scenario 1

A Spark job takes 2 hours instead of 15 minutes. How do you investigate?

### Scenario 2

One executor is processing much more data than others. Why?

### Scenario 3

A join causes massive shuffle. How do you optimize it?

### Scenario 4

A small lookup table is joined with a 2 TB dataset. What strategy could help?

### Scenario 5

Your output contains thousands of tiny Parquet files. What happened?

### Scenario 6

A Python UDF makes the job extremely slow. What would you change?

### Scenario 7

One customer has 50% of all records. How can you handle the skew?

### Scenario 8

A Spark job fails halfway through. How does Spark recover?

---

# 53. Recommended Learning Order

```text
1. Spark Architecture
        ↓
2. SparkSession
        ↓
3. DataFrames
        ↓
4. Read / Write
        ↓
5. Transformations
        ↓
6. Actions
        ↓
7. Lazy Evaluation
        ↓
8. Spark SQL
        ↓
9. Joins
        ↓
10. Aggregations
        ↓
11. Window Functions
        ↓
12. Complex Data Types
        ↓
13. Parquet
        ↓
14. Partitions
        ↓
15. Shuffle
        ↓
16. Repartition / Coalesce
        ↓
17. Broadcast Joins
        ↓
18. Data Skew
        ↓
19. Caching
        ↓
20. Execution Plans
        ↓
21. Catalyst / AQE
        ↓
22. Performance Optimization
        ↓
23. Incremental ETL
        ↓
24. Testing
        ↓
25. Structured Streaming
        ↓
26. AWS Glue / EMR
```

---

# 54. Progress Tracker

## Fundamentals

- [ ] Spark architecture
- [ ] SparkSession
- [ ] DataFrames
- [ ] RDD basics
- [ ] Data types
- [ ] Schemas
- [ ] Read / Write

## Transformations

- [ ] select
- [ ] filter
- [ ] where
- [ ] withColumn
- [ ] drop
- [ ] distinct
- [ ] dropDuplicates
- [ ] groupBy
- [ ] agg
- [ ] joins
- [ ] window functions

## Performance

- [ ] Lazy evaluation
- [ ] Narrow transformations
- [ ] Wide transformations
- [ ] Shuffle
- [ ] Partitioning
- [ ] repartition
- [ ] coalesce
- [ ] Broadcast joins
- [ ] Data skew
- [ ] Cache
- [ ] Persist
- [ ] AQE
- [ ] Execution plans
- [ ] Small files

## Data Engineering

- [ ] Parquet
- [ ] Incremental processing
- [ ] Watermarking
- [ ] Deduplication
- [ ] Data quality
- [ ] Fault tolerance
- [ ] Checkpointing
- [ ] Idempotency

## Streaming

- [ ] Structured Streaming
- [ ] Checkpoints
- [ ] Watermarks
- [ ] Windows
- [ ] Output modes
- [ ] Kafka integration

## AWS

- [ ] Glue Jobs
- [ ] Glue Data Catalog
- [ ] Glue Crawlers
- [ ] S3
- [ ] Athena
- [ ] EMR
- [ ] Redshift

## Projects

- [ ] CSV → Parquet
- [ ] Large-scale sales ETL
- [ ] Incremental PySpark pipeline
- [ ] AWS Glue pipeline

---

# 55. Definition of Done

I should be able to:

- Explain Spark architecture.
- Build DataFrame-based ETL pipelines.
- Read and write common file formats.
- Use joins and aggregations confidently.
- Use window functions.
- Handle nested JSON.
- Explain lazy evaluation.
- Explain shuffle and partitions.
- Optimize joins.
- Use broadcast joins appropriately.
- Identify data skew.
- Read a Spark execution plan.
- Explain Catalyst and AQE at a high level.
- Optimize large Spark jobs.
- Process incremental data.
- Build production-style PySpark ETL.
- Test PySpark transformations.
- Explain Structured Streaming fundamentals.
- Build a PySpark job on AWS Glue.

---

# 56. Connection to the Next Topics

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
```

The key goal is to understand:

> How to move from single-machine Python/SQL processing to distributed data processing at scale.
