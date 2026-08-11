-- Construir uma tabela com o perfil comportamental de cada usuário
use transacao;

 with tb_transacao as (
  select
    idTransacao,
    idCliente,
    QtdePontos,
    Dtcriacao as DtCriacao,
    DATEDIFF(NOW(), DATE(Dtcriacao)) as DiffDate
  from transacoes
)
select * from tb_transacao;


select idcliente,
count(*) as qtdeTransacoes,
count( case when datediff(now(), substr(Dtcriacao,1,10)) <=7 then idTransacao end) as qtdTransacaoD7,
count( case when datediff(now(), substr(Dtcriacao,1,10)) <=28 then idTransacao end) as qtdTransacaoD28,
count(case when datediff(now(), substr(Dtcriacao,1,10)) <=56 then idTransacao end) as qtdTransacaoD56,
count(case when datediff(now(), substr(Dtcriacao,1,10)) <=70 then idTransacao end) as qtdTransacaoD70
from transacoes
group by idcliente
