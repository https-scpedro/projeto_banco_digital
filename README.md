# Projeto de Banco de Dados: Banco Digital

Este repositório contém o trabalho desenvolvido para a disciplina de Banco de Dados, que consiste na criação e manipulação de um banco de dados para um sistema de Banco Digital. O objetivo é modelar e consultar informações sobre usuários, contas, transações e investimentos financeiros.

## 🚀 Tecnologias Utilizadas

* **SGBD:** MySQL

## 🔧 Como Utilizar o Projeto

Para executar este projeto em seu ambiente local e testar as consultas, siga os passos abaixo.

### Pré-requisitos

* É necessário ter um servidor MySQL (ou um SGBD compatível, como o MariaDB) instalado.
* Um cliente de banco de dados para interagir com o servidor, como MySQL Workbench, DBeaver ou a própria linha de comando do MySQL.

### Passos para Instalação

1.  **Crie o Banco de Dados:**
    Execute o comando SQL abaixo para criar o banco de dados que será utilizado no projeto.
    ```sql
    CREATE DATABASE banco_digital;
    ```

2.  **Importe a Estrutura e os Dados:**
    Com o banco de dados criado, importe o arquivo `Dump20250605.sql`. Este script irá criar todas as tabelas necessárias e preenchê-las com dados de exemplo, permitindo que as consultas sejam executadas corretamente.

    * **Via Linha de Comando:**
        ```sh
        mysql -u seu_usuario -p banco_digital < /caminho/para/Dump20250605.sql
        ```
    * **Via MySQL Workbench (ou similar):**
        Abra o arquivo `Dump20250605.sql` e execute todo o script no servidor conectado.

3.  **Execute as Consultas:**
    Após a importação, o banco de dados estará pronto. Você pode utilizar as queries presentes no arquivo `consultas.sql` para explorar os dados e validar os diferentes cenários de negócio.

## 🗂️ Estrutura do Banco de Dados

O modelo de dados foi projetado para representar as principais entidades de um banco digital e seus relacionamentos:

* `usuario`: Armazena as informações cadastrais dos clientes.
* `conta`: Gerencia as contas correntes dos usuários e seus respectivos saldos.
* `produto_financeiro`: Catálogo de todos os produtos de investimento oferecidos (CDB, Ações, Tesouro Direto, etc.).
* `investimento`: Registra as aplicações financeiras feitas pelos usuários em um determinado produto.
* `rendimento`: Armazena o histórico de rendimentos de cada investimento.
* `tipo_transacao`: Tabela de domínio para descrever os tipos de transações (Depósito, Saque, etc.).
* `transacao`: Mantém o histórico de todas as movimentações financeiras nas contas dos usuários.

## 📊 Consultas SQL Desenvolvidas

O arquivo `consultas.sql` contém uma série de queries para extrair informações e gerar relatórios a partir dos dados. Abaixo está a descrição de cada uma delas.

---

**1. Listar todos os usuários cadastrados**
*Retorna uma lista com o código, nome e e-mail de todos os clientes cadastrados no banco.*
```sql
select codUser, nome, email from usuario;
```

**2. Exibir o saldo de uma conta específica**
*Consulta o saldo atual de um usuário específico, identificado pelo seu código.*
```sql
select saldo from conta where codUser = '22';
```

**3. Mostrar as transações de um usuário em um período**
*Exibe todas as transações de uma conta específica realizadas dentro de um intervalo de datas.*
```sql
select * from transacao where codConta = '1' and dataTransac between '2024-01-01' and '2024-12-12';
```

**4. Identificar usuários que investem em um produto específico**
*Lista os dados dos usuários que possuem investimentos ativos em um produto financeiro determinado (neste caso, o produto de código `1`).*
```sql
select codUser, nome, email from usuario
where codUser in (
    select codUser from investimento
    where codProduto = '1'
);
```

**5. Calcular o total investido por cada usuário**
*Calcula a soma de todos os valores aplicados por cada usuário e exibe o montante total, ordenado de forma decrescente.*
```sql
select u.nome,
    (select sum(i.valorAplicado) from investimento i
     where i.codUser = u.codUser) as total_investido
from usuario u
having total_investido is not null
order by total_investido desc;
```

**6. Exibir o rendimento acumulado de um investimento**
*Calcula e apresenta o valor total de rendimentos acumulados para um investimento específico.*
```sql
select investimento.codInvest, usuario.nome as nome_investidor,
    produto_financeiro.nome as nome_produto, sum(rendimento.valorRendimento) as rendimento_total_acumulado
from rendimento
join investimento on rendimento.codInvest = investimento.codInvest
join usuario on investimento.codUser = usuario.codUser
join produto_financeiro on investimento.codProduto = produto_financeiro.codProduto
where investimento.codInvest = 1
group by investimento.codInvest, usuario.nome, produto_financeiro.nome;
```

**7. Contar transações por tipo no último mês**
*Agrupa as transações por tipo e conta quantas ocorreram no mês de maio de 2024.*
```sql
select tipo_transacao.descricao as tipo_de_transacao, count(transacao.codTransac) as quantidade
from transacao
join tipo_transacao on transacao.codTipoTransacao = tipo_transacao.codTipoTransacao
where transacao.dataTransac between '2024-05-01' and '2024-05-31'
group by tipo_transacao.descricao
order by quantidade desc;
```

**8. Listar os produtos financeiros mais populares**
*Classifica os produtos financeiros com base no número de investidores únicos, revelando os mais populares.*
```sql
select produto_financeiro.nome as nome_produto, count(distinct investimento.codUser) as quantidade_de_investidores
from produto_financeiro
join investimento on produto_financeiro.codProduto = investimento.codProduto
group by produto_financeiro.codProduto, produto_financeiro.nome
order by quantidade_de_investidores desc;
```

**9. Mostrar o histórico de transações de um usuário**
*Apresenta o histórico completo de transações de um usuário, ordenado da mais recente para a mais antiga.*
```sql
select transacao.dataTransac, tipo_transacao.descricao as tipo, transacao.valor
from transacao
join conta on transacao.codConta = conta.codConta
join usuario on conta.codUser = usuario.codUser
join tipo_transacao on transacao.codTipoTransacao = tipo_transacao.codTipoTransacao
where usuario.codUser = '1'
order by transacao.dataTransac desc;
```

**10. Listar usuários com mais de um investimento ativo**
*Identifica e lista os clientes que possuem mais de um investimento com status "ativo".*
```sql
select usuario.nome, count(investimento.codInvest) as investimentos_ativos
from usuario
join investimento on usuario.codUser = investimento.codUser
where investimento.ativo = true
group by usuario.codUser, usuario.nome
having count(investimento.codInvest) > 1;
```

---



