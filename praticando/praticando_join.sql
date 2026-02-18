-- categoria de produtos mais vendidos
SELECT t2.DescCategoriaProduto,
        count(DISTINCT t1.IdTransacao)
FROM transacao_produto AS t1
LEFT JOIN produtos AS t2
ON t1.IdProduto = t2.IdProduto 
GROUP BY t2.DescCategoriaProduto
ORDER BY count(DISTINCT t1.IdTransacao) DESC


-- quantas transacoes tivemos em 2024 de lovers

-- SELECT t1.IdTransacao,
--         t1.idCliente,
--         t2.IdProduto,
--         t3.DescCategoriaProduto
SELECT 
        t3.DescCategoriaProduto,
        count(DISTINCT t1.IdTransacao)
FROM transacoes AS t1

LEFT JOIN transacao_produto AS t2
ON t1.IdTransacao = t2.IdTransacao

LEFT JOIN produtos AS t3
ON t2.IdProduto = t3.IdProduto

WHERE t1.DtCriacao >= '2024-01-01'
AND t1.DtCriacao < '2025-01-01'

GROUP BY t3.DescCategoriaProduto
HAVING count(DISTINCT t1.IdTransacao)  < 1000
ORDER BY count(DISTINCT t1.IdTransacao) DESC


-- qual mes tivemos mais lista de presença assinada? 

SELECT  substr(t1.DtCriacao,1,7) AS anoMes,
        count(DISTINCT t1.IdTransacao) AS qtdeTransacao

FROM transacoes AS t1

LEFT JOIN transacao_produto AS t2
ON t1.IdTransacao = t2.IdTransacao

LEFT JOIN produtos AS t3
ON t2.IdProduto = t3.IdProduto

WHERE DescNomeProduto = 'Lista de presença'

GROUP BY substr(t1.DtCriacao,1,7) 

ORDER BY qtdeTransacao DESC

LIMIT 1


