select 
    store_id::int store_id,
    product_id::int as product_id,
    stock_on_hand::int as Stock_left_in_stores
from {{ source('toy_shop', 'inventory') }}