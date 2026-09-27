# String Functions in SQL

## 1. Why string functions matter

String functions are essential for cleaning, standardizing, filtering, and parsing text data in data engineering pipelines.

They are commonly used for:

- normalizing names and IDs
- removing extra spaces
- parsing domain names
- extracting substrings
- cleaning inconsistent values
- preparing data for joins and reporting

---

## 2. Common string functions

### LOWER / UPPER

```sql
SELECT LOWER('DATA ENGINEERING');
SELECT UPPER('data engineering');
```

These are useful for case-insensitive comparisons and standardizing values.

---

### TRIM, LTRIM, RTRIM

```sql
SELECT TRIM('  hello  ');
SELECT LTRIM('  hello');
SELECT RTRIM('hello  ');
```

These help remove unwanted leading or trailing spaces before processing values.

---

### LENGTH

```sql
SELECT LENGTH('data');
```

This is useful for validation, checking field size, and filtering values by length.

---

### SUBSTRING

```sql
SELECT SUBSTRING('data-engineering', 1, 4);
```

This is used to extract a portion of a string, such as a code prefix or a date piece.

---

### REPLACE

```sql
SELECT REPLACE('data engineering', ' ', '-');
```

This is helpful for cleaning and standardizing text values.

---

### CONCAT / CONCAT_WS

```sql
SELECT CONCAT(first_name, ' ', last_name)
FROM customers;

SELECT CONCAT_WS('-', city, country, region)
FROM locations;
```

These combine pieces of text into a single value.

---

### POSITION / STRPOS

```sql
SELECT POSITION('eng' IN 'data engineering');
```

Useful when searching for a substring inside a larger string.

---

## 3. Real-world examples

```sql
SELECT
    customer_id,
    TRIM(first_name) AS first_name_clean,
    UPPER(city) AS city_upper
FROM customers;
```

```sql
SELECT
    email,
    SUBSTRING(email, 1, POSITION('@' IN email) - 1) AS username
FROM users;
```

These are typical steps in ETL pipelines when values are inconsistent.

---

## 4. Cleaning messy data

String functions are commonly used to handle:

- extra spaces
- mixed casing
- malformed IDs
- inconsistent formatting
- duplicate-like values that differ only by spaces or punctuation

Example:

```sql
SELECT DISTINCT LOWER(TRIM(email))
FROM customers;
```

This helps normalize values before deduplication or joins.

---

## 5. String functions in joins and filters

```sql
SELECT c.customer_id, c.first_name
FROM customers c
JOIN user_accounts u
    ON LOWER(TRIM(c.email)) = LOWER(TRIM(u.email));
```

This pattern is useful when source data contains inconsistent spacing or case differences.

---

## 6. Data quality checks

String functions can help detect invalid or corrupted values:

```sql
SELECT *
FROM customers
WHERE email IS NULL OR TRIM(email) = '';
```

```sql
SELECT *
FROM products
WHERE LENGTH(product_code) < 5;
```

These checks are common in validation and QA queries.

---

## 7. Database differences

Some string function names vary slightly by database:

- PostgreSQL: `POSITION`, `TRIM`, `SUBSTRING`, `CONCAT`
- MySQL: `SUBSTRING`, `TRIM`, `LOWER`, `UPPER`
- SQL Server: `SUBSTRING`, `LTRIM`, `RTRIM`, `UPPER`, `LOWER`

The concepts are the same even though the syntax may vary slightly.

---

## 8. Key learning goals

By the end of this topic, you should be able to:

- use `LOWER`, `UPPER`, and `TRIM`
- extract substrings and clean text values
- combine strings in a readable way
- standardize IDs and names before joins
- use string functions in data quality checks

---

## 9. Practice prompts

Try solving:

- normalize customer emails to lowercase and trimmed values
- extract the domain from an email address
- remove extra spaces from names before deduplication
- detect malformed product codes
- compare rows after standardizing casing and spacing

String functions are foundational for preparing raw text data for real analytics and ETL jobs.
