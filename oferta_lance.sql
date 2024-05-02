select cotas.grupo,cotas.cota,
       cotas.sitCota,
       cotas.nomeConsorciado ,
       cotas.proposta,
       cotas.email1,
       lances.vlrLance ,
       lances.percLanceOfertado ,
       lances.tipoLance ,
       lances.dataAssembleia ,
       lances.assRefLance 
from siens_bi.cotas cotas join siens_bi.lances lances on cotas.proposta = lances.proposta
join siens_bi.pagamentos pagamentos on pagamentos.proposta  = cotas.proposta 

/*>= to_date('{0}', 'YYYY-MM-DD HH24:MI:SS') and ls.dtalance < to_date('{1}', 'YYYY-MM-DD HH24:MI:SS')*/