/*
    The top trending keywords in the U.S., broken down by DMA (Designated Market Area)
*/

with cleaned_data as (
    select

        dma_id as region_id,
        dma_name as region_name,
        term as search_term,
        score,
        rank,
        week as week_date
        refresh_date as date

    from {{ source('google_trends', 'top_terms') }}

    where dma_id is not null 
        and term is not null
        and refresh_date >= '2023-01-01'
)

select distinct *
from cleaned_data
