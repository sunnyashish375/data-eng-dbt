{{ config(
    materialized = 'table'
)
}}

with session_src as (
    select 
    session_id,
    user_id,
    browser,
    device_type,
    b.country_code as country_name,
    b.continent as continent,
    b.currency as currency,
    start_time,
    end_time,
    pages_vistied,
    CURRENT_TIMESTAMP as insert_dts
    from {{source('country', 'SESSION_SRC')}} a
    left join {{ref('country_code')}} b
    on a.country_code = b.country_code
)