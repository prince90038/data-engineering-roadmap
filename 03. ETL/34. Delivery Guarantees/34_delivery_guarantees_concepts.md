# Delivery Guarantees

## 1. What are delivery guarantees?

Delivery guarantees describe how many times a message or record may be processed and whether it is guaranteed to be delivered exactly once.

The common models are:

- at-most-once
- at-least-once
- exactly-once

---

## 2. At-most-once

A record may be processed zero or one time.

This reduces duplication, but it risks losing data if a failure happens before processing completes.

---

## 3. At-least-once

A record is processed one or more times.

This avoids lost data but may produce duplicates unless the system is idempotent.

---

## 4. Exactly-once

Exactly-once delivery means every record is processed once and only once.

This is ideal, but in practice it is often achieved through a combination of:

- idempotency
- deduplication
- transactional writes
- unique event IDs
- checkpointing

---

## 5. Important lesson

Exactly-once is not always automatically guaranteed by a system.

Real pipelines often approximate it through careful design.

---

## 6. Key learning goals

By the end of this topic, you should be able to:

- explain at-most-once, at-least-once, and exactly-once semantics
- identify the trade-offs among them
- describe how practical exactly-once behavior is often achieved in ETL systems
- reason about duplicate and lost-data risks in pipelines

---

## 7. Practice prompts

Try solving:

- explain why at-least-once delivery is common in data pipelines
- describe how a unique event ID supports deduplication
- compare a transactional database pattern with an event-driven pipeline for reliability

Delivery guarantees are central to designing resilient data systems.
