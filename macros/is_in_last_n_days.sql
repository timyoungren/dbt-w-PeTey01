{% macro is_in_last_n_days(date_to_check, n_days) %}
    {{ date_to_check }} >= date_sub( current_date(), interval {{ n_days }} day )
{% endmacro %}