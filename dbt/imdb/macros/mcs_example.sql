-- макрос для примера, переводящий datetime в timestamp

{% macro datetime_to_timestamp(datetime_str) %}
    {% set datetime_obj = modules.datetime.datetime.fromisoformat(datetime_str) %}
    {{ return(datetime_obj.timestamp() | int) }}
{% endmacro %}