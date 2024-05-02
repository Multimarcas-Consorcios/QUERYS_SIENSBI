select
	cotas.grupo,
	cotas.cota,
	cotas.sitCota,
	cotas.proposta,
	cotas.uf,codVendedor,codRevenda, 
	cotas.nomeVendedor,cotas.creditoVenda, 
	case
		when cotas.dataPgCredito is null then 'NÃO FATURADO'
		ELSE'FATURADO'
	end AS STATUS_FATURADO,cotas.dataPgCredito,
	case
		when codRevenda = 505204 then 'IS'
		when codRevenda = 502015 then 'YM'
		when codRevenda = 62289 then 'PAI'
		when codRevenda = 532629 then 'GR'
	end as setor,
	cotas.dataContemplacao,
	cotas.dataVenda,
	cotas.tipoContemplacao
from
	siens_bi.cotas cotas
where cotas.codRevenda in(505204,502015,62289,532629)
and trim(cotas.sitCota)= 'Ativa'
and cotas.dataContemplacao is not null