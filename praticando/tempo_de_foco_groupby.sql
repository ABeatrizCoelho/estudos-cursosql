--quantos clientes tem email cadastrado

SELECT sum(flEmail)
FROM clientes
--ou
SELECT count(*)
from clientes
WHERE flEmail = 1
---------------------------------------------------------------------------------
--qual cliente juntou mais pontos positivos em 2025-05

SELECT idCliente,
       sum(QtdePontos) AS totalPontos
FROM transacoes

WHERE DtCriacao >= '2025-05-01'
AND DtCriacao < '2025-06-01'
AND QtdePontos > 0

GROUP BY idCliente
ORDER BY sum(QtdePontos) DESC
LIMIT 1
---------------------------------------------------------------------------------
--qual cliente fez mais transacoes no ano de 2024
SELECT idCliente,
        count(*) --ou count(DISTINCT IdTransacao)
FROM transacoes

WHERE DtCriacao >= '2024-01-01'
AND DtCriacao < '2025-01-01'

GROUP BY IdCliente

ORDER BY count(*) DESC

LIMIT 1
---------------------------------------------------------------------------------
--quantos produtos são de rpg? 
SELECT count(*)
FROM produtos
WHERE DescCategoriaProduto = 'rpg'

--ou

SELECT DescCategoriaProduto,
        count(*)
FROM produtos
GROUP BY DescCategoriaProduto
---------------------------------------------------------------------------------
--qual o valor médio de pontos positivos por dia

SELECT sum(QtdePontos) AS totalPontos,

        count(substr(DtCriacao,1,10)) as QtdeDiasRepetidos,

        count(DISTINCT substr(DtCriacao,1,10)) as QtdeDiasUnicos,

        sum(QtdePontos) / count(DISTINCT substr(DtCriacao,1,10)) as avgPontosPorDia

FROM transacoes

WHERE QtdePontos > 0

SELECT substr(DtCriacao,1,10) AS dtDia,
        avg(QtdePontos) AS avgPontosDia
FROM transacoes
WHERE QtdePontos > 0 
GROUP BY 1
ORDER BY 1

-- 1 = Primeira coluna do select
---------------------------------------------------------------------------------
--Qual dia da semana tem mais pedidos em 2025

SELECT 
    strftime('%w', datetime(dtCriacao)) AS diaDaSemana,
    count(*) AS totalPedidos
FROM transacoes
WHERE DtCriacao >= '2025-01-01'
AND  DtCriacao < '2026-01-01'
GROUP BY diaDaSemana
ORDER BY totalPedidos DESC
LIMIT 1
--ou
SELECT
    strftime('%w',substr(DtCriacao,1,10)) AS diaDaSemana,
    count(DISTINCT IdTransacao) AS qteTransacao
FROM transacoes
WHERE substr(DtCriacao,1,4) = '2025'
GROUP BY  1
ORDER BY 2 DESC
LIMIT 1
---------------------------------------------------------------------------------
--Qual o produto mais transacionado
SELECT IdProduto,
        --count(*)
       sum(QtdeProduto)
FROM transacao_produto
GROUP BY IdProduto
ORDER BY count(*) DESC
LIMIT 1 

---------------------------------------------------------------------------------
--Qual o produto com mais pontos transicionado?

SELECT IdProduto,
       sum(vlProduto) AS totalPontos,
       sum(QtdeProduto) AS qteVenda

FROM transacao_produto

GROUP BY IdProduto
ORDER BY sum(vlProduto) DESC




