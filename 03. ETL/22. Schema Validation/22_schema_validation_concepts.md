# Schema Validation

## 1. What is schema validation?

Schema validation checks whether incoming data matches the expected structure.

This ensures the pipeline receives fields in the right names, order, type, and format.

---

## 2. Typical validation checks

Common schema checks include:

- column names
- data types
- required fields
- allowed values
- nested structures

---

## 3. Why schema validation matters

Without schema validation, pipelines can silently ingest corrupt or inconsistent data.

This can lead to:

- broken transformations
- downstream errors
- null-heavy tables
- wrong analytics

---

## 4. Tools and frameworks

Examples include:

- Pydantic
- JSON Schema
- database constraints
- data contracts

These systems define what is valid and what is not.

---

## 5. Example validation rules

Example rules:

- customer_id must be an integer
- country must be one of a set of accepted values
- amount must be numeric
- email must be present for customer records

---

## 6. Key learning goals

By the end of this topic, you should be able to:

- explain what schema validation checks
- identify when schema drift occurs
- list common schema validation techniques
- describe why validation should happen before transformation or loading

---

## 7. Practice prompts

Try solving:

- validate a CSV schema before loading to a warehouse
- explain how a missing column can break a transformation
- list schema rules for a payment event feed

Schema validation is a key safeguard in any modern ETL pipeline.
