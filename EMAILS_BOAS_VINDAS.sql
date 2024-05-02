select
	cotas.nomeConsorciado ,
	cotas.grupo ,
	cotas.cota ,
	cotas.email1 ,
	cotas.codRevenda,
	cotas.proposta,
	agendamentos.codMotivo,cotas.proposta
from
	siens_bi.cotas cotas
join siens_bi.agendamentos agendamentos on
	cotas.proposta = agendamentos.proposta
where
	agendamentos.dataContato BETWEEN CURDATE() - INTERVAL 1 DAY AND CURDATE()*/
	cotas.codRevenda = 505204
	and agendamentos.codMotivo in (584, 539,716)
	and trim(cotas.email1) is not null
     