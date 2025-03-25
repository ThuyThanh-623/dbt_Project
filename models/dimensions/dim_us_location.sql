select distinct
    cast(dma_id as string) as location_id,
    'US' as country_code,
    'United States' as country_name,
    dma_id,
    dma_name
from {{ ref("int_us_trends") }}
where dma_id is not null
