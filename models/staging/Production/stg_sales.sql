select 
    sale_id::int as sale_id,
    date::date as sales_date,
    store_id::int as store_id,
    product_id::int as product_id,
    units::int as product_units_sold
from {{ source('toy_shop', 'sales') }}