# Data Contracts

## 1. What is a data contract?

A data contract is an agreement between data producers and data consumers about the expected shape and meaning of data.

It defines what is expected and what should be treated as a breaking change.

---

## 2. Typical contract elements

A data contract may include:

- schema
- data types
- required fields
- semantic meaning
- expected values
- versioning rules

---

## 3. Why contracts matter

Without a contract, producers and consumers may interpret fields differently.

This can cause silent breakage, invalid dashboards, and expensive debugging.

---

## 4. Breaking changes

Examples of breaking changes include:

- removing a required field
- changing a column type
- changing what a flag means
- renaming a field without versioning

These are dangerous because downstream consumers may fail unexpectedly.

---

## 5. Best practices

Good data contracts include:

- versioning and change management
- backward compatibility rules
- clear owner responsibilities
- documentation on semantics
- validation in CI/CD or pipeline checks

---

## 6. Key learning goals

By the end of this topic, you should be able to:

- explain what a data contract is
- identify the major elements of a contract
- describe why contract changes can break downstream consumers
- reason about schema versioning and compatibility

---

## 7. Practice prompts

Try solving:

- draft a data contract for a customer profile feed
- explain why renaming a field without notice is a breaking change
- list contract checks you would enforce before production deployment

Data contracts help teams communicate and protect the meaning of shared data.
