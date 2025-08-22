-- This model cleans up the products table
select
    product_id,
    product_name,
    product_category,
    price_per_unit,
    in_stock

from {{ source('food_tech_raw_data', 'products') }}