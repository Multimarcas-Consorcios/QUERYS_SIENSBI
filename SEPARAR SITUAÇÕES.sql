SELECT cotas.proposta,
    SUBSTRING_INDEX(SUBSTRING_INDEX(trim(cotas.situacoes), '-', n), '-', -1) AS numero
FROM
    siens_bi.cotas cotas,
    (SELECT 1 AS n
     UNION ALL SELECT 2
     UNION ALL SELECT 3
     UNION ALL SELECT 4
     UNION ALL SELECT 5) numbers
WHERE
    n <= 1 + LENGTH(cotas.situacoes) - LENGTH(REPLACE(cotas.situacoes, '-', ''))and LENGTH(trim(cotas.situacoes))>5;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*case
		when trim(cotas.situacoes) LIKE '%447%' then 'MEDIAÇAO DR ALBERTO'
		when trim(cotas.situacoes) LIKE '%448%' then 'MEDIAÇAO DR FLAVIANO'
		when trim(cotas.situacoes) LIKE '%450%' then 'MEDIAÇ WASHING TRANN'
		when trim(cotas.situacoes) LIKE '%451%' then 'MEDIAÇAO DR ARTHUR'
		when trim(cotas.situacoes) LIKE '%452%' then 'MEDIACAO DRA ERCILIA'
		when trim(cotas.situacoes) LIKE '%453%' then 'MEDIACAO DRA LETICIA'
		when trim(cotas.situacoes) LIKE '%455%' then 'MEDIAÇAO DR HAMILTON'
		when trim(cotas.situacoes) LIKE '%456%' then 'MEDIACAO JALES MELO'
		when trim(cotas.situacoes) LIKE '%457%' then 'BLOQUEIO WEB'
		when trim(cotas.situacoes) LIKE '%458%' then 'COTA SEM BOLETO'
		when trim(cotas.situacoes) LIKE '%460%' then 'CRED UTILIZ QUIT PCL'
		when trim(cotas.situacoes) LIKE '%461%' then 'CANCELADA CHECAGEM'
		when trim(cotas.situacoes) LIKE '%465%' then 'MEDIAÇAO ANA MARIA'
		when trim(cotas.situacoes) LIKE '%464%' then 'MEDIACAO SEM BOLETO1'
		when trim(cotas.situacoes) LIKE '%466%' then 'NEGOCIAÇÃO PENDENTE'
		when trim(cotas.situacoes) LIKE '%467%' then 'NEGOCIAÇÃO SUSTENTAÇ'
		when trim(cotas.situacoes) LIKE '%470%' then 'JURIDICO SAG ARIGATO'
		when trim(cotas.situacoes) LIKE '%471%' then 'JURIDIGO SAG S/BOLET'
		when trim(cotas.situacoes) LIKE '%462%' then 'DESISTENTE WEB'
		when trim(cotas.situacoes) LIKE '%468%' then 'COTA SEM BOLETO-FAB'
		when trim(cotas.situacoes) LIKE '%469%' then 'COTA ARIG'
		when trim(cotas.situacoes) LIKE '%437%' then 'JURIDICO SAG'
		when trim(cotas.situacoes) LIKE '%425%' then 'INCOBRAVEL'
		when trim(cotas.situacoes) LIKE '%0%' then 'NORMAL'
		when trim(cotas.situacoes) LIKE '%428%' then 'Transf. Pendente'
		when trim(cotas.situacoes) LIKE '%410%' then 'NORMAL'
		when trim(cotas.situacoes) LIKE '%415%' then 'AÇÃO CONTRÁRIA-ATIVO'
		when trim(cotas.situacoes) LIKE '%397%' then 'CANCEL SOL CONSORCIA'
		when trim(cotas.situacoes) LIKE '%399%' then 'CANCELADA FORMACAO'
		when trim(cotas.situacoes) LIKE '%436%' then 'DESISTENTE'
		when trim(cotas.situacoes) LIKE '%13%' then 'Cancela Trans.Pendte'
		when trim(cotas.situacoes) LIKE '%1%' then 'Transferência Cont'
		when trim(cotas.situacoes) LIKE '%3%' then 'EXCLUIDA'
		when trim(cotas.situacoes) LIKE '%4%' then 'CANCEL INADIMPLENTE'
		when trim(cotas.situacoes) LIKE '%5%' then 'Troca nº Cota Normal'
		when trim(cotas.situacoes) LIKE '%6%' then 'NORMAL - 6'
		when trim(cotas.situacoes) LIKE '%9%' then 'SINISTRO'
		when trim(cotas.situacoes) LIKE '%10%' then 'BUSCA APREENSAO'
		when trim(cotas.situacoes) LIKE '%11%' then 'QUITADO'
		when trim(cotas.situacoes) LIKE '%439%' then 'MEDIACAO 2 PARCELAS'
		when trim(cotas.situacoes) LIKE '%396%' then 'COBRANCA 1 PARCELA'
		when trim(cotas.situacoes) LIKE '%401%' then 'MEDIACAO JURIDICO'
		when trim(cotas.situacoes) LIKE '%440%' then 'MEDIACAO 3 PARCELAS'
		when trim(cotas.situacoes) LIKE '%442%' then 'DESISTENTE JUR ACAO'
		when trim(cotas.situacoes) LIKE '%441%' then 'CANCELADA ACAO CONTR'
		when trim(cotas.situacoes) LIKE '%443%' then 'JURIDICO ALBERTO PON'
		when trim(cotas.situacoes) LIKE '%444%' then 'JURIDICO HAMILTON RI'
		when trim(cotas.situacoes) LIKE '%445%' then 'MEDIACAO ACAO CONTRA'
		when trim(cotas.situacoes) LIKE '%446%' then 'MEDIACAO FRANKLIN'
		when trim(cotas.situacoes) LIKE '%490%' then 'TROCA DE CONTRATO'
		when trim(cotas.situacoes) LIKE '%491%' then 'CANCEL - CARTÃO CANC'
		when trim(cotas.situacoes) LIKE '%492%' then 'CANCEL - RECLAME AQU'
		when trim(cotas.situacoes) LIKE '%495%' then 'ANALISE - COMPLIANCE'
		when trim(cotas.situacoes) LIKE '%496%' then 'CANCEL - RECL PROCON'
		when trim(cotas.situacoes) LIKE '%476%' then 'CANCEL VENDAS'
		when trim(cotas.situacoes) LIKE '%481%' then 'CRED UTIL-DEB ABONAD'
		when trim(cotas.situacoes) LIKE '%482%' then 'DEBTO ABONADO/PRESCR'
		when trim(cotas.situacoes) LIKE '%483%' then 'EXCLUIDA CONT CANCEL'
		when trim(cotas.situacoes) LIKE '%486%' then 'MEDIAÇ WASHING MIRAN'
		when trim(cotas.situacoes) LIKE '%499%' then 'CANCEL - CONTESTAÇÃO'
		when trim(cotas.situacoes) LIKE '%500%' then 'ACORDO EXTRAJUDI-ADV'
		when trim(cotas.situacoes) LIKE '%504%' then 'CANCEL C/PENDENCIA'
		when trim(cotas.situacoes) LIKE '%506%' then 'CANCELADO OUVIDORIA'
		when trim(cotas.situacoes) LIKE '%514%' then 'CANCEL NA DIRETORIA'
		when trim(cotas.situacoes) LIKE '%515%' then 'COTA AJUIZADA - FLAV'
		when trim(cotas.situacoes) LIKE '%473%' then 'MEDIAÇÃO - B & TRANM'
		when trim(cotas.situacoes) LIKE '%474%' then 'CANCEL.P/REPRESENTAN'
		when trim(cotas.situacoes) LIKE '%477%' then 'QUITADO S BOLETO-FAB'
		when trim(cotas.situacoes) LIKE '%478%' then 'CANCEL PENDENTE'
		when trim(cotas.situacoes) LIKE '%489%' then 'RESTRIÇÃO CADASTRAL'
		when trim(cotas.situacoes) LIKE '%493%' then 'CANCEL-DEV APÓS ASS'
		when trim(cotas.situacoes) LIKE '%498%' then 'CANCEL SEM CHECAGEM'
		when trim(cotas.situacoes) LIKE '%505%' then 'COTA COBRANÇA SUSTEN'
		when trim(cotas.situacoes) LIKE '%507%' then 'COTA AJUIZADA B & T'
		when trim(cotas.situacoes) LIKE '%511%' then 'PEND.DOC VIA BOLETO'
		when trim(cotas.situacoes) LIKE '%512%' then 'RECLAMACAO - BACEN'
		when trim(cotas.situacoes) LIKE '%513%' then 'CONTEMP.A CANCELAR'
		when trim(cotas.situacoes) LIKE '%472%' then 'BLOQUEIO COM RESIDUO'
		when trim(cotas.situacoes) LIKE '%475%' then 'QUITADO S/BOLETO'
		when trim(cotas.situacoes) LIKE '%479%' then 'BLOQUEIO ENVIO BOLET'
		when trim(cotas.situacoes) LIKE '%480%' then 'CANCEL SEM PAGAMENTO'
		when trim(cotas.situacoes) LIKE '%484%' then 'PCLS PAGAS P/ ADM'
		when trim(cotas.situacoes) LIKE '%485%' then 'COTA NAO QUITADA'
		when trim(cotas.situacoes) LIKE '%494%' then 'CANCEL - COMPLIANCE'
		when trim(cotas.situacoes) LIKE '%488%' then 'DEBITO PROVISIONADO'
		when trim(cotas.situacoes) LIKE '%497%' then 'CANCEL - NÃO CHECADA'
		when trim(cotas.situacoes) LIKE '%502%' then 'NEG.EXTRA JUDICIAL'
		when trim(cotas.situacoes) LIKE '%503%' then 'CONTRATO DUPLICIDADE'
		when trim(cotas.situacoes) LIKE '%508%' then 'CANCEL - ANTES ASS'
		when trim(cotas.situacoes) LIKE '%509%' then 'VENDA C/CANCELAMENTO'
		when trim(cotas.situacoes) LIKE '%454%' then 'MEDIAÇAO CASTRO OLIV'
		when trim(cotas.situacoes) LIKE '%449%' then 'MEDIACAO FELIPE JACO'
		when trim(cotas.situacoes) LIKE '%501%' then 'MEDIAÇÃO INTERNA'
		when trim(cotas.situacoes) LIKE '%516%' then 'CANCEL.COMPLIANCE'
		when trim(cotas.situacoes) LIKE '%517%' then 'EXCEÇÃO EM ANALISE'
		when trim(cotas.situacoes) LIKE '%518%' then 'COTA AJUIZADA - HAM'
		when trim(cotas.situacoes) LIKE '%519%' then 'CANC. C/CARTA S/CHEC'
		when trim(cotas.situacoes) LIKE '%520%' then 'CANCEL. CONSUMID.GOV'
		when trim(cotas.situacoes) LIKE '%521%' then 'ANALISE COMPLIANCE'
		when trim(cotas.situacoes) LIKE '%522%' then 'CANCEL. RECL. BACEN'
		when trim(cotas.situacoes) LIKE '%8%' then 'COTA AJUIZADA'
		when trim(cotas.situacoes) LIKE '%2%' then 'Transferência NCont'
		when trim(cotas.situacoes) LIKE '%523%' then 'COTA AJUIZADA - WASH'
		when trim(cotas.situacoes) LIKE '%524%' then 'BLQ CONT 1 PCL'
		when trim(cotas.situacoes) LIKE '%525%' then 'BLQ CONT 2 PCL'
		when trim(cotas.situacoes) LIKE '%526%' then 'BLQ CONT 3 PCL'
		when trim(cotas.situacoes) LIKE '%527%' then 'COTA S/BOLETO - DR'
		when trim(cotas.situacoes) LIKE '%528%' then 'COTA AJUIZADA - ALB'
		when trim(cotas.situacoes) LIKE '%529%' then 'QUITADO S/BOLETO-DR'
		when trim(cotas.situacoes) LIKE '%459%' then 'COTA N FAT'
		when trim(cotas.situacoes) LIKE '%530%' then 'ANALISE FATURAMENTO'
		when trim(cotas.situacoes) LIKE '%510%' then 'MONTAGEM PROC. P/JUR'
		when trim(cotas.situacoes) LIKE '%438%' then 'BLOQUEIO SLIP ATRASO'
		when trim(cotas.situacoes) LIKE '%531%' then 'COTA AJUIZADA-CASTRO'
		when trim(cotas.situacoes) LIKE '%532%' then 'PROCON - COTA ATIVA'
	end as descreduzida*/
from siens_bi.cotas contas 