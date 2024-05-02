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
where cotas.situacoes NOT REGEXP '458|468|462|475|477|527'
and  trim(cotas.sitCota) = 'Ativa'
and cotas.dataContemplacao  is null
and lances.dataOferta BETWEEN CURDATE() - INTERVAL 1 DAY AND CURDATE()