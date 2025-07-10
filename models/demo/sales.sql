
{{
    config(
        materialized='incremental',
        incremental_strategy = 'append'
    )
}}

with sales_src as 
(
 select 
 * 
 from {{SOURCE('sales', 'SALES_SRC')}}
 
 {% if is_incremental()%}
 CREATED_AT > (SELECT MAX(INSERT_DTS) FROM {{this}})
 {%endif%}
)
SELECT * FROM sales_src