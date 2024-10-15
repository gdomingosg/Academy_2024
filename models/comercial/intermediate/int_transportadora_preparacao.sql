with
    transportadora as (
        select
            *
        from {{ ref('stg_erp__transportadora') }}
    )

select 
    *
from transportadora