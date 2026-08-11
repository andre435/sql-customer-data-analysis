# sql-customer-data-analysis
# 📊 Análise de Dados Transacionais e Comportamento de Clientes

Projeto de análise de dados desenvolvido em **SQL/MySQL**, com foco na exploração de dados transacionais, comportamento de clientes, métricas de recorrência, segmentação RFM e análise de produtos.

O projeto reúne diferentes consultas SQL desenvolvidas para transformar dados transacionais em informações úteis para análise e apoio à tomada de decisão.

---

## 🎯 Objetivo

O objetivo deste projeto é explorar uma base de dados transacional e responder a diferentes questões relacionadas com:

* Evolução da quantidade de transações;
* Crescimento e comportamento dos clientes;
* Frequência e recorrência de transações;
* Perfil comportamental dos utilizadores;
* Segmentação de clientes através de RFM;
* Análise dos sistemas de origem;
* Análise de produtos e categorias;
* Qualidade e completude dos dados.

---

## 🛠️ Tecnologias utilizadas

* **MySQL**
* **SQL**
* CTEs (`WITH`)
* Window Functions
* Funções de agregação
* Funções de data e hora
* `ROW_NUMBER()`
* `LAG()`
* `NTILE()`
* `SUM() OVER()`
* `COUNT()`
* `COUNT(DISTINCT)`
* `AVG()`
* `MAX()`
* `STDDEV_SAMP()`
* `DATEDIFF()`
* `TIMESTAMPDIFF()`

---

## 📁 Estrutura do projeto

```text
analise-dados-sql/
│
├── README.md
│
├── dataset/
│   ├── clientes.csv
│   ├── transacoes.csv
│   └── produtos.csv
│
└── queries/
    │
    ├── Analytics_Profile.sql
    ├── transaction_qtd.sql
    ├── transaction.sql
    └── Product_Analytics.sql
```

### 📂 Dataset

A pasta `dataset` contém os dados utilizados para realizar as análises do projeto.

Os principais conjuntos de dados estão relacionados com:

* **Clientes:** informações relacionadas aos utilizadores;
* **Transações:** registos das operações realizadas pelos clientes;
* **Produtos:** informações sobre produtos e respetivas categorias.

> **Nota:** os ficheiros disponibilizados neste repositório devem conter apenas dados que possam ser partilhados publicamente. Informações pessoais, credenciais, dados comerciais ou outros dados confidenciais devem ser removidos ou anonimizados.

---

# 🔎 Principais análises

## 📈 Transações acumuladas

Foi criada uma análise da quantidade de transações por dia e do respetivo acumulado ao longo do tempo.

A utilização de Window Functions permite acompanhar a evolução acumulada das transações e identificar diferentes momentos de crescimento.

---

## 👥 Análise de clientes

O projeto também analisa a evolução e o comportamento dos clientes.

Entre as métricas desenvolvidas estão:

* Quantidade de clientes;
* Clientes acumulados;
* Quantidade de transações por cliente;
* Frequência de utilização;
* Dia da semana mais ativo;
* Intervalo médio entre transações.

---

## 👤 Perfil comportamental

Foi criada uma visão consolidada do comportamento dos clientes através de métricas como:

* Primeira transação;
* Última transação;
* Recência;
* Frequência;
* Total de pontos;
* Ticket médio;
* Maior transação;
* Desvio padrão;
* Intervalo médio entre transações;
* Tempo de vida;
* Atividade nos últimos 30 dias;
* Atividade nos últimos 90 dias.

---

# 📊 Segmentação RFM

Foi implementada uma segmentação **RFM — Recency, Frequency and Value**, permitindo classificar os clientes de acordo com o seu comportamento.

### R — Recency

Representa o tempo desde a última transação.

### F — Frequency

Representa a quantidade de transações realizadas.

### M — Value

Neste projeto, representa o volume total de pontos movimentados pelo cliente.

Os clientes são classificados utilizando `NTILE(5)` para gerar scores de 1 a 5.

A combinação dos scores permite criar diferentes segmentos:

| Segmento              | Descrição                                        |
| --------------------- | ------------------------------------------------ |
| 🏆 Campeão            | Alta recência, frequência e valor                |
| ⭐ Fiel                | Alta recência e boa frequência                   |
| 🌱 Novo / Promissor   | Cliente recente com menor frequência             |
| ⚠️ Precisa de Atenção | Comportamento intermediário                      |
| 🔴 Em Risco           | Baixa recência, mas elevada frequência histórica |
| ❌ Perdido             | Baixa recência e baixa frequência                |
| 🔵 Ocasional          | Outros padrões de comportamento                  |

Além da segmentação RFM, foi criada uma classificação complementar baseada no intervalo médio entre transações.

---

# 🔄 Análise de recorrência

A recorrência dos clientes é analisada através do intervalo médio entre transações.

A função `LAG()` é utilizada para identificar a transação anterior de cada cliente, permitindo calcular a diferença de dias entre atividades.

Com base nessa informação, os clientes podem ser classificados como:

* Compra Única;
* Alta Recorrência;
* Média Recorrência;
* Baixa Recorrência;
* Atrasado / Churn Provável.

A classificação de churn apresentada no projeto é uma **heurística baseada no comportamento histórico**, não um modelo estatístico de previsão.

---

# 🏢 Análise dos sistemas de origem

Também foram desenvolvidas consultas para comparar os diferentes sistemas de origem das transações.

São analisadas métricas como:

* Quantidade de clientes;
* Quantidade de transações;
* Total de pontos;
* Ticket médio;
* Média de transações por cliente.

O objetivo é compreender quais sistemas apresentam maior capacidade de atrair clientes e qual o nível de atividade associado a cada origem.

---

# 📦 Análise de produtos e qualidade dos dados

O projeto inclui ainda análises relacionadas com produtos e categorias.

São avaliados:

* Quantidade de produtos por categoria;
* Produtos sem categoria;
* Produtos com descrição;
* Produtos sem descrição;
* Completude das informações.

Essa análise demonstra a importância da **qualidade e consistência dos dados** antes da construção de indicadores e análises.

---

# 🧠 Principais conhecimentos demonstrados

Este projeto permitiu aplicar conhecimentos de:

* SQL;
* MySQL;
* Análise de Dados;
* Bases de dados relacionais;
* CTEs;
* Window Functions;
* Análise temporal;
* Análise comportamental;
* Segmentação RFM;
* Métricas de recorrência;
* Qualidade de dados;
* Transformação de dados em indicadores;
* Resolução de questões orientadas para negócio.

O objetivo não foi apenas construir consultas SQL, mas utilizar os dados para **responder a perguntas concretas, identificar padrões e gerar informações úteis para a tomada de decisão**.

---

# 🚀 Possíveis melhorias

Como evolução futura do projeto, algumas análises podem ser complementadas com:

* Dashboard em **Power BI**;
* Integração com **Python**;
* Análises estatísticas;
* Análise de churn;
* Análise de coortes;
* Modelos de previsão;
* ETL automatizado;
* Visualização de indicadores;
* Automatização da atualização das análises.

---

# 📚 Contexto académico

Projeto desenvolvido no âmbito do meu percurso em **Análise e Desenvolvimento de Sistemas**, com foco em **Análise de Dados, SQL e Bases de Dados**.

O projeto representa uma aplicação prática de conhecimentos técnicos na exploração de dados transacionais, análise do comportamento de clientes e avaliação da qualidade dos dados.

---

# 👨‍💻 Autor

## André Tavira

Estudante de **Análise e Desenvolvimento de Sistemas**, com interesse em:

* 📊 Análise de Dados
* 🗄️ Bases de Dados
* 🐍 Python
* 📈 Business Intelligence
* 💻 Desenvolvimento Web
* 🤖 Inteligência Artificial
* 🧠 Sistemas de Informação

**GitHub:** https://github.com/andre435/

**LinkedIn:** https://www.linkedin.com/in/andr%C3%A9-tavira-b63058295/

**Email:** andretavira1@gmail.com

---

## ⭐ Feedback

Este projeto faz parte do meu percurso de desenvolvimento técnico e académico na área de dados.

Feedback, sugestões e oportunidades de colaboração são bem-vindos.
