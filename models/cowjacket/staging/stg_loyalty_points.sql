with source as (

    select * 
    from {{ source('cowjacket_raw', 'loyalty_points') }}

),

renamed as (

    select
        loyalty_id,
        customer_id,
        points_earned,
        transaction_date,
        source
    from source

)

select *
from renamed
