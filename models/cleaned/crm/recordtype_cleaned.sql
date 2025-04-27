with source as (

    select * from {{ source('PHARMA_COMMERCIAL', 'recordtype') }}

)

select * from source
