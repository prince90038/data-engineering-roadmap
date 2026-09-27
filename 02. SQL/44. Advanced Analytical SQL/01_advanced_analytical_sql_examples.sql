-- Advanced analytical SQL examples

CREATE TABLE user_events (
    user_id INT,
    event_date DATE,
    event_type VARCHAR(100)
);

INSERT INTO user_events (user_id, event_date, event_type)
VALUES
    (1, '2025-01-01', 'login'),
    (1, '2025-01-02', 'purchase'),
    (1, '2025-01-03', 'login'),
    (2, '2025-01-01', 'login'),
    (2, '2025-01-08', 'purchase'),
    (3, '2025-01-02', 'login'),
    (3, '2025-01-02', 'login');

-- 1. Running total of events per user
SELECT
    user_id,
    event_date,
    COUNT(*) OVER (PARTITION BY user_id ORDER BY event_date) AS running_event_count
FROM user_events;

-- 2. Rolling 7-day count
SELECT
    event_date,
    COUNT(*) AS daily_events,
    SUM(COUNT(*)) OVER (ORDER BY event_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS rolling_7_day_total
FROM user_events
GROUP BY event_date;

-- 3. Cohort-style grouping by first login date
WITH first_login AS (
    SELECT user_id, MIN(event_date) AS first_seen_date
    FROM user_events
    GROUP BY user_id
)
SELECT first_seen_date, COUNT(*) AS cohort_size
FROM first_login
GROUP BY first_seen_date;

-- 4. Retention check: users active in multiple periods
SELECT
    user_id,
    COUNT(DISTINCT event_date) AS active_days
FROM user_events
GROUP BY user_id;

-- Cleanup
-- DROP TABLE IF EXISTS user_events;
