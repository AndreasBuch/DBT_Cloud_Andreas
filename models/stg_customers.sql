select
    id as customer_id,
    first_name,
    last_name,
    {{ var('region') }} as region

from {{ source('jaffle_shop', 'customers') }}