with 
    produtos as (
        select *
        from {{ ref('stg_erp__product') }}
    )

    , categoria as (
        select *
        from {{ ref('stg_erp__category') }}
    )

    , fornecedor as (
        select *
        from {{ ref('stg_erp__fornecedor') }}
    )

    , joined as (
        select
            produtos.pk_produto
            , produtos.nome_produto
            , produtos.quantidade_por_unidade
            , produtos.preco_unitario
            , produtos.unidades_em_estoque
            , produtos.unidades_em_pedidos
            , produtos.nivel_reabastacimento
            , produtos.descontinuado
            , categoria.nome_categoria
            , categoria.descricao_categoria
            , fornecedor.nome_fornecedor
            , fornecedor.cidade_fornecedor
            , fornecedor.pais_fornecedor
        from produtos
        left join categoria
            on produtos.fk_categoria = categoria.pk_categoria
        left join fornecedor
            on produtos.fk_fornecedor = fornecedor.pk_fornecedor
    )

select * 
from joined