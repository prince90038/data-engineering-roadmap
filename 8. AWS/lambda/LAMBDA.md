# AWS Lambda

## 1. Learn

- Function
- Handler
- Runtime
- Event
- Context
- Memory
- Timeout
- Layers
- Environment variables
- IAM execution role
- Concurrency
- Cold starts

## 2. Data Engineering use cases

Good use cases:

- S3 event processing
- Lightweight transformations
- Triggering workflows
- Validation
- API ingestion
- Notifications

Avoid using Lambda for large Spark-style ETL.

## 3. Architecture

```text
S3 upload
   ↓
Lambda
   ↓
Glue / Airflow / Step Functions
```

## 4. Python

Practice:

```python
def lambda_handler(event, context):
    return {
        "statusCode": 200,
        "body": "OK"
    }
```

Learn Boto3 integration.

## 5. Reliability

Understand:

- Retry behavior
- Duplicate events
- Idempotency
- DLQ
- Destinations
- Timeouts

## 6. Security

- Execution roles
- Environment secrets
- Secrets Manager
- VPC
- Least privilege

## 7. Project

Build:

```text
S3 upload
 ↓
Lambda
 ↓
Validate metadata
 ↓
Start Glue job
```

## 8. Interview

- Lambda limitations
- Cold start
- Timeout
- Concurrency
- Lambda vs Glue
- Lambda vs ECS
- Handling duplicate events
