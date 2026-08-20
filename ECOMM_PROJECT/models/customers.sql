{{ config(materialized='table') }}

SELECT
    c.id AS customer_id,
    c.first_name,
    c.last_name,
    MIN(o.order_date) AS first_order,
    MAX(o.order_date) AS most_recent_order,
    COUNT(DISTINCT o.id) AS number_of_orders,
    COALESCE(SUM(p.amount), 0) AS customer_lifetime_value

FROM {{ source('ecomm', 'RAW_CUSTOMERS') }} c

LEFT JOIN {{ source('ecomm', 'RAW_ORDERS') }} o
    ON c.id = o.user_id

LEFT JOIN {{ source('ecomm', 'RAW_PAYMENTS') }} p
    ON o.id = p.order_id

GROUP BY
    c.id,
    c.first_name,
    c.last_name