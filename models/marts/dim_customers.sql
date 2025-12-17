-- models/cowjacket/marts/dim_customers.sql

with customers as (
    select * from {{ ref('stg_customers') }}
),

loyalty as (
    select * from {{ ref('customer_loyalty') }}
)

select
    c.customer_id,
    c.full_name,
    c.email,
    c.join_date,
    coalesce(l.total_loyalty_points, 0) as total_loyalty_points
from customers c
left join loyalty l
    on c.customer_id = l.customer_id
