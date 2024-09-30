with 
    fonte_categoria as (
        select *            
        from {{ source('erpnorthwind', 'category') }}
    )

    , renomeacao as (
        select
            cast(ID  as int) as pk_categoria
            , cast(CATEGORYNAME  as varchar) as nome_categoria
            , cast(DESCRIPTION as varchar) as descricao_categoria
        from fonte_categoria
    )

select *
from renomeacao