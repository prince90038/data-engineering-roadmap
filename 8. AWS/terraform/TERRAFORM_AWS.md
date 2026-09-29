# Terraform for AWS Data Engineering

## Learn

- Providers
- Resources
- Variables
- Outputs
- Data sources
- Modules
- State
- Plan
- Apply
- Destroy
- Remote state
- State locking concepts

## AWS resources to provision

Start with:

- S3
- IAM role
- Glue Catalog
- Glue job
- Lambda
- CloudWatch
- VPC

## Workflow

```text
Code
 ↓
terraform plan
 ↓
Review
 ↓
terraform apply
 ↓
AWS
```

## Project

Provision a small S3 + IAM + Glue environment entirely using Terraform.

## Interview

- Terraform vs CloudFormation
- State file
- Modules
- Plan vs apply
- Drift
