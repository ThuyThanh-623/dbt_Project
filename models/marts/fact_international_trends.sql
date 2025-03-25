{{
    config(
        materialized="table", 
        partition_by={
            "field": "date_id",
             "data_type": "date"
        }
    )
}}

select
    cast(week as date) as date_id,
    coalesce(country_code || region_code, country_code) as location_id,
    search_term as term_id,
    rank,
    score,
    percent_gain,
    term_type,
    refresh_date
from {{ ref("int_international_trends") }}
