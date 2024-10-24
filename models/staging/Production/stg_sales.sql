{{ 
    config(
    materialized='incremental',
    unique_key='sale_id' 
    ) 
}}

with sales as (
    select 
        sale_id::int as sale_id,
        date::date as sales_date,
        store_id::int as store_id,
        product_id::int as product_id,
        units::int as product_units_sold
    from 
        {{ source('toy_shop', 'sales') }}

    {% if is_incremental() %} 
        WHERE 
            sale_id > (SELECT MAX(sale_id) FROM {{ this }})
    {% endif %}
)

select * from sales order by sale_id desc