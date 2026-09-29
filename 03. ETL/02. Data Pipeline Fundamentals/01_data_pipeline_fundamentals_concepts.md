# Data Pipeline Fundamentals

## 1. What is a data pipeline?

A data pipeline is a sequence of steps that moves data from a source to a destination while applying necessary checks, transformations, and monitoring.

A pipeline can involve:

- extraction
- validation
- transformation
- loading
- orchestration
- monitoring
- alerting

---

## 2. Pipeline stages

A typical pipeline looks like this:

```text
Source
  ↓
Extract
  ↓
Validate
  ↓
Transform
  ↓
Load
  ↓
Validate
  ↓
Monitor
```

This pattern is useful because production pipelines need both technical reliability and business correctness.

---

## 3. ETL pipeline

An ETL pipeline transforms data before the final load.

This is useful when the target system expects clean and standardized values.

---

## 4. ELT pipeline

An ELT pipeline loads raw or semi-raw data first and transforms later.

This is common when the warehouse or lake supports large SQL transformations.

---

## 5. Data workflow vs data pipeline

A workflow is often a scheduled orchestration of tasks.

A pipeline may be one part of a workflow, but the broader workflow usually includes dependencies, retries, and orchestration.

---

## 6. Data product mindset

A mature data pipeline is often considered a data product because it produces usable, reliable data for downstream consumers.

This means quality, documentation, observability, and SLAs matter.

---

## 7. Key learning goals

By the end of this topic, you should be able to:

- explain the stages of a data pipeline
- distinguish between ETL, ELT, and broader workflows
- describe what a reliable pipeline must validate and monitor
- understand why pipelines are more than just moving data

---

## 8. Practice prompts

Try solving:

- design a simple pipeline from a CSV file to a warehouse table
- identify the validation steps before loading a dataset
- explain how monitoring differs from transformation
- describe the responsibilities of a data product team

Data pipelines are the backbone of modern analytics and data engineering systems.
