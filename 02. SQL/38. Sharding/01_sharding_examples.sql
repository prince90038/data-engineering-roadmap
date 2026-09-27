-- Sharding examples
-- Conceptual example of data distribution across multiple shards.

CREATE TABLE customer_records (
    customer_id INT,
    customer_name VARCHAR(200),
    region VARCHAR(50),
    created_at DATE
);

INSERT INTO customer_records (customer_id, customer_name, region, created_at)
VALUES
    (1, 'Alice', 'us-east', '2025-01-01'),
    (2, 'Bob', 'eu-west', '2025-01-02'),
    (3, 'Charlie', 'ap-south', '2025-01-03'),
    (4, 'Diana', 'us-east', '2025-01-04');

-- Example: selecting by region can reduce data scanning on a shard
SELECT *
FROM customer_records
WHERE region = 'us-east';

-- Example: shard key-aware grouping
SELECT region, COUNT(*) AS customer_count
FROM customer_records
GROUP BY region;

-- Example: small demonstration of hotspot concern
SELECT region, COUNT(*)
FROM customer_records
GROUP BY region
ORDER BY COUNT(*) DESC;

-- Cleanup
-- DROP TABLE IF EXISTS customer_records;
