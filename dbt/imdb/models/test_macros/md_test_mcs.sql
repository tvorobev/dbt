{% set my_timestamp = datetime_to_timestamp('2023-01-01T12:00:00') %}

SELECT 
    {{ my_timestamp }} as timestamp_value