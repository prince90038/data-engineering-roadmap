# AWS Database Migration Service

## Learn

- Source endpoints
- Target endpoints
- Replication instances
- Full load
- CDC
- Tasks
- Schema conversion concepts
- Monitoring

## Core architecture

```text
OLTP DB
 ↓
AWS DMS
 ↓
S3 / Redshift / DB
```

## Data Engineering use

Focus on:

- CDC
- Incremental ingestion
- Initial full load
- Change capture
- Failure recovery

## Project

Build:

```text
PostgreSQL
 ↓
DMS
 ↓
S3
 ↓
Glue
 ↓
Redshift
```

## Interview

- Full load vs CDC
- DMS vs Glue
- CDC challenges
- Duplicate changes
- Delete handling
