# Apache Airflow for Data Engineering

## Objective

Learn Airflow as the orchestration layer for production Data Engineering pipelines.

The goal is to understand how to:

- Schedule pipelines
- Define task dependencies
- Build DAGs
- Handle retries and failures
- Pass metadata between tasks
- Backfill historical runs
- Monitor pipelines
- Manage connections and secrets
- Test DAGs
- Deploy Airflow
- Integrate Airflow with AWS, databases, Spark, Kafka, and APIs

---

# 1. What is Airflow?

Understand that Airflow is primarily an **orchestration platform**, not a data-processing engine.

Airflow should coordinate:

```text
Extract
   ↓
Transform
   ↓
Validate
   ↓
Load
```

It should generally not be used to process millions of records itself.

Instead:

```text
Airflow
   ↓
Triggers
   ↓
Python / SQL / Spark / AWS Glue / dbt / APIs
```

---

# 2. Core Airflow Concepts

Learn:

- DAG
- DAG Run
- Task
- Operator
- Task Instance
- Scheduler
- Executor
- Worker
- Metadata Database
- Webserver
- XCom
- Connection
- Variable
- Pool

Understand how these components interact.

---

# 3. DAG

DAG = Directed Acyclic Graph.

Example:

```text
extract
   ↓
validate
   ↓
transform
   ↓
load
   ↓
quality_check
```

Learn:

- DAG definition
- DAG ID
- Schedule
- Start date
- Tags
- Default arguments
- Catchup
- Max active runs

---

# 4. Tasks

Understand a task as a unit of work.

Examples:

```text
Extract data
Run SQL
Run Spark job
Call API
Validate data
Send notification
```

Learn task:

- State
- Retry configuration
- Timeout
- Dependencies
- Trigger rules

---

# 5. Operators

Know common operators:

- PythonOperator
- BashOperator
- SQL operators
- BranchPythonOperator
- ShortCircuitOperator
- EmptyOperator
- Sensor operators
- TaskFlow API
- AWS operators

Do not try to memorize every provider operator.

Understand the pattern.

---

# 6. TaskFlow API

Learn the modern style:

```python
from airflow.decorators import dag, task
```

Understand:

- `@dag`
- `@task`
- Task dependencies
- Task return values
- Dynamic task mapping

Prefer TaskFlow API for many Python-based workflows.

---

# 7. Dependencies

Learn:

```python
task_a >> task_b >> task_c
```

and:

```python
task_a >> [task_b, task_c] >> task_d
```

Understand:

```text
Sequential
Parallel
Fan-out
Fan-in
```

---

# 8. Scheduling

Learn:

- Cron expressions
- Presets
- Timetables
- Manual runs
- Event-driven triggering concepts

Examples:

```text
Every hour
Every day at 2 AM
Every Monday
Every 15 minutes
```

Understand that the schedule determines logical data intervals, not simply "when the code runs."

---

# 9. Data Intervals

Critical Airflow concept.

Understand:

```text
Logical Date
Data Interval
Run Time
```

Example:

```text
Daily DAG
 ↓
Data interval: Jan 1
 ↓
Process Jan 1 data
```

Do not blindly use the current system timestamp inside pipelines.

---

# 10. Catchup

Understand:

```python
catchup=False
```

versus catchup enabled.

Know what happens when a DAG is created with an old start date.

---

# 11. Backfill

Learn how Airflow can rerun historical periods.

Example:

```text
2026-09-01
2026-09-02
...
2026-09-20
```

Use cases:

- Historical corrections
- Failed periods
- Business-rule changes
- Reprocessing

Understand the difference between:

```text
Backfill
Rerun
Retry
```

---

# 12. Retries

Learn:

- Retry count
- Retry delay
- Exponential backoff
- Retryable errors
- Non-retryable errors

Example:

```text
Task
 ↓
Failure
 ↓
Wait
 ↓
Retry
 ↓
Retry
 ↓
Failed
```

Do not retry permanent data-quality errors blindly.

---

# 13. Timeouts

Learn:

- Execution timeout
- Sensor timeout
- DAG/task-level timeout concepts

Use timeouts to prevent jobs from hanging indefinitely.

---

# 14. Trigger Rules

Understand:

```text
all_success
all_failed
all_done
one_success
one_failed
none_failed
```

Important for failure branches and cleanup tasks.

Example:

```text
Main task
   ↓
Cleanup
```

Cleanup may need:

```text
all_done
```

---

# 15. Sensors

Sensors wait for conditions.

Examples:

```text
File arrives
API becomes available
Another DAG completes
S3 object exists
Database condition is true
```

Learn:

- Poke mode
- Reschedule mode
- Deferrable sensors

Avoid tying up workers while waiting unnecessarily.

---

# 16. XCom

XCom = cross-communication between tasks.

Use XCom for:

```text
Small metadata
IDs
File paths
Status information
```

Do NOT use XCom for:

```text
Large datasets
DataFrames
Millions of records
```

Instead:

```text
Task A
 ↓
S3 / DB / Warehouse
 ↓
Task B
```

Pass a reference through XCom.

---

# 17. Variables

Understand Airflow Variables.

Useful for:

```text
Configuration
Feature flags
Environment-specific values
```

Do not store secrets in Variables unless the platform's secret handling is explicitly appropriate.

---

# 18. Connections

Learn Airflow Connections.

Used for:

```text
Database
AWS
HTTP
Kafka
Cloud services
```

Understand:

- Connection ID
- Connection type
- Credentials
- Extra configuration

---

# 19. Secrets Management

Learn how Airflow integrates with:

- AWS Secrets Manager
- HashiCorp Vault
- Environment variables
- Secret backends

Never hardcode:

```text
Passwords
API keys
AWS access keys
Tokens
```

---

# 20. Pools

Pools control concurrency against limited resources.

Example:

```text
Source DB
Maximum 5 concurrent queries
```

Create:

```text
database_pool = 5
```

Tasks use pool slots.

This prevents Airflow from overwhelming external systems.

---

# 21. Concurrency

Understand:

- DAG concurrency
- Task concurrency
- Worker concurrency
- Pool limits
- Parallelism
- Max active DAG runs

Learn how these controls interact.

---

# 22. Dynamic Task Mapping

Learn how to dynamically create tasks based on runtime input.

Example:

```text
Files:
A.csv
B.csv
C.csv
D.csv

       ↓

Task A
Task B
Task C
Task D
```

Useful when the number of inputs changes dynamically.

---

# 23. Branching

Learn conditional workflows.

Example:

```text
Check data
   ↓
 ┌───────┐
 ↓       ↓
Valid   Invalid
 ↓       ↓
Load    Reject
```

Use:

- BranchPythonOperator
- TaskFlow branching

Understand how skipped tasks affect downstream dependencies.

---

# 24. DAG Design

Good DAGs should be:

- Small
- Modular
- Observable
- Idempotent
- Testable
- Reusable

Avoid:

```text
One giant Python script
```

Prefer:

```text
DAG
 ├── extract
 ├── validate
 ├── transform
 ├── load
 └── quality
```

---

# 25. Idempotency

Critical production topic.

If a DAG runs twice:

```text
Run 1 → successful
Run 2 → same interval
```

the second run should not corrupt the target.

Use:

- MERGE
- Upsert
- Partition overwrite
- Unique keys
- Run IDs
- Data interval

---

# 26. Atomic Pipeline Design

Understand:

```text
Extract
   ↓
Stage
   ↓
Validate
   ↓
Publish
```

Avoid publishing partially processed data.

Use staging and atomic/controlled publishing where appropriate.

---

# 27. Task Communication

Prefer:

```text
S3
Database
Warehouse
Object storage
```

for actual data.

Use XCom for:

```text
Metadata
References
Small values
```

---

# 28. ExternalTaskSensor / DAG Dependencies

Learn how one workflow can depend on another.

Example:

```text
Source DAG
    ↓
Completion
    ↓
Warehouse DAG
```

Understand alternatives such as dataset/event-driven scheduling where applicable.

---

# 29. Datasets / Data-Aware Scheduling

Learn the concept:

```text
Producer DAG
     ↓
Dataset updated
     ↓
Consumer DAG
```

Useful when workflows are driven by data availability rather than fixed time schedules.

---

# 30. Callbacks and Alerts

Learn:

- Success callbacks
- Failure callbacks
- SLA/deadline concepts
- Email/Slack/PagerDuty integrations

Alert on actionable failures.

Avoid noisy alerts.

---

# 31. Logging

Every production DAG should provide enough information to answer:

```text
What ran?
When?
For which interval?
How many records?
Which source?
Which target?
Why did it fail?
```

Include:

- DAG ID
- Task ID
- Run ID
- Data interval
- Source/target
- Record counts
- Error information

---

# 32. Monitoring

Monitor:

- DAG failures
- Task failures
- Duration
- Queue time
- Retry count
- Data freshness
- Scheduler health
- Worker health
- Resource utilization

---

# 33. Airflow Metadata Database

Understand that Airflow stores orchestration metadata in a database.

Examples:

```text
DAG runs
Task instances
Connections
Variables
XCom
Schedules
```

Do not treat this metadata database as your application's data warehouse.

---

# 34. Executors

Understand the main execution models:

- SequentialExecutor
- LocalExecutor
- CeleryExecutor
- KubernetesExecutor

Know the conceptual difference:

```text
Sequential
    ↓
Local
    ↓
Distributed
```

Focus on architecture rather than memorizing configuration.

---

# 35. Scheduler

Understand the Scheduler's responsibility:

```text
DAG definitions
      ↓
Scheduling decisions
      ↓
Task instances
      ↓
Executor
```

Learn:

- Scheduling loop
- Queued tasks
- Task states
- DAG parsing

---

# 36. Workers

Workers execute tasks.

Understand:

```text
Scheduler
   ↓
Executor
   ↓
Worker
   ↓
Task
```

Learn why worker capacity affects pipeline throughput.

---

# 37. Webserver / UI

Use the UI to inspect:

- DAG status
- Task status
- Logs
- Graph
- Grid
- Gantt
- Task duration
- Retries
- XCom
- Task dependencies

---

# 38. DAG Serialization / Deployment Concepts

Understand that production Airflow deployments separate:

```text
DAG code
Configuration
Metadata
Workers
Scheduler
```

Know the basic deployment implications.

---

# 39. Testing DAGs

Learn:

- DAG import tests
- Unit tests
- Task-level tests
- Integration tests
- Data quality tests

Use:

```text
pytest
```

Validate:

```text
DAG loads
No circular dependencies
Expected tasks exist
Expected dependencies exist
```

---

# 40. CI/CD for Airflow

Typical flow:

```text
Git
 ↓
Pull Request
 ↓
Lint
 ↓
Unit Tests
 ↓
DAG Validation
 ↓
Deploy
 ↓
Production
```

Learn:

- Git branching
- Automated tests
- Environment promotion
- Versioning
- Rollback

---

# 41. Docker

Learn Airflow with Docker for local development.

Understand:

- Docker Compose
- Scheduler
- Webserver
- Metadata DB
- Workers
- Volumes
- Environment variables

Do not assume a local Docker setup is equivalent to production.

---

# 42. Managed Airflow

For AWS, learn:

```text
Amazon MWAA
```

Understand:

- DAG deployment
- Plugins
- Requirements
- Connections
- IAM
- CloudWatch integration
- S3 integration

---

# 43. AWS Integration

Learn how Airflow orchestrates:

```text
S3
Glue
EMR
Redshift
Athena
Lambda
Step Functions
ECS
```

Example:

```text
S3 file arrival
      ↓
Airflow
      ↓
Glue Job
      ↓
S3 Curated
      ↓
Athena validation
      ↓
Redshift load
```

---

# 44. Airflow + Spark

Airflow should orchestrate Spark rather than perform large Spark processing itself.

Architecture:

```text
Airflow
   ↓
Submit Spark Job
   ↓
Spark Cluster / Glue / EMR
   ↓
Process Data
   ↓
Return Status
```

---

# 45. Airflow + SQL

Learn:

```text
Run SQL
 ↓
Validate result
 ↓
Next task
```

Use SQL operators/hooks appropriately.

---

# 46. Airflow + APIs

Build:

```text
API
 ↓
Extract
 ↓
S3
 ↓
Transform
 ↓
Warehouse
```

Handle:

- Pagination
- Retry
- Rate limits
- Authentication
- Incremental extraction

---

# 47. Production Best Practices

Do:

- Keep DAGs modular
- Make tasks idempotent
- Keep tasks reasonably small
- Use retries carefully
- Use pools
- Use proper secrets management
- Monitor data freshness
- Test DAGs
- Version control DAG code
- Parameterize workflows

Avoid:

- Huge XCom payloads
- Hardcoded credentials
- Heavy processing inside scheduler
- Dynamic DAG generation without care
- Blind retries
- Overly complex DAG dependencies
- Using Airflow as a data-processing engine

---

# 48. Common Interview Questions

Be able to explain:

- What is Airflow?
- What is a DAG?
- DAG vs task
- Operator vs sensor
- Scheduler vs worker
- Executor types
- XCom
- Variables vs Connections
- Airflow Pools
- Catchup
- Backfill
- Retry
- Trigger rules
- Sensors
- TaskFlow API
- Dynamic task mapping
- Idempotency
- DAG dependencies
- Dataset scheduling
- Airflow metadata DB
- Airflow vs cron
- Airflow vs AWS Step Functions

---

# 49. Production Scenario Questions

### Scenario 1

A task fails after inserting half the records. It retries. How do you prevent duplicates?

### Scenario 2

A database can handle only 5 concurrent queries. How do you enforce this?

### Scenario 3

A downstream DAG should run only after upstream data is successfully produced. How would you design it?

### Scenario 4

A task takes 6 hours instead of 20 minutes. How do you investigate?

### Scenario 5

An API returns HTTP 429. Should Airflow retry it?

### Scenario 6

A DAG needs to process 500 files independently. How would you design the workflow?

### Scenario 7

You need to rerun one failed date without rerunning the entire DAG. How?

### Scenario 8

A DAG has 1000 tasks and overwhelms the database. How would you control concurrency?

---

# 50. Practical Projects

## Project 1 — Basic ETL DAG

```text
Extract
 ↓
Validate
 ↓
Transform
 ↓
Load
```

Use:

```text
Python
PostgreSQL
Airflow
```

Add:

- Retry
- Logging
- Data quality

---

## Project 2 — API Pipeline

```text
REST API
 ↓
Airflow
 ↓
Python extraction
 ↓
S3
 ↓
PySpark
 ↓
Warehouse
```

Add:

- Pagination
- Rate-limit handling
- Incremental loads

---

## Project 3 — Incremental Pipeline

```text
Airflow
 ↓
Read watermark
 ↓
Extract changes
 ↓
Transform
 ↓
Load
 ↓
Update watermark
```

Add:

- Idempotency
- Audit table
- Backfill

---

## Project 4 — AWS Data Pipeline

```text
S3
 ↓
Airflow
 ↓
Glue / PySpark
 ↓
S3 Curated
 ↓
Athena
 ↓
Redshift
```

This is a strong project for AWS Data Engineering interviews.

---

# 51. Recommended Learning Order

```text
1. What is Airflow?
        ↓
2. DAG
        ↓
3. Tasks
        ↓
4. Operators
        ↓
5. Dependencies
        ↓
6. TaskFlow API
        ↓
7. Scheduling
        ↓
8. Data Intervals
        ↓
9. Catchup
        ↓
10. Backfill
        ↓
11. Retry
        ↓
12. Sensors
        ↓
13. XCom
        ↓
14. Variables / Connections
        ↓
15. Secrets
        ↓
16. Pools / Concurrency
        ↓
17. Branching
        ↓
18. Dynamic Task Mapping
        ↓
19. Monitoring
        ↓
20. Testing
        ↓
21. CI/CD
        ↓
22. Executors
        ↓
23. Docker
        ↓
24. AWS MWAA
        ↓
25. AWS Integration
        ↓
26. Production Architecture
```

---

# 52. Progress Tracker

## Fundamentals

- [ ] Airflow architecture
- [ ] DAG
- [ ] Task
- [ ] Operator
- [ ] Task instance
- [ ] Scheduler
- [ ] Worker
- [ ] Executor
- [ ] Metadata database

## Workflow

- [ ] Dependencies
- [ ] Scheduling
- [ ] Data intervals
- [ ] Catchup
- [ ] Backfill
- [ ] Retry
- [ ] Trigger rules
- [ ] Sensors
- [ ] Branching
- [ ] Dynamic task mapping
- [ ] Dataset scheduling

## Communication / Configuration

- [ ] XCom
- [ ] Variables
- [ ] Connections
- [ ] Secrets
- [ ] Pools
- [ ] Concurrency

## Operations

- [ ] Logging
- [ ] Monitoring
- [ ] Alerts
- [ ] Callbacks
- [ ] DAG UI
- [ ] Task debugging

## Engineering

- [ ] DAG testing
- [ ] pytest
- [ ] CI/CD
- [ ] Docker
- [ ] Git
- [ ] Environment management

## AWS

- [ ] S3 integration
- [ ] Glue integration
- [ ] EMR integration
- [ ] Redshift integration
- [ ] Athena integration
- [ ] Lambda integration
- [ ] MWAA

## Projects

- [ ] Basic ETL DAG
- [ ] API pipeline
- [ ] Incremental pipeline
- [ ] AWS data pipeline

---

# 53. Definition of Done

I should be able to:

- Build Airflow DAGs from scratch.
- Define task dependencies.
- Schedule pipelines correctly.
- Understand logical dates and data intervals.
- Configure retries and timeouts.
- Use sensors appropriately.
- Use XCom correctly.
- Manage connections and secrets.
- Control concurrency using pools.
- Implement branching.
- Use dynamic task mapping.
- Design idempotent DAGs.
- Perform backfills.
- Debug failed tasks.
- Monitor DAGs.
- Test DAG definitions.
- Deploy DAGs using CI/CD.
- Explain Airflow executors.
- Integrate Airflow with Spark.
- Integrate Airflow with AWS services.
- Design a production-style orchestration architecture.

---

# 54. Connection to the Data Engineering Stack

```text
Python
   ↓
SQL
   ↓
ETL / ELT
   ↓
PySpark
   ↓
Data Warehouse
   ↓
Airflow
   ↓
AWS
```

Airflow is the **orchestrator** connecting the other components.

The key mindset:

> Airflow decides **what runs, when it runs, in what order, and what happens when it fails**.
