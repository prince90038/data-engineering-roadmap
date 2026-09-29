# AWS Fundamentals

## 1. Learn

- AWS account and billing basics
- Regions
- Availability Zones
- Edge locations
- AWS global infrastructure
- Managed vs self-managed services
- Scalability
- Elasticity
- High availability
- Fault tolerance
- Shared responsibility model

## 2. CLI and SDK

Learn:

- AWS CLI
- Profiles
- Regions
- Credentials
- STS
- Boto3
- SDK clients vs resources

Practice:

```bash
aws sts get-caller-identity
aws s3 ls
```

Python:

```python
import boto3

s3 = boto3.client("s3")
```

## 3. Core concepts

Understand:

```text
Region
 ├── AZ-A
 ├── AZ-B
 └── AZ-C
```

Know why production systems avoid unnecessary single points of failure.

## 4. Hands-on

- Create a sandbox AWS account
- Configure CLI
- Configure Boto3
- Inspect IAM identity
- Create and delete test resources

## 5. Interview

- Region vs Availability Zone
- Scalability vs elasticity
- Managed vs self-managed
- Shared responsibility model
- Why deploy across multiple AZs?
