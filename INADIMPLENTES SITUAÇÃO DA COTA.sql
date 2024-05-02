select
	trim(cotas.nomeConsorciado) as nomerazao,
	cotas.cpfCnpjCota as cpf,
	trim(cotas.email1)as email,
	trim(cotas.email2)as email2,
	CONCAT(cotas.dddFone1, cotas.nroFone1)as numero_1,
	CONCAT(cotas.dddFone2, cotas.nroFone2) as numero_2,
	'' AS numero_3,
	CONCAT(cotas.dddCelular, cotas.nroCelular) as celular,
	'' as celular_2,
	trim(cotas.proposta) as nrocontratoadesao,
	cotas.grupo,
	cotas.cota,
	trim(cotas.sitCota) AS status_consorciado,
	cotas.dataContemplacao as dtacontemplacao,
	trim(cotas.tipoContemplacao) as situacao,
	cotas.dataVenda as dtaadesao,
	'' as formalance,
	cotas.dataPgCredito as dtaentregabem,
	cotas.situacoes as seqcadsituacao,
	case
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '447-' then 'MEDIAÇAO DR ALBERTO'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '448-' then 'MEDIAÇAO DR FLAVIANO'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '450-' then 'MEDIAÇ WASHING TRANN'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '451-' then 'MEDIAÇAO DR ARTHUR'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '452-' then 'MEDIACAO DRA ERCILIA'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '453-' then 'MEDIACAO DRA LETICIA'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '455-' then 'MEDIAÇAO DR HAMILTON'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '456-' then 'MEDIACAO JALES MELO'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '457-' then 'BLOQUEIO WEB'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '458-' then 'COTA SEM BOLETO'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '460-' then 'CRED UTILIZ QUIT PCL'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '461-' then 'CANCELADA CHECAGEM'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '465-' then 'MEDIAÇAO ANA MARIA'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '464-' then 'MEDIACAO SEM BOLETO1'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '466-' then 'NEGOCIAÇÃO PENDENTE'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '467-' then 'NEGOCIAÇÃO SUSTENTAÇ'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '470-' then 'JURIDICO SAG ARIGATO'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '471-' then 'JURIDIGO SAG S/BOLET'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '462-' then 'DESISTENTE WEB'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '468-' then 'COTA SEM BOLETO-FAB'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '469-' then 'COTA ARIG'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '437-' then 'JURIDICO SAG'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '425-' then 'INCOBRAVEL'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '000-' then 'NORMAL'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '428-' then 'Transf. Pendente'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '410-' then 'NORMAL'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '415-' then 'AÇÃO CONTRÁRIA-ATIVO'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '397-' then 'CANCEL SOL CONSORCIA'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '399-' then 'CANCELADA FORMACAO'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '436-' then 'DESISTENTE'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '013-' then 'Cancela Trans.Pendte'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '001-' then 'Transferência Cont'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '003-' then 'EXCLUIDA'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '004-' then 'CANCEL INADIMPLENTE'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '005-' then 'Troca nº Cota Normal'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '006-' then 'NORMAL - 6'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '009-' then 'SINISTRO'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '010-' then 'BUSCA APREENSAO'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '011-' then 'QUITADO'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '439-' then 'MEDIACAO 2 PARCELAS'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '396-' then 'COBRANCA 1 PARCELA'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '401-' then 'MEDIACAO JURIDICO'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '440-' then 'MEDIACAO 3 PARCELAS'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '442-' then 'DESISTENTE JUR ACAO'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '441-' then 'CANCELADA ACAO CONTR'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '443-' then 'JURIDICO ALBERTO PON'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '444-' then 'JURIDICO HAMILTON RI'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '445-' then 'MEDIACAO ACAO CONTRA'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '446-' then 'MEDIACAO FRANKLIN'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '490-' then 'TROCA DE CONTRATO'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '491-' then 'CANCEL - CARTÃO CANC'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '492-' then 'CANCEL - RECLAME AQU'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '495-' then 'ANALISE - COMPLIANCE'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '496-' then 'CANCEL - RECL PROCON'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '476-' then 'CANCEL VENDAS'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '481-' then 'CRED UTIL-DEB ABONAD'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '482-' then 'DEBTO ABONADO/PRESCR'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '483-' then 'EXCLUIDA CONT CANCEL'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '486-' then 'MEDIAÇ WASHING MIRAN'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '499-' then 'CANCEL - CONTESTAÇÃO'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '500-' then 'ACORDO EXTRAJUDI-ADV'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '504-' then 'CANCEL C/PENDENCIA'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '506-' then 'CANCELADO OUVIDORIA'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '514-' then 'CANCEL NA DIRETORIA'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '515-' then 'COTA AJUIZADA - FLAV'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '473-' then 'MEDIAÇÃO - B & TRANM'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '474-' then 'CANCEL.P/REPRESENTAN'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '477-' then 'QUITADO S BOLETO-FAB'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '478-' then 'CANCEL PENDENTE'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '489-' then 'RESTRIÇÃO CADASTRAL'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '493-' then 'CANCEL-DEV APÓS ASS'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '498-' then 'CANCEL SEM CHECAGEM'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '505-' then 'COTA COBRANÇA SUSTEN'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '507-' then 'COTA AJUIZADA B & T'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '511-' then 'PEND.DOC VIA BOLETO'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '512-' then 'RECLAMACAO - BACEN'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '513-' then 'CONTEMP.A CANCELAR'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '472-' then 'BLOQUEIO COM RESIDUO'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '475-' then 'QUITADO S/BOLETO'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '479-' then 'BLOQUEIO ENVIO BOLET'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '480-' then 'CANCEL SEM PAGAMENTO'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '484-' then 'PCLS PAGAS P/ ADM'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '485-' then 'COTA NAO QUITADA'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '494-' then 'CANCEL - COMPLIANCE'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '488-' then 'DEBITO PROVISIONADO'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '497-' then 'CANCEL - NÃO CHECADA'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '502-' then 'NEG.EXTRA JUDICIAL'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '503-' then 'CONTRATO DUPLICIDADE'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '508-' then 'CANCEL - ANTES ASS'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '509-' then 'VENDA C/CANCELAMENTO'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '454-' then 'MEDIAÇAO CASTRO OLIV'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '449-' then 'MEDIACAO FELIPE JACO'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '501-' then 'MEDIAÇÃO INTERNA'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '516-' then 'CANCEL.COMPLIANCE'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '517-' then 'EXCEÇÃO EM ANALISE'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '518-' then 'COTA AJUIZADA - HAM'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '519-' then 'CANC. C/CARTA S/CHEC'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '520-' then 'CANCEL. CONSUMID.GOV'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '521-' then 'ANALISE COMPLIANCE'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '522-' then 'CANCEL. RECL. BACEN'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '008-' then 'COTA AJUIZADA'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '002-' then 'Transferência NCont'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '523-' then 'COTA AJUIZADA - WASH'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '524-' then 'BLQ CONT 1 PCL'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '525-' then 'BLQ CONT 2 PCL'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '526-' then 'BLQ CONT 3 PCL'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '527-' then 'COTA S/BOLETO - DR'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '528-' then 'COTA AJUIZADA - ALB'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '529-' then 'QUITADO S/BOLETO-DR'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '459-' then 'COTA N FAT'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '530-' then 'ANALISE FATURAMENTO'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '510-' then 'MONTAGEM PROC. P/JUR'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '438-' then 'BLOQUEIO SLIP ATRASO'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '531-' then 'COTA AJUIZADA-CASTRO'
		when SUBSTRING(trim(cotas.situacoes),-4,(length(cotas.situacoes))) = '532-' then 'PROCON - COTA ATIVA'
	end as descreduzida,
	''as status_faturamento,
	''as nomerazao1,
	cotas.sexo,
	trim(cotas.cidade) as cidade,
	cotas.uf,
	'' AS data_nasc,
	'' as atividade,
	'' as idade,
	  CASE
		WHEN cotas.codEspecie = 2 THEN 'AUT'
		WHEN cotas.codEspecie = 5 THEN 'MOT'
		WHEN cotas.codEspecie = 6 THEN 'CAM'
		WHEN cotas.codEspecie = 13 THEN 'SRV'
		WHEN cotas.codEspecie = 14 THEN 'IMV'
	END as especiebem,
	cotas.vlrRendaFaturamento as renda,
	'' as comprovante,
	'' as tipocmpl,
	cotas.codVendedor as comissionado,
	cotas.nomeVendedor as nome_repre,
	cotas.codRevenda as cod_master,
	trim(cotas.nomeRevenda) as nome_master,
	cotas.ufRevenda as uf_master,
	cotas.vlrCreditoContemplacao as vlr_cred_pago,
	cotas.creditoVenda as vlr_contemplado,
	cotas.creditoAtualizado as vlrbem_atual,
	replace(cotas.percPago,'.',',') as perc_adq,
	(SELECT MAX(pagamentos.vlrPago) FROM siens_bi.pagamentos pagamentos WHERE pagamentos.proposta = cotas.proposta AND pagamentos.codMvto = 003)as parcela_atual,
	cotas.qtdePclsPagas as parcelas_pagas,
	cotas.diasMaiorAtraso as diasatraso,
	CAST(sysdate() - INTERVAL cotas.diasMaiorAtraso DAY AS DATE) as vencimento,
	cotas.qtdeAtrasos as qtde_parc_inad,(SELECT MAX(pagamentos.vlrTaxaAdm) FROM siens_bi.pagamentos pagamentos WHERE pagamentos.proposta = cotas.proposta AND pagamentos.codMvto = 003)as txAdmParcela
from
	siens_bi.cotas cotas  
where
	trim(cotas.sitCota) = 'Ativa'