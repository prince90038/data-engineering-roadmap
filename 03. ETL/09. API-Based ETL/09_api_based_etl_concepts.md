# API-Based ETL

## 1. Why APIs matter

Many SaaS and web systems expose data through APIs instead of database connections.

This makes API-based ETL a common pattern in modern data engineering.

---

## 2. Common API authentication patterns

Common patterns include:

- API keys
- bearer tokens
- OAuth 2.0
- basic auth

The correct pattern depends on the provider and security model.

---

## 3. Pagination patterns

Most APIs do not return all records in one request.

Common pagination styles include:

- page number
- offset / limit
- cursor-based pagination
- next URL pagination

---

## 4. Rate limits and retries

APIs often enforce rate limits.

You must handle:

- retries
- backoff
- timeout handling
- server errors
- throttling responses

---

## 5. Extracting incrementally from APIs

Typically, an API pipeline stores a checkpoint such as:

- last updated timestamp
- last record ID
- cursor token

Then it requests only new or modified records since that checkpoint.

---

## 6. Challenges with API extraction

API extraction can be difficult because of:

- unstable schemas
- partial failures
- pagination edge cases
- duplicate records
- changing business rules

---

## 7. Best practices

Good API ETL pipelines often include:

- request logging
- retry with exponential backoff
- safe checkpoint updates
- schema validation
- raw staging before transformation

---

## 8. Key learning goals

By the end of this topic, you should be able to:

- explain why APIs are common data sources
- describe authentication and pagination patterns
- reason about rate limits and retry management
- design incremental extraction from an API source

---

## 9. Practice prompts

Try solving:

- design an API extraction job for a CRM system
- explain how cursor pagination differs from offset pagination
- outline a retry strategy for rate-limited responses

API-based ETL is a practical and highly relevant topic for real-world organizations.
