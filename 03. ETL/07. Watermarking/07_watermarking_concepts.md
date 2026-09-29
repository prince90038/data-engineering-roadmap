# Watermarking

## 1. What is a watermark?

A watermark is a checkpoint value that helps a pipeline remember what data was already processed.

It is typically based on:

- a timestamp
- a maximum ID
- a batch number
- a last successful run time

---

## 2. Why watermarks matter

Without a watermark, a pipeline may re-read old data or miss new data.

This can cause:

- duplicates
- missed rows
- inconsistent analytics
- broken backfills

---

## 3. Typical watermark pattern

```text
Read last watermark
   ↓
Extract records newer than watermark
   ↓
Process data
   ↓
Load successfully
   ↓
Update watermark
```

The watermark should only advance after successful completion of the load.

---

## 4. Timestamp watermarks

A timestamp watermark is common in OLTP systems.

Example:

```text
last_processed_timestamp = 2026-09-20T12:00:00Z
```

Then the pipeline reads rows with updated_at > last_processed_timestamp.

---

## 5. High-water mark

A high-water mark captures the greatest processed value.

For example:

```text
max_order_id = 125000
```

This helps process only records with IDs greater than the last maximum.

---

## 6. Late-arriving data issue

A watermark based only on the latest processed value may fail when older rows arrive late.

This is a common production problem that requires stronger business rules or event-time handling.

---

## 7. Best practices

Good watermarking practices include:

- updating only after success
- storing the watermark in a control table
- auditing watermark changes
- monitoring for long gaps or duplicates
- handling late-arriving records explicitly

---

## 8. Key learning goals

By the end of this topic, you should be able to:

- explain what a watermark is
- describe how watermarks drive incremental processing
- identify risks in watermark logic
- design safer checkpoint behavior in a pipeline

---

## 9. Practice prompts

Try solving:

- design a watermark for a daily orders table
- explain what happens when a row is updated after the watermark advances
- describe how a control table can help pipeline state tracking

Watermarking is the mechanism that keeps incremental pipelines consistent and traceable.
