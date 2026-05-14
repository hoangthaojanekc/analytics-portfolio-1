with orders as (
    select * from {{ ref('stg_orders') }}
),

users as (
    select * from {{ ref('stg_users') }}
),

final as (
    select
        o.order_id,
        o.user_id,
        o.status,
        -- Using your new macro here:
        {{ get_order_status_category('o.status') }} as status_category,
        o.order_created_at,
        u.country as user_country,
        u.age as user_age,
        o.item_count
    from orders o
    left join users u on o.user_id = u.id
)

select * from final