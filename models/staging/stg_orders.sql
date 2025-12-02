
/*
    Welcome to your second dbt staging model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='view') }}

with source as (

    select 
        cast(id as int64)       as order_id
        , cast(customer_id as int64)       as customer_id
        , cast(order_date as date) as order_date
        , status as order_status
    from {{ source('raw', 'orders')}}

),

final as (

    select 
        order_id
        , customer_id
        , order_date
        , order_status
        , current_timestamp() as record_loaded_at
    from source

)

select *
from final

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
