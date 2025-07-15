WITH max_date AS (
    SELECT MAX(invoice_date)::date AS 기준일 FROM invoices
),
customer_first_order AS (
    SELECT
        customer_id,
        MIN(invoice_date)::date AS 첫구매일
    FROM invoices
    GROUP BY customer_id
),
invoices_last_12m AS (
    SELECT
        i.customer_id,
        DATE_TRUNC('month', i.invoice_date)::date AS 월
    FROM invoices i
    CROSS JOIN max_date m
    WHERE i.invoice_date >= (m.기준일 - interval '12 months')
),
labeled_customers AS (
    SELECT
        ilo.월,
        ilo.customer_id,
        CASE
            WHEN cf.첫구매일 >= ilo.월 AND cf.첫구매일 < (ilo.월 + interval '1 month') THEN '신규'
            ELSE '잔존'
        END AS 고객구분
    FROM invoices_last_12m ilo
    JOIN customer_first_order cf ON ilo.customer_id = cf.customer_id
)
SELECT
    월,
    COUNT(CASE WHEN 고객구분 = '신규' THEN 1 END) AS 신규고객수,
    COUNT(CASE WHEN 고객구분 = '잔존' THEN 1 END) AS 잔존고객수
FROM labeled_customers
GROUP BY 월
ORDER BY 월;S