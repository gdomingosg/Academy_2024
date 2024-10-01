with 
    ordens as (
        select *
        from {{ source('erpnorthwind', '_order_') }}
    ),
    renomeado as (
        select
            cast(ID as int) as pk_pedido
            , cast(CUSTOMERID as varchar) as fk_cliente
            , cast(EMPLOYEEID as int) as fk_funcionario
            , cast(SHIPVIA as varchar) as fk_transportadora
            , cast(ORDERDATE as date) as data_do_pedido 
            , cast(REQUIREDDATE as date) as data_requerida_entrega
            , cast(SHIPPEDDATE as date) as data_do_envio
            , cast(FREIGHT as numeric(18,2)) as frete
            , cast(SHIPNAME as varchar) as nm_destinatario
            , cast(SHIPCITY as varchar) as cidade_destinatario
            , cast(SHIPREGION as varchar) as regiao_destinatario
            , cast(SHIPCOUNTRY as varchar) as pais_destinatario
        from ordens
    )

select *
from renomeado