# Containerization

## 1. What is containerization?

Containerization packages an application and its dependencies into a portable runtime environment.

For data engineering, this is often used to make ETL jobs repeatable across environments.

---

## 2. Why Docker is common

Docker lets teams define:

- base image
- runtime dependencies
- environment variables
- network configuration
- startup commands

This makes ETL jobs easier to run in local, test, and production environments.

---

## 3. Typical ETL container use cases

Containers are often used for:

- Python ETL scripts
- Airflow workers
- task runners
- transformation jobs
- validation checks

---

## 4. Benefits

Containerization provides:

- consistency across environments
- isolated dependencies
- easier onboarding
- easier deployment
- reproducibility

---

## 5. Key learning goals

By the end of this topic, you should be able to:

- explain what containerization means in ETL
- list common reasons teams use Docker for pipeline jobs
- reason about environment consistency and reproducibility
- identify where containers fit within modern data engineering practices

---

## 6. Practice prompts

Try solving:

- explain how Docker helps a Python ETL project stay consistent across machines
- list the components you would include in a containerized ETL job
- describe how environment variables help containerized pipelines behave differently in dev and prod

Containerization makes a pipeline easier to run, share, and operate reliably.
