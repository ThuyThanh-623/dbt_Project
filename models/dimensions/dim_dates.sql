select distinct
    week as date_id,
    extract(year from week) as year,
    extract(month from week) as month,
    extract(day from week) as day,
    extract(quarter from week) as quarter,
    refresh_date
from
    (
        select week, refresh_date
        from {{ ref("int_us_trends") }}
        union all
        select week, refresh_date
        from {{ ref("int_international_trends") }}
    )
