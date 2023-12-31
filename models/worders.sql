SELECT 
        o.order_date,
        c.name as customer_name,
        o.product,
        o.quantity
    FROM {{ source('raw', 'orders') }} o
    JOIN {{ source('raw', 'customers') }} c ON o.customer_id = c.id
