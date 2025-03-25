with us_top as (
    select
        search_term,
        rank,
        score,
        null as percent_gain,
        refresh_date,
        week,
        'US' as country_code,
        'United States' as country_name,
        dma_id,
        dma_name,
        'top' as term_type
    from {{ ref("stg_trends__top_terms") }}
),
us_rising as (
    select
        search_term,
        rank,
        score,
        percent_gain,
        refresh_date,
        week,
        'US' as country_code,
        'United States' as country_name,
        dma_id,
        dma_name,
        'rising' as term_type
    from {{ ref("stg_trends__top_rising_terms") }}
)
select *
from us_top
union all
select *
from us_rising
