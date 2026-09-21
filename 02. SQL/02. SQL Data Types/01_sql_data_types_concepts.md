# SQL Data Types

## 1. What are SQL data types?

SQL data types define the kind of value a column can hold. They help ensure that the database stores data consistently and predictably.

Choosing the correct data type matters because it affects:

- storage size
- performance
- validation rules
- sorting and comparison behavior
- compatibility with functions and joins

---

## 2. Common numeric types

### INTEGER
Used for whole numbers.

```sql
age INT
```

Good for:

- counts
- IDs
- quantities
- ages

### BIGINT
Used for large integers beyond the range of INT.

```sql
customer_id BIGINT
```

### DECIMAL / NUMERIC
Used for exact decimal values such as money or percentages.

```sql
price DECIMAL(10,2)
```

This is often preferred over FLOAT when precision matters.

### FLOAT / DOUBLE
Used for approximate numeric values.

```sql
ratio FLOAT
```

Useful for scientific or statistical values, but do not use for money when exact precision is required.

---

## 3. String types

### VARCHAR(n)
Variable-length character data with a maximum length.

```sql
name VARCHAR(100)
```

### TEXT
Used for longer text content.

```sql
description TEXT
```

### CHAR(n)
Fixed-length character data.

```sql
country_code CHAR(2)
```

Use `CHAR` when values are always a fixed length, like country or state codes.

---

## 4. Boolean types

Boolean values are true/false or yes/no values.

```sql
is_active BOOLEAN
```

In some databases, booleans are stored as `TRUE/FALSE`, `1/0`, or `Y/N` depending on the dialect.

---

## 5. Date and time types

### DATE
Stores only a date.

```sql
order_date DATE
```

### TIME
Stores time without a date.

```sql
start_time TIME
```

### TIMESTAMP
Stores both date and time.

```sql
created_at TIMESTAMP
```

### TIMESTAMP WITH TIME ZONE
Stores timezone-aware timestamp values.

```sql
event_time TIMESTAMP WITH TIME ZONE
```

These are important for analytics, event tracking, and auditing.

---

## 6. JSON and semi-structured data

Some databases support JSON columns.

```sql
payload JSON
```

or

```sql
metadata JSONB
```

This is useful when data is dynamic or not neatly modeled in strict relational columns.

Examples:

- API responses
- user metadata
- event payloads
- nested configuration

---

## 7. Type conversion

SQL often requires converting between data types.

```sql
CAST(price AS VARCHAR)
```

or

```sql
CAST(order_date AS DATE)
```

Type conversion is common in:

- ETL pipelines
- reporting queries
- data validation
- parsing strings into dates or numbers

---

## 8. Precision and scale

For DECIMAL and NUMERIC, precision and scale are important.

```sql
amount DECIMAL(10,2)
```

This means:

- 10 total digits
- 2 digits after the decimal point

Example values:

- 12345678.90
- 999.99

This is very useful for monetary values because it avoids floating-point precision issues.

---

## 9. Common interview points

Be ready to explain:

- why `DECIMAL` is better than `FLOAT` for money
- why `DATE` and `TIMESTAMP` are different
- why string length matters in `VARCHAR`
- when to use `BOOLEAN` vs `VARCHAR` flags
- how JSON is different from relational columns

---

## 10. Example table using multiple data types

```sql
CREATE TABLE sales_records (
    sale_id BIGINT PRIMARY KEY,
    customer_id INT NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    quantity INT,
    unit_price DECIMAL(10,2),
    total_amount DECIMAL(12,2),
    is_paid BOOLEAN DEFAULT FALSE,
    sale_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    metadata JSON
);
```

This table uses a mix of numeric, text, boolean, date, timestamp, and JSON data types.

---

## 11. Data type best practices

- choose the smallest practical type
- use `DECIMAL` for money
- use `TIMESTAMP` for event times
- store IDs as integers or big integers when appropriate
- keep JSON for flexible payloads, but avoid overusing it for deep relational modeling
- be careful with implicit conversions in queries

---

## 12. Key learning goal

By the end of this section, you should understand:

- the difference between integer, string, boolean, and date types
- why type choice matters for storage and accuracy
- when to use `DECIMAL` instead of floating-point types
- how SQL type conversions work in practice
