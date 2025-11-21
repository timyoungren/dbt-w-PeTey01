
    
    

with child as (
    select parent_id as from_field
    from `dbt-petey-01`.`dbt_timyoungren_dev`.`my_second_dbt_model`
    where parent_id is not null
),

parent as (
    select id as to_field
    from `dbt-petey-01`.`dbt_timyoungren_dev`.`my_first_dbt_model`
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


