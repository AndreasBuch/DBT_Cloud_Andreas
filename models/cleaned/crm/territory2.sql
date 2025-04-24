with 

source as (

    select * from {{ source('pharma_commercial', 'territory2') }}

),
--iConnect names in the comment
renamed as (

    select
        Id
        ,ParentTerritory2Id
        ,Description
        ,Name
        ,Territory2ModelId

        ,mck_Territory2TypeId
        ,mck_Global_Business_Unit__c
        ,mck_Territory_Type__c
        ,mck_Country__c
        ,mck_Team__c
        ,mck_Level__c
        ,mck_Local_Business_Unit__c
    from source

)

select * from renamed