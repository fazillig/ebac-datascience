-- @block Query 1
SELECT id_cliente FROM transacoes
UNION
SELECT id_cliente  FROM cliente;

-- @block Query 2
SELECT transacoes.id_cliente, cliente.nome
FROM transacoes
INNER JOIN cliente
ON transacoes.id_cliente = cliente.id_cliente;

-- @block Query 3
SELECT *
FROM cliente
CROSS JOIN transacoes;

-- @block Query 4
SELECT *
FROM transacoes
LEFT JOIN cliente 
ON cliente.id_cliente = transacoes.id_cliente;

-- @block Query 5
SELECT *
FROM transacoes
RIGHT JOIN cliente 
ON cliente.id_cliente = transacoes.id_cliente;