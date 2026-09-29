# Amazon Redshift

## 1. Learn

- Data warehouse concepts
- Redshift provisioned
- Redshift Serverless
- Schemas
- Tables
- COPY
- UNLOAD
- Distribution
- Sort keys
- Compression
- Workload management
- Automatic table optimization

## 2. Architecture

```text
S3
 ↓
COPY
 ↓
Redshift
 ↓
BI
```

## 3. Distribution

Learn:

- DISTSTYLE AUTO
- EVEN
- KEY
- ALL
- DISTKEY concepts

Goal:

```text
Minimize data movement
```

## 4. Sort keys

Learn:

- Compound
- Interleaved concepts
- Automatic optimization
- Range filtering

## 5. Loading

Practice:

```sql
COPY sales
FROM 's3://bucket/curated/sales/'
IAM_ROLE '...'
FORMAT AS PARQUET;
```

Also learn UNLOAD.

## 6. Performance

Learn:

- Query plans
- Joins
- Distribution skew
- Sort order
- Compression
- Table design
- Workload management

## 7. Project

Build:

```text
S3 Curated
 ↓
Redshift
 ↓
Fact / Dimension tables
 ↓
Analytical SQL
```

## 8. Interview

- Redshift vs Athena
- DISTKEY
- Sort key
- Distribution skew
- COPY
- UNLOAD
- Redshift Serverless
