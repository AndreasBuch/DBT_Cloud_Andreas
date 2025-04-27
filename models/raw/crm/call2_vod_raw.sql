with source as (

    select * from {{ source('PHARMA_COMMERCIAL', 'call2_vod') }}

)

select * from source