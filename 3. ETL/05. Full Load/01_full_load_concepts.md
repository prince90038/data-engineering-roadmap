# Full Load

## 1. What is a full load?

A full load copies all data from a source into a target system.

This often occurs during an initial migration or a complete rebuild.

---

## 2. When full load is useful

Full loads are appropriate for:

- initial data population
- small datasets
- reference tables
- one-time migrations
- rebuilding a warehouse table

---

## 3. Advantages

Benefits include:

- simple to understand
- easy to validate
- no need for incremental state tracking
- good for small or static datasets

---

## 4. Disadvantages

Full loads can become expensive when:

- data volume grows large
- sources are frequently updated
- loading time is critical
- compute and network costs matter

---

## 5. Why full loads are often avoided in production

As datasets grow, full loads can be slow and expensive.

This is why incremental loads and CDC are commonly used for large production pipelines.

---

## 6. Full load in ETL/ELT

A full load might look like this:

```text
Source
   ↓
Extract everything
   ↓
Transform
   ↓
Load target
```

This is simple but not always efficient at scale.

---

## 7. Key learning goals

By the end of this topic, you should be able to:

- explain what a full load is
- describe when it is useful
- explain why it becomes costly at scale
- compare full load with incremental load design

---

## 8. Practice prompts

Try solving:

- explain when a full load is appropriate for a customer dimension table
- compare the cost of a full load versus an incremental load for a 10-billion-row table
- describe how to rebuild a target table safely with a full refresh

Full load is simple and useful, but incremental patterns are usually necessary for large production workloads.
