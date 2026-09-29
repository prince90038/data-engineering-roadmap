# AWS IAM

## 1. Learn

- Users
- Groups
- Roles
- Policies
- Trust policies
- Identity-based policies
- Resource-based policies
- AssumeRole
- Temporary credentials
- MFA
- Least privilege

## 2. Policy structure

```json
{
  "Effect": "Allow",
  "Action": "s3:GetObject",
  "Resource": "arn:aws:s3:::bucket/path/*"
}
```

Learn:

- Effect
- Action
- Resource
- Condition
- Principal

## 3. Data Engineering use

Understand roles for:

```text
Airflow → S3
Glue → S3
Lambda → S3
EC2/EMR → S3
Redshift → S3
```

## 4. Security rules

- Never commit access keys
- Prefer IAM roles
- Apply least privilege
- Separate dev/test/prod access
- Restrict destructive permissions

## 5. Troubleshooting

Practice diagnosing:

```text
AccessDenied
InvalidClientTokenId
Not authorized to perform action
```

## 6. Interview

- IAM user vs role
- Role assumption
- Trust policy vs permission policy
- Identity policy vs resource policy
- Least privilege
