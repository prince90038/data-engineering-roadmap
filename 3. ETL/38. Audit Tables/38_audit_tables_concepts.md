# Audit Tables

## 1. What is an audit table?

An audit table stores the operational history of pipeline execution.

It is usually used to answer questions like:

- when did a job run?
- was it successful?
- how many rows were processed?
- what watermark was used?
- what failed?

---

## 2. Typical audit table structure

Example fields:

- run_id
- pipeline_name
- start_time
- end_time
- status
- source_count
- target_count
- failed_count
- watermark
- error_message

---

## 3. Why audit tables matter

Audit tables improve:

- monitoring
- reconciliation
- debugging
- compliance
- operational reporting

They are particularly useful when a pipeline breaks and you need to understand the exact state of the run.

---

## 4. Best practices

A good audit table should record:

- consistent run identifiers
- clear timestamps
- error details without sensitive payloads
- enough metrics for operational review

---

## 5. Key learning goals

By the end of this topic, you should be able to:

- explain what an audit table is
- describe common fields in an ETL audit record
- identify business and operational reasons to keep this history
- connect audit tables to debugging and accountability

---

## 6. Practice prompts

Try solving:

- design an audit table for a daily sales ingestion job
- explain how an audit table helps during a pipeline incident
- describe what information should never be stored in an audit log

Audit tables give teams a reliable trail of how data pipelines behaved over time.
