/*
    The top trending keywords in the U.S., broken down by DMA (Designated Market Area)
*/

with cleaned_data as (
    select

        term as search_term,
        rank,
        score,
        refresh_date,
        dma_name,
        dma_id,
        week

    from {{ source('google_trends', 'top_terms') }}

    where dma_id is not null 
        and term is not null
        and week >= '2023-01-01'
)

select distinct *
from cleaned_data
