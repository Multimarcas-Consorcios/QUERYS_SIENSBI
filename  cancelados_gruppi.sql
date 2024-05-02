select DISTINCT  
	cotas.nomeConsorciado,
	cotas.Grupo,
	cotas.cpfCnpjCota AS cgccpf,
	cotas.dataContemplacao AS data_assembleia,
	cotas.assContemplacao,
	cotas.cota,
	cotas.email1,
	MONTH(NOW()),
	CASE
		WHEN cotas.codEspecie = 2 THEN 'AUTOMÓVEL'
		WHEN cotas.codEspecie = 6 THEN 'CAMINHÃO'
		WHEN cotas.codEspecie = 5 THEN 'VEÍCULO'
		WHEN cotas.codEspecie = 13 THEN 'SERVIÇO'
		WHEN cotas.codEspecie = 14 THEN 'IMÓVEL'
		ELSE 'OUTROS'
	END AS TIPO_GRUPO,
	SUBSTRING_INDEX(dataContemplacao, '-',-1) AS dia,
	SUBSTRING_INDEX(dataContemplacao, '-', 1) AS ano,
	CASE
		WHEN MONTH(NOW()) = 1 THEN 'Janeiro'
		WHEN MONTH(NOW()) = 2 THEN 'Fevereiro'
		WHEN MONTH(NOW()) = 3 THEN 'Março'
		WHEN MONTH(NOW()) = 4 THEN 'Abril'
		WHEN MONTH(NOW()) = 5 THEN 'Maio'
		WHEN MONTH(NOW()) = 6 THEN 'Junho'
		WHEN MONTH(NOW()) = 7 THEN 'Julho'
		WHEN MONTH(NOW()) = 8 THEN 'Agosto'
		WHEN MONTH(NOW()) = 9 THEN 'Setembro'
		WHEN MONTH(NOW()) = 10 THEN 'Outubro'
		WHEN MONTH(NOW()) = 11 THEN 'Novembro'
		WHEN MONTH(NOW()) = 12 THEN 'Dezembro'
	END AS mes
FROM
	siens_bi.cotas
JOIN
siens_bi.agendamentos atendimentos on
	atendimentos.proposta = cotas.proposta
WHERE
	cotas.tipoContemplacao REGEXP('Canc.Contemplada')
	AND cotas.dataContemplacao BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 DAY) AND CURDATE()
	AND cotas.codRevenda in (505204,532629)
	AND atendimentos.codMotivo <> 233
	AND cotas.grupo <> '02051'
	AND cotas.situacoes NOT REGEXP '458|468|462|475|477|527|8|10|401|425|437|439|440|443|444|446|447|448|449|450|451|452|453|454|455|456|465|470|473|486|500|501|507|515|518|523|528'
	AND cotas.nomeConsorciado NOT IN ('CAZECA LOCADORA DE VEICULOS E ASSES.LTDA', 'DREAMS CONSTRUCOES E ACABAMENTOS LTDA', 'DREAMS CONSTRUTORA E INCORPORADORA LTDA', 'AD HOC CORRETORA DE SEGUROS LTDA')
	AND cotas.grupo <> '02051'
	AND cotas.email1 REGEXP('@')
	

	
