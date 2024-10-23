with deduplication as (
    select 
        PRODUCT_ID::int as PRODUCT_ID,
        PRODUCT_NAME::string as PRODUCT_NAME,
        PRODUCT_CATEGORY::string as PRODUCT_CATEGORY,
        {{ clean_currency('PRODUCT_COST') }} as PRODUCT_COST,
        {{ clean_currency('PRODUCT_PRICE') }} as PRODUCT_PRICE,
        ROW_NUMBER() OVER (PARTITION BY PRODUCT_ID ORDER BY PRODUCT_ID DESC) AS deduplicate
from {{ source('toy_shop', 'products')}}  
order by 
    product_id

)

select 
    product_id,
    PRODUCT_NAME,
    PRODUCT_CATEGORY,
    PRODUCT_COST,
    product_price
 from deduplication where deduplicate = 1