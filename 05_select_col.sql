SELECT *, 
        qtdePontos + 10 AS teste
FROM clientes

-- AS: Alias

SELECT idCliente,
        dtCriacao,
        strftime('%w', datetime(dtCriacao)) AS diaDaSemana
FROM clientes

SELECT idCliente,
        dtCriacao,
        substr(dtCriacao, 1, 10) AS dtSubstring
FROM clientes


SELECT idCliente,
        dtCriacao,
        datetime( substr(dtCriacao, 1, 19) ) AS dtCricaoNova
FROM clientes