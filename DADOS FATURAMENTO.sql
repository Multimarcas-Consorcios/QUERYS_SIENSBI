SELECT 
    a.grupo, 
    a.cota, 
   a.proposta,c.cadAprovado,c.dataAnalise,c.dataPgCredito, 
    case 
		when c.codEspecie = 2 then 'AUT'
		when c.codEspecie = 5 then 'MOT'
		when c.codEspecie = 6 then 'CAM'
		when c.codEspecie = 13 then 'SRV'
		when c.codEspecie = 14 then 'IMV'
	end as especie,max(CASE WHEN codMotivo = 469 THEN dataContato END) as dataCadastroAprovado,
    DATEDIFF(min(CASE WHEN a.codMotivo = 469 THEN a.dataContato END), min(CASE WHEN a.codMotivo = 142 THEN a.dataContato END)) AS diferenca
FROM 
    agendamentos a join cotas c on c.proposta = a.proposta 
WHERE 
    TRIM(a.descAssunto) = "CONTEMPLACAO"
    AND a.dataContato > '2024-01-01'
    AND a.codMotivo IN (469, 142)
GROUP BY
    a.grupo, 
    a.cota, 
    a.proposta,c.cadAprovado,c.dataAnalise,c.dataPgCredito
  having diferenca is not null;
