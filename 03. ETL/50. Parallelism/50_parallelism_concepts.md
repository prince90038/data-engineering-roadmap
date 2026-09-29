# Parallelism

## 1. What is parallelism?

Parallelism means running multiple tasks at the same time to reduce total execution time.

In ETL, this can happen at task level or data level.

---

## 2. Types of parallelism

Common patterns include:

- task parallelism
- data parallelism
- threading
- multiprocessing
- distributed processing

---

## 3. When to use it

Parallelism is helpful when independent tasks can run concurrently, such as:

- processing separate files
- extracting multiple source tables
- validating independent records

---

## 4. When not to use it

Parallelism should not be used blindly.

It can overload the source system, increase operational complexity, or produce race conditions when shared state is involved.

---

## 5. Key learning goals

By the end of this topic, you should be able to:

- explain the role of parallelism in ETL jobs
- identify when parallelism helps and when it hurts
- differentiate between task-level and data-level parallelism
- reason about concurrency trade-offs in production workloads

---

## 6. Practice prompts

Try solving:

- design a parallel extraction plan for ten source tables
- explain why parallelism may be harmful if the database has a single connection limit
- describe how a DAG-based orchestrator handles dependencies between parallel tasks

Parallelism is powerful, but good ETL design is about controlled concurrency rather than maximum concurrency.
