# Security

## 1. Why security matters in ETL

ETL pipelines move sensitive data, and they often connect to systems with credentials, private APIs, and regulated information.

Security is not just a platform feature. It is a design requirement.

---

## 2. Common risks

Common ETL security risks include:

- hardcoded credentials
- plaintext secrets in config files
- over-permissive database roles
- exposing sensitive values in logs
- insecure transport or weak encryption
- unvalidated data intake

---

## 3. Core security principles

A secure pipeline should follow these ideas:

- least privilege
- secret management
- encryption in transit and at rest
- access monitoring
- environment separation
- auditability

---

## 4. Least privilege

Services should only have the permissions they need.

For example, a load job should not also be able to delete records from unrelated tables unless that is explicitly required.

---

## 5. Secret management

Secrets should not live in source code.

Common patterns include:

- environment variables
- secret managers
- cloud key stores
- vault systems

---

## 6. Logging safely

Logs should not print raw credentials or customer PII.

Instead, log masked values, IDs, counts, and status messages.

---

## 7. Key learning goals

By the end of this topic, you should be able to:

- explain why ETL security is critical
- identify common pipeline vulnerabilities
- describe least-privilege access patterns
- explain how to manage secrets and redact sensitive output

---

## 8. Practice prompts

Try solving:

- design a secure configuration pattern for a production ETL job
- explain what happens if credentials are hardcoded into a pipeline script
- list three ways to reduce risk without slowing the pipeline down

Security is a first-class requirement, not an afterthought, in production data pipelines.
