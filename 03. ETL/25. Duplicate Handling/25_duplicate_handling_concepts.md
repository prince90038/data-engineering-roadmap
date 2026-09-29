# Duplicate Handling

## 1. Why duplicates happen

Duplicates in pipelines can arise from many causes, including:

- retry logic
- duplicate source records
- replayed events
- multiple file arrivals
- API pagination issues
- at-least-once delivery patterns

---

## 2. Why duplicates are dangerous

Duplicate records can distort analytics and produce incorrect business metrics.

Examples:

- double counting sales
- incorrect row totals
- duplicated customer records
- repeated event processing

---

## 3. Common solutions

Typical solutions include:

- deduplication
- business keys
- unique constraints
- MERGE statements
- idempotency handling
- event IDs

---

## 4. Business keys and events

A business key often identifies the canonical record.

For example:

- order_id
- customer_id
- event_id + timestamp

If the same business key appears again, the system should treat it as the same logical record.

---

## 5. Best practices

A strong pipeline often includes:

- detection of duplicate records before loading
- unique constraints at the target table
- idempotent writes
- logging when duplicates are found

---

## 6. Key learning goals

By the end of this topic, you should be able to:

- explain the common causes of duplicate records
- identify why duplicates are harmful
- list practical deduplication strategies
- design safer repeated-load behavior using idempotency principles

---

## 7. Practice prompts

Try solving:

- explain how a retry can create duplicates in a sales pipeline
- design a deduplication rule for an API ingestion job
- outline how a unique constraint helps reduce duplicate data

Duplicate handling is a must-have skill in reliable ETL and ELT systems.
