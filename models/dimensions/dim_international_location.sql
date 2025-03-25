select distinct
    coalesce(country_code || region_code, country_code) as location_id,
    country_code,
    country_name,
    region_code,
    region_name
from {{ ref("int_international_trends") }}
where country_code is not null
