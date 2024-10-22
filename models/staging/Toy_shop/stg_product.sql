select 
    PRODUCT_ID::int as PRODUCT_ID,
    PRODUCT_NAME::string as PRODUCT_NAME,
    PRODUCT_CATEGORY::string as PRODUCT_CATEGORY,
    {{ clean_currency('PRODUCT_COST') }} as PRODUCT_COST,
    {{ clean_currency('PRODUCT_PRICE') }} as PRODUCT_PRICE
from {{ source('toy_shop', 'products')}}