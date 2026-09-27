-- String functions examples
-- Covers LOWER, UPPER, TRIM, SUBSTRING, REPLACE, CONCAT, and LENGTH.

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    email VARCHAR(200),
    city VARCHAR(100)
);

INSERT INTO customers (customer_id, first_name, email, city)
VALUES
    (1, '  Alice  ', 'ALICE@EXAMPLE.COM', ' london '),
    (2, 'bob', 'bob@example.com', 'Paris'),
    (3, 'Charlie', 'charlie@example.com', 'BERLIN'),
    (4, '  Diana  ', '  diana@example.com  ', 'Rome');

-- 1. Normalize case and trim spaces
SELECT
    customer_id,
    TRIM(first_name) AS clean_first_name,
    LOWER(TRIM(email)) AS normalized_email,
    UPPER(TRIM(city)) AS normalized_city
FROM customers;

-- 2. Extract username from email
SELECT
    customer_id,
    email,
    SUBSTRING(email, 1, POSITION('@' IN email) - 1) AS username
FROM customers;

-- 3. Replace spaces with hyphens
SELECT
    customer_id,
    REPLACE(city, ' ', '-') AS city_slug
FROM customers;

-- 4. Length check for malformed values
SELECT
    customer_id,
    email,
    LENGTH(email) AS email_length
FROM customers;

-- 5. Concatenate first and last name style values
SELECT
    customer_id,
    CONCAT(UPPER(TRIM(first_name)), ' ', UPPER(TRIM(city))) AS formatted_value
FROM customers;

-- 6. Find records with blank or missing email values
SELECT *
FROM customers
WHERE email IS NULL OR TRIM(email) = '';

-- 7. Standardize for join comparison
SELECT c.customer_id, c.email
FROM customers c
WHERE LOWER(TRIM(c.email)) IN ('alice@example.com', 'bob@example.com');

-- Optional cleanup
-- DROP TABLE IF EXISTS customers;
