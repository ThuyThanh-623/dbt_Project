with international_top as (
    select
        search_term,
        rank,
        score,
        null as percent_gain,
        refresh_date,
        week,
        country_code,
        country_name,
        region_code,
        region_name,
        'top' as term_type
    from {{ ref("stg_trends__int_top_terms") }}
),
international_rising as (
    select
        search_term,
        rank,
        score,
        percent_gain,
        refresh_date,
        week,
        country_code,
        country_name,
        region_code,
        region_name,
        'rising' as term_type
    from {{ ref("stg_trends__int_rising_terms") }}
)
select *
from international_top
union all
select *
from international_rising
