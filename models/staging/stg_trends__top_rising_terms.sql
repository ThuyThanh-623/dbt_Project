/*
    The top rising trending keywords in the U.S., broken down by DMA (Designated Market Area)
*/

with cleaned_data as (
    select

        term AS search_term,
        rank,
        score,
        percent_gain,
        refresh_date,
        dma_name,
        dma_id,
        week

    from {{ source('google_trends', 'top_rising_terms') }}

    where dma_id is not null 
        and term is not null
        and percent_gain >= 100
        and week >= '2023-01-01'
)

select distinct *
from cleaned_data
