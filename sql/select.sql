SELECT
    p.product_name,
    SUM(s.quantity) AS total_quantity,
    SUM(s.total_amount) AS total_revenue
FROM `default`.sales AS s
INNER JOIN products AS p ON s.product_id = p.product_id
GROUP BY p.product_name;

SELECT
    c.customer_name,
    SUM(s.total_amount) AS total_spent
FROM sales AS s
INNER JOIN customers AS c ON s.customer_id = c.customer_id
GROUP BY c.customer_name;


SELECT
    d.month_name,
    d.year,
    SUM(s.total_amount) AS total_revenue
FROM sales AS s
INNER JOIN dates AS d ON s.date_id = d.date_id
GROUP BY d.month_name, d.year
ORDER BY d.year, d.month_name;


