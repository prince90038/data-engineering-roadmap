# AWS Step Functions

## Learn

- State machines
- Task
- Choice
- Parallel
- Wait
- Retry
- Catch
- Map

## Architecture

```text
Step Functions
 ├── Lambda
 ├── Glue
 ├── EMR
 └── ECS
```

## Compare

Understand:

```text
Airflow
vs
Step Functions
```

Airflow is stronger for broad data orchestration; Step Functions is strong for AWS-native workflows.

## Project

Build:

```text
Start
 ↓
Validate
 ↓
Glue
 ↓
Choice
 ├── Success → Notify
 └── Failure → Retry / DLQ
```
