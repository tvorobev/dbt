-- метод материализации, то есть просто вьюха, если нужна таблица - materialized='table', дальше реализуем это
{{ config(materialized='view') }}

with orders_full as (
select * from {{ source('default', 'orders') }} join {{ source('default', 'district') }} 
on {{ source('default', 'orders') }}.OrderID = {{ source('default', 'district') }}.OrderID
)

select *
from orders_full