with source as (

    select * from {{ source('maven_raw', 'website_sessions') }}

),

renamed as (

    select
        website_session_id,
        created_at as session_created_at,
        user_id,
        is_repeat_session,
        utm_source,
        utm_campaign,
        utm_content,
        device_type,
        http_referer
    from source

)

select * from renamed
