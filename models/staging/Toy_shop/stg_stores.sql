
{{ config(
    post_hook=[
        "ALTER TABLE {{ this }} ADD ROW ACCESS POLICY city_manager_access_policy ON (store_city)"
    ]
) }}

SELECT
    store_id::int AS store_id,
    {{ Initial_letter_capital( 'store_name' ) }}::string AS store_name,
    {{ Initial_letter_capital('store_city') }}::string AS store_city,
    {{ Initial_letter_capital('store_location') }}::string AS store_location,
    store_open_date::date AS store_open_date
FROM {{ source('toy_shop', 'stores') }}
