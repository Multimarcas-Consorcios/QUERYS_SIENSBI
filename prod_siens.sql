select cotas.proposta as contrato,
       cotas.grupo,cotas.cota,
       cotas.sitCota  as nivel,
       cotas.codVendedor  ,
       cotas.creditoAtualizado as Preco, 
       cotas.nomeVendedor,
       cotas.codRevenda ,cotas.dataChecagem,
       'CONSOLIDADAS' as STATUS,
       cotas.dataVenda ,
      'Fevereiro/24' as producao,
        25 as clas_mes,
       case 
                  when cotas.codRevenda = 505204 then 'GR'
                  when cotas.codRevenda = 502015 then 'GR'
                  when cotas.codRevenda = 62289 then 'GR'
                  when cotas.codRevenda = 532629 then 'GR'
                  else  cotas.ufRevenda 
                  end  as uf    
from siens_bi.cotas cotas
where cotas.dataVenda between '2024-01-26' AND '2024-02-23'
and trim(cotas.sitCota) = 'Ativa' 
and exists(select sum(pa.vlrPago) from siens_bi.pagamentos pa join siens_bi.cotas cotas on pa.proposta = cotas.proposta
where pa.codMvto ='002'
and pa.dataPagamento between '2024-01-26' AND '2024-02-23'
group by pa.dataPagamento 
having sum(pa.vlrPago)> 0)
and cotas.codVendedor not in ('009999','000999')
and cotas.dataChecagem < '2024-03-01'
/*and exists(select * from siens_bi.agendamentos agendamentos
                    where agendamentos.proposta = cotas.proposta
                    and agendamentos.codMotivo  in ('584','539','716')
                    and agendamentos.dataContato < '2024-02-01')*/
UNION
/*BUSCA OCORR�NCIAS DA CHECAGEM*/
select cotas.proposta as contrato,
       cotas.grupo,cotas.cota,
       cotas.sitCota  as nivel,
       cotas.codVendedor  ,
       cotas.creditoAtualizado as Preco, 
       cotas.nomeVendedor,
       cotas.codRevenda ,cotas.dataChecagem,
       'CANCELADA' as STATUS,
       cotas.dataVenda ,
      'Fevereiro/24' as producao,
        25 as clas_mes,
       case 
                  when cotas.codRevenda = 505204 then 'GR'
                  when cotas.codRevenda = 502015 then 'GR'
                  when cotas.codRevenda = 62289 then 'GR'
                  when cotas.codRevenda = 532629 then 'GR'
                  else  cotas.ufRevenda 
                  end  as uf    
from siens_bi.cotas cotas
where cotas.dataVenda between '2024-01-26' AND '2024-02-23'
and trim(cotas.sitCota) = 'Cancelada' 
and exists(select sum(pa.vlrPago) from siens_bi.pagamentos pa join siens_bi.cotas cotas on pa.proposta = cotas.proposta
where pa.codMvto ='002'
and pa.dataPagamento between '2024-01-26' AND '2024-02-23'
group by pa.dataPagamento 
having sum(pa.vlrPago)> 0)
and cotas.codVendedor not in ('009999','000999')
and cotas.dataChecagem < '2024-03-01'
/*and exists(select * from siens_bi.agendamentos agendamentos
                    where agendamentos.proposta = cotas.proposta
                    and agendamentos.codMotivo  in ('524','526','530','536','539','540','542','560','584''524','526','530','536','539','540','542','560','584')
                    and agendamentos.dataContato < '2024-02-01')*/
UNION
/*BUSCA TODAS AS VENDAS DO PERIODO*/
select cotas.proposta as contrato,
       cotas.grupo,cotas.cota,
       cotas.sitCota  as nivel,
       cotas.codVendedor  ,
       cotas.creditoAtualizado as Preco, 
       cotas.nomeVendedor,
       cotas.codRevenda ,cotas.dataChecagem,
       'TODAS' as STATUS,
       cotas.dataVenda ,
      'Fevereiro/24' as producao,
        25 as clas_mes,
       case 
                  when cotas.codRevenda = 505204 then 'GR'
                  when cotas.codRevenda = 502015 then 'GR'
                  when cotas.codRevenda = 62289 then 'GR'
                  when cotas.codRevenda = 532629 then 'GR'
                  else  cotas.ufRevenda 
                  end  as uf    
from siens_bi.cotas cotas
where cotas.dataVenda between '2024-01-26' AND '2024-02-23'
and not trim(cotas.sitCota)  = 'Substituida'
and exists(select sum(pa.vlrPago) from siens_bi.pagamentos pa join siens_bi.cotas cotas on pa.proposta = cotas.proposta
where pa.codMvto ='002'
and pa.dataPagamento between '2024-01-26' AND '2024-02-23'
group by pa.dataPagamento 
having sum(pa.vlrPago)> 0)
and cotas.codVendedor not in ('009999','000999')
and cotas.dataChecagem < '2024-03-01'
/*and exists(select * from siens_bi.agendamentos agendamentos
                    where agendamentos.proposta = cotas.proposta
                    and agendamentos.codMotivo  in ('584','524','526','530','536','539','540','542','560','716')
                    and agendamentos.dataContato < '2024-02-01')*/
/*BUSCA TODAS VENDAS DO PERIODO ANTERIOR*/

