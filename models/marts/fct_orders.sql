 -- This model joins our staging tables to create a final rich orders table

with orders as (
    select * from {{ ref('stg_orders')}}
),

customers as (
    select * from {{ ref('stg_customers')}}
),

products as (
    select * from{{ ref("stg_products")}}
),

final as (

    select
        --Select from orders table
        o.order_id,
        o.ordered_at,
        o.order_status,
        o.total_price,
        o.quantity,

        --Select from customers table
        c.first_name,
        c.last_name,
        c.email,
        c.country as customer_country,
    
        -- Select from products table
        p.product_name,
        p.product_category

    from orders o
    left join customers c on o.customer_id = c.customer_id
    left join products p on o.product_id = p.product_id
)

select * from final
 