with source as (

    select * from {{ source('PHARMA_COMMERCIAL', 'territory2') }}

)

select * from source
