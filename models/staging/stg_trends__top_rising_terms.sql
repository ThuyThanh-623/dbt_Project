/*
    The top rising trending keywords in the U.S., broken down by DMA (Designated Market Area)
*/

with cleaned_data as (
    select

        dma_id as region_id,
        dma_name as region_name,
        term as search_rising_term,
        rank as rising_rank,
        score,
        percent_gain as growth_percent,
        week as week_date,
        refresh_date

    from {{ source('google_trends', 'top_rising_terms') }}

    where dma_id is not null 
        and term is not null
        and percent_gain >= 100
        and week >= '2023-01-01'
)

select distinct *
from cleaned_data
