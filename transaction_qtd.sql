-- Quantidade de Transação acumulada ao longo do Tempo(Diário)
with tb_diario as ( 
	select substr(Dtcriacao, 1,10) as dtDia,
	count(idTransacao) as qtdeTransacao
	from transacoes 
	group by dtDia 
	order by dtDia
),
tb_acum as(
	select *,
	sum(qtdeTransacao) over(order by dtDia) as qtdeTransacaoAcum
	from tb_diario
)
select * from tb_acum
where qtdeTransacaoAcum > 10000
order by qtdeTransacaoAcum
limit 1;


-- Quantidade de usuário cadastrados(absoluto e acumulado) ao longo do tempo
  with tb_dia_cliente  as (
		select substr(Dtcriacao, 1,10) as dtDia,
		   count(distinct idcliente) as qtdeClientes
		 from clientes
		 group by dtDia
 )
 
 select *, 
 sum(qtdeClientes) over (order by dtDia) as qtdeClienteAcum
 from tb_dia_cliente;
 
 -- Qual dia da semana mais ativo de cada usuário?
 with tb_semana as (
 select idcliente,
 DAYOFWEEK(DtCriacao) AS dia_semana,
 count( distinct IdTransacao) as qtdeTransacao
 from transacoes
 group by  IdCliente, dia_semana
 ),
 tb_rn as(
		 select *, 
		 case
          when dia_semana = '1' then 'Segunda-Feira'
          when dia_semana = '2' then 'Terça-Feira'
          when dia_semana = '3' then 'Quarta-Feira'
          when dia_semana = '4' then 'Quinta-feira'
          when dia_semana = '5' then 'Sexta-feira'
          when dia_semana = '6' then 'Sábado'
          else 'Domingo'
          end as descdiasemana,
		 row_number() over (partition by idcliente order by qtdeTransacao) as rn
		 from tb_semana
 )
 select *from tb_rn
 where rn=1;
 
 -- Saldo acumulado de ponto de cada usuário
 WITH tb_cliente_dia AS (
    SELECT
        idcliente,
        DATE(DtCriacao) AS dtDia,
        SUM(QtdePontos) AS totalPontos,
        SUM(CASE
                WHEN QtdePontos > 0 THEN QtdePontos
                ELSE 0
            END) AS SaldoPositivo
    FROM transacoes
    GROUP BY idcliente, DATE(DtCriacao)
),
tb_acumulado AS (
    SELECT
        *,
        SUM(totalPontos) OVER (
            PARTITION BY idcliente
            ORDER BY dtDia
        ) AS PontoPos
    FROM tb_cliente_dia
),
tb_totalPontos as(
SELECT
    *,
    SUM(PontoPos) OVER (
        PARTITION BY idcliente
        ORDER BY dtDia
    ) AS TotalPontosPos
FROM tb_acumulado),
tb_maxPontos as (

select idcliente,
 max(TotalPontosPos) as maxPontos
from  tb_totalPontos
group by idcliente
order by maxPontos desc)
select *,
sum(maxPontos) over(order by idcliente desc) as maxPontosAcum
from tb_maxPontos