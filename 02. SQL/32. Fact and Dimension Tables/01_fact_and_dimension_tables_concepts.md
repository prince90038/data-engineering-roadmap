# Fact and Dimension Tables

## 1. What is a fact table?

A fact table stores measurable events or transactions.

Examples include:

- sales
- payments
- orders
- page views
- shipments

Fact tables usually hold numeric measures such as:

- quantity
- revenue
- amount
- duration
- counts

---

## 2. What is a dimension table?

A dimension table stores descriptive attributes around the facts.

Examples include:

- customer
- product
- date
- location
- employee

Dimension tables describe who, what, when, where, and why a fact happened.

---

## 3. Grain of the fact table

The grain is the level of detail stored in a fact table.

Examples:

- one row per order
- one row per order item
- one row per hour of traffic
- one row per payment transaction

Choosing the correct grain is one of the most important modeling decisions.

---

## 4. Measures and dimensions

Measures are numeric values used for aggregation.

Examples:

```text
sales_amount
quantity
profit
cost
```

Dimensions are descriptive attributes used to slice and group data.

Examples:

```text
customer_name
product_category
order_date
city
```

---

## 5. Surrogate keys and natural keys

A natural key is a business identifier such as a customer ID or product code.

A surrogate key is an artificial key used inside the warehouse, often an incrementing integer or hash-based identifier.

Surrogate keys are commonly used to simplify joins and track history.

---

## 6. Common warehouse pattern

A warehouse often looks like this:

```text
fact_sales
  ├── order_id
  ├── customer_key
  ├── product_key
  ├── date_key
  └── sales_amount
```

This makes analytical queries easier to perform with joins to dimension tables.

---

## 7. Why fact and dimension tables matter

This model is useful because it separates:

- transactional quantitative data (facts)
- descriptive context (dimensions)

This makes reporting faster and easier to understand.

---

## 8. Key learning goals

By the end of this topic, you should be able to:

- explain the difference between fact and dimension tables
- describe grain and measures
- explain why dimensions are important in analytics
- differentiate natural keys from surrogate keys

---

## 9. Practice prompts

Try solving:

- identify the fact and dimension tables in a sales warehouse
- define the grain of a customer order fact table
- explain what a surrogate key adds in a dimension table
- design a minimal star schema for events data

Fact and dimension tables are central to modern analytical SQL design.
