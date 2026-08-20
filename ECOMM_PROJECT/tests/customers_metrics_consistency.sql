SELECT * 
FROM {{ ref('customers') }}
WHERE first_order is NULL 
    AND (
        most_recent_order IS NOT NULL
        OR number_of_orders !=0
        OR customer_lifetime_value !=0
    )