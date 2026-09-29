# ETL Metadata

## 1. What is ETL metadata?

ETL metadata is the operational information captured around a pipeline run.

It helps teams understand what happened, when it happened, and whether it succeeded.

---

## 2. Typical metadata fields

A job may track:

- pipeline_name
- run_id
- start_time
- end_time
- status
- records_read
- records_processed
- records_failed
- source
- target
- watermark
- error_message

---

## 3. Why metadata matters

Without metadata, operations teams have little visibility into pipeline health.

This makes debugging, alerting, and recovery much harder.

---

## 4. Operational use cases

Metadata is useful for:

- monitoring
- run comparison
- auditing
- troubleshooting
- backfill management
- performance analysis

---

## 5. Key learning goals

By the end of this topic, you should be able to:

- explain what ETL metadata is
- identify the common fields captured in a run record
- describe how metadata supports operations and debugging
- reason about metadata quality as part of pipeline observability

---

## 6. Practice prompts

Try solving:

- design a metadata record for a daily customer sync job
- explain how run_id helps support debugging across retries
- outline which fields matter most for a production alerting system

Metadata is the operational memory of your data pipeline.
