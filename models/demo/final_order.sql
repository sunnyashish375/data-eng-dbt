{{
    config(
        materialized='table'
    )
}}

with clean_orders as (

    select 
    *,
    CURRENT_TIMESTAMP as INSERT_DTS
    from {{ ref('final_order') }}
)
select * from clean_orders