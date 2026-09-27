# Data Lakes and SQL

## 1. What is a data lake?

A data lake is a storage system that keeps large volumes of raw data in its original form.

This often includes files such as:

- CSV
- JSON
- Parquet
- ORC

It is commonly used for ingestion and large-scale analytics.

---

## 2. What is a data warehouse?

A data warehouse is a structured analytics environment optimized for reporting and SQL analysis.

It typically stores cleaned and organized data, often in tables designed for querying.

---

## 3. What is a data lakehouse?

A lakehouse combines features of data lakes and data warehouses.

It keeps data in an open lake storage format while adding warehouse-like reliability, performance, and metadata management.

---

## 4. SQL on data lakes

SQL is often used to query data lakes using systems such as:

- AWS Athena
- AWS Glue
- Trino/Presto-style engines
- Spark SQL

These tools allow SQL to run directly over lake data without fully moving the data into a traditional warehouse first.

---

## 5. File formats

Common data lake file formats include:

- CSV: simple but less efficient for large analysis workloads
- JSON: flexible but verbose and less optimized for analytics
- Parquet: columnar, efficient, and popular for analytical workloads
- ORC: columnar and optimized for big data workloads

---

## 6. Why this matters for data engineering

Modern data engineering often combines:

- raw lake storage for scale
- SQL engines for transformation and reporting
- warehouse layers for curated analytics

This enables flexible pipelines and effective data discovery.

---

## 7. Key learning goals

By the end of this topic, you should be able to:

- explain the difference between a data lake and a warehouse
- describe what a lakehouse is
- recognize common data lake file formats
- understand how SQL is used on data lake storage

---

## 8. Practice prompts

Try solving:

- compare CSV and Parquet for analytics workloads
- explain why a lakehouse is useful in modern platforms
- describe how Athena or Trino can query data stored in S3 or object storage
- identify when a data warehouse is preferred over a data lake

Data lakes and SQL are essential for modern large-scale analytical platforms.
