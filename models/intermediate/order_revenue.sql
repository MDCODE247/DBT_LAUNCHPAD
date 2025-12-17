-- models/cowjacket/intermediate/order_revenue.sql

with orders as (
    select * from {{ ref('stg_orders') }}
),

order_items as (
    select order_id, line_total
    from {{ ref('stg_order_items') }}
)

select
    o.order_id,
    o.customer_id,
    o.order_date,
    sum(oi.line_total) as revenue
from orders o
join order_items oi
    on o.order_id = oi.order_id
group by o.order_id, o.customer_id, o.order_date
