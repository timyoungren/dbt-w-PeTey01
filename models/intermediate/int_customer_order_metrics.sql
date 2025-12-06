with orders as (
    select
        customer_id,
        price,
        order_date
    from {{ ref('stg_orders') }}
),

agg as (
    select
        customer_id,

        -- total orders / spend
        count(*) as total_orders,
        sum(price) as total_spend,

        -- last 90 days
        countif( {{ is_in_last_n_days('order_date', 90) }} ) as orders_90d,
        sum( case when {{ is_in_last_n_days('order_date', 90) }} then price end ) as spend_90d

    from orders
    group by customer_id
)

select *
from agg
