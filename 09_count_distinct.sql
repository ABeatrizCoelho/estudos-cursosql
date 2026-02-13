
--DISTINCT: Ele olha todas as colunas que vc tem na query e vai trazer valores
--distintos nessa combinação

-- SELECT DISTINCT flEmail
-- FROM clientes

-- SELECT COUNT(DISTINCT idCliente)
-- FROM clientes

SELECT count(*)
FROM transacoes
WHERE DtCriacao >= '2026-01-01'
AND DtCriacao <= '2026-01-31'

--quantos clientes fizeram transacoes

SELECT count(*),
        count(DISTINCT IdTransacao),
        count(DISTINCT idCliente)
FROM transacoes
WHERE DtCriacao >= '2026-01-01'
AND DtCriacao <= '2026-01-31'

