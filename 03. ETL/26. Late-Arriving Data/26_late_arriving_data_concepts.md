# Late-Arriving Data

## 1. What is late-arriving data?

Late-arriving data refers to records that arrive after the expected processing window.

This is common in distributed systems, batch pipelines, and event-driven architectures.

---

## 2. Why it matters

A pipeline may have already processed a batch when a late record appears.

If the system does not handle late arrivals, the final result may be wrong.

---

## 3. Common examples

Examples include:

- a transaction for Day 1 arriving on Day 3
- a delayed API sync
- a source outage that caused delayed writes
- out-of-order event delivery

---

## 4. Common handling strategies

Typical approaches include:

- reprocessing a window
- using event-time semantics
- storing late records separately for follow-up
- adjusting watermark logic
- explicitly allowing a reprocessing window

---

## 5. Key learning goals

By the end of this topic, you should be able to:

- explain what late-arriving data is
- describe its impact on incremental pipelines
- identify strategies to handle delayed records
- reason about watermark and reprocessing trade-offs

---

## 6. Practice prompts

Try solving:

- explain how a daily sales load can be wrong if a late transaction arrives after the batch completes
- design a reprocessing strategy for a delayed event stream
- explain how watermarks interact with late-data handling

Late-arriving data is a normal reality in production systems and requires explicit handling.
