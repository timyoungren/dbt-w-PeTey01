{% test no_future_dates(model, column_name) %}
    -- Fail if any values in the column are in the future (after today)
    select *
    from {{ model }}
    where {{ column_name }} > current_date()
{% endtest %}
