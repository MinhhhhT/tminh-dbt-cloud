WITH payments (
    SELECT * FROM {{ ref("stg_stripe_payments") }}
)

SELECT 
    order_id,
    SUM(amount) 
FROM payments
GROUP BY 
    order_id 
HAVING 
    SUM(amount) < 0