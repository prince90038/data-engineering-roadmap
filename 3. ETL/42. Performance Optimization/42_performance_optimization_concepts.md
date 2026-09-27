# Performance Optimization

## 1. Why performance matters

An ETL pipeline is not useful if it is too slow to meet business needs.

Data systems are often constrained by read speed, network limits, CPU, memory, and database load.

---

## 2. Typical bottlenecks

Common ETL bottlenecks include:

- large scans of unnecessary rows
- poor filtering before transformation
- unnecessary serialization
- too many small database writes
- lack of partitioning
- serial execution where parallelism is possible

---

## 3. Optimization strategies

Performance can improve with:

- filtering early
- batching writes
- reducing data movement
- using indexes where appropriate
- parallelizing independent steps
- pushing work close to the source or target

---

## 4. Batch sizing

Large jobs should often use chunking.

This reduces memory pressure and helps with retries and recovery.

---

## 5. Trade-offs

Faster pipelines may require:

- more memory
- more compute
- more complex orchestration
- careful monitoring

The goal is to improve throughput without sacrificing correctness or reliability.

---

## 6. Key learning goals

By the end of this topic, you should be able to:

- identify common performance bottlenecks in ETL workflows
- explain why batching and filtering matter
- discuss trade-offs between speed, cost, and reliability
- reason about when a pipeline is under-optimized

---

## 7. Practice prompts

Try solving:

- explain how a 10x increase in source volume affects pipeline performance
- describe how chunked loading can help a transformation step
- outline an optimization plan for a slow nightly warehouse job

Good ETL performance is about throughput, stability, and controlled resource use.
