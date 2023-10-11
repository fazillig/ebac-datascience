-- @block create table
CREATE TABLE clientes2 (
  id BIGINT, 
  idade BIGINT, 
  sexo STRING, 
  dependentes BIGINT, 
  escolaridade STRING, 
  tipo_cartao STRING, 
  limite_credito DOUBLE, 
  valor_transacoes_12m DOUBLE, 
  qtd_transacoes_12m BIGINT
);

-- @block insert data
INSERT INTO clientes2 VALUES (768805383, 45, 'M', 3, 'ensino medio', 'blue', 12691.51, 1144.90, 42);
INSERT INTO clientes2 VALUES (818770008, 49, 'F', 5, 'mestrado', 'blue', 8256.96, 1291.45, 33);
INSERT INTO clientes2 VALUES (713982108, 51, 'M', 3, 'mestrado', 'blue', 3418.56, 1887.72, 20);

-- @block Query 1
SELECT * FROM clientes2;

-- @block Query 2
SELECT id, idade, limite_credito FROM clientes2 WHERE sexo = 'M' ORDER BY idade DESC;

-- @block Query 3
SELECT sexo, AVG(idade) AS "media_idade_por_sexo" FROM clientes2 GROUP BY sexo;