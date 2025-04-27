{% test call2_vod_row_count_after_join(model, base_model, reference_model) %}

with original as (
    select count(*) as original_count
    from {{ ref(base_model) }}
),
transformed as (
    select count(*) as transformed_count
    from {{ ref(reference_model) }}
)

select
    'Row count mismatch' as error_message
from original, transformed
where original.original_count != transformed.transformed_count

{% endtest %}
