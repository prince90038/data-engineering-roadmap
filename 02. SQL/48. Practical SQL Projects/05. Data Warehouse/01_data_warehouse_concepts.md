# Data Warehouse Project

## Goal

Build a small data warehouse with a star schema for analytical reporting.

---

## Example schema

```text
             dim_customer
                  │
                  │
dim_product ─ fact_sales ─ dim_date
                  │
                  │
             dim_location
```

---

## Core concepts

- fact table stores measurable events
- dimension tables store descriptive attributes
- fact tables join to dimensions for analysis
- the grain defines the unit of each row

---

## Example reporting questions

- total sales by month
- sales by customer and product
- revenue by region
- top products by category

---

## SQL skills used

- star schema modeling
- joins
- group by aggregation
- time-based reporting
- dimension-based analysis

This project helps you understand how analytical data systems are built in real warehouse environments.
