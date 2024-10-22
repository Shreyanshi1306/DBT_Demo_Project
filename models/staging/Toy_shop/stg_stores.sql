select
    store_id::int as store_id,
    {{ Initial_letter_capital( 'store_name' ) }}::string as store_name,
    {{ Initial_letter_capital('store_city') }}::string as store_city,
    {{ Initial_letter_capital('store_location') }}::string as store_location,
    store_open_date::date as store_open_date
from {{ source('toy_shop', 'stores') }}