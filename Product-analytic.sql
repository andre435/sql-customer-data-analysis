/*====================================================
5. Quantidade de produtos por categoria
====================================================*/

with tb_produto_categoria as (
     select
     DescCategoriaProduto,
     count(*) as QuantidadeProdutos
     from produtos
     group by DescCategoriaProduto
),

tb_produtos_sem_categoria as (
		select *
        from  produtos
        where DescCategoriaProduto is null
),
tb_qualidade_produto as (
		
        select
        count(*) as TotalProdutos,
        count(DescDescricaoProduto) as ProdutosComDescricao,
        count(DescCategoriaProduto) as ProdutosComCategoria
        from produtos
        )
        select * from
        
        tb_qualidade_produto
