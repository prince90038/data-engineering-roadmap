# Batch Processing

## 1. What is batch processing?

Batch processing runs jobs on a schedule or at intervals rather than continuously.

This is a classic ETL pattern used in warehouses, reporting systems, and operational data pipelines.

---

## 2. Typical batch flow

```text
Scheduled job
  ↓
Extract
  ↓
Transform
  ↓
Load
```

This pattern is common for daily or hourly processing windows.

---

## 3. Common batch intervals

Typical intervals include:

- every 5 minutes
- hourly
- daily
- weekly

The schedule depends on source freshness, business needs, and processing cost.

---

## 4. Batch design considerations

A batch pipeline must consider:

- batch size
- processing window
- job duration
- late data
- retries
- backfills

---

## 5. Why batch is still common

Batch processing remains common because it is:

- simpler
- easier to monitor
- easier to recover
- more cost predictable

This makes it a good default for many enterprise workloads.

---

## 6. Key learning goals

By the end of this topic, you should be able to:

- explain a batch processing workflow
- identify common batch schedules
- connect batch processing to operational design decisions
- understand the role of retries and late data in batch jobs

---

## 7. Practice prompts

Try solving:

- design a daily batch job for sales data
- explain why a 5-minute batch may be better than a 1-minute batch in some cases
- describe what happens when an hourly batch misses data because of a failure

Batch processing is one of the most established and reliable patterns in data engineering.
