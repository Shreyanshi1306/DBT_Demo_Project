with 
product as ( select * from {{ ref('stg_product') }} ),
store as ( select * from {{ ref('stg_stores') }} ),
sale as ( select * from {{ ref('stg_sales') }} ),

product_sales as (
    select 
        store.store_city,
        store.store_name,
        sale.product_id,
        product.product_price,
        sale.product_units_sold,
        (sale.product_units_sold * product.product_price) as revenue_per_product,
        ( sale.product_units_sold * product.PRODUCT_COST ) as cost_per_product
    from 
        product join sale 
    on
        product.product_id = sale.product_id join store 
    on
        sale.store_id = store.store_id
)

select * from product_sales