# Data Testing

## 1. What is data testing?

Data testing checks whether the actual data produced by a pipeline matches expectations.

It is different from code testing because the focus is on the correctness and quality of the produced dataset.

---

## 2. What to validate

Data testing commonly checks:

- row counts
- null rates
- duplicate counts
- schema compliance
- freshness
- referential integrity
- business rule violations

---

## 3. Why code tests are not enough

A transformation can run without crashing and still produce wrong data.

That is why data testing matters even when unit and integration tests pass.

---

## 4. Example checks

You may validate:

- number of rows in the target matches the source expectation
- no nulls in critical columns
- no duplicates in business keys
- time window aligns with the scheduled load

---

## 5. Key learning goals

By the end of this topic, you should be able to:

- explain the difference between code testing and data testing
- list common data validation checks
- describe how freshness and quality checks protect downstream reporting
- reason about silent data problems that code tests might miss

---

## 6. Practice prompts

Try solving:

- design a data test for a daily incremental load
- explain how null checks differ from schema checks
- outline a production alert if duplicate key counts spike above threshold

Data testing ensures the pipeline is not just running, but producing trustworthy data.
