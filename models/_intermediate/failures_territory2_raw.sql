{{ config(materialized='ephemeral') }}
-- or use materialized='view' if you want debugging easier

{{ union_failed_ids('territory2_raw') }}
