with source as (
    select * from {{ source('thelook', 'order_items') }}
),

renamed as (
    select
        id,
        order_id,
        user_id,
        product_id, 
        inventory_item_id,
        status,
        created_at as order_created_at,
        returned_at,
        shipped_at as order_shipped_at,
        delivered_at as order_delivered_at,
        sale_price
    from source
)

select * from renamed