# Pipeline Dependencies

## 1. What are pipeline dependencies?

Pipeline dependencies describe how one task depends on another.

For example, a transformation job may not run until extraction succeeds.

---

## 2. DAGs

Many data pipelines are represented as directed acyclic graphs (DAGs).

This allows the system to understand:

- what runs before what
- what can run in parallel
- what should be retried when a dependency fails

---

## 3. Why dependencies matter

Without clear dependencies, tasks can run in the wrong order and produce broken results.

This can lead to:

- missing data
- partial loads
- invalid downstream processing
- difficult debugging

---

## 4. Example dependency flow

```text
Extract A
   ↓
Transform
  /    \
Load A  Load B
  \    /
   Validation
```

This shows that validation depends on downstream completion.

---

## 5. Operational concerns

A dependency-aware pipeline should also handle:

- retry propagation
- failure notifications
- scheduled reruns
- manual intervention when a task fails

---

## 6. Key learning goals

By the end of this topic, you should be able to:

- explain what a pipeline dependency is
- describe the role of DAG-based orchestration
- identify why dependency order matters in ETL systems
- reason about failure propagation and recovery across tasks

---

## 7. Practice prompts

Try solving:

- design a simple DAG for extraction, transformation, and validation
- explain how a failed extraction should affect downstream tasks
- outline the dependency chain for a sales daily refresh job

Pipeline dependencies are what keep complex workflows predictable and safe.
