# Configuration and Secrets Management

## 1. Why configuration matters

ETL jobs often depend on environment-specific settings such as:

- source URLs
- database hosts
- schema names
- batch sizes
- file paths
- retry values

These values should be configured, not hardcoded.

---

## 2. Configuration best practices

Use:

- environment variables
- config files in safe locations
- parameterized job settings
- explicit defaults for development

Separate code from environment-specific values.

---

## 3. Secrets management

Secrets include:

- database passwords
- API tokens
- cloud credentials
- private keys

These should be stored in a managed secret store or vault and injected securely at runtime.

---

## 4. Common mistakes

Common mistakes include:

- embedding credentials in source code
- storing secrets in shared repos
- logging them during execution
- using the same secrets across environments

---

## 5. Key learning goals

By the end of this topic, you should be able to:

- explain the difference between configuration and secrets
- describe how environment-specific values should be managed
- identify common security problems in ETL configuration
- reason about safe access patterns for production data systems

---

## 6. Practice prompts

Try solving:

- design a configuration model for a dev/test/prod ETL pipeline
- explain how to handle secret rotation safely
- list which settings should never be included in a shared code repository

Good configuration and secrets management are essential for repeatable and secure ETL pipelines.
