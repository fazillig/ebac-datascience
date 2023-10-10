-- @block create table
CREATE TABLE clientes (
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
INSERT INTO clientes VALUES (768805383, 45, 'M', 3, 'ensino medio', 'blue', 12691.51, 1144.90, 42);
INSERT INTO clientes VALUES (818770008, 49, 'F', 5, 'mestrado', 'blue', 8256.96, 1291.45, 33);
INSERT INTO clientes VALUES (713982108, 51, 'M', 3, 'mestrado', 'blue', 3418.56, 1887.72, 20);

-- @block
SELECT * FROM clientes WHERE sexo = 'M' AND idade > 50;