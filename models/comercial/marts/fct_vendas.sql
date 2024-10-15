with
    int_vendas as (
        select *
        from {{ ref('int_vendas_metricas') }}
    )

    , dim_produtos as (
        select *
        from {{ ref('dim_produtos') }}
    )

    , dim_funcionarios as (
        select *
        from {{ ref('dim_funcionarios') }}
    )

    , dim_transportadora as (
        select *
        from {{ ref('dim_transportadora') }}
    )

    , dim_clientes as (
        select *
        deom {{ ref('dim_clientes') }}
    )

select *
from int_vendas