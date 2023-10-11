-- @block Query 1
SELECT id_loja, id_cliente, id_transacao from transacoes 
WHERE id_loja IN
(SELECT cliente.loja_cadastro from cliente where cliente.valor_compra > 160 )

-- @block Query 2
SELECT * FROM transacoes where id_loja = 'magalu'

-- @block Query 3
CREATE VIEW transacoesv100 AS
SELECT id_cliente , valor_compra, id_loja AS nome_loja FROM transacoes where valor_compra > 100

-- @block Query 3.1
Select * from transacoesv100

-- @block Query 4
CREATE VIEW clientevalor  AS 
SELECT id_cliente, valor_compra FROM transacoes ORDER BY valor_compra DESC LIMIT 2;

-- @block Query 4.1
select * from clientevalor