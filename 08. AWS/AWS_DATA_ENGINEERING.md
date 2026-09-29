# AWS Data Engineering

Service-by-service roadmap for an AWS Data Engineer job switch.

## Recommended order

1. fundamentals
2. iam
3. s3
4. glue
5. athena
6. redshift
7. lambda
8. emr
9. dms
10. kinesis
11. msk
12. sqs
13. step-functions
14. vpc
15. cloudwatch
16. kms
17. secrets-manager
18. lake-formation
19. terraform

## Core architecture

```text
Sources
  ↓
S3 / DMS / Kafka / Kinesis
  ↓
Glue / EMR / PySpark
  ↓
S3 Curated
  ↓
Athena / Redshift
  ↓
BI / Applications

Airflow orchestrates the workflow.
IAM/KMS/Secrets Manager secure it.
CloudWatch monitors it.
Terraform provisions it.
```

The objective is to understand architecture decisions, not memorize AWS services.
