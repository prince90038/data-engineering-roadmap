# Extraction

## 1. What is extraction?

Extraction is the process of reading data from a source system and moving it into a staging or landing area.

This is the first stage of a pipeline.

---

## 2. Common extraction patterns

Common strategies include:

- full extraction
- incremental extraction
- timestamp-based extraction
- ID-based extraction
- CDC-based extraction
- query-based extraction

---

## 3. Full extraction

A full extraction reads all rows from a source table or file.

This is useful for:

- initial load
- reference data loads
- small datasets
- rebuilds

It becomes expensive at scale.

---

## 4. Incremental extraction

Incremental extraction only reads rows that changed since the last successful run.

This is the most common production pattern for large tables.

---

## 5. Watermark-based extraction

A watermark is a checkpoint value such as:

- last updated timestamp
- maximum record ID
- last processed batch ID

This helps the pipeline fetch only new or changed records.

---

## 6. CDC-based extraction

CDC captures database changes from transaction logs or change tables.

This is often used for near-real-time replication and incremental pipelines.

---

## 7. Why reliable extraction matters

If extraction is wrong, all downstream data quality and analytics will be compromised.

A reliable extraction pattern must ensure:

- correctness
- idempotency
- retry safety
- source consistency

---

## 8. Key learning goals

By the end of this topic, you should be able to:

- explain common extraction patterns
- describe watermark and CDC approaches
- identify when full extraction is acceptable versus incremental extraction
- discuss the importance of safe extraction logic in production

---

## 9. Practice prompts

Try solving:

- design a timestamp-based extraction for an orders table
- explain why an incremental query should use a watermark
- compare full extraction and CDC-based extraction
- outline a safe extraction process for a sales API

Extraction is the foundation of reliable ELT and ETL pipelines.
