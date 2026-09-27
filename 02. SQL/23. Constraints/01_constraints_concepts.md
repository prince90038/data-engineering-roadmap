# Constraints in SQL

## 1. What are constraints?

Constraints are rules enforced by the database to protect the integrity of data.

They help ensure that invalid or inconsistent records are not inserted, updated, or deleted.

---

## 2. PRIMARY KEY

A primary key uniquely identifies each row in a table.

```sql
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100)
);
```

This ensures no two rows can share the same primary key.

---

## 3. FOREIGN KEY

A foreign key references a key in another table.

```sql
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
```

This enforces referential integrity between related tables.

---

## 4. UNIQUE

A unique constraint ensures values in a column or set of columns are distinct.

```sql
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    email VARCHAR(100) UNIQUE
);
```

This prevents duplicate emails.

---

## 5. NOT NULL

A `NOT NULL` constraint ensures a field cannot be empty or missing.

```sql
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);
```

---

## 6. CHECK

A `CHECK` constraint ensures values satisfy a logical condition.

```sql
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    price DECIMAL(10,2) CHECK (price > 0)
);
```

This helps prevent invalid values, such as negative prices.

---

## 7. DEFAULT

A `DEFAULT` value is used when a value is not supplied.

```sql
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

---

## 8. Composite keys

A composite key is a key made from multiple columns.

```sql
CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    PRIMARY KEY (order_id, product_id)
);
```

This is useful when a single column is not sufficient to uniquely identify a row.

---

## 9. Why constraints matter in data engineering

Constraints help protect data quality and reduce bad data entering the warehouse.

They are especially useful for:

- preserving referential integrity
- catching invalid values early
- preventing duplicate records
- enforcing required fields

---

## 10. Key learning goals

By the end of this topic, you should be able to:

- explain `PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE`, `NOT NULL`, `CHECK`, and `DEFAULT`
- explain how they improve data integrity
- identify when a composite key is appropriate

---

## 11. Practice prompts

Try solving:

- create a table where every customer has a unique email
- enforce that product prices cannot be negative
- ensure orders always reference an existing customer
- use a composite primary key in an order item table

Constraints are a foundational part of reliable database design.
