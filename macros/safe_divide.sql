{% macro safe_divide(numerator_column, denominator_column) %}
    -- Set to null if denominator_column is zero
    case
        when {{ denominator_column }} is null or {{ denominator_column }} = 0
            then null
        else {{ numerator_column }}/{{ denominator_column }}
    end 
{% endmacro %}
