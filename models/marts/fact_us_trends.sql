{{ config(
    materialized='table',
    partition_by={
      "field": "date_id",
      "data_type": "date"
    }
) }}

select
    cast(week as date) as date_id,
    cast(dma_id as string) as location_id,
    search_term as term_id,
    rank,
    score,
    percent_gain,
    term_type,
    refresh_date
from {{ ref("int_us_trends") }}
