{{ config(
    materialized='ephemeral'
) }}

with 
unique_failures as (
    select UNIQUE_FIELD as Id
    from {{ target.schema }}_DBT_TEST__AUDIT.UNIQUE_TERRITORY2_RAW_ID
),
not_null_failures as (
    select Id
    from {{ target.schema }}_DBT_TEST__AUDIT.NOT_NULL_TERRITORY2_RAW_ID
),

-- Combine all failure Ids into a single set
all_failures as (
    select Id from unique_failures
    union all
    select Id from not_null_failures
)

select * from all_failures
