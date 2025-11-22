{% test no_dupe_ids(model, column_name) %}
    -- Fail if any values in the column are in the future (after today)
    select {{ column_name }}, count(*) as dupe_count
    from {{ model }}
    group by 1
    having count(*) > 1
{% endtest %}
