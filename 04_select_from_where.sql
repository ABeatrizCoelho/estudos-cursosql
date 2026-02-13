SELECT * 
FROM produtos
WHERE DescCategoriaProduto = 'rpg'  --valor do campo é aspas simples!
LIMIT 10
--string é case sensitive
/*
No SQL, aspas simples (') são usadas para definir valores literais 
(strings, datas, textos). Aspas duplas (") são utilizadas para delimitar identificadores 
(nomes de tabelas ou colunas) que contêm espaços ou palavras reservadas. Aspas simples (') 
são obrigatórias para dados, enquanto aspas duplas (") são opcionais para nomes, 
dependendo do banco de dados. 
*/

