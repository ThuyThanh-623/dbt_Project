with cleaned_data as (
    select
        term as search_term,
        rank,
        score,
        refresh_date,
        country_name,
        country_code,
        region_name,
        region_code,
        week
    from {{ source("google_trends", "international_top_terms") }}
    where
        week >= '2023-01-01'
        and term is not null
        and country_code is not null
)

select distinct *
from cleaned_data

