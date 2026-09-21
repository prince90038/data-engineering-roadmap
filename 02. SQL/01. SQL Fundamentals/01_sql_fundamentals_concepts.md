# SQL Fundamentals

## 1. Why SQL matters

SQL is the standard language used to interact with relational databases. It helps us:

- create and modify tables
- insert and update records
- query data for analysis
- validate data quality
- build reporting and ETL workflows
- support data warehouse and analytics platforms

In data engineering, SQL is used for both operational and analytical workloads.

---

## 2. Core database concepts

### Database
A database is a structured collection of data stored and managed by a database system.

### Table
A table stores data in rows and columns.

Example:

```sql
customers
--------
customer_id | first_name | city
-----------+------------+-----
1           | Alice      | London
2           | Bob        | Paris
```

### Row
A row is one record in a table.

### Column
A column represents a field or attribute.

### Schema
A schema is a logical grouping of database objects such as tables, views, and functions.

---

## 3. Primary keys and foreign keys

### Primary key
A primary key uniquely identifies each row in a table.

Example:

```sql
customer_id INT PRIMARY KEY
```

Rules:

- values must be unique
- cannot be NULL usually
- one table typically has one primary key

### Foreign key
A foreign key references the primary key of another table.

Example:

```sql
customer_id INT REFERENCES customers(customer_id)
```

This creates a relationship between tables.

---

## 4. Constraints

Constraints enforce rules on the data.

Common constraints:

- PRIMARY KEY
- FOREIGN KEY
- UNIQUE
- NOT NULL
- CHECK
- DEFAULT

Examples:

```sql
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    age INT CHECK (age >= 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

---

## 5. NULL values

NULL means "no value" or "unknown". It is not the same as the number `0` or an empty string.

Important rules:

- `NULL` is not equal to anything, including `NULL`
- comparisons with NULL usually return unknown
- functions like `COUNT(column)` ignore NULL values
- `COALESCE()` can replace NULL with a default value

Example:

```sql
SELECT COALESCE(phone_number, 'N/A') AS phone_number
FROM customers;
```

---

## 6. Data types

SQL has many data types depending on the database engine.

Examples:

- INTEGER / BIGINT
- DECIMAL / NUMERIC
- FLOAT / DOUBLE
- VARCHAR / TEXT
- BOOLEAN
- DATE
- TIME
- TIMESTAMP
- JSON / JSONB

Choosing the right type matters for:

- storage efficiency
- data correctness
- performance
- query behavior

---

## 7. Views

A view is a virtual table generated from a SQL query.

Example:

```sql
CREATE VIEW active_customers AS
SELECT customer_id, name, email
FROM customers
WHERE is_active = TRUE;
```

Views are useful for:

- simplifying complex queries
- restricting access to columns
- building reusable reporting logic

---

## 8. Basic SELECT query structure

The most common query pattern is:

```sql
SELECT column1, column2
FROM table_name
WHERE condition
ORDER BY column1;
```

Parts of the query:

- `SELECT`: choose which columns to return
- `FROM`: choose the table
- `WHERE`: filter rows
- `ORDER BY`: sort results
- `GROUP BY`: aggregate rows by a key
- `HAVING`: filter aggregated results
- `DISTINCT`: remove duplicates
- `LIMIT`: restrict the number of rows returned

---

## 9. Common SQL operations

### ORDER BY
Sort rows in ascending or descending order.

```sql
SELECT *
FROM orders
ORDER BY order_date DESC;
```

### GROUP BY
Group rows to compute aggregated values.

```sql
SELECT customer_id, COUNT(*)
FROM orders
GROUP BY customer_id;
```

### HAVING
Filter groups after aggregation.

```sql
SELECT customer_id, COUNT(*) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 2;
```

### DISTINCT
Remove duplicate rows from the result.

```sql
SELECT DISTINCT city
FROM customers;
```

### LIMIT
Return only a subset of rows.

```sql
SELECT *
FROM orders
LIMIT 10;
```

---

## 10. Important comparisons

### WHERE vs HAVING

- `WHERE` filters rows before aggregation
- `HAVING` filters grouped results after aggregation

### DISTINCT vs GROUP BY

- `DISTINCT` removes duplicate rows from the result set
- `GROUP BY` groups rows so aggregate functions can be used

### Primary key vs foreign key

- Primary key identifies records in a table
- Foreign key connects records in one table to records in another

---

## 11. Example of a small relational model

```sql
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    city VARCHAR(100),
    email VARCHAR(150) UNIQUE
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
```

This shows how one customer can have many orders.

---

## 12. Learning goals for this section

By the end of this section, you should be able to:

- explain what a table, row, and column are
- identify primary and foreign keys
- explain constraints and NULL behavior
- write basic `SELECT` queries
- use `WHERE`, `ORDER BY`, `GROUP BY`, `HAVING`, `DISTINCT`, and `LIMIT`
- understand the purpose of schemas and views
- explain the difference between data types and why they matter

---

## 13. Practice tips

- Write examples using small tables
- Create your own practice dataset
- Always compare expected output vs query result
- Focus on understanding logic, not memorizing syntax only
- Try rewriting the same question with different SQL clauses

This section builds the foundation for joins, window functions, ETL logic, and performance optimization.
