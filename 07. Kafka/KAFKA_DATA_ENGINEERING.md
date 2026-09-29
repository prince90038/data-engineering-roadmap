# Apache Kafka for Data Engineering

## Objective

Learn Kafka as the event-streaming and messaging layer in modern Data Engineering systems.

The goal is to understand:

- Event-driven architecture
- Producers
- Consumers
- Topics
- Partitions
- Brokers
- Consumer groups
- Offsets
- Replication
- Delivery semantics
- Ordering
- Retention
- Schema management
- Kafka Streams concepts
- Python integration
- Spark integration
- AWS streaming equivalents

---

# 1. What is Kafka?

Kafka is a distributed event streaming platform.

Basic architecture:

```text
Producer
   ↓
Kafka Topic
   ↓
Consumer
```

Kafka is useful for:

- Event streaming
- Data pipelines
- Log/event collection
- Real-time analytics
- Service integration
- CDC pipelines

---

# 2. Kafka vs Traditional Queue

Understand the difference.

Traditional queue:

```text
Producer → Queue → Consumer
```

Kafka:

```text
Producer
   ↓
Topic
 ┌───┬───┬───┐
 P0  P1  P2
 └───┴───┴───┘
   ↓
Consumer Groups
```

Kafka stores events for a configured retention period rather than simply deleting them immediately after consumption.

---

# 3. Core Kafka Components

Learn:

- Broker
- Cluster
- Topic
- Partition
- Producer
- Consumer
- Consumer Group
- Offset
- Replication
- Controller / metadata management concepts

---

# 4. Topic

A topic represents a logical stream of events.

Examples:

```text
orders
payments
customer-events
transactions
```

Understand:

- Topic creation
- Partitions
- Replication factor
- Retention
- Configuration

---

# 5. Partitions

Critical Kafka concept.

Example:

```text
orders
 ├── Partition 0
 ├── Partition 1
 └── Partition 2
```

Partitions provide:

- Parallelism
- Scalability
- Ordering within a partition

Important:

> Kafka does not guarantee global ordering across all partitions.

---

# 6. Partition Key

Understand:

```text
event
  ↓
key
  ↓
partition
```

Example:

```text
customer_id = 123
```

All events for the same key can be routed to the same partition.

This helps preserve per-key ordering.

---

# 7. Ordering

Understand:

```text
Partition 0:
Event 1
Event 2
Event 3
```

Ordering is guaranteed within a partition.

Not necessarily:

```text
Partition 0 + Partition 1 + Partition 2
```

for the whole topic.

---

# 8. Producer

Producer sends events to Kafka.

Learn:

```text
Producer
   ↓
Topic
   ↓
Partition
```

Producer concepts:

- Serialization
- Keys
- Batching
- Compression
- Acknowledgments
- Retries
- Idempotent producer

---

# 9. Producer Acknowledgments

Understand:

```text
acks=0
acks=1
acks=all
```

Conceptually:

### acks=0

Producer does not wait for broker acknowledgment.

### acks=1

Leader acknowledges.

### acks=all

Required replicas acknowledge according to configuration.

Understand the reliability vs latency trade-off.

---

# 10. Producer Batching

Kafka producers can batch records before sending them.

Benefits:

- Higher throughput
- Lower network overhead

Understand:

- Batch size
- Linger time
- Compression

---

# 11. Producer Compression

Learn:

```text
gzip
snappy
lz4
zstd
```

Understand how compression affects:

- Network traffic
- CPU
- Storage

---

# 12. Consumer

Consumer reads events.

Basic flow:

```text
Kafka
  ↓
Consumer
  ↓
Process
```

Learn:

- Polling
- Deserialization
- Processing
- Commit offsets
- Error handling

---

# 13. Consumer Groups

Critical concept.

Example:

```text
Topic
 ├── P0
 ├── P1
 └── P2

Consumer Group A
 ├── C1
 ├── C2
 └── C3
```

A partition is assigned to only one consumer within the same consumer group at a time.

This provides parallel processing.

---

# 14. Consumer Group Scaling

Understand:

```text
3 partitions
3 consumers
```

can process in parallel.

But:

```text
3 partitions
6 consumers
```

means some consumers will be idle.

Important rule:

> Maximum active consumers in a consumer group are bounded by the number of partitions.

---

# 15. Consumer Offset

Offset represents the consumer's position in a partition.

Example:

```text
Partition 0

Offset
0
1
2
3
4
5 ← consumer position
```

Learn:

- Current offset
- Committed offset
- Offset reset
- Earliest
- Latest

---

# 16. Offset Commit

Understand:

```text
Read event
   ↓
Process event
   ↓
Commit offset
```

The timing matters.

Bad pattern:

```text
Commit
 ↓
Process
 ↓
Crash
```

The event may be skipped.

---

# 17. At-Most-Once

Concept:

```text
Commit first
   ↓
Process
```

Possible outcome:

```text
Event lost
```

Trade-off:

```text
No duplicates
but
possible data loss
```

---

# 18. At-Least-Once

Common approach:

```text
Process
   ↓
Commit
```

If the application crashes after processing but before committing:

```text
Event
   ↓
Processed
   ↓
Crash
   ↓
Reprocessed
```

Possible duplicate processing.

Therefore consumers should often be designed to be idempotent.

---

# 19. Exactly-Once Concepts

Understand that exactly-once is not simply a configuration switch for every end-to-end system.

Learn concepts:

- Idempotency
- Transactions
- Idempotent producer
- Kafka transactions
- Offset + output coordination
- Exactly-once processing semantics

Always clarify the scope of the guarantee.

---

# 20. Broker

A Kafka broker stores and serves partitions.

Example:

```text
Kafka Cluster

Broker 1
Broker 2
Broker 3
```

Learn:

- Broker
- Partition leader
- Replica
- Cluster

---

# 21. Replication

Example:

```text
Partition 0

Leader → Broker 1
Replica → Broker 2
Replica → Broker 3
```

Replication improves fault tolerance.

Learn:

- Replication factor
- Leader
- Followers
- In-sync replicas (ISR)

---

# 22. Leader and Followers

For each partition:

```text
Leader
  ↓
Handles writes / reads depending on configuration
  ↓
Followers replicate
```

Understand leader election conceptually.

---

# 23. ISR

ISR = In-Sync Replicas.

Understand why Kafka tracks replicas that are sufficiently caught up.

Learn concepts:

- ISR
- Replication lag
- Under-replicated partitions

---

# 24. Retention

Kafka stores events according to retention configuration.

Learn:

- Time-based retention
- Size-based retention
- Log cleanup
- Segment files

Important:

> Kafka retention is independent of whether a consumer has read the event.

---

# 25. Log Compaction

Understand:

```text
Key → Latest value
```

Compaction keeps the latest record for a key over time.

Use cases:

- Current state
- CDC topics
- Reference data

Know the difference:

```text
Retention
vs
Compaction
```

---

# 26. Serialization

Kafka transfers bytes.

Learn:

- String
- JSON
- Avro
- Protobuf
- Schema Registry concepts

Understand serialization and deserialization.

---

# 27. Schema Registry

Learn why schema management matters.

Example:

```text
Producer
   ↓
Schema
   ↓
Kafka
   ↓
Consumer
```

Understand:

- Schema version
- Compatibility
- Backward compatibility
- Forward compatibility
- Full compatibility

---

# 28. Schema Evolution

Handle:

```text
Add field
Remove field
Change field
Rename field
```

Understand why consumers can break when schemas change.

---

# 29. Dead Letter Topics

Bad events should not necessarily block the entire consumer.

Architecture:

```text
Kafka Topic
    ↓
Consumer
    ↓
Validation
 ┌───────┴────────┐
 ↓                ↓
Valid            Invalid
 ↓                ↓
Process        DLQ Topic
```

Store:

- Original event
- Error reason
- Timestamp
- Source
- Processing metadata

---

# 30. Consumer Error Handling

Learn:

- Retry
- Backoff
- Dead-letter topic
- Poison message
- Manual replay

Avoid endlessly retrying a permanently invalid event.

---

# 31. Reprocessing

One major Kafka advantage:

```text
Historical events
       ↓
Reset consumer offset
       ↓
Replay
       ↓
Reprocess
```

Useful for:

- Bug fixes
- New consumers
- Data correction
- Backfills

---

# 32. Consumer Lag

Consumer lag measures how far behind a consumer is.

Conceptually:

```text
Latest Kafka offset
        -
Consumer committed offset
        =
Lag
```

High lag means consumers are falling behind.

Monitor:

- Current offset
- End offset
- Lag
- Processing throughput

---

# 33. Throughput

Understand:

```text
Messages/sec
MB/sec
Records/sec
```

Factors:

- Partition count
- Producer batching
- Compression
- Consumer processing speed
- Network
- Disk
- Broker capacity

---

# 34. Partition Count Design

More partitions provide:

- More parallelism
- More consumer scalability

But too many partitions can increase:

- Metadata overhead
- Resource usage
- Operational complexity

Do not choose partition count arbitrarily.

---

# 35. Hot Partitions

Problem:

```text
Partition 0 → 90% traffic
Partition 1 → 5%
Partition 2 → 5%
```

Causes:

- Bad partition key
- Highly skewed keys

Solutions:

- Better key
- Composite key
- Salting where appropriate

---

# 36. Kafka Connect

Learn Kafka Connect conceptually.

Architecture:

```text
Source System
    ↓
Kafka Connect
    ↓
Kafka
    ↓
Kafka Connect
    ↓
Target System
```

Use cases:

- Database CDC
- S3
- Elasticsearch
- JDBC
- Cloud services

Understand:

- Source connector
- Sink connector
- Worker
- Connector
- Task

---

# 37. Kafka Connect vs Custom Python

Understand when to use:

### Kafka Connect

For standard source/sink integrations.

### Python

For:

- Complex business logic
- Custom APIs
- Specialized transformations

Avoid writing custom code for something Kafka Connect already handles well.

---

# 38. Kafka + CDC

Important Data Engineering use case.

Architecture:

```text
Database
   ↓
CDC Tool
   ↓
Kafka
   ↓
Consumers
   ↓
Data Lake / Warehouse
```

Example tools/concepts:

```text
Debezium
Kafka Connect
```

Understand:

- INSERT
- UPDATE
- DELETE
- Before/after state
- Log position

---

# 39. Kafka + Spark

Understand:

```text
Kafka
  ↓
Spark Structured Streaming
  ↓
Transform
  ↓
S3 / Warehouse
```

Learn:

- Kafka source
- Kafka sink
- Checkpointing
- Watermarking
- Consumer offsets

---

# 40. Kafka + Python

Learn at least one Python client.

Common option:

```text
confluent-kafka
```

Understand:

- Producer
- Consumer
- Serialization
- Consumer group
- Offset commit
- Error handling

---

# 41. Producer Example Architecture

```text
Python Application
       ↓
Create Event
       ↓
Serialize
       ↓
Kafka Producer
       ↓
Topic
       ↓
Partition
```

---

# 42. Consumer Example Architecture

```text
Kafka Topic
     ↓
Consumer Group
     ↓
Python Consumer
     ↓
Deserialize
     ↓
Validate
     ↓
Process
     ↓
Commit
```

---

# 43. Event Design

A good event usually contains:

```json
{
  "event_id": "...",
  "event_type": "...",
  "event_time": "...",
  "producer": "...",
  "version": "...",
  "data": {}
}
```

Understand:

- Event ID
- Event type
- Event time
- Schema version
- Payload

---

# 44. Event Time vs Processing Time

Critical streaming concept.

### Event time

When the event actually happened.

### Processing time

When your system processed it.

Example:

```text
Event happened: 10:00
Arrived: 10:05
Processed: 10:06
```

Do not confuse these timestamps.

---

# 45. Ordering vs Delivery Guarantees

Understand the trade-off:

```text
Ordering
Reliability
Throughput
Latency
```

You often cannot maximize all four simultaneously without trade-offs.

---

# 46. Kafka Security

Learn:

- Authentication
- Authorization
- TLS
- SASL concepts
- ACLs
- Encryption in transit
- Secrets management

Never hardcode credentials in producer/consumer code.

---

# 47. Kafka Monitoring

Monitor:

- Consumer lag
- Broker health
- Under-replicated partitions
- Request latency
- Throughput
- Disk usage
- Network usage
- Producer errors
- Consumer errors
- Rebalances

---

# 48. Rebalancing

Understand what happens when:

```text
Consumer joins
Consumer leaves
Consumer crashes
Partitions change
```

Kafka redistributes partition assignments among consumers in the group.

Learn why excessive rebalancing is undesirable.

---

# 49. Consumer Group Rebalancing

Understand:

```text
Before:
C1 → P0
C2 → P1
C3 → P2

C2 crashes

After:
C1 → P0,P1
C3 → P2
```

This affects processing continuity and throughput.

---

# 50. Kafka Architecture

Be able to design:

```text
Applications
     ↓
   Kafka
 ┌───┼────┐
 ↓   ↓    ↓
S3  DB  Analytics
```

For larger systems:

```text
                    ┌→ Data Lake
                    │
Producer → Kafka → Consumer
                    │
                    ├→ Warehouse
                    │
                    └→ Search / Cache
```

---

# 51. Kafka vs SQS vs Kinesis

Understand at a high level:

| Kafka | SQS | Kinesis |
|---|---|---|
| Event streaming platform | Queue | AWS streaming service |
| Strong partition model | Queue model | Shard model |
| Replay through offsets | Different replay model | Retention-based replay |
| Large ecosystem | AWS-native | AWS-native |
| High streaming flexibility | Simple messaging | Managed AWS streaming |

Do not treat them as interchangeable.

---

# 52. AWS Kafka

Learn:

```text
Amazon MSK
```

Understand:

- Managed Kafka
- Brokers
- Networking
- Security
- IAM/SASL concepts
- Monitoring
- Integration with AWS services

---

# 53. Kafka vs RabbitMQ

Know the conceptual difference.

Kafka:

```text
Event log
Replay
High throughput
Streaming
```

RabbitMQ:

```text
Message broker
Routing
Queues
Messaging patterns
```

Choose based on workload, not popularity.

---

# 54. Kafka Performance

Learn:

- Partitioning
- Batching
- Compression
- Producer tuning
- Consumer concurrency
- Fetch settings
- Network
- Disk
- Replication

---

# 55. Exactly-Once vs Idempotency

Critical interview distinction.

Understand:

```text
Kafka exactly-once semantics
```

does not automatically make:

```text
Kafka → External Database
```

exactly-once.

For external systems, design:

```text
Idempotency key
+
Deduplication
+
Transactional / atomic write where possible
```

---

# 56. Practical Projects

## Project 1 — Python Producer / Consumer

```text
Python Producer
      ↓
Kafka
      ↓
Python Consumer
      ↓
PostgreSQL
```

Implement:

- JSON events
- Consumer groups
- Offset commits
- Error handling
- Retries

---

## Project 2 — Real-Time Order Pipeline

```text
Order Service
      ↓
Kafka
      ↓
Consumer
      ↓
Validation
      ↓
PostgreSQL / S3
```

Track:

```text
orders/sec
consumer lag
failed events
```

---

## Project 3 — Kafka + Spark

```text
Kafka
  ↓
Spark Structured Streaming
  ↓
Transformation
  ↓
S3
  ↓
Athena
```

Include:

- Checkpointing
- Watermarks
- Deduplication
- Partitioning

---

## Project 4 — CDC Pipeline

```text
PostgreSQL
     ↓
CDC / Debezium
     ↓
Kafka
     ↓
Spark / Consumer
     ↓
S3
     ↓
Warehouse
```

Implement:

- INSERT
- UPDATE
- DELETE
- Schema evolution

---

## Project 5 — AWS Streaming Architecture

```text
Application
    ↓
Amazon MSK
    ↓
Consumer / Glue / Spark
    ↓
S3
    ↓
Athena / Redshift
```

---

# 57. Recommended Learning Order

```text
1. Kafka Fundamentals
        ↓
2. Topics
        ↓
3. Partitions
        ↓
4. Producers
        ↓
5. Consumers
        ↓
6. Consumer Groups
        ↓
7. Offsets
        ↓
8. Delivery Semantics
        ↓
9. Replication
        ↓
10. Retention
        ↓
11. Compaction
        ↓
12. Schema Management
        ↓
13. Error Handling
        ↓
14. Consumer Lag
        ↓
15. Rebalancing
        ↓
16. Kafka Connect
        ↓
17. CDC
        ↓
18. Kafka + Spark
        ↓
19. Kafka + Python
        ↓
20. Security
        ↓
21. Monitoring
        ↓
22. Performance
        ↓
23. Amazon MSK
        ↓
24. Production Architecture
```

---

# 58. Progress Tracker

## Fundamentals

- [ ] Kafka architecture
- [ ] Broker
- [ ] Topic
- [ ] Partition
- [ ] Producer
- [ ] Consumer
- [ ] Consumer group
- [ ] Offset
- [ ] Replication

## Producers

- [ ] Keys
- [ ] Partitioning
- [ ] acks
- [ ] Retries
- [ ] Idempotent producer
- [ ] Batching
- [ ] Compression

## Consumers

- [ ] Polling
- [ ] Offset commit
- [ ] Consumer groups
- [ ] Rebalancing
- [ ] Consumer lag
- [ ] Retry
- [ ] DLQ
- [ ] Replay

## Reliability

- [ ] At-most-once
- [ ] At-least-once
- [ ] Exactly-once concepts
- [ ] Idempotency
- [ ] Transactions
- [ ] Replication
- [ ] ISR

## Storage

- [ ] Retention
- [ ] Log compaction
- [ ] Partition sizing
- [ ] Hot partitions

## Data Engineering

- [ ] Schema Registry
- [ ] Schema evolution
- [ ] Kafka Connect
- [ ] CDC
- [ ] Debezium
- [ ] Kafka + Spark
- [ ] Kafka + Python

## Operations

- [ ] Monitoring
- [ ] Consumer lag
- [ ] Broker monitoring
- [ ] Security
- [ ] TLS
- [ ] ACLs

## AWS

- [ ] Amazon MSK
- [ ] IAM/SASL concepts
- [ ] MSK monitoring
- [ ] MSK + S3
- [ ] MSK + Glue
- [ ] MSK + Spark

## Projects

- [ ] Python producer/consumer
- [ ] Real-time order pipeline
- [ ] Kafka + Spark
- [ ] CDC pipeline
- [ ] AWS MSK pipeline

---

# 59. Interview Topics

Be able to explain:

- What is Kafka?
- Kafka vs traditional queues
- Broker
- Topic
- Partition
- Producer
- Consumer
- Consumer group
- Offset
- Partition key
- Ordering
- Replication
- ISR
- Retention
- Log compaction
- Consumer lag
- Rebalancing
- At-most-once
- At-least-once
- Exactly-once
- Idempotency
- Schema Registry
- Schema evolution
- Kafka Connect
- CDC
- Kafka vs SQS
- Kafka vs Kinesis
- Kafka vs RabbitMQ
- MSK

---

# 60. Production Scenario Questions

### Scenario 1

A consumer processes an event and crashes before committing the offset. What happens?

### Scenario 2

A consumer commits the offset before processing. What can go wrong?

### Scenario 3

A topic has 3 partitions but 10 consumers in one consumer group. What happens?

### Scenario 4

One partition receives 80% of all events. How do you fix it?

### Scenario 5

Consumer lag keeps increasing. How do you investigate?

### Scenario 6

A consumer receives the same event twice. How do you prevent duplicate downstream records?

### Scenario 7

A producer sends events faster than consumers can process them. What options do you have?

### Scenario 8

A schema change breaks an existing consumer. How should schema evolution be managed?

### Scenario 9

You need to replay the last 7 days of events. How would you do it?

### Scenario 10

Kafka publishes an event and the downstream database write succeeds, but the consumer crashes before committing. How do you make the downstream operation safe?

---

# 61. Definition of Done

I should be able to:

- Explain Kafka architecture.
- Create topics and partitions.
- Build Python producers and consumers.
- Explain consumer groups.
- Explain offsets.
- Explain partition ordering.
- Design partition keys.
- Explain replication and ISR.
- Configure producer acknowledgments conceptually.
- Explain at-most-once and at-least-once.
- Explain exactly-once limitations.
- Build idempotent consumers.
- Handle retries and poison messages.
- Implement DLQ patterns.
- Understand consumer lag.
- Explain rebalancing.
- Understand retention and compaction.
- Explain schema evolution.
- Understand Kafka Connect and CDC.
- Integrate Kafka with Spark.
- Explain Kafka security.
- Monitor Kafka systems.
- Design a production Kafka pipeline.
- Explain Amazon MSK.

---

# 62. Connection to the Data Engineering Stack

```text
Python
   ↓
SQL
   ↓
ETL / ELT
   ↓
PySpark
   ↓
Data Warehouse
   ↓
Airflow
   ↓
Kafka
   ↓
AWS
```

Kafka adds the **real-time/event-driven layer**.

The key mindset:

> Kafka is not just a queue. Think of it as a durable, partitioned event log that allows multiple independent consumers to process and replay streams of data.
