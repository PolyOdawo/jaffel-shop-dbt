with 

source as (

    select * from {{ source('stripe', 'payment') }}

),

renamed as (

    select
        id as order_id,
        orderid,
        paymentmethod,
        status as payment_status,
        (amount/100) as amount,
        created as created_at,
        _batched_at

    from source

)

select * from renamed