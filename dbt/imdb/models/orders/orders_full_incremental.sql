-- вся конфигурация модели в dbt/imdb/models/orders/orders_full_incremental.yml

select t1.* except (dt_load), t2.* except (OrderID, dt_load), now() dt_load
from {{ source('default', 'order_norm') }} t1 join {{ source('default', 'district') }} t2
on t1.OrderID = t2.OrderID

{% if is_incremental() %}

  -- {{ this }} - представление таблицы данной модели. Удобно чтобы обрабатывать только те данные из источника,
  -- которые старше времени последнего запуска.
where dt_load >= (select max(dt_load) from {{ this }} )

{% endif %}

-- как пример - можно использовать jinja для многих вещей. например, если окружение dev - то добавляем limit 100, чтобы не дергать всю таблицу
{% if target.name=='dev' %}
limit 100
{% endif %}