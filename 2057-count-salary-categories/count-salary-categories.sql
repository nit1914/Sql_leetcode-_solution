# Write your MySQL query statement below
WITH categories AS (
    SELECT 'Low Salary' AS category
    UNION ALL
    SELECT 'Average Salary'
    UNION ALL
    SELECT 'High Salary'
),
counts AS (
    SELECT 
        CASE 
            WHEN income < 20000 THEN 'Low Salary'
            WHEN income BETWEEN 20000 AND 50000 THEN 'Average Salary'
            ELSE 'High Salary'
        END AS category,
        COUNT(*) AS accounts_count
    FROM Accounts
    GROUP BY category
)
SELECT 
    c.category,
    COALESCE(cnt.accounts_count, 0) AS accounts_count
FROM categories c
LEFT JOIN counts cnt
ON c.category = cnt.category;