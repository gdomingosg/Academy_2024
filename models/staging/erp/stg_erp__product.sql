with 
    fonte_produtos as (
        select
            *
        from {{ source('erpnorthwind', 'product') }}
    )

    , renomeacao as (
        select
            cast(ID as int) as pk_produto
            , cast(SUPPLIERID as int) as fk_fornecedor
            , cast(CATEGORYID as int) as fk_categoria
            , cast(PRODUCTNAME as varchar) as nome_produto
            , cast(QUANTITYPERUNIT as varchar) as quantidade_por_unidade
            , cast(UNITPRICE as float) as preco_unitario
            , cast(UNITSINSTOCK as int) as unidades_em_estoque
            , cast(UNITSONORDER as int) as unidades_em_pedidos
            , cast(REORDERLEVEL as int) as nivel_reabastacimento
            , cast(DISCONTINUED as boolean) as descontinuado
        from fonte_produtos
    )

select 
    *
from renomeacao