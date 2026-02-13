-- Lista de transacoes com apenas 1 ponto

SELECT *
FROM transacoes
WHERE QtdePontos= 1;

--lista de pedidos realizados no fim de seamana

SELECT *,
        strftime('%w', datetime(dtCriacao)) AS diaDaSemana
FROM transacoes
WHERE diaDaSemana in ('0', '6');

--lista de clientes com 0(zero) pontos

SELECT *
FROM clientes
WHERE qtdePontos = 0;

--lista de clientes com 100 a 200 pontos (inclusive ambos)

SELECT *
FROM clientes
WHERE qtdePontos >= 100 
AND qtdePontos <= 200

-- WHERE qtdepontos BETWEEN 100 AND 200

--lista de produtos com nome de que começa com "Venda de"

SELECT *
FROM produtos
WHERE DescNomeProduto LIKE 'Venda de%'


--lista de produtos com nome que termina com "Lover"

SELECT *
FROM produtos
WHERE DescNomeProduto LIKE '%Lover'


--lista de produtos que sao "chapéu"

SELECT *
FROM produtos
WHERE DescCategoriaProduto LIKE 'chapeu'

--Like n é case sensitive

--lista de trasacoes com o produto "Resgatar Ponei"
SELECT *
FROM transacao_produto
where IdProduto = 15

--listta de transações adicionando uma coluna nova sinalizando "alto", "médio" e "baixo" para o valor dos pontos
--[<10; <500, <=500]
