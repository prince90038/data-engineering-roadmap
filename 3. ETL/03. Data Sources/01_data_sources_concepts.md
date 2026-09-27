# Data Sources

## 1. Why data sources matter

Every pipeline begins with a source of data.

The source determines extraction strategy, data quality, refresh cadence, and transformation complexity.

---

## 2. Database sources

Common relational sources include:

- PostgreSQL
- MySQL
- SQL Server
- Oracle

Each system may differ in:

- connectors
- export speed
- change tracking support
- query cost

---

## 3. File sources

File-based sources include:

- CSV
- JSON
- JSON Lines
- XML
- Parquet
- ORC

These sources are common in data lakes and landing zones.

---

## 4. API sources

APIs are common in SaaS and web systems.

They often require:

- pagination
- authentication
- rate limit handling
- retry logic
- schema mapping

---

## 5. Streaming sources

Streaming systems include:

- Kafka
- Kinesis
- event buses

These systems process data in near-real-time and usually require event-based handling or streaming architectures.

---

## 6. Data source characteristics to consider

When evaluating a source, think about:

- freshness requirement
- volume
- schema stability
- change detection support
- authentication and security
- ingestion frequency

---

## 7. Key learning goals

By the end of this topic, you should be able to:

- identify common source types in data engineering
- describe why source type influences extraction design
- explain the challenges of API and file-based ingestion
- connect source characteristics to pipeline architecture choices

---

## 8. Practice prompts

Try solving:

- compare a PostgreSQL source and a REST API source
- explain why Parquet is often preferred over CSV in lake storage
- list the considerations for data source ingestion in a daily ETL job
- describe how a Kafka topic differs from a relational table as a source

Data sources are the starting point of every successful pipeline.
