with
    fonte_fornecedor as (
        select *
        from {{ source('erpnorthwind', 'supplier') }}
    )
    , renomeacao as (
        select
        cast(ID as varchar) as pk_fornecedor
        , cast(COMPANYNAME as varchar) as nome_fornecedor
        , cast(CITY as varchar) as cidade_fornecedor
        , cast(COUNTRY as varchar) as pais_fornecedor
        --, cast(CONTACTTITLE as varchar) as titulo_contato
        -- cast(ADDRESS as varchar) as endereco_empresa
        --, cast(CONTACTNAME as varchar) as nome_contato
        --, cast(REGION as varchar) as regiao_empresa
        --, cast(POSTALCODE as varchar) as 
        --, cast(PHONE as varchar) as 
        --, cast(FAX as varchar) as
        --, cast(HOMEPAG as varchar) as
        from fonte_fornecedor
    )

select *
from renomeacao