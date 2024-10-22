{% macro Initial_letter_capital(column_name) -%}
    INITCAP({{ column_name }})
{%- endmacro -%}