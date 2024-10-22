{% macro clean_currency(amount_column) -%}
    CAST(REPLACE(REPLACE({{ amount_column }}, '$', ''), ',', '') AS DECIMAL(10, 2))
{% endmacro %}