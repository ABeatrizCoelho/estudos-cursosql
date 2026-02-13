SELECT round(avg(QtdePontos),2),
    1. * sum(QtdePontos) / count(idCliente),
    min(QtdePontos) AS minCarteira,
    max(QtdePontos) AS maxCarteira,
    sum(flTwitch) AS comTwitch
FROM clientes