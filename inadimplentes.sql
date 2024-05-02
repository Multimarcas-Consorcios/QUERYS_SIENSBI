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
	trim(cotas.situacoes) as seqcadsituacao,
	case
		when cotas.situacoes = 447 then 'MEDIAÇAO DR ALBERTO'
		when cotas.situacoes = 448 then 'MEDIAÇAO DR FLAVIANO'
		when cotas.situacoes = 450 then 'MEDIAÇ WASHING TRANN'
		when cotas.situacoes = 451 then 'MEDIAÇAO DR ARTHUR'
		when cotas.situacoes = 452 then 'MEDIACAO DRA ERCILIA'
		when cotas.situacoes = 453 then 'MEDIACAO DRA LETICIA'
		when cotas.situacoes = 455 then 'MEDIAÇAO DR HAMILTON'
		when cotas.situacoes = 456 then 'MEDIACAO JALES MELO'
		when cotas.situacoes = 457 then 'BLOQUEIO WEB'
		when cotas.situacoes = 458 then 'COTA SEM BOLETO'
		when cotas.situacoes = 460 then 'CRED UTILIZ QUIT PCL'
		when cotas.situacoes = 461 then 'CANCELADA CHECAGEM'
		when cotas.situacoes = 465 then 'MEDIAÇAO ANA MARIA'
		when cotas.situacoes = 464 then 'MEDIACAO SEM BOLETO1'
		when cotas.situacoes = 466 then 'NEGOCIAÇÃO PENDENTE'
		when cotas.situacoes = 467 then 'NEGOCIAÇÃO SUSTENTAÇ'
		when cotas.situacoes = 470 then 'JURIDICO SAG ARIGATO'
		when cotas.situacoes = 471 then 'JURIDIGO SAG S/BOLET'
		when cotas.situacoes = 462 then 'DESISTENTE WEB'
		when cotas.situacoes = 468 then 'COTA SEM BOLETO-FAB'
		when cotas.situacoes = 469 then 'COTA ARIG'
		when cotas.situacoes = 437 then 'JURIDICO SAG'
		when cotas.situacoes = 425 then 'INCOBRAVEL'
		when cotas.situacoes = 0 then 'NORMAL'
		when cotas.situacoes = 428 then 'Transf. Pendente'
		when cotas.situacoes = 410 then 'NORMAL'
		when cotas.situacoes = 415 then 'AÇÃO CONTRÁRIA-ATIVO'
		when cotas.situacoes = 397 then 'CANCEL SOL CONSORCIA'
		when cotas.situacoes = 399 then 'CANCELADA FORMACAO'
		when cotas.situacoes = 436 then 'DESISTENTE'
		when cotas.situacoes = 13 then 'Cancela Trans.Pendte'
		when cotas.situacoes = 1 then 'Transferência Cont'
		when cotas.situacoes = 3 then 'EXCLUIDA'
		when cotas.situacoes = 4 then 'CANCEL INADIMPLENTE'
		when cotas.situacoes = 5 then 'Troca nº Cota Normal'
		when cotas.situacoes = 6 then 'NORMAL - 6'
		when cotas.situacoes = 9 then 'SINISTRO'
		when cotas.situacoes = 10 then 'BUSCA APREENSAO'
		when cotas.situacoes = 11 then 'QUITADO'
		when cotas.situacoes = 439 then 'MEDIACAO 2 PARCELAS'
		when cotas.situacoes = 396 then 'COBRANCA 1 PARCELA'
		when cotas.situacoes = 401 then 'MEDIACAO JURIDICO'
		when cotas.situacoes = 440 then 'MEDIACAO 3 PARCELAS'
		when cotas.situacoes = 442 then 'DESISTENTE JUR ACAO'
		when cotas.situacoes = 441 then 'CANCELADA ACAO CONTR'
		when cotas.situacoes = 443 then 'JURIDICO ALBERTO PON'
		when cotas.situacoes = 444 then 'JURIDICO HAMILTON RI'
		when cotas.situacoes = 445 then 'MEDIACAO ACAO CONTRA'
		when cotas.situacoes = 446 then 'MEDIACAO FRANKLIN'
		when cotas.situacoes = 490 then 'TROCA DE CONTRATO'
		when cotas.situacoes = 491 then 'CANCEL - CARTÃO CANC'
		when cotas.situacoes = 492 then 'CANCEL - RECLAME AQU'
		when cotas.situacoes = 495 then 'ANALISE - COMPLIANCE'
		when cotas.situacoes = 496 then 'CANCEL - RECL PROCON'
		when cotas.situacoes = 476 then 'CANCEL VENDAS'
		when cotas.situacoes = 481 then 'CRED UTIL-DEB ABONAD'
		when cotas.situacoes = 482 then 'DEBTO ABONADO/PRESCR'
		when cotas.situacoes = 483 then 'EXCLUIDA CONT CANCEL'
		when cotas.situacoes = 486 then 'MEDIAÇ WASHING MIRAN'
		when cotas.situacoes = 499 then 'CANCEL - CONTESTAÇÃO'
		when cotas.situacoes = 500 then 'ACORDO EXTRAJUDI-ADV'
		when cotas.situacoes = 504 then 'CANCEL C/PENDENCIA'
		when cotas.situacoes = 506 then 'CANCELADO OUVIDORIA'
		when cotas.situacoes = 514 then 'CANCEL NA DIRETORIA'
		when cotas.situacoes = 515 then 'COTA AJUIZADA - FLAV'
		when cotas.situacoes = 473 then 'MEDIAÇÃO - B & TRANM'
		when cotas.situacoes = 474 then 'CANCEL.P/REPRESENTAN'
		when cotas.situacoes = 477 then 'QUITADO S BOLETO-FAB'
		when cotas.situacoes = 478 then 'CANCEL PENDENTE'
		when cotas.situacoes = 489 then 'RESTRIÇÃO CADASTRAL'
		when cotas.situacoes = 493 then 'CANCEL-DEV APÓS ASS'
		when cotas.situacoes = 498 then 'CANCEL SEM CHECAGEM'
		when cotas.situacoes = 505 then 'COTA COBRANÇA SUSTEN'
		when cotas.situacoes = 507 then 'COTA AJUIZADA B & T'
		when cotas.situacoes = 511 then 'PEND.DOC VIA BOLETO'
		when cotas.situacoes = 512 then 'RECLAMACAO - BACEN'
		when cotas.situacoes = 513 then 'CONTEMP.A CANCELAR'
		when cotas.situacoes = 472 then 'BLOQUEIO COM RESIDUO'
		when cotas.situacoes = 475 then 'QUITADO S/BOLETO'
		when cotas.situacoes = 479 then 'BLOQUEIO ENVIO BOLET'
		when cotas.situacoes = 480 then 'CANCEL SEM PAGAMENTO'
		when cotas.situacoes = 484 then 'PCLS PAGAS P/ ADM'
		when cotas.situacoes = 485 then 'COTA NAO QUITADA'
		when cotas.situacoes = 494 then 'CANCEL - COMPLIANCE'
		when cotas.situacoes = 488 then 'DEBITO PROVISIONADO'
		when cotas.situacoes = 497 then 'CANCEL - NÃO CHECADA'
		when cotas.situacoes = 502 then 'NEG.EXTRA JUDICIAL'
		when cotas.situacoes = 503 then 'CONTRATO DUPLICIDADE'
		when cotas.situacoes = 508 then 'CANCEL - ANTES ASS'
		when cotas.situacoes = 509 then 'VENDA C/CANCELAMENTO'
		when cotas.situacoes = 454 then 'MEDIAÇAO CASTRO OLIV'
		when cotas.situacoes = 449 then 'MEDIACAO FELIPE JACO'
		when cotas.situacoes = 501 then 'MEDIAÇÃO INTERNA'
		when cotas.situacoes = 516 then 'CANCEL.COMPLIANCE'
		when cotas.situacoes = 517 then 'EXCEÇÃO EM ANALISE'
		when cotas.situacoes = 518 then 'COTA AJUIZADA - HAM'
		when cotas.situacoes = 519 then 'CANC. C/CARTA S/CHEC'
		when cotas.situacoes = 520 then 'CANCEL. CONSUMID.GOV'
		when cotas.situacoes = 521 then 'ANALISE COMPLIANCE'
		when cotas.situacoes = 522 then 'CANCEL. RECL. BACEN'
		when cotas.situacoes = 8 then 'COTA AJUIZADA'
		when cotas.situacoes = 2 then 'Transferência NCont'
		when cotas.situacoes = 523 then 'COTA AJUIZADA - WASH'
		when cotas.situacoes = 524 then 'BLQ CONT 1 PCL'
		when cotas.situacoes = 525 then 'BLQ CONT 2 PCL'
		when cotas.situacoes = 526 then 'BLQ CONT 3 PCL'
		when cotas.situacoes = 527 then 'COTA S/BOLETO - DR'
		when cotas.situacoes = 528 then 'COTA AJUIZADA - ALB'
		when cotas.situacoes = 529 then 'QUITADO S/BOLETO-DR'
		when cotas.situacoes = 459 then 'COTA N FAT'
		when cotas.situacoes = 530 then 'ANALISE FATURAMENTO'
		when cotas.situacoes = 510 then 'MONTAGEM PROC. P/JUR'
		when cotas.situacoes = 438 then 'BLOQUEIO SLIP ATRASO'
		when cotas.situacoes = 531 then 'COTA AJUIZADA-CASTRO'
		when cotas.situacoes = 532 then 'PROCON - COTA ATIVA'
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
	cotas.percPago as perc_adq,
	 pag.valor as parcela_atual,
	cotas.qtdePclsPagas as parcelas_pagas,
	cotas.diasMaiorAtraso as diasatraso,
	CAST(sysdate() - INTERVAL cotas.diasMaiorAtraso DAY AS DATE) as vencimento,
	FLOOR(cotas.diasMaiorAtraso / 30) as qtde_parc_inad
from
	siens_bi.cotas cotas join(select max(pagamentos.vlrPago)as valor,pagamentos.proposta from siens_bi.pagamentos pagamentos
	 where pagamentos.codMvto =003 group by pagamentos.proposta )as pag on pag.proposta  = cotas.proposta 
where
	trim(cotas.sitCota) = 'Ativa'

