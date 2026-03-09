with orders as (

    select * from {{ ref('stg_maven__orders') }}

),

sessions as (

    select * from {{ ref('stg_maven__website_sessions') }}

)

select
    o.order_id,
    o.order_created_at,
    o.website_session_id,
    o.user_id as order_user_id,
    o.primary_product_id,
    o.items_purchased,
    o.price_usd,
    o.cogs_usd,
    s.session_created_at,
    s.user_id as session_user_id,
    s.is_repeat_session,
    s.utm_source,
    s.utm_campaign,
    s.utm_content,
    s.device_type,
    s.http_referer
from orders o
left join sessions s
    on o.website_session_id = s.website_session_id
