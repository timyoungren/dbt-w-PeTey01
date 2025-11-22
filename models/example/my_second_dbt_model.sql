
-- Use the `ref` function to select from other models

select 
  id as parent_id,
  greeting
from {{ ref('my_first_dbt_model') }}
-- where id = 1
