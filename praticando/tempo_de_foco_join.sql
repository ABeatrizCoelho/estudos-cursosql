--QUAIS CLIENTES MAIS PERDERAM PONTOS POR LOVER
SELECT t1.idCliente,
        sum(t1.QtdePontos) AS totalPontos

FROM transacoes AS t1

LEFT JOIN transacao_produto AS t2
ON t1.IdTransacao = t2.IdTransacao

LEFT JOIN produtos AS t3
ON t2.IdProduto = t3.IdProduto

WHERE t3.DescCategoriaProduto = 'lovers'

GROUP BY t1.IdCliente 

ORDER BY totalPontos

LIMIT 5

--QUAIS CLIENTES ASSINARAM A LISTA DE PRESENTA NO DIA 25 DE AGOSTO DE 2025

SELECT t1.idCliente,
        count(*)

FROM transacoes AS t1

LEFT JOIN transacao_produto AS t2
ON t1.IdTransacao = t2.IdTransacao

LEFT JOIN produtos as t3
ON t2.IdProduto =  t3.IdProduto

WHERE substr(t1.DtCriacao,1,10 )= '2025-08-25'
AND t3.DescNomeProduto = 'Lista de presença'

GROUP BY t1.idCliente

-- Do início ao fim do nosso curso (2025/08/25 a 2025/08/29), 
-- quantos clientes assinaram a lista de presença?

SELECT count(DISTINCT t1.idCliente)

FROM transacoes AS t1

LEFT JOIN transacao_produto AS t2
ON t1.IdTransacao = t2.IdTransacao

LEFT JOIN produtos as t3
ON t2.IdProduto =  t3.IdProduto

WHERE substr(t1.DtCriacao,1,10 ) >= '2025-08-25'
AND substr(t1.DtCriacao,1,10 ) < '2025-08-30'
AND t3.DescNomeProduto = 'Lista de presença'

--Clientes mais antigos, tem mais frequência de transação?

-- SELECT idCliente,
--         julianday('now') - julianday(datetime(DtCriacao)) AS idadeBase,
--         julianday('now') - julianday(substr(DtCriacao,1,19)) AS idadeBase
-- FROM clientes

SELECT  t1.idCliente,
        julianday('now') - julianday(datetime(t1.DtCriacao)) AS idadeBase,
        count(t2.IdTransacao) AS qtdeTransacoes

FROM clientes AS t1

LEFT JOIN transacoes AS t2
ON t1.idCliente = t2.idCliente

GROUP BY t1.idCliente, idadeBase

--agrupa pelos dois pois os dois estao repetindo