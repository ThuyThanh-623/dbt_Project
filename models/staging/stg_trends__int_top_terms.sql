with cleaned_data as (
    select
        country_code as country_code,
        country_name as country_name,
        region_code as region_code,
        region_name as region_name,
        term as search_term,
        rank,
        score,
        week as week_date,
        refresh_date as date
    from {{ source("google_trends", "international_top_terms") }}
    where
        refresh_date >= '2023-01-01'
        and term is not null
        and country_code is not null
)

select distinct *
from cleaned_data

