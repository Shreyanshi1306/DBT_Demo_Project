select * 
from {{ ref('stg_sales') }}
where product_units_sold < 0