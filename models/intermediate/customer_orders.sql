-- models/cowjacket/intermediate/customer_orders.sql
with orders as (
    select * from {{ ref('stg_orders') }}
),
customers as (
    select * from {{ ref('stg_customers') }}
)
select
    o.order_id,
    o.customer_id,
    o.order_date,
    o.total_amount,
    c.full_name,
    c.email
from orders o
left join customers c
    on o.customer_id = c.customer_id
