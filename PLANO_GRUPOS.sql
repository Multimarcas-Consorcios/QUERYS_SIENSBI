select
	cotas.grupo,
	cotas.cota,
	cotas.dataVenda,
	cotas.sitCota,
	e.codBem,e.tipoBem, 
	e.descricao
from
	siens_bi.cotas cotas
join siens_bi.ecommerce e on
	cotas.grupo = e.grupo
where
	e.codBem in (3463, 3464, 3465)