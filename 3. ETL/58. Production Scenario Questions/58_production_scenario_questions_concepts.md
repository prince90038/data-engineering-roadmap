# Production Scenario Questions

## 1. Why scenario questions matter

In production, ETL work is not just about writing code. It is about handling real operational uncertainty.

Scenario questions test whether you understand failure modes, recovery paths, and system behavior under stress.

---

## 2. Common scenario themes

Typical ETL scenario questions ask about:

- partial failures
- duplicate records
- late-arriving data
- schema drift
- API rate limits
- unexpected downtime
- row count mismatches
- historical backfills

---

## 3. Example scenarios

Examples include:

- 10 million rows loaded, but the job crashes after 8 million
- same API response arrives twice
- source adds a new column unexpectedly
- source changes a type from integer to string
- target contains fewer rows than source
- data from yesterday arrives today
- API returns HTTP 429
- database connection fails halfway through a run

---

## 4. What good answers look like

Strong answers usually include:

- idempotency strategy
- checkpointing or resume logic
- validation and alerting
- backfill or reprocessing design
- reconciliation checks

---

## 5. Key learning goals

By the end of this topic, you should be able to:

- interpret common production ETL failure scenarios
- design operational responses to failure conditions
- connect scenario analysis to idempotency, recovery, and validation
- explain how production thinking differs from local script execution

---

## 6. Practice prompts

Try solving:

- what would you do if the pipeline succeeds but the target has fewer rows?
- how would you handle a job that gets the same API response twice?
- what strategy would you use for late-arriving records from yesterday?

Great ETL engineers think in terms of operational reality, not only clean happy-path logic.
