with summary AS (
    SELECT 
        order_date,
        customer_name,
        product,
        SUM(quantity) as total_quantity
    FROM {{ ref('worders') }}
    GROUP BY 1,2,3
)

SELECT * FROM summary