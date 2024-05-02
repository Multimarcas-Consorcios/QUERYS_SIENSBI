SELECT
    cotas.grupo,
    cotas.cota,
    cotas.nomeConsorciado,
    cotas.proposta AS nro_contrato,
    CONCAT(cotas.dddFone1,'-', cotas.nroFone1)as NUMERO_1,
	CONCAT(cotas.dddFone2,'-', cotas.nroFone2) as NUMERO_2,
	CONCAT(cotas.dddCelular ,'-', cotas.nroCelular) as CELULAR,
    cotas.cidade,
    cotas.uf,
    cotas.email1,
    cotas.email2
FROM siens_bi.cotas cotas
WHERE trim(cotas.sitCota) = 'Ativa'
and cotas.situacoes NOT REGEXP '458|468|462|475|477|527|8|10|401|425|437|439|440|443|444|446|447|448|449|450|451|452|453|454|455|456|465|470|473|486|500|501|507|515|518|523|528'
AND cotas.nomeConsorciado  NOT IN ('CAZECA LOCADORA DE VEICULOS E ASSES.LTDA','DREAMS CONSTRUCOES E ACABAMENTOS LTDA','DREAMS CONSTRUTORA E INCORPORADORA LTDA','AD HOC CORRETORA DE SEGUROS LTDA')


SELECT
cotas.nomeVendedor,
cotas.nomeRevenda,
cotas.emailVendedor,
cotas.ufRevenda,
cotas.codrevenda
FROM siens_bi.cotas cotas
WHERE trim(cotas.codrevenda) NOT IN(
    505204,
    502015,
    62289,
    532629
)
GROUP BY
    cotas.nomeVendedor,
    cotas.nomeRevenda,
    cotas.emailVendedor,
    cotas.ufRevenda
ORDER BY 
    cotas.ufRevenda,
    cotas.nomeRevenda
