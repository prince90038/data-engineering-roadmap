# Stored Procedures and Functions in SQL

## 1. What are stored procedures?

A stored procedure is a named collection of SQL statements stored in the database.

It can:

- accept parameters
- perform logic
- update data
- call other procedures or functions
- manage transaction control

Stored procedures are often used for business workflows.

---

## 2. What are functions?

A function is a reusable database object that returns a value.

Functions are often used in:

- calculations
- validations
- transformation logic
- expressions in `SELECT`, `WHERE`, and computed columns

Unlike procedures, functions are usually designed to return data rather than control program flow.

---

## 3. Key differences

Stored procedures:

- may not return a value directly
- can perform multiple operations
- are often used for procedural logic
- may support transaction handling

Functions:

- usually return a value
- can be used inside SQL expressions
- are designed for reusable logic
- are often simpler and more declarative

---

## 4. Parameters and variables

Both procedures and functions accept input and may use local variables.

Example parameters include:

- customer ID
- order amount
- threshold value
- date range

Parameters let the same logic be reused for different inputs.

---

## 5. Control flow

Database procedures and functions often include logic such as:

- `IF` conditions
- `CASE` expressions
- loops
- error handling

This allows business rules to live close to the data layer.

---

## 6. Exception handling

Many databases support error handling inside procedures and functions.

Examples of use cases:

- raising an error for invalid data
- handling missing customers
- validating amounts before updates

Error handling makes business logic more predictable and easier to debug.

---

## 7. Database-specific syntax

The exact syntax for procedures and functions varies by database system.

Examples:

- PostgreSQL uses `CREATE FUNCTION` and `CREATE PROCEDURE`
- SQL Server uses `CREATE PROCEDURE` and `CREATE FUNCTION`
- MySQL has similar but not identical patterns

The concept is the same even when syntax differs.

---

## 8. When to use them

Use a stored procedure when:

- multiple SQL steps must run together
- you need transaction-based business logic
- you want to keep workflow logic in the database

Use a function when:

- a value needs to be computed repeatedly
- it fits naturally into SQL expressions
- you want reusable calculation logic

---

## 9. Key learning goals

By the end of this topic, you should be able to:

- explain the role of stored procedures and functions
- differentiate between procedural logic and reusable calculations
- describe how parameters and variables are used
- understand why database-specific syntax varies

---

## 10. Practice prompts

Try solving:

- create a function that returns the total spend for a customer
- create a procedure that inserts an order and updates inventory
- explain when a function should be used instead of a procedure
- discuss how error handling improves data integrity

Stored procedures and functions help move business rules into the database layer.
