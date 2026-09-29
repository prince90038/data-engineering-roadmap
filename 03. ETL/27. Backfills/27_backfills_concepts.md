# Backfills

## 1. What is a backfill?

A backfill reprocesses historical data for a specific date range or set of records.

It is often used after fixing a bug, changing business logic, or correcting a bad load.

---

## 2. Why backfills matter

Production pipelines do not always work perfectly the first time.

A backfill allows teams to rebuild historical output safely and then validate that the corrected result is consistent.

---

## 3. Backfill types

Common forms include:

- partial backfill
- full backfill
- date-range backfill
- reprocess by partition or batch

---

## 4. Best practices

Good backfills usually include:

- idempotent logic
- clear date range or partition selection
- validation after completion
- controlled reruns
- careful checkpoint handling

---

## 5. Key learning goals

By the end of this topic, you should be able to:

- explain what a backfill is
- identify why backfills are necessary in production pipelines
- describe common backfill patterns
- reason about safe reprocessing for historical data

---

## 6. Practice prompts

Try solving:

- design a backfill for sales records between two dates
- explain why backfills must be idempotent
- describe how backfills interact with watermark state

Backfills are essential for correcting issues and maintaining confidence in a data platform.
