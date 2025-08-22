-- This model cleans up the orders table and renames columns for clarity
select
    order_id,
    order_timestamp as ordered_at,
    customer_id,
    product_id,
    quantity,
    total_price,
    status as order_status

from {{ source('food_tech_raw_data', 'orders') }}