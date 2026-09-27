# Performance Optimization

## 1. Why optimize ETL pipelines?

A slow ETL job creates delays, cost issues, and operational risk.

Teams need to know where time is being spent and where the bottleneck is.

---

## 2. Common bottlenecks

Possible bottlenecks include:

- source DB read latency
- network transfer
- transformation CPU cost
- memory pressure
- target write speed
- unnecessary row movement

---

## 3. Optimization levers

You can improve performance by:

- filtering early
- reducing unnecessary columns
- batching writes
- using indexes where appropriate
- avoiding repeated scans
- partitioning data
- parallelizing independent tasks

---

## 4. Avoiding waste

A key ETL principle is to move only the data that is necessary.

If a query reads millions of rows and then discards most of them, the design is inefficient.

---

## 5. Example question

> Where is the bottleneck in the pipeline?

This is a critical question whenever a job becomes slower.

---

## 6. Key learning goals

By the end of this topic, you should be able to:

- explain why ETL performance matters
- list common bottlenecks in ETL systems
- describe optimization patterns like filtering, batching, and partitioning
- reason about performance trade-offs in production work

---

## 7. Practice prompts

Try solving:

- identify the likely bottleneck in a database-to-data-warehouse daily sync
- explain how batch size affects throughput and recovery
- compare a full-file read versus a filtered SQL read

A fast pipeline is reliable only when it is also correct and stable.
