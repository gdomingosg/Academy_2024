with
    fonte_transportadora as (
        select *
        from {{ source('erpnorthwind', 'shipper') }}
    )
    , renomeacao as (
        select
            cast(ID as varchar) as pk_transportadora
            , cast(COMPANYNAME as varchar) as nome_transportadora
        from fonte_transportadora
    )

select *
from renomeacao