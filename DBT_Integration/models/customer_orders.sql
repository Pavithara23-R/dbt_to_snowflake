with orders as (
    select * from {{ source('raw','orders') }}
    
),
customers as (
    select * from {{ ref('stg_customers') }}
)

select
    c.id,
    c.name,
    count(o.order_id) as total_orders,
    sum(o.amount) as total_revenue
from customers c
left join orders o on c.id = o.customer_id
group by 1, 2
