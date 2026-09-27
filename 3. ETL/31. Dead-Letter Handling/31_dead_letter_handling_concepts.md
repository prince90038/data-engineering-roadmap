# Dead-Letter Handling

## 1. What is dead-letter handling?

A dead-letter pattern stores invalid or problematic records separately instead of crashing the whole pipeline.

This allows teams to inspect, fix, and replay bad data without losing the original record.

---

## 2. Why it matters

Bad records are common in real pipelines, especially when dealing with:

- malformed values
- schema drift
- missing required fields
- upstream mistakes
- temporary source issues

If every bad record fails the entire job, the pipeline is too brittle.

---

## 3. Typical dead-letter flow

```text
Input
  ↓
Validate
  ├── valid → process
  └── invalid → dead-letter store
```

The dead-letter location should capture enough metadata to support debugging.

---

## 4. What to store

Typical dead-letter records include:

- original record payload
- error reason
- timestamp
- pipeline/job ID
- source identifier

---

## 5. Key learning goals

By the end of this topic, you should be able to:

- explain dead-letter handling
- describe when invalid records should be quarantined instead of crashing the pipeline
- identify metadata needed to debug bad records
- reason about operational recovery from bad input data

---

## 6. Practice prompts

Try solving:

- design a dead-letter store for a CSV ingestion pipeline
- explain how you would debug a bad customer record later
- compare failing the batch entirely versus quarantining invalid rows

Dead-letter handling is a practical way to keep pipelines resilient and debuggable.
