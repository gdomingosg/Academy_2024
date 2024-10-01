with
    ordens as (
        select *
        from {{ ref('stg_erp__ordens') }}
    )

    , pedido_itens as (
        select *
        from {{ ref('stg_erp__pedido_itens') }}
    )

    , joined as (
        select
            pedido_itens.pk_pedido_item
            , ordens.pk_pedido as numero_pedido
            , pedido_itens.fk_produto
            , ordens.fk_transportadora
            , ordens.fk_funcionario
            , ordens.fk_cliente
            , ordens.data_do_pedido
            , ordens.data_do_envio
            , ordens.data_requerida_entrega
            , pedido_itens.desc_perc
            , pedido_itens.preco_unitario
            , pedido_itens.quantidade
            , ordens.frete
            , ordens.nm_destinatario
            , ordens.cidade_destinatario
            , ordens.regiao_destinatario
            , ordens.pais_destinatario
        from pedido_itens
        inner join ordens
            on ordens.pk_pedido = pedido_itens.fk_pedido
    )

    , metricas as (
        select 
            *
            , quantidade * preco_unitario as faturamento_bruto
            , quantidade * preco_unitario * (1-desc_perc) as faturamento_liquido
            , frete / (COUNT(*) OVER(PARTITION BY numero_pedido)) as frete_rateado
            , case
                when desc_perc > 0 then true
                else false
            end as desconto
        from joined
    )

    , final as (
        select
            pk_pedido_item
            , fk_produto
            , fk_transportadora
            , fk_funcionario
            , fk_cliente
            , data_do_pedido
            , data_do_envio
            , data_requerida_entrega
            , desc_perc
            , preco_unitario
            , quantidade
            , faturamento_bruto
            , faturamento_liquido
            , cast(frete_rateado as numeric(18,2)) as frete_rateado
            , desconto
            , numero_pedido
            , nm_destinatario
            , cidade_destinatario
            , regiao_destinatario
            , pais_destinatario
            
        from metricas
    )

select *
from final