-- @block Query 1
SELECT *
FROM transacoes
WHERE valor > 30 AND id_loja = 'magalu';

-- @block Query 2
SELECT *
FROM transacoes
WHERE valor > 30 OR id_loja = 'magalu';

-- @block Query 3
SELECT *
FROM transacoes
WHERE id_loja IN ('magalu','subway') AND valor > 10;

-- @block Query 4
SELECT *
FROM transacoes
WHERE valor BETWEEN 60.0 AND 1000.0;

-- @block Query 5
SELECT * 
FROM transacoes 
WHERE id_loja LIKE 'mag%'

-- @block Query 6
SELECT * 
FROM transacoes 
WHERE id_loja LIKE '%sh%'

-- @block Query 7
SELECT id_cliente, id_loja, valor,
CASE
    WHEN valor > 1000 THEN 'Compra com alto valor'
    WHEN valor < 1000 THEN 'Compra com baixo valor'
END 
AS classeValor, 
CASE
    WHEN id_loja IN ('giraffas','subway')  THEN 'alimentacao'
    WHEN id_loja IN ('magalu','extra') THEN 'variedade'
    WHEN id_loja IN ('postoshell','seveneleven') THEN '24horas'
    ELSE 'outros'
END 
AS tipo_compra
FROM transacoes;