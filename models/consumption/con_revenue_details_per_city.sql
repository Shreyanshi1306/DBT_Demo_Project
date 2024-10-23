with 
ps as ( select * from {{ ref('cur_product_sales')}} ),
ss as ( select * from {{ ref('cur_stores_sales')}} ),

revenue_details as (
    select 
        ps.store_city,
        ss.no_of_store_per_city,
        sum(ps.revenue_per_product) as total_revenue,
        sum(ps.cost_per_product) as total_cost,
        total_revenue - total_cost as total_profit
    from 
        ps join ss
    on 
        ps.store_city = ss.store_city
    group by 
        ps.store_city,
        ss.no_of_store_per_city
)

select * from revenue_details