select 1 as error
where (
    select count(*) from {{ ref('mart_maven__orders_obt') }}
) != (
    select count(*) from {{ ref('int_maven__orders_with_sessions') }}
)
