WITH customer_order_count AS (
    SELECT
        c.customer_id,
        c.country,
        COUNT(i.invoice_id) AS 구매횟수
    FROM customers c
    JOIN invoices i ON c.customer_id = i.customer_id
    GROUP BY c.customer_id, c.country
)
SELECT
    country AS 국가명,
    COUNT(customer_id) AS 전체고객수,
    COUNT(CASE WHEN 구매횟수 >= 2 THEN 1 END) AS 두번이상구매고객수,
    ROUND(
        COUNT(CASE WHEN 구매횟수 >= 2 THEN 1 END) * 100.0
        / COUNT(customer_id),
        2
    ) AS 재구매율
FROM customer_order_count
GROUP BY country
ORDER BY 전체고객수 DESC;