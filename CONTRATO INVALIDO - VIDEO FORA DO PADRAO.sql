select
	grupo,
	cota,
	proposta,
	dataContato,
	apelidoAtendeu,
	descMotivo,
	observacao
from
	siens_bi.agendamentos
where
	trim(observacao) like '%Vídeo fora do%'
