SELECT
	"default" AS Adimplencia,
	COUNT(idade) AS Quantidade
FROM credito GROUP BY "default";

PRAGMA table_info(credito)

SELECT
	SUM(CASE WHEN escolaridade IS NULL THEN 1 ELSE 0 END) AS Escolaridade,
	SUM(CASE WHEN estado_civil IS NULL THEN 1 ELSE 0 END) AS "Estado Civil",
	SUM(CASE WHEN salario_anual IS NULL THEN 1 ELSE 0 END) AS "Salário Anual",
	COUNT(*) AS TOTAL
FROM credito

SELECT
	"default",
	SUM(CASE WHEN escolaridade IS NULL THEN 1 ELSE 0 END) AS Escolaridade,
	SUM(CASE WHEN estado_civil IS NULL THEN 1 ELSE 0 END) AS "Estado Civil",
	SUM(CASE WHEN salario_anual IS NULL THEN 1 ELSE 0 END) AS "Salário Anual"
FROM credito
GROUP BY "default"


SELECT
	"default" AS Adimplencia,
	ROUND(AVG(limite_credito_casted),2) AS "Limite de Crédito Médio",
	ROUND(MAX(limite_credito_casted),2) AS "Limite de Crédito Máximo",
	ROUND(MIN(limite_credito_casted),2) AS "Limite de Crédito Mínimo"
FROM(
	SELECT *,
		CAST(
			REPLACE(REPLACE(limite_credito, '.', ''),',', '.')
		AS FLOAT) AS limite_credito_casted
	FROM credito
)
GROUP BY "default"

SELECT
	"default" AS Adimplencia,
	ROUND(AVG(valor_transacoes_12m_casted),2) AS "Valor Transações Médio",
	ROUND(MAX(valor_transacoes_12m_casted),2) AS "Valor Transações Máximo",
	ROUND(MIN(valor_transacoes_12m_casted),2) AS "Valor Transações Mínimo"
FROM(
	SELECT *,
		CAST(
			REPLACE(REPLACE(valor_transacoes_12m, '.', ''),',', '.')
		AS FLOAT) AS valor_transacoes_12m_casted
	FROM credito
)
GROUP BY "default"

SELECT
	"default" AS Adimplencia,
	ROUND(AVG(qtd_transacoes_12m),2) AS "Quantidade Transações Médio",
	ROUND(MAX(qtd_transacoes_12m),2) AS "Quantidade Transações Máximo",
	ROUND(MIN(qtd_transacoes_12m),2) AS "Quantidade Transações Mínimo"
FROM credito
GROUP BY "default"


