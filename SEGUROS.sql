select
    pa.vlrSegVida AS vlrSegVida,
    pa.dataContabil AS dataContabil,
    co.grupo,
    co.uf AS uf,
    co.cotaComSeguro AS cotaComSeguro,
    co.sitCota AS sitCota
from
    siens_bi.pagamentos pa
join siens_bi.cotas co on
    pa.proposta = co.proposta
WHERE pa.dataContabil >= '2024-01-01'

SELECT c.grupo,c.cota,c.dataVenda,c.proposta,x.codAssunto,x.descMotivo,x.observacao  FROM siens_bi.agendamentos x join siens_bi.cotas c on x.proposta = c.proposta 
where x.codMotivo = 555
and c.dataVenda >='2023-04-06'
and LENGTH(c.proposta) > 7


select distinct c.ufRevenda  from siens_bi.cotas c 