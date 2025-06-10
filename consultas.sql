-- Consultas SQL
-- 1. Listar todos os usuarios cadastrados na corretora
select nome from usuario;					/* Mostra apenas os nomes */
select * from usuario;						/* Mostra todos os dados dos usuarios */
select codUser, nome, email from usuario;

-- 2. Exibir o saldo de uma conta especifica
select saldo from conta where codUser = '22';

-- 3. Mostrar todas as transacoes realizadas por um usuario em um determinado periodo
select * from transacao where codConta = '1' and dataTransac between '2024-01-01' and '2024-12-12';

-- 4. Identificar quais usuarios possuem investimentos em um determinado produto financeiro
select codUser, nome, email from usuario 
	where codUser in (
		select codUser from investimento
		where codProduto = (
			select codProduto from produto_financeiro
			where codProduto = '1'
        )
);		

-- 5. Calcular o total investido por cada usuario
select u.nome,
	(select sum(i.valorAplicado) from investimento i 
     where i.codUser = u.codUser) as total_investido
from usuario u
having total_investido is not null
order by total_investido desc;

-- 6. Exibir o rendimento acumulado de um investimento especifico
select investimento.codInvest, usuario.nome as nome_investidor,
    produto_financeiro.nome as nome_produto, sum(rendimento.valorRendimento) as rendimento_total_acumulado
from rendimento
	join investimento on rendimento.codInvest = investimento.codInvest
	join usuario on investimento.codUser = usuario.codUser
	join produto_financeiro on investimento.codProduto = produto_financeiro.codProduto
where investimento.codInvest = 1
group by investimento.codInvest, usuario.nome, produto_financeiro.nome;

-- 7. Contar quantas transações de cada tipo foram realizadas no último mês.
select tipo_transacao.descricao as tipo_de_transacao, count(transacao.codTransac) as quantidade
from transacao
	join tipo_transacao on transacao.codTipoTransacao = tipo_transacao.codTipoTransacao
where transacao.dataTransac between '2024-05-01' and '2024-05-31'
group by tipo_transacao.descricao
order by quantidade desc; /*Alteramos o ano para 2024 pois nao existem registros para 2025 na tabela*/

-- 8. Listar os produtos financeiros mais populares com base na quantidade de investidores.
select produto_financeiro.nome as nome_produto, count(distinct investimento.codUser) as quantidade_de_investidores
from produto_financeiro
	join investimento on produto_financeiro.codProduto = investimento.codProduto
group by produto_financeiro.codProduto, produto_financeiro.nome
order by quantidade_de_investidores desc;

-- 9. Mostrar o histórico de transações ordenado por data para um determinado usuário.
select transacao.dataTransac, tipo_transacao.descricao as tipo, transacao.valor
from transacao
	join conta on transacao.codConta = conta.codConta
	join usuario on conta.codUser = usuario.codUser
	join tipo_transacao on transacao.codTipoTransacao = tipo_transacao.codTipoTransacao
where usuario.codUser = '1'
order by transacao.dataTransac desc;

-- 10. Exibir os usuários que possuem mais de um investimento ativo.
select usuario.nome, count(investimento.codInvest) as investimentos_ativos
from usuario
	join investimento on usuario.codUser = investimento.codUser
where investimento.ativo = true
group by usuario.codUser, usuario.nome
having count(investimento.codInvest) > 1;