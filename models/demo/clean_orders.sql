{{
    config(
        materialized='ephemeral'
    )
}}

with base_orders as 
(
    select 
    order_id,
    order_date,
    customer_id,
    case when customer_Name is null then 'NA'
    ELSE UPPER(customer_name) END AS customer_name 
    from {{source('orders', 'BASE_ORDERS')}}
    where order_date is not null
)
select * from base_orders;