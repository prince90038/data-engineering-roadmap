# Parameterization

## 1. What is parameterization?

Parameterization means making a pipeline configurable through inputs such as dates, environments, source names, or batch windows.

Instead of hardcoding values, you pass them as arguments when the job runs.

---

## 2. Why it matters

Parameterization enables:

- backfills
- reruns
- environment-specific execution
- testing in multiple contexts
- easier operational control

---

## 3. Common examples

Typical parameters include:

- start_date
- end_date
- source_system
- target_table
- batch_size
- environment
- run_id

---

## 4. Example command

```bash
python pipeline.py --start_date 2026-09-01 --end_date 2026-09-30 --environment prod
```

This approach makes the pipeline reusable and safer to operate.

---

## 5. Design considerations

A well-parameterized pipeline should:

- validate parameter values
- document expected formats
- support reprocessing
- expose defaults sensibly

---

## 6. Key learning goals

By the end of this topic, you should be able to:

- explain what parameterization means in ETL
- identify common pipeline parameters
- describe why reprocessing and backfills require parameterized jobs
- reason about safe configuration design

---

## 7. Practice prompts

Try solving:

- design parameters for a daily sales ETL job
- explain how a backfill differs from a normal incremental job
- list which parameters should be environment-aware rather than hardcoded

Parameterization turns a one-off script into an operational, repeatable workflow.
