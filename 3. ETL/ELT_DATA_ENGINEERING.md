# ETL / ELT for Data Engineering

## Objective

Build practical understanding of how production data pipelines are designed, developed, operated, monitored, and optimized.

This section connects:

```text
Python
  +
SQL
  ↓
ETL / ELT
  ↓
Data Warehouse / Data Lake
  ↓
Airflow / Orchestration
  ↓
AWS Data Engineering
```

The goal is not just to know what ETL means. You should be able to design and implement reliable pipelines that handle:

- Batch data
- Incremental data
- Large datasets
- API sources
- Database sources
- Files
- Data quality issues
- Failures and retries
- Duplicate data
- Late-arriving data
- Schema changes
- Backfills
- Monitoring
- Security

---

# 1. ETL vs ELT

Understand the difference.

## ETL

```text
Extract
   ↓
Transform
   ↓
Load
```

## ELT

```text
Extract
   ↓
Load
   ↓
Transform
```

Understand:

- When ETL is appropriate
- When ELT is appropriate
- Cost and performance trade-offs
- Why modern cloud platforms often favor ELT

---

# 2. Data Pipeline Fundamentals

Learn the difference between:

- ETL pipeline
- ELT pipeline
- Data pipeline
- Data workflow
- Data product

Understand a pipeline as:

```text
Source
  ↓
Extract
  ↓
Validate
  ↓
Transform
  ↓
Load
  ↓
Validate
  ↓
Monitor
```

---

# 3. Data Sources

Understand common sources.

## Databases

- PostgreSQL
- MySQL
- SQL Server
- Oracle

## Files

- CSV
- JSON
- JSON Lines
- XML
- Parquet
- ORC

## APIs

- REST APIs
- GraphQL basics
- Paginated APIs
- Authentication
- Rate limits

## Streaming

- Kafka
- Kinesis

---

# 4. Extraction

Learn reliable extraction patterns.

## Database Extraction

Understand:

- Full extraction
- Incremental extraction
- Timestamp-based extraction
- ID-based extraction
- CDC-based extraction
- Query-based extraction

Example:

```sql
SELECT *
FROM orders
WHERE updated_at > :last_watermark;
```

---

# 5. Full Load

Understand:

```text
Source
   ↓
Extract everything
   ↓
Transform
   ↓
Load target
```

Use cases:

- Initial migration
- Small datasets
- Reference data
- Rebuilding a target

Understand why full loads become expensive at scale.

---

# 6. Incremental Load

Critical Data Engineering topic.

Understand:

```text
Initial Load
     ↓
Watermark
     ↓
New / Updated Records
     ↓
Transform
     ↓
Target
```

Learn:

- Timestamp watermark
- Numeric ID watermark
- High-water mark
- Last successful execution
- Source-side change tracking
- CDC

---

# 7. Watermarking

Understand how a pipeline remembers what it has already processed.

Example:

```text
last_processed_timestamp
```

Pipeline:

```text
Read watermark
      ↓
Extract records > watermark
      ↓
Process records
      ↓
Successful load
      ↓
Update watermark
```

Important:

> Update the watermark only after the data has been successfully processed.

---

# 8. Idempotency

One of the most important production concepts.

A pipeline should be safe to run multiple times without corrupting the target.

Example:

```text
Run 1 → records loaded
Run 2 → same records arrive again
```

The second run should not create duplicates.

Learn:

- Idempotent transformations
- Upserts
- MERGE
- Deduplication
- Business keys
- Unique constraints
- Deterministic processing

---

# 9. API-Based ETL

Learn:

- Authentication
- API keys
- OAuth basics
- Pagination
- Rate limits
- Retry
- Backoff
- Timeout
- Error handling
- Incremental API extraction

Common pagination styles:

```text
Page number
Offset / limit
Cursor
Next URL
```

---

# 10. API Reliability

Understand:

```text
Request
  ↓
Timeout?
  ↓
Retry?
  ↓
Rate limit?
  ↓
Backoff
  ↓
Success / Failure
```

Learn:

- Exponential backoff
- Maximum retry count
- Retryable vs non-retryable errors
- Connection timeout
- Read timeout
- Circuit breaker concept

Do not blindly retry every error.

---

# 11. File-Based ETL

Learn pipelines involving:

```text
CSV
JSON
Parquet
ORC
```

Understand:

- File naming conventions
- Directory structures
- File arrival detection
- File validation
- Empty files
- Corrupt files
- Duplicate files
- Partial files

---

# 12. File Processing Patterns

## Single File

```text
file.csv
 ↓
process
```

## Multiple Files

```text
*.csv
 ↓
discover
 ↓
process
```

## Partitioned Files

```text
/year=2026/month=09/day=27/
```

Understand why partitioned data is useful for analytical workloads.

---

# 13. Staging Layer

Understand why staging exists.

```text
Source
  ↓
Raw / Staging
  ↓
Transformation
  ↓
Curated
  ↓
Warehouse
```

Benefits:

- Reprocessing
- Auditing
- Debugging
- Recovery
- Separation of concerns

---

# 14. Bronze / Silver / Gold

Understand the common medallion pattern:

```text
Bronze
  ↓
Silver
  ↓
Gold
```

## Bronze / Raw

- Preserve source data
- Minimal transformation
- Enable replay
- Support auditing

## Silver / Clean

- Type conversion
- Deduplication
- Null handling
- Standardization
- Validation

## Gold / Business

- Business-ready datasets
- Aggregations
- KPIs
- Reporting tables

This is an architectural pattern, not a mandatory universal implementation.

---

# 15. Data Transformation

Learn:

- Filtering
- Joining
- Aggregation
- Deduplication
- Sorting
- Type conversion
- Normalization
- Denormalization
- Derived columns
- Business rules

Implement transformations using:

```text
Python
SQL
Pandas
PySpark
```

Understand when each is appropriate.

---

# 16. Transformation Strategy

## Python

Good for:

- API processing
- Complex application logic
- File processing
- Lightweight transformations

## SQL

Good for:

- Relational transformations
- Joins
- Aggregations
- Warehouse transformations

## PySpark

Good for:

- Large datasets
- Distributed processing
- Large-scale transformations

---

# 17. Data Loading

Learn:

- Insert
- Bulk insert
- Batch insert
- Upsert
- Merge
- Append
- Replace
- Overwrite

Understand:

```text
Append
Overwrite
Upsert
Merge
```

---

# 18. Batch Processing

Understand:

```text
Scheduled Job
   ↓
Extract
   ↓
Transform
   ↓
Load
```

Examples:

```text
Every 5 minutes
Hourly
Daily
Weekly
```

Understand:

- Batch size
- Processing windows
- Job duration
- Late data
- Backfills

---

# 19. Micro-Batching

Understand the middle ground between batch and streaming.

```text
Small batch
   ↓
Process
   ↓
Small batch
   ↓
Process
```

Use cases:

- Near-real-time analytics
- High-frequency ingestion
- Systems that don't require true streaming

---

# 20. Batch vs Streaming

| Batch | Streaming |
|---|---|
| Periodic processing | Continuous processing |
| Higher latency | Lower latency |
| Simpler | More complex |
| Easier recovery | Requires state/checkpoint management |
| Scheduled | Event-driven |

Know when each approach is appropriate.

---

# 21. Data Quality

Data quality should be part of the pipeline.

Check:

```text
Completeness
Accuracy
Consistency
Validity
Uniqueness
Timeliness
```

Examples:

- Null checks
- Duplicate checks
- Schema validation
- Range checks
- Referential integrity
- Row count checks
- Source-target reconciliation

---

# 22. Schema Validation

Validate:

```text
Column names
Data types
Required fields
Allowed values
Nested structures
```

Useful concepts/tools:

- Pydantic
- JSON Schema
- Database constraints
- Data contracts

---

# 23. Data Contracts

Understand agreements between producers and consumers around:

```text
Schema
Data types
Required fields
Semantics
Expected values
Versioning
```

Learn why breaking schema changes can break downstream pipelines.

---

# 24. Schema Evolution

Understand:

```text
Added column
Removed column
Renamed column
Changed data type
Changed meaning
```

Learn:

- Backward compatibility
- Forward compatibility
- Schema versioning
- Optional fields
- Migration strategies

---

# 25. Duplicate Handling

Understand why duplicates occur:

- Pipeline retry
- Duplicate source records
- Replayed events
- Multiple file arrivals
- API pagination issues
- At-least-once delivery

Solutions:

- Deduplication
- Business keys
- Unique constraints
- MERGE
- Event IDs
- Idempotency

---

# 26. Late-Arriving Data

Understand:

```text
Data for Day 1
arrives on Day 3
```

Learn:

- Late transactions
- Late dimension updates
- Watermark delays
- Reprocessing windows
- Backfills

---

# 27. Backfills

Critical production concept.

```text
Normal processing
      ↓
Problem discovered
      ↓
Historical period selected
      ↓
Reprocess
      ↓
Validate
      ↓
Publish corrected data
```

Learn:

- Partial backfill
- Full backfill
- Date-range backfill
- Idempotent backfills
- Dependency management

---

# 28. Failure Handling

Understand failures from:

```text
Extraction
Transformation
Validation
Loading
Network
Schema
Infrastructure
```

Learn:

- Retry
- Alert
- Fail fast
- Dead-letter storage
- Checkpointing
- Recovery
- Reprocessing

---

# 29. Retry Strategy

Understand:

```text
Retryable error
      ↓
Wait
      ↓
Retry
      ↓
Retry
      ↓
Dead-letter / Alert
```

Learn:

- Exponential backoff
- Jitter
- Maximum retries
- Retry policies

Avoid retry storms.

---

# 30. Checkpointing

Understand how a pipeline records progress.

Example:

```text
Processed up to:
2026-09-27 22:00:00
```

Checkpointing helps with:

- Recovery
- Restart
- Incremental processing
- Large jobs

---

# 31. Dead-Letter Handling

Bad records should not always crash an entire pipeline.

Architecture:

```text
Input
  ↓
Validation
  ├── Valid → Process
  │
  └── Invalid → Dead Letter
```

Store:

- Original record
- Error reason
- Timestamp
- Pipeline/job ID
- Source information

---

# 32. Error Classification

### Transient

Examples:

- Network timeout
- Temporary service unavailable

Usually retry.

### Permanent

Examples:

- Invalid schema
- Invalid business rule
- Missing required field

Usually do not blindly retry.

---

# 33. Transactions and Partial Loads

Understand what happens if:

```text
Step 1 succeeds
Step 2 succeeds
Step 3 fails
```

Learn:

- Transaction boundaries
- Rollback
- Partial loads
- Staging tables
- Atomic publish patterns
- Swap/merge strategies

---

# 34. Delivery Guarantees

Understand:

```text
At-most-once
At-least-once
Exactly-once
```

Do not assume exactly-once is automatically guaranteed.

Learn how practical exactly-once behavior can be achieved using:

- Idempotency
- Deduplication
- Transactional writes
- Checkpoints
- Unique event IDs

---

# 35. Pipeline Dependencies

Understand DAG-style dependencies:

```text
       Extract A
          ↓
      Transform
       ↙      ↘
 Load A       Load B
       ↘      ↙
       Validation
```

Understand task dependencies and failure propagation.

---

# 36. Orchestration

Learn the role of an orchestrator.

Responsibilities:

- Scheduling
- Dependencies
- Retries
- Monitoring
- Backfills
- Alerts
- Logging
- Parameterization

Primary tool:

```text
Apache Airflow
```

Later understand AWS options:

```text
AWS Glue Workflows
Step Functions
MWAA
EventBridge
```

---

# 37. ETL Metadata

Track:

```text
pipeline_name
run_id
start_time
end_time
status
records_read
records_processed
records_failed
source
target
watermark
error_message
```

This is useful for operations and debugging.

---

# 38. Audit Tables

Example:

```text
etl_audit
--------------------------------
run_id
pipeline_name
start_time
end_time
status
source_count
target_count
failed_count
watermark
error_message
```

Use for:

- Monitoring
- Reconciliation
- Debugging
- Compliance
- Operational reporting

---

# 39. Source-to-Target Reconciliation

Validate:

```text
Source records
        vs
Target records
```

Compare:

```text
Count
Sum
Min/Max dates
Distinct keys
Checksums where appropriate
```

Example:

```text
Source count = 1,000,000
Target count = 999,850
```

The pipeline should detect and investigate the discrepancy.

---

# 40. Observability

Understand:

```text
Logs
Metrics
Traces
```

For data pipelines also track:

```text
Data freshness
Data volume
Data quality
Pipeline duration
Failure rate
```

---

# 41. Monitoring Metrics

Track:

- Records read
- Records written
- Records rejected
- Processing time
- Throughput
- Failure count
- Retry count
- Data freshness
- Lag
- Cost

---

# 42. Alerting

Define alerts for:

```text
Pipeline failure
Long-running job
Missing data
Unexpected row count
Schema change
Data freshness breach
High error rate
High processing latency
```

Alerts should be actionable rather than noisy.

---

# 43. Logging Best Practices

Log:

```text
run_id
pipeline_name
task_name
timestamp
status
record counts
watermark
error details
```

Never log:

```text
Passwords
API keys
Tokens
Sensitive customer data
```

---

# 44. Security

Understand:

- Authentication
- Authorization
- Encryption
- Secrets management
- Least privilege
- Network security
- Data masking
- PII handling

Never hardcode credentials.

---

# 45. Configuration Management

Separate code from environment-specific configuration.

Example:

```text
Development
Testing
Production
```

Configuration may include:

```text
Source connection
Target connection
Batch size
Retry count
API endpoint
Schedule
Feature flags
```

---

# 46. Parameterization

Build reusable pipelines.

Example:

```text
pipeline.py --date 2026-09-27
```

or:

```text
start_date
end_date
environment
source
target
```

This is essential for backfills and reprocessing.

---

# 47. Performance Optimization

Learn:

- Batch processing
- Bulk loading
- Parallel processing
- Partitioning
- Predicate pushdown
- Column pruning
- Incremental processing
- Caching
- Compression
- Avoiding unnecessary data movement

Always ask:

> Where is the bottleneck?

Possible bottlenecks:

```text
Source DB
Network
CPU
Memory
Transformation
Target DB
```

---

# 48. Large Dataset Processing

Avoid:

```python
data = load_entire_dataset()
```

Prefer:

```text
Streaming
Chunking
Batching
Generators
Distributed processing
```

Learn:

- Pandas chunks
- PySpark
- SQL pushdown

---

# 49. Pushdown Processing

Understand:

```text
Bad:

Database
   ↓
Millions of rows
   ↓
Python
   ↓
Filter
```

versus:

```text
Database
   ↓
Filter in SQL
   ↓
Only required rows
   ↓
Python
```

Push computation closer to the data source when appropriate.

---

# 50. Parallelism

Understand:

- Task-level parallelism
- Data-level parallelism
- Threading
- Multiprocessing
- Distributed processing

Don't parallelize blindly.

Parallelism can overload source systems.

---

# 51. ETL Testing

## Unit Tests

Test:

```text
Transformation
Validation
Parsing
Business rules
```

## Integration Tests

Test:

```text
Database
API
Storage
Pipeline components
```

## End-to-End Tests

Test:

```text
Source
 ↓
Pipeline
 ↓
Target
```

---

# 52. Data Testing

Validate:

```text
Schema
Row counts
Null rates
Duplicates
Business rules
Referential integrity
Freshness
Distribution
```

Understand:

```text
Code testing
vs
Data testing
```

---

# 53. CI/CD for ETL

Learn:

```text
Git
 ↓
Pull Request
 ↓
Tests
 ↓
Lint
 ↓
Build
 ↓
Deploy
```

Understand:

- Environment promotion
- Automated testing
- Configuration management
- Rollback

---

# 54. Containerization

Understand Docker for ETL.

Learn:

- Dockerfile
- Dependencies
- Environment variables
- Volumes
- Networking

---

# 55. Data Pipeline Architecture

## Simple Batch Pipeline

```text
Source DB
   ↓
Python
   ↓
Transform
   ↓
Target DB
```

## File Pipeline

```text
Source
   ↓
CSV
   ↓
Object Storage
   ↓
ETL
   ↓
Warehouse
```

## Cloud Data Lake

```text
Sources
   ↓
S3 Raw
   ↓
Glue / Spark
   ↓
S3 Curated
   ↓
Athena / Redshift
```

---

# 56. ETL Design Principles

### Idempotency

Repeated execution should be safe.

### Observability

You should know what happened.

### Recoverability

Failures should be recoverable.

### Reproducibility

Historical results should be reproducible.

### Scalability

The pipeline should handle increasing data volume.

### Maintainability

The pipeline should be easy to change.

### Security

Sensitive data and credentials must be protected.

### Testability

Components should be independently testable.

---

# 57. ETL Anti-Patterns

Recognize bad designs:

- Full-load everything every day
- Hardcoded credentials
- No logging
- No retries
- Blind retries
- No data validation
- No idempotency
- No audit trail
- Loading entire datasets into memory
- No backfill strategy
- No schema evolution strategy
- One huge monolithic script
- Hardcoded dates
- No monitoring
- No source-target reconciliation
- Ignoring late-arriving data

---

# 58. Production Scenario Questions

Be able to design solutions for:

### Scenario 1

A pipeline processed 10 million records and failed after loading 8 million.

What happens when you restart it?

### Scenario 2

The same API response is received twice.

How do you prevent duplicates?

### Scenario 3

A source adds a new column.

How does your pipeline handle it?

### Scenario 4

A source changes a column from integer to string.

What should happen?

### Scenario 5

The pipeline succeeds but the target contains fewer records than the source.

How do you detect it?

### Scenario 6

A record from yesterday arrives today.

How do you process it?

### Scenario 7

An API returns HTTP 429.

What do you do?

### Scenario 8

A database connection fails halfway through the pipeline.

How do you recover?

### Scenario 9

A pipeline takes 4 hours today instead of 30 minutes.

How do you investigate?

### Scenario 10

A historical business rule changed.

How do you backfill 2 years of data safely?

---

# 59. Practical Projects

## Project 1 — Python ETL Pipeline

```text
CSV
 ↓
Python
 ↓
Validation
 ↓
Transformation
 ↓
PostgreSQL
```

Include:

- Logging
- Configuration
- Error handling
- Tests
- Audit table

---

## Project 2 — API to Database Pipeline

```text
REST API
   ↓
Python
   ↓
Pagination
   ↓
Validation
   ↓
Transformation
   ↓
PostgreSQL
```

Include:

- Retry
- Exponential backoff
- Rate-limit handling
- Incremental extraction
- Deduplication

---

## Project 3 — Incremental ETL

```text
Source
 ↓
Watermark
 ↓
Incremental extraction
 ↓
Transform
 ↓
Merge
 ↓
Target
```

Include:

- Initial full load
- Incremental loads
- Idempotency
- Audit table
- Failure recovery

---

## Project 4 — Data Quality Pipeline

```text
Raw
 ↓
Validation
 ├── Valid → Curated
 └── Invalid → Rejects
```

Implement:

- Null checks
- Duplicate checks
- Type checks
- Business rules
- Data freshness
- Source-target reconciliation

---

## Project 5 — Orchestrated ETL

```text
Extract
   ↓
Validate
   ↓
Transform
   ↓
Load
   ↓
Data Quality
```

Use:

```text
Airflow
```

Add:

- DAG dependencies
- Retries
- Alerts
- Backfills
- Parameters
- Logging

---

## Project 6 — Cloud Data Pipeline

Later, build:

```text
API / Database
      ↓
S3 Raw
      ↓
AWS Glue / PySpark
      ↓
S3 Curated
      ↓
Athena
      ↓
Redshift / BI
```

This becomes the bridge into AWS Data Engineering.

---

# 60. Recommended Learning Order

```text
1. ETL vs ELT
        ↓
2. Pipeline Fundamentals
        ↓
3. Sources + Extraction
        ↓
4. Full Loads
        ↓
5. Incremental Loads
        ↓
6. Watermarking
        ↓
7. Idempotency
        ↓
8. API Pipelines
        ↓
9. File Pipelines
        ↓
10. Staging / Bronze / Silver / Gold
        ↓
11. Transformations
        ↓
12. Loading Strategies
        ↓
13. Batch vs Streaming
        ↓
14. Data Quality
        ↓
15. Schema Evolution
        ↓
16. Duplicates + Late Data
        ↓
17. Backfills
        ↓
18. Failure Recovery
        ↓
19. Checkpointing
        ↓
20. Audit + Reconciliation
        ↓
21. Monitoring + Observability
        ↓
22. Security
        ↓
23. Performance
        ↓
24. Testing
        ↓
25. CI/CD
        ↓
26. Orchestration
        ↓
27. Production Architecture
        ↓
28. Cloud Data Pipeline
```

---

# 61. Progress Tracker

## Fundamentals

- [ ] ETL
- [ ] ELT
- [ ] Data pipeline
- [ ] Batch processing
- [ ] Micro-batching
- [ ] Streaming
- [ ] Sources
- [ ] Extraction
- [ ] Loading

## Incremental Processing

- [ ] Full load
- [ ] Incremental load
- [ ] Watermark
- [ ] High-water mark
- [ ] Idempotency
- [ ] Upsert
- [ ] MERGE
- [ ] CDC

## Reliability

- [ ] Retry
- [ ] Exponential backoff
- [ ] Error classification
- [ ] Checkpointing
- [ ] Dead-letter handling
- [ ] Failure recovery
- [ ] Exactly-once concepts
- [ ] At-least-once concepts

## Data Quality

- [ ] Schema validation
- [ ] Null checks
- [ ] Duplicate checks
- [ ] Referential integrity
- [ ] Source-target reconciliation
- [ ] Data freshness
- [ ] Data contracts
- [ ] Schema evolution

## Advanced

- [ ] Late-arriving data
- [ ] Backfills
- [ ] Partitioning
- [ ] Pushdown processing
- [ ] Parallelism
- [ ] Performance optimization
- [ ] Medallion architecture

## Operations

- [ ] Logging
- [ ] Metrics
- [ ] Monitoring
- [ ] Alerting
- [ ] Audit tables
- [ ] Pipeline metadata
- [ ] Observability

## Engineering

- [ ] Unit tests
- [ ] Integration tests
- [ ] End-to-end tests
- [ ] Git
- [ ] CI/CD
- [ ] Docker
- [ ] Configuration management
- [ ] Secrets management

## Orchestration

- [ ] DAG concepts
- [ ] Dependencies
- [ ] Scheduling
- [ ] Retries
- [ ] Backfills
- [ ] Airflow
- [ ] AWS Glue Workflows
- [ ] Step Functions
- [ ] MWAA
- [ ] EventBridge

## Projects

- [ ] Python ETL
- [ ] API → Database
- [ ] Incremental ETL
- [ ] Data Quality Pipeline
- [ ] Airflow ETL
- [ ] AWS Cloud Pipeline

---

# 62. Definition of Done

Before moving into deeper AWS Data Engineering topics, I should be able to:

- Explain ETL vs ELT clearly.
- Design a batch pipeline from source to target.
- Build a Python-based ETL pipeline.
- Extract data from APIs and databases.
- Handle pagination and API rate limits.
- Implement full and incremental loads.
- Implement watermarking.
- Design idempotent pipelines.
- Handle duplicate records.
- Handle late-arriving data.
- Design a backfill strategy.
- Implement retries and failure recovery.
- Separate valid and invalid records.
- Implement data quality checks.
- Perform source-target reconciliation.
- Track pipeline metadata and audit information.
- Monitor pipeline health and data freshness.
- Explain at-least-once and exactly-once concepts.
- Optimize data movement and transformations.
- Test ETL pipelines.
- Understand orchestration and DAGs.
- Design a production-style pipeline architecture.

---

# 63. Connection to the Next Topics

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
Kafka
   ↓
AWS S3
   ↓
AWS Glue
   ↓
Athena
   ↓
Redshift
   ↓
AWS Data Engineering Architecture
```

The key shift at this stage is:

> Stop thinking only about writing transformations. Start thinking about building **reliable data systems**.

A good Data Engineer is not someone who can only move data from A to B.

A good Data Engineer can answer:

```text
What happens if it fails?
What happens if it runs twice?
What happens if data arrives late?
What happens if the schema changes?
How do we know the data is correct?
How do we recover?
How do we backfill?
How do we scale?
How much does it cost?
```
