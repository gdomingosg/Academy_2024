with 
    ordens as (
        select *
        from {{ source('erpnorthwind', 'orderdetail') }}
    ),
    renomeado as (
        select
            ORDERID::varchar || ' ' || PRODUCTID::varchar as pk_pedido_item
            , cast(ORDERID as int) as fk_pedido
            , cast(PRODUCTID as int) as fk_produto
            , cast(DISCOUNT as numeric(18,2)) as desc_perc
            , cast(UNITPRICE as numeric(18,2)) as preco_unitario
            , cast(QUANTITY as int) as quantidade
        from ordens
    )

select *
from renomeado