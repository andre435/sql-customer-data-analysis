-- Transações acumulada
with tb_sumario_dias as (

select substr(DtCriacao, 1,10) as dtDia,
	count(distinct idTransacao) as qtdeTransacao
    from transacoes
where DtCriacao >= '2025-08-25'
and DtCriacao < '2025-08-30'
group by dtDia)

select *,
   sum(qtdeTransacao) over (order by dtDia) as qtdeTransacao
   from tb_sumario_dias;
   
   -- Acumulado por Cliente
   with tb_cliente_dia as (
   select idCliente,
          substr(DtCriacao,1,10) as dtDia, 
          count(distinct idTransacao) as qtdeTransacao
          from transacoes
          where DtCriacao >= '2025-08-25'
          and DtCriacao < '2025-08-30'
          group by IdCliente, dtDia),
		tb_lag as (
		select *,
        sum(qtdeTransacao) over (partition by idCliente order by dtDia) as acum,
        lag(qtdeTransacao) over (partition by idcliente order by dtDia) as lagTransacoes
        from tb_cliente_dia)
        select *,
        1.* qtdeTransacao / lagTransacoes
        from tb_lag;
        
     with  cliente_dia   as(
        select
        distinct
        idcliente,
        substr(DtCriacao,1,10) as dtDia
        from transacoes
        where substr(Dtcriacao,1,4) = '2025'
        order by idcliente, dtDia),
        tb_lag as (
 
        select*, lag(dtDia) over (partition by idCliente order by dtDia) as lagDia
        from cliente_dia),
        tb_diff_dt as (
        select *, 
        datediff(dtdia, lagdia) as tDia from tb_lag),
        tb_avg_dia as(
        select idcliente, avg(tDia) as avg_dia
        from tb_diff_dt
        group by idcliente)
        select avg(avg_dia) from  tb_avg_dia
       
