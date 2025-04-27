with 
base as (
    select *
    from {{ ref('call2_vod_cleaned') }}
),
recordtype as (
    select *
    from {{ ref('recordtype_cleaned') }}
    where name <> 'DOUBLE DATA ENTRY'
),
joined as (
    select f.*, r.name as recordtype  -- Rename 'name' to 'recordtype'
    from base f
    join recordtype r
        on f.recordtypeid = r.id  -- Adjust the join condition
)

select * from joined
