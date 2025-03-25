select distinct 
    search_term as term_id, 
    search_term as term_name
from
    (
        select search_term
        from {{ ref("int_us_trends") }}
        union all
        select search_term
        from {{ ref("int_international_trends") }}
    )
