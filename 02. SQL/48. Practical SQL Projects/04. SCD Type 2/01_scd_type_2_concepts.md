# SCD Type 2 Project

## Goal

Build a slowly changing dimension that preserves historical versions of a changing attribute.

---

## Common design fields

A Type 2 dimension often contains:

- customer_id
- name
- city
- status
- effective_from
- effective_to
- is_current

---

## Business scenario

A customer’s city or status may change over time. The warehouse should maintain both the current version and historical versions.

---

## Why this matters

Without historical tracking, you cannot answer questions like:

- what was the customer’s status in January?
- which record was active on a specific date?

---

## SQL skills used

- `INSERT`
- `UPDATE`
- `CASE`
- date comparisons
- effective date logic
- history tracking

This is a classic data warehouse project and a common interview topic.
