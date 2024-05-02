SELECT
	c.grupo,
	c.cota,
	c.dataVenda,
	c.proposta,
	x.descAssunto,
	x.descMotivo,
	trim(x.observacao)
FROM
	siens_bi.agendamentos x
join siens_bi.cotas c on
	x.proposta = c.proposta
where
	x.codMotivo = 555
	and c.dataVenda >= '2023-04-06'
	and LENGTH(c.proposta) > 7