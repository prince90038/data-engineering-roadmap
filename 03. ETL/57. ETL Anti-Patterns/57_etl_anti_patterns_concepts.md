# ETL Anti-Patterns

## 1. What are ETL anti-patterns?

Anti-patterns are recurring design mistakes that make ETL pipelines fragile, unclear, or unreliable.

Recognizing these mistakes is a crucial part of becoming a better data engineer.

---

## 2. Common anti-patterns

Typical ETL anti-patterns include:

- full-load everything every day
- hardcoded credentials
- no logging
- no retries
- blind retries
- no validation
- no idempotency
- no audit trail
- loading everything into memory
- no backfill strategy
- no schema evolution strategy
- giant monolithic scripts
- no monitoring
- no reconciliation
- ignoring late-arriving data

---

## 3. Why they matter

Each anti-pattern creates a different kind of operational risk:

- data loss
- duplicate records
- poor debugging
- expensive runtime failures
- bad trust in reporting

---

## 4. Example of a bad pattern

```text
Read all rows from source
 ↓
Keep everything in memory
 ↓
Write to target without validation
 ↓
Retry forever without rules
```

This design fails under scale and under pressure.

---

## 5. Better alternatives

Use instead:

- technical validation
- chunking and batching
- idempotent writes
- retries with limits
- reconciliation
- observability
- controlled schema updates

---

## 6. Key learning goals

By the end of this topic, you should be able to:

- identify the most common ETL anti-patterns
- explain how they create operational risk
- describe safer alternatives for each pattern
- apply design judgment to avoid these mistakes in practice

---

## 7. Practice prompts

Try solving:

- list three anti-patterns in a daily file ingestion pipeline
- explain why hardcoded credentials are dangerous
- identify how a silent duplicate load can happen in a naive pipeline

Good ETL design is usually the result of avoiding predictable mistakes.
