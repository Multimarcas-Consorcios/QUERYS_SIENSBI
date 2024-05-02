select
cotas.proposta,
cotas.grupo,
cotas.cota,
cotas.sitCota,
cotas.dataVenda,
cotas.ufRevenda,
cotas.nomeVendedor,
agendamentos.apelidoAtendeu,
agendamentos.descAssunto,
agendamentos.descMotivo 
from
	siens_bi.cotas cotas join siens_bi.agendamentos agendamentos on agendamentos.proposta  = cotas.proposta
where agendamentos.codMotivo IN (526,524,530,536,584,540,539,560)
;



select c.proposta,
          c.grupo,
          c.cota,
          c.sitCota,
          a.codMotivo,
		 a.dataContato as dtageracao,
          a.apelidoAtendeu as usu_checagem,
          a.descMotivo,  
          a.descAssunto,
          c.dataVenda,
          c.ufRevenda
from siens_bi.agendamentos a 
     join siens_bi.cotas c  on a.proposta = c.proposta 
where a.codMotivo = '580'
and a.dataContato  > '2024-01-01'


select * from cotas c where grupo = '02052'
