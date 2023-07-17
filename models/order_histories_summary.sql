WITH order_histories_summary AS (
  SELECT
    oh.order_id,
    oh.customer_id,
    c.name as customer_name,
    o.product as product_name,
    o.order_date,
    oh.status
  FROM {{ source('raw', 'order_histories') }} as oh
  INNER JOIN {{ source('raw', 'customers') }} as c
    ON oh.customer_id = c.id
  INNER JOIN {{ source('raw', 'orders') }} as o
    ON oh.order_id = o.id
)

SELECT * FROM order_histories_summary
