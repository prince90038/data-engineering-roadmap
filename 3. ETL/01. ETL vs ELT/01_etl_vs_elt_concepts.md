# ETL vs ELT

## 1. What is ETL?

ETL stands for Extract, Transform, Load.

In ETL, data is extracted from a source, transformed in a processing layer, and then loaded into the target system.

This pattern is common when data quality and transformation logic need to happen before the data reaches a warehouse or downstream analytics layer.

---

## 2. What is ELT?

ELT stands for Extract, Load, Transform.

In ELT, data is first extracted and loaded into a target storage or warehouse, and transformations happen afterward.

This pattern is common in cloud data platforms because storage is cheap and compute can be scaled as needed.

---

## 3. When to use ETL

ETL is often preferred when:

- the data needs heavy cleanup before loading
- transformation rules are strict and business-specific
- the target system is limited or expensive to transform on the fly
- data quality gates must happen before analytics

---

## 4. When to use ELT

ELT is often preferred when:

- the raw data is large and should be stored first
- the warehouse has powerful query engines for transformation
- the team wants flexibility to transform data multiple ways
- cloud infrastructure supports scalable compute

---

## 5. Common trade-offs

ETL can be more controlled and cleaner for pipelines, but it may be slower or harder to scale when transformation happens before loading.

ELT is flexible and scalable, but raw data landing sooner may require stronger governance and quality checks later.

---

## 6. Why modern platforms favor ELT

Modern lakehouse and warehouse architectures often favor ELT because they offer:

- cheap storage
- large-scale compute
- SQL-friendly transformation layers
- easier reprocessing and backfills

---

## 7. Key learning goals

By the end of this topic, you should be able to:

- explain the difference between ETL and ELT
- describe when each pattern is appropriate
- explain why cloud systems often favor ELT
- reason about trade-offs in cost, flexibility, and quality control

---

## 8. Practice prompts

Try solving:

- describe when ETL is more appropriate than ELT in a regulated environment
- explain why a raw data lake often uses ELT patterns
- compare transformation timing and cost between ETL and ELT
- outline a data pipeline using both patterns in different stages

ETL and ELT are core design decisions in modern data engineering architectures.
