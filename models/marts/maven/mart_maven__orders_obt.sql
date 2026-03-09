with base as (

    select * from {{ ref('int_maven__orders_with_sessions') }}

),

final as (

    select
        order_id,
        order_created_at,
        website_session_id,
        order_user_id,
        primary_product_id,
        items_purchased,
        price_usd,
        cogs_usd,
        price_usd - cogs_usd as gross_profit_usd,
        session_created_at,
        session_user_id,
        is_repeat_session,
        utm_source,
        utm_campaign,
        utm_content,
        device_type,
        http_referer
    from base

)

select * from final
