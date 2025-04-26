with failure_ids as (
    select * from {{ ref('failures_territory2_raw') }}
),

base as (
    select * 
    from {{ ref('territory2_raw') }}
),

cleaned as (
    select b.*
    from base b
    left join failure_ids f on b.id = f.id
    where f.id is null
)

select * from cleaned
