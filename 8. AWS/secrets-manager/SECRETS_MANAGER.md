# AWS Secrets Manager

## Learn

- Secret storage
- Retrieval
- Rotation concepts
- IAM access
- Boto3 integration

## Architecture

```text
Application
 ↓
Secrets Manager
 ↓
Database credentials
```

Never store credentials in:

- Git
- Source code
- Plain config files

## Project

Store a database credential in Secrets Manager and retrieve it from Python.
