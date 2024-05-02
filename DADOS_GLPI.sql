SELECT
	x.id,
	gg.name,us.name,
	x.date_creation as data_criacao,
	x.solvedate as data_solucao,
	DATEDIFF(x.solvedate, x.date_creation)as tempo_resposta,ROUND((gs.number_time/24)) as SLA_EM_DIAS,
	gt.satisfaction,
	gt.comment
FROM
	glpidb.glpi_tickets x
join glpidb.glpi_groups_users gu on
	gu.users_id = x.users_id_lastupdater
join glpidb.glpi_groups gg on
	gg.id = gu.groups_id
left join glpidb.glpi_ticketsatisfactions gt on
	x.id = gt.id
join glpidb.glpi_slas gs on gs.id =x.slas_id_ttr
join glpidb.glpi_users us on us.id =x.users_id_lastupdater 
where
	x.date BETWEEN '2024-04-01' and SYSDATE() 
	and gg.name in('Setor de Suporte a Sistemas', 'Tecnologia', 'Setor Ciências de Dados', 'Setor de Desenvolvimento', 'Setor de T.I', 'Setor de Inovação')
	OR gg.id = 114
	
	
	
/*SHOW COLUMNS FROM glpidb.glpi_tickets*/