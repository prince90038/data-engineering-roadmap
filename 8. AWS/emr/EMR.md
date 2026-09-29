# Amazon EMR

## 1. Learn

- EMR overview
- Hadoop
- Spark
- Hive
- YARN concepts
- EC2-based clusters
- EMR Serverless concepts
- Cluster lifecycle
- Auto scaling
- Instance types

## 2. Data Engineering architecture

```text
S3
 ↓
EMR Spark
 ↓
S3
```

## 3. Spark

Master:

- DataFrames
- Transformations
- Actions
- Lazy evaluation
- Shuffles
- Partitions
- Joins
- Caching
- Broadcast joins

## 4. Cluster concepts

Learn:

- Primary node
- Core nodes
- Task nodes
- Instance groups/fleets
- Cluster termination
- Bootstrap actions

## 5. Optimization

Learn:

- Partition sizing
- Shuffle reduction
- Broadcast joins
- File sizing
- Compression
- Spark configurations
- Dynamic allocation concepts

## 6. EMR vs Glue

### Glue

- Serverless
- Managed ETL
- Less infrastructure

### EMR

- More control
- Spark/Hadoop ecosystem
- Custom configurations
- Specialized workloads

## 7. Cost

Learn:

- Cluster lifecycle
- Auto scaling
- Spot instances
- Right-sized instances
- EMR Serverless
- Avoiding idle clusters

## 8. Project

Build:

```text
S3 Raw
 ↓
EMR Spark
 ↓
Transform
 ↓
S3 Parquet
 ↓
Athena
```

## 9. Interview

- EMR vs Glue
- EMR architecture
- Core vs task nodes
- Spark optimization
- Cluster cost optimization
- Why use EMR instead of Glue?
