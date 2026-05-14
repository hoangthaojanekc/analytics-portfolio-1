with source as (
    select * from {{ source('thelook', 'users') }}
),

renamed as (
    select
        id,
        age,
        gender,
        state,
        country,
        traffic_source,
        created_at
    from source
)

select * from renamed