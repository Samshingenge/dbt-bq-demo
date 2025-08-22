-- This model cleans up the customers table
select
    customer_id,
    first_name,
    last_name,
    email,
    signup_date,
    country

from {{ source('food_tech_raw_data', 'customers') }}