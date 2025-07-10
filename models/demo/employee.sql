{{
    config (
        materialized='table'
    )
}}


with employee_raw as (
    select * from {{('employee', 'EMPLOYEE_RAW')}}
)
select * from employee_raw