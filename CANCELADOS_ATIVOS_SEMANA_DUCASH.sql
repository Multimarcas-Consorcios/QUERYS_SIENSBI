SELECT
	COTAS.dataVenda as data,
	COTAS.nomeConsorciado,
	COTAS.cpfCnpjCota ,
	COTAS.dataNascimento,
	COTAS.sexo,
	COTAS.proposta,
	COTAS.uf,
	COTAS.cidade,
	COTAS.bairro ,
	COTAS.cep,
	CONCAT(COTAS.dddFone1, COTAS.nroFone1)as telefone_1,
	CONCAT(COTAS.dddCelular , COTAS.nroCelular) as celular,
	COTAS.email1,
	'INCLUSÃO' AS OBSERVACAO
FROM
	siens_bi.cotas COTAS
WHERE
    TRIM(COTAS.sitCota) = 'Ativa'
    AND COTAS.dataVenda BETWEEN CURRENT_DATE - INTERVAL 15 DAY AND CURRENT_DATE
AND COTAS.situacoes NOT REGEXP '458|468|462|475|477|527'
    
union
SELECT
	COTAS.dataCancelamento as data,
	COTAS.nomeConsorciado,
	COTAS.cpfCnpjCota ,
	COTAS.dataNascimento,
	COTAS.sexo,
	COTAS.proposta,
	COTAS.uf,
	COTAS.cidade,
	COTAS.bairro ,
	COTAS.cep,
	CONCAT(COTAS.dddFone1, COTAS.nroFone1)as telefone_1,
	CONCAT(COTAS.dddCelular , COTAS.nroCelular) as celular,
	COTAS.email1,
	'EXCLUSÃO' AS OBSERVACAO
FROM
	siens_bi.cotas COTAS
WHERE
    TRIM(COTAS.sitCota) = 'Cancelada'
    AND COTAS.dataVenda BETWEEN CURRENT_DATE - INTERVAL 15 DAY AND CURRENT_DATE
	AND COTAS.situacoes NOT REGEXP '458|468|462|475|477|527';
    
    
    
    
    ;
    
   
   {"name":"Isabela","email":"isabela.bahiense@ducash.com.br"},{"name":"Walter","email":"walter.junior@ducash.com.br"},{"name":"Rodrigo","email":"rodrigo.costa@ducash.com.br"}, {"name":"Daniel","email":"daniel.hott@multimarcasconsorcios.com.br"}, 