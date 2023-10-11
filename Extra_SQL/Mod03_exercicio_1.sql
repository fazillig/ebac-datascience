-- @block Query 1
SELECT * FROM transacoes;

-- @block Query 2
SELECT id_cliente , valor, id_loja AS nome_loja FROM transacoes;

-- @block Query 3
SELECT DISTINCT id_loja AS nome_loja FROM transacoes;

-- @block Query 4
SELECT id_cliente, valor FROM transacoes ORDER BY valor DESC LIMIT 2;