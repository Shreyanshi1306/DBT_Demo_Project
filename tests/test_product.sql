SELECT *
FROM {{ ref('stg_product') }}
WHERE PRODUCT_PRICE < 0
and PRODUCT_COST < 0