SELECT
	cotas.nomeConsorciado ,
	cotas.cota,
	cotas.Grupo,
	cotas.cpfCnpjCota as cgccpf,
	cotas.dataContemplacao ,
	cotas.assContemplacao ,
	SUBSTRING_INDEX(dataContemplacao,'-',1) AS ano,
	SUBSTRING_INDEX(SUBSTRING_INDEX(dataContemplacao,'-',2),'-',-1) AS mes,
	SUBSTRING_INDEX(dataContemplacao,'-',-1)as dia,
	cotas.email1,
	trim(cotas.sitCota)as sitcota ,
	CASE
		WHEN cotas.codEspecie = 2 THEN 'AUTOMÓVEL'
		WHEN cotas.codEspecie = 6 THEN 'CAMINHÃO'
		WHEN cotas.codEspecie = 5 THEN 'VEÍCULO'
		WHEN cotas.codEspecie = 13 THEN 'SERVIÇO'
		WHEN cotas.codEspecie = 14 THEN 'IMÓVEL'
		ELSE 'OUTROS'
	END AS TIPO_GRUPO
FROM
	siens_bi.cotas cotas
WHERE
	trim(cotas.sitCota) = 'Ativa'
	AND trim(cotas.tipoContemplacao) = 'LANCE'
	AND cotas.codRevenda <> 505204
	AND cotas.grupo <> '02051'
	AND cotas.situacoes NOT REGEXP '458|468|462|475|477|527|8|10|401|425|437|439|440|443|444|446|447|448|449|450|451|452|453|454|455|456|465|470|473|486|500|501|507|515|518|523|528'
	AND cotas.nomeConsorciado NOT IN ('CAZECA LOCADORA DE VEICULOS E ASSES.LTDA', 'DREAMS CONSTRUCOES E ACABAMENTOS LTDA', 'DREAMS CONSTRUTORA E INCORPORADORA LTDA', 'AD HOC CORRETORA DE SEGUROS LTDA')
	AND cotas.email1 IS NOT NULL
	AND cotas.dataContemplacao BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 DAY) AND CURDATE()
union
SELECT
	cotas.nomeConsorciado ,
	cotas.cota,
	cotas.Grupo,
	cotas.cpfCnpjCota as cgccpf,
	cotas.dataContemplacao ,
	cotas.assContemplacao ,
	SUBSTRING_INDEX(dataContemplacao,'-',1) AS ano,
	SUBSTRING_INDEX(SUBSTRING_INDEX(dataContemplacao,'-',2),'-',-1) AS mes,
	SUBSTRING_INDEX(dataContemplacao,'-',-1)as dia,
	cotas.email2,
	trim(cotas.sitCota)as sitcota ,
	CASE
		WHEN cotas.codEspecie = 2 THEN 'AUTOMÓVEL'
		WHEN cotas.codEspecie = 6 THEN 'CAMINHÃO'
		WHEN cotas.codEspecie = 5 THEN 'VEÍCULO'
		WHEN cotas.codEspecie = 13 THEN 'SERVIÇO'
		WHEN cotas.codEspecie = 14 THEN 'IMÓVEL'
		ELSE 'OUTROS'
	END AS TIPO_GRUPO
FROM
	siens_bi.cotas cotas
WHERE
	trim(cotas.sitCota) = 'Ativa'
	AND trim(cotas.tipoContemplacao) ='LANCE LIVRE'
	AND cotas.codRevenda <> 505204
	AND cotas.grupo <> '02051'
	AND cotas.situacoes NOT REGEXP '458|468|462|475|477|527|8|10|401|425|437|439|440|443|444|446|447|448|449|450|451|452|453|454|455|456|465|470|473|486|500|501|507|515|518|523|528'
	AND cotas.nomeConsorciado NOT IN ('CAZECA LOCADORA DE VEICULOS E ASSES.LTDA', 'DREAMS CONSTRUCOES E ACABAMENTOS LTDA', 'DREAMS CONSTRUTORA E INCORPORADORA LTDA', 'AD HOC CORRETORA DE SEGUROS LTDA')
	AND cotas.email2 IS NOT NULL
	AND cotas.dataContemplacao BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 DAY) AND CURDATE()