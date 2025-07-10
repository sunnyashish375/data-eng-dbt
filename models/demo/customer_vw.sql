{{
    CONFIG(
        materialized='view'
    )
}}

select * FROM {{ ref('customer')}}
where COUNTRY ='USA'