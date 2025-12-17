with loyalty as (
    select * from {{ ref('stg_loyalty_points') }}
)

select
    customer_id,
    sum(points_earned) as total_loyalty_points
from loyalty
group by customer_id
