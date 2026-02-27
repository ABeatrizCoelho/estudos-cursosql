--LISTA DE TRANSACOES COM O PRODUTO "Resgatar Ponei"

SELECT *    
FROM transacao_produto AS t1

WHERE t1.IdProduto IN (
    SELECT IdProduto
    FROM produtos
    where DescNomeProduto = 'Resgatar Ponei' )

    --faz primeiro o que esta entre parenteses



-- DOS CLIENTES QUE COMECARAM O CURSO NO 1o DIA, QUANTOS CHEGARAM AO 5o DIA
SELECT count(DISTINCT idCliente)
FROM transacoes AS t1

WHERE t1.idCliente IN (
    SELECT DISTINCT IdCliente
    FROM transacoes
    WHERE substr(DtCriacao,1,10) = '2025-08-25'
    )
AND substr(t1.DtCriacao,1,10) = '2025-08-29'



