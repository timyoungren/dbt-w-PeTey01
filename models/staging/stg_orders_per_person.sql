
/*
    It works! The fields in the macro call needed to be strings to be converted in the macro.
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='view') }}

with source as (

    select 
        cx1.customer_id
        , {{ safe_divide( 'count(o.order_id)', 'cx1.hh_size' ) }} as orders_per_person
        , cx1.hh_size
        , count(o.order_id) as order_count
    from {{ ref('stg_customers') }} AS cx1 LEFT JOIN {{ ref('stg_orders') }} AS o ON cx1.customer_id = o.customer_id
    group by cx1.customer_id, cx1.hh_size

),

final as (

    select 
        customer_id
        , orders_per_person
        , hh_size
        , order_count
    from source

)

select *
from final

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
