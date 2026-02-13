-- SELECT sum(QtdePontos)
-- FROM transacoes
-- WHERE DtCriacao >= '2026-01-01'
-- AND DtCriacao <= '2026-01-31'
-- AND QtdePontos > 0

SELECT IdTransacao,
        sum(QtdePontos),
        sum( CASE
        WHEN QtdePontos > 0 THEN QtdePontos
        END) AS pontosPositivos,
        sum(CASE 
        WHEN QtdePontos < 0 THEN QtdePontos
        END) AS pontosNegativos,
        count(CASE 
        WHEN QtdePontos < 0 THEN QtdePontos
        END) AS qtTransacoesNegativas
FROM transacoes
WHERE DtCriacao >= '2026-01-01'
AND DtCriacao <= '2026-01-31'