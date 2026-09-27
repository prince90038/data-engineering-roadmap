# Ranking Problems in SQL

## 1. Why ranking problems matter

Ranking problems are extremely common in SQL interviews and analytics work. They are used to answer questions like:

- Who is the top-paid employee in each department?
- Which products rank first in sales by category?
- What is the second-highest salary in the company?

These problems usually require a combination of ordering, partitioning, and window functions.

---

## 2. Common ranking functions

The main ranking functions are:

- `ROW_NUMBER()`
- `RANK()`
- `DENSE_RANK()`
- `NTILE()`

Each one behaves a little differently when there are ties.

---

## 3. ROW_NUMBER

`ROW_NUMBER()` assigns a unique number to each row in a partition.

```sql
SELECT
    employee_id,
    department_id,
    salary,
    ROW_NUMBER() OVER (
        PARTITION BY department_id
        ORDER BY salary DESC
    ) AS row_num
FROM employees;
```

Use this when you need a unique ranking, such as selecting the top row per group.

---

## 4. RANK

`RANK()` gives the same rank to tied rows and then skips values.

```sql
SELECT
    employee_id,
    salary,
    RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;
```

Example: if two employees tie for first, the next employee gets rank 3.

---

## 5. DENSE_RANK

`DENSE_RANK()` also gives tied rows the same rank, but it does not skip values.

```sql
SELECT
    employee_id,
    salary,
    DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_salary_rank
FROM employees;
```

This is often preferred when you want compact ranking without gaps.

---

## 6. Top N per group

A common pattern is selecting the top N rows within each partition.

```sql
WITH ranked AS (
    SELECT
        employee_id,
        department_id,
        salary,
        ROW_NUMBER() OVER (
            PARTITION BY department_id
            ORDER BY salary DESC
        ) AS rn
    FROM employees
)
SELECT *
FROM ranked
WHERE rn <= 3;
```

This is a standard Data Engineering interview pattern.

---

## 7. Second-highest salary

```sql
SELECT MAX(salary) AS second_highest_salary
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
);
```

Alternative window-based method:

```sql
WITH ranked AS (
    SELECT salary,
           DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
    FROM employees
)
SELECT salary
FROM ranked
WHERE rnk = 2;
```

---

## 8. Ranking with partitions

Partitioning allows ranking inside groups.

```sql
SELECT
    department_id,
    employee_id,
    salary,
    RANK() OVER (
        PARTITION BY department_id
        ORDER BY salary DESC
    ) AS dept_rank
FROM employees;
```

This is useful for department-wise salary comparisons.

---

## 9. Percentiles and buckets

`NTILE()` is often used to divide rows into buckets.

```sql
SELECT
    employee_id,
    salary,
    NTILE(4) OVER (ORDER BY salary DESC) AS quartile
FROM employees;
```

This helps with segmentation and reporting buckets, such as top 25%, middle 50%, and bottom 25%.

---

## 10. Common interview patterns

Ranking questions often include:

- highest salary per department
- Nth highest salary
- top 3 products per category
- first purchase per customer
- employees with the top five salaries
- latest transaction per customer

---

## 11. Key learning goals

By the end of this topic, you should be able to:

- explain the difference between `ROW_NUMBER`, `RANK`, and `DENSE_RANK`
- rank rows within partitions
- identify the correct function for top-N and tie scenarios
- use window functions to solve ranking interview questions

---

## 12. Practice prompts

Try solving:

- second highest salary
- top 3 salaries per department
- customers with the most recent order per month
- products ranked by revenue within each category
- identify employees tied on salary

Ranking problems are a core part of SQL interview preparation and real-world analytics logic.
