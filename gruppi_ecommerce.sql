select
    e.seq AS seq,
    e.grupo AS GRUPO,
    e.tipoBem AS TIPO_BEM,
	DATE_FORMAT(e.dataLancamentoGrupo,'%d/%m/%Y') AS DTA_LANCAMENTO_GRUPO,
    DATE_FORMAT(e.dataPrimeiraAss,'%d/%m/%Y') AS DTA_PRIMEIRA_ASSEMB,
    DATE_FORMAT(e.dataUltimaAss,'%d/%m/%Y') AS DTA_ULTIMA_ASSEMB,
    DATE_FORMAT(e.dataProximaAss,'%d/%m/%Y') AS DTA_PROXIMA_ASSEMB,
    replace(round(e.taxaFR,1),'.',',')AS TX_FUNDO_RESERVA,
    replace(e.taxaSeguro,'.',',') AS TX_SEGURO,
    e.cotaTotal AS COTA_TOTAL,
    e.regrasLance AS REGRAS_LANCE,
    e.assembRealizadas AS ASSEMB_REALIZADAS,
    e.duracaoTotal AS DURACAO_TOTAL,
    e.prazo AS PRAZO,
    e.lanceEmbutMax AS LANCEMBUT_MAX,
    e.indiceCorrecao AS INDICECORRECAO,
    e.codBem AS CODBEM,
    DATE_FORMAT(e.dataValidadeCorr,'%d/%m/%Y') AS DATA_VALIDADE_CORR,
    replace(round(e.vlrBem,2),'.',',') AS VLR_BEM,
    replace(round(e.vlrTotalPlano,2),'.',',') AS VLR_TOTAL_PLANO,
    /*(e.vlrBem/e.prazo)+(e.vlrBem*e.t)  AS VLR_PARCELA,*/
    replace(round((e.vlrTotalPlano -(e.taxaAdesao/100) *e.vlrBem)/e.prazo,2),'.',',') AS VLR_PARCELA,
    /*replace(round(e.percUltimaCorr,1),'.',',') AS PERC_ULTIMA_CORR,*/
    e.percUltimaCorr AS PERC_ULTIMA_CORR,
    e.nContemplacao AS N_CONTEMPLACAO,
    e.participantes AS PARTICIPANTES,
   replace(round(e.taxaAdesao ,1),'.',',') AS TX_ADESAO,
    replace(round(e.taxaAdm,1),'.',',')AS TX_ADM,
    e.descricao AS DESCRICAO,
    'modelo' AS MODELO,
    'marca' AS MARCA
from
    ecommerce e
where e.GRUPO in ('02033', '02041', '02045', '02046', '02051', '02052', '02053', '02054','02050','02069','02059','02063','02056','02055','02061');
1