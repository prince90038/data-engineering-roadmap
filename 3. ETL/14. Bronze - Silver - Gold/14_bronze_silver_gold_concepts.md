# Bronze / Silver / Gold

## 1. What is the medallion architecture?

The medallion model organizes data into layers:

- Bronze
- Silver
- Gold

This pattern is common in lakehouse and warehouse architectures.

---

## 2. Bronze layer

The bronze layer stores raw or nearly raw data.

Typical properties:

- preserve original source data
- minimal transformation
- support replay and audits
- maintain lineage

---

## 3. Silver layer

The silver layer is cleaned and standardized.

Typical transformations include:

- data type conversion
- deduplication
- null handling
- standardization
- validation checks

---

## 4. Gold layer

The gold layer is business-ready data used for analytics and reporting.

Typical properties:

- aggregated metrics
- business logic applied
- ready for dashboards and downstream use
- high-quality, curated data

---

## 5. Why this pattern is useful

The medallion model helps data teams:

- separate raw and business-ready data
- improve traceability
- support reprocessing without loss
- reduce clutter in curated tables

---

## 6. Key learning goals

By the end of this topic, you should be able to:

- explain the bronze/silver/gold model
- describe the purpose of each layer
- identify the kinds of work done in each layer
- connect the architecture to real-world pipeline design

---

## 7. Practice prompts

Try solving:

- design bronze, silver, and gold tables for ecommerce sales
- explain what transformations belong in each layer
- outline how a bad upstream file would be handled in this model

Bronze, silver, and gold are practical ways to organize a scalable analytics architecture.
