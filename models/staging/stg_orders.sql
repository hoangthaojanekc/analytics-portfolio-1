with source as (
    select * from {{ source('thelook', 'orders') }}
),

renamed as (
    select
        order_id,
        user_id,
        status,
        created_at as order_created_at,
        returned_at,
        shipped_at as order_shipped_at,
        delivered_at as order_delivered_at,
        num_of_item as item_count
    from source
)

select * from renamed