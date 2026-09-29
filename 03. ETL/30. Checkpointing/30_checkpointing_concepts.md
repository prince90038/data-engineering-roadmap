# Checkpointing

## 1. What is checkpointing?

Checkpointing records the progress of a pipeline so it can resume from a known point after failure.

This is critical for incremental processing and large jobs.

---

## 2. Why checkpointing matters

Without a checkpoint, a failed job may need to restart from the beginning or risk processing data twice.

This creates problems in both cost and correctness.

---

## 3. Example checkpoint state

```text
Processed up to: 2026-09-27 22:00:00
```

This tells the system what data was successfully processed and what remains.

---

## 4. Typical checkpoint information

Common checkpoint metadata includes:

- last processed timestamp
- last inserted record ID
- job run ID
- status
- source partition or batch ID

---

## 5. Best practices

A good checkpointing design includes:

- writing state only after successful processing
- storing clear metadata
- supporting operator-driven recovery
- handling out-of-order or late data explicitly

---

## 6. Key learning goals

By the end of this topic, you should be able to:

- explain what checkpointing does
- identify why it is essential in long-running pipelines
- describe what information is usually stored as checkpoint state
- reason about checkpoint correctness with retries and reprocessing

---

## 7. Practice prompts

Try solving:

- design a checkpoint for an ETL job processing hourly orders
- explain how a checkpoint prevents duplicate processing after a restart
- describe how checkpoint state should behave when a process fails after partial completion

Checkpointing is the operational memory of a resilient data pipeline.
