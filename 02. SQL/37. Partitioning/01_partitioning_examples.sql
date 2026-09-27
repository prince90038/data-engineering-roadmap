-- Partitioning examples

CREATE TABLE sales (
    sale_id INT,
    sale_date DATE,
    customer_id INT,
    amount DECIMAL(10,2)
);

INSERT INTO sales (sale_id, sale_date, customer_id, amount)
VALUES
    (1, '2025-01-10', 101, 150.00),
    (2, '2025-02-12', 102, 220.50),
    (3, '2025-03-02', 101, 80.00),
    (4, '2025-04-20', 104, 310.00),
    (5, '2025-05-07', 103, 505.75);

-- Query by date range; in a partitioned table this can prune irrelevant partitions
SELECT *
FROM sales
WHERE sale_date BETWEEN '2025-03-01' AND '2025-05-31';

-- Querying by customer is useful for targeted analysis
SELECT customer_id, SUM(amount) AS total_sales
FROM sales
WHERE customer_id = 101
GROUP BY customer_id;

-- Example of grouping by month to mimic partition-based reporting
SELECT
    EXTRACT(YEAR FROM sale_date) AS year_num,
    EXTRACT(MONTH FROM sale_date) AS month_num,
    SUM(amount) AS monthly_sales
FROM sales
GROUP BY EXTRACT(YEAR FROM sale_date), EXTRACT(MONTH FROM sale_date)
ORDER BY year_num, month_num;

-- Cleanup
-- DROP TABLE IF EXISTS sales;
