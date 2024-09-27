with
    funcionarios as (
        select
            *
        from {{ ref('stg_erp__funcionarios') }}
    )

    , joined as (
        select
            funcionarios.pk_funcionario
            , funcionarios.fk_gerente
            , funcionarios.nome_funcionario
            , funcionarios.cargo_funcionario
            , funcionarios.dt_nascimento_funcionario
            , funcionarios.dt_contratacao
            , funcionarios.cidade_funcionario
            , funcionarios.regiao_funcionario
            , funcionarios.pais_funcionario
            , gerente.nome_funcionario as nome_gerente
        from funcionarios
        left join funcionarios as gerente
            on funcionarios.fk_gerente = gerente.pk_funcionario
    )

select 
    *
from joined