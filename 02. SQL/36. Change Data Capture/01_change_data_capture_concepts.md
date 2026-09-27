# Change Data Capture

## 1. What is Change Data Capture?

Change Data Capture (CDC) is the process of detecting and capturing changes in source data, such as inserts, updates, and deletes.

It is commonly used in pipelines that need to process only new or modified data rather than reloading everything.

---

## 2. Why CDC matters

CDC is important because many production sources are continuously changing.

Without CDC, systems may need to:

- reload full datasets repeatedly
- miss incremental updates
- produce stale results
- create expensive compute loads

CDC helps keep downstream systems fresh and efficient.

---

## 3. Types of change events

A CDC system typically captures:

- insert events
- update events
- delete events

These events can be represented in logs, tables, or event streams.

---

## 4. Log-based CDC

Many databases support log-based CDC, where the database writes change events to a transaction log.

This allows downstream applications to consume changes incrementally with low overhead.

---

## 5. Snapshot vs incremental CDC

A snapshot copies the full dataset at a point in time.

Incremental CDC only captures the rows that changed since the last sync.

Incremental CDC is usually preferred for ongoing pipelines because it is more efficient.

---

## 6. CDC in data pipelines

A typical CDC flow looks like this:

```text
Source DB
   ↓
Change Events
   ↓
CDC pipeline
   ↓
Target warehouse or lake
```

This allows the target to keep up with source changes without full reloads.

---

## 7. Common use cases

CDC is useful for:

- near-real-time dashboards
- warehouse synchronization
- event-driven pipelines
- replication
- incremental ETL and ELT jobs

---

## 8. Key learning goals

By the end of this topic, you should be able to:

- explain what CDC is
- describe insert, update, and delete capture patterns
- explain log-based CDC
- compare snapshot and incremental approaches

---

## 9. Practice prompts

Try solving:

- explain how CDC is used in an order-processing pipeline
- identify whether a source system should use snapshot or incremental sync
- describe how delete events are handled in a warehouse
- outline a CDC flow from source database to analytics table

CDC is a core concept in modern data engineering systems that must stay current.
