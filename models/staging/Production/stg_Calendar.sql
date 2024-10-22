select 
    dates::date as calendar_date
from {{ source('toy_shop', 'calendar')}}