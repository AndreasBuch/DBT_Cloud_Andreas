with base as (
    select *
    from {{ ref('call2_vod_raw') }}
),

-- Reference the new ephemeral model for failures
excluded as (
    select Id from {{ ref('failures_call2_vod_raw') }}
),

final as (
    select base.*
    from base
    left join excluded
        on base.Id = excluded.Id
    where excluded.Id is null  -- Only keep rows that are NOT excluded
)

select * from final
