-- models/staging/stg_customers_enriched.sql

with customers as (
    select *
    from {{ ref('stg_customers') }}
),

metrics as (
    select *
    from {{ ref('int_customer_order_metrics') }}
)

select
    c.*,
    m.total_orders,
    m.orders_90d,
    m.total_spend,
    m.spend_90d
from customers c
left join metrics m
    on c.customer_id = m.customer_id
