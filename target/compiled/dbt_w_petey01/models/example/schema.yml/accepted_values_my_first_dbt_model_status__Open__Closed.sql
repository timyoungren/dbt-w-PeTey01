
    
    

with all_values as (

    select
        status as value_field,
        count(*) as n_records

    from `dbt-petey-01`.`dbt_timyoungren_dev`.`my_first_dbt_model`
    group by status

)

select *
from all_values
where value_field not in (
    'Open','Closed'
)


