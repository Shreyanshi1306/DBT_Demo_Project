with 
store as 
    (select * from {{ ref('stg_stores') }} ),
sale as 
    (select * from {{ ref('stg_sales') }} ),

stores_sales as (
    select 
        store.store_city,
        count(distinct store.store_name) as no_of_store_per_city,
        sum( sale.product_units_sold ) as total_unit_sold,
    from 
        store join sale 
    on 
        store.store_id = sale.store_id
    group by 
        store.store_city
    order by 
        store.store_city
)

select * from stores_sales