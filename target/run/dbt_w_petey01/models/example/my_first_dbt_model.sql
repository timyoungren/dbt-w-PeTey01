

  create or replace view `dbt-petey-01`.`dbt_timyoungren_dev`.`my_first_dbt_model`
  OPTIONS()
  as /*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/



with source_data as (

    select 1 as id, "Hello, Tim!" as greeting, 'Open' as status
    union all
    select 2 as id, "Hello, PeTey!" as greeting, 'Open' as status
    union all
    select 3 as id, "Hello, window!" as greeting, 'Closed' as status

)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null;

