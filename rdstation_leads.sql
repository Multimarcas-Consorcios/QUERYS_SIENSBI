SELECT
	x.nomeConsorciado,
	x.proposta,x.dataVenda, 
	x.nomeRevenda,
	x.email1,
	concat(x.dddCelular , x.nroCelular)as celular
FROM
	siens_bi.cotas x
where
	x.codVendedor in ('1533', '1575', '1586', '1524')
	and x.dataVenda 