{{ config(
    materialized='ephemeral'
) }}

with 
unique_failures as (
    select UNIQUE_FIELD as Id
    from {{ target.schema }}_DBT_TEST__AUDIT.UNIQUE_CALL2_VOD_RAW_ID
),

-- Combine all failure Ids into a single set
all_failures as (
    select Id from unique_failures
)

select * from all_failures
