# Amazon Kinesis

## Learn

- Kinesis Data Streams
- Shards
- Partition keys
- Sequence numbers
- Consumers
- Retention
- Kinesis Data Firehose

## Architecture

```text
Applications
 ↓
Kinesis
 ↓
S3 / Redshift
```

## Compare

Understand:

```text
Kafka partition
≈
Kinesis shard
```

but know they are not identical.

## Project

Build a producer that sends events to Kinesis and delivers them to S3.

## Interview

- Kinesis vs Kafka
- Shards
- Partition key
- Ordering
- Scaling
- Firehose vs Data Streams
