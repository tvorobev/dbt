-- строим модель поверх другой модели, просто для примера

{{ config(materialized='table') }}

-- {{ ref("orders_full") }} - ссылка на модель orders_full
select OrderID, count(*) as cnt from {{ ref("orders_full") }}
group by OrderID

-- как пример - можно использовать jinja для многих вещей. например, если окружение dev - то добавляем limit 100, чтобы не дергать всю таблицу
{% if target.name=='dev' %}
limit 100
{% endif %}