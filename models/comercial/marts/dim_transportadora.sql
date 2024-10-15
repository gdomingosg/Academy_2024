with
    int_transportadora as (
        select *
        from {{ ref('int_transportadora_preparacao') }}
    )

select *
from int_transportadora