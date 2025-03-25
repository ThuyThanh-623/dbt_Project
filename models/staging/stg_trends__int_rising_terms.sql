with cleaned_data as (
    select

        term as search_term,
        rank,
        score,
        percent_gain,
        refresh_date,
        country_name,
        country_code,
        region_name,
        region_code,
        week

    from {{ source("google_trends", "international_top_rising_terms") }}
    where
        week >= '2023-01-01'
        and term is not null
        and country_code is not null
        and percent_gain >= 100
)

select distinct *
from cleaned_data
