-- orders_summary.sql

WITH base AS (
    SELECT 
        o.order_date,
        c.name as customer_name,
        o.product,
        o.quantity
    FROM {{ source('raw', 'orders') }} o
    JOIN {{ source('raw', 'customers') }} c ON o.customer_id = c.id
),

summary AS (
    SELECT 
        order_date,
        customer_name,
        product,
        SUM(quantity) as total_quantity
    FROM base
    GROUP BY 1,2,3
)

SELECT * FROM summary