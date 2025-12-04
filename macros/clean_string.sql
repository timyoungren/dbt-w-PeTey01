{% macro clean_string(string_to_clean) %}
    -- Trim leading/trailing spaces and make lower case
    trim(lower( {{ string_to_clean }} ))
{% endmacro %}