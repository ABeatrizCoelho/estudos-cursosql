--todos os clientes com email cadastrado
SELECT *
FROM clientes
WHERE flEmail = 1
--where flEmail <> 0 ou != 0

--todas as transacoes de 50 pontos (exatos)
SELECT *
FROM transacoes
WHERE QtdePontos = 50

--todos clientes com mais de 500 pontos
SELECT *
FROM clientes
WHERE QtdePontos > 500

--todos os produtos que contem 'churn' no nome
SELECT *
FROM produtos
WHERE DescNomeProduto LIKE 'Churn%'

/* 
 %: coringa, onde, ela começa no Churn e o resto tanto faz
--quando é no começo, é quando quero pesquisar algo que termine com o que esquevi
--'teste'% pesquisa dos dois lados

--LIKE é mais custoso que IN

WHERE DescNomeProduto IN ('Churn_10pp', 'Churn_2pp', 'Churn_2pp') ou OR no lugar
de in e indo de string e string (usando 2 OR) /*


