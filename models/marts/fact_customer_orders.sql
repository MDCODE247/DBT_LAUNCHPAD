-- models/cowjacket/marts/fact_customer_orders.sql
with
    customer_orders as (select * from {{ ref("customer_orders") }}),
    order_revenue as (select * from {{ ref("order_revenue") }})

select
    co.customer_id,
    count(co.order_id) as total_orders,
    sum(orv.revenue) as total_spent,
    max(co.order_date) as last_order_date
from customer_orders co
left join order_revenue orv on co.order_id = orv.order_id
group by co.customer_id
