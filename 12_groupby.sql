-- SELECT IdProduto,
--     count(*)
-- FROM transacao_produto
-- GROUP BY IdProduto

SELECT idCliente,
        sum(QtdePontos),
        count(IdTransacao)

FROM transacoes

WHERE DtCriacao >= '2026-01-01'
AND DtCriacao <= '2026-01-31'

GROUP by idCliente
HAVING sum(QtdePontos) >= 2500

ORDER BY sum(QtdePontos) DESC

LIMIT 10 

/*O WHERE é executado ANTES do GROUP BY.
Mas SUM(QtdePontos) só existe DEPOIS que os dados são agrupados.
Ou seja:
Quando o WHERE roda, ainda não existe SUM(QtdePontos).
Por isso, é necessário usar o HAVING após o GROUP BY

O HAVING é uma cláusula do SQL usada para filtrar resultados após o GROUP BY, 
ou seja, depois que funções de agregação como SUM, COUNT, AVG, MAX ou MIN já foram 
calculadas.
WHERE - filtra linhas individuais
HAVING - filtra grupos agregados
 */