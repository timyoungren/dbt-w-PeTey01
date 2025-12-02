
/*
    Welcome to your first dbt staging model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='view') }}

with source as (

    select 
        cast(id as int64)       as customer_id
        , first_name
        , last_name
        , cast(signup_date as date) as signup_date
    from {{ source('raw', 'customers')}}

),

final as (

    select 
        customer_id
        , first_name
        , last_name
        , signup_date
        , current_timestamp() as record_loaded_at
    from source

)

select *
from final

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
