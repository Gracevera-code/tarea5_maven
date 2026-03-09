select 1 as error
where (
    select count(*) from {{ ref('mart_maven__orders_obt') }}
) != (
    select count(*) from {{ ref('stg_maven__orders') }}
)
