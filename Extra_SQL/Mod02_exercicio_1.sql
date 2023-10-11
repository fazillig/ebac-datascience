-- @block Query 1

SELECT id, idade, sexo, dependentes FROM clientes;

-- @block Query 2
SELECT id, valor_transacoes_12m FROM clientes WHERE escolaridade = 'mestrado' and sexo = 'F';

-- @block Query 3
SELECT sexo, AVG(idade) AS "media_idade_por_sexo" FROM clientes GROUP BY sexo;

-- @block Query 4
SELECT * FROM clientes;

-- @block Query 5
select * from clientes where sexo = 'F'

-- @block Query 6
SELECT id, idade, limite_credito FROM clientes WHERE sexo = 'M' ORDER BY limite_credito DESC;

-- @block Adicionando Coluna
ALTER TABLE clientes ADD estado VARCHAR(2);

-- @block Query 7
SELECT * FROM clientes;