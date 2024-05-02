SELECT 'agendamentos < 17:00' as tabela, count(*) as qtd_linhas FROM siens_bi.agendamentos x
where x.dataContato BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 DAY) AND CURDATE()
and HOUR(x.dataContato) < 17
union
SELECT 'agendamentos > 17:00' as tabela, count(*) as qtd_linhas FROM siens_bi.agendamentos x
where x.dataContato BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 DAY) AND CURDATE()
and HOUR(x.dataContato) >= 17
union
SELECT 'lances' as tabela,count(*) as qtd_linhas  FROM siens_bi.lances l 
where l.dataOferta  BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 DAY) AND CURDATE()
union
SELECT 'cotas' as tabela,count(*) as qtd_linhas  FROM siens_bi.cotas c
where c.dataVenda  BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 DAY) AND CURDATE()
union
SELECT 'pagamentos' as tabela,count(*) FROM siens_bi.pagamentos p
where p.dataPagamento BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 DAY) AND CURDATE()