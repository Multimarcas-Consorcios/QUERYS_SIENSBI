create view participantes as 
SELECT
  cotas.proposta,
  cotas.grupo,
  cotas.cota,
  TRIM(cotas.sitcota) AS cota_situacao,
  CASE
    WHEN cotas.codEspecie = 2 THEN 'AUT'
    WHEN cotas.codEspecie = 5 THEN 'MOT'
    WHEN cotas.codEspecie = 6 THEN 'CAM'
    WHEN cotas.codEspecie = 13 THEN 'SRV'
    WHEN cotas.codEspecie = 14 THEN 'IMV'
  ELSE
 cotas.codEspecie
END
  AS especie_bem,
  cotas.prazocota AS cota_prazo,
  cotas.prazogrupo AS grupo_prazo,
  cotas.datavenda AS data_venda,
  cotas.dataAtivacao AS data_ativacao,
  cotas.dataChecagem AS data_checagem,
  cotas.dataAssPart AS data_assembleia_entrada,
  cotas.assParticip AS assembleia_entrada,
  cotas.dataCancelamento as data_cancelamento,
  cotas.nomevendedor AS nome_representante,
  cotas.codvendedor AS codigo_representante,
  cotas.nomerevenda AS nome_master,
  cotas.codrevenda AS codigo_master,
  cotas.uf AS uf_cliente,
  CASE
    WHEN cotas.codrevenda = 505204 THEN 'GR'
    WHEN cotas.codrevenda = 502015 THEN 'GR'
WHEN cotas.codrevenda = 62289 THEN 'GR'   
WHEN cotas.codrevenda = 532629 THEN 'GR'
WHEN cotas.codrevenda = 1056 THEN 'GR'
ELSE
  cotas.ufRevenda
END
  AS uf_master,
  cotas.creditoatualizado AS cota_credito_atualizado,
  cotas.creditovenda AS cota_credito_venda,
  cotas.codPlanoComercial AS plano_comercial,
  cotas.tipocontemplacao AS cota_tipo_contemplacao,
  cotas.asscontemplacao AS cota_assembleia_contemplacao,
  cotas.datacontemplacao AS cota_data_contemplacao,
  cotas.perclancecontemplado AS cota_percentual_lance_contemplado,
  cotas.perclanceembutido AS cota_percentual_lance_embutido,
  cotas.datapgcredito AS data_pagamento_credito,
  cotas.vlrcreditopendente AS valor_credito_pendente,
  cotas.vlrcreditocontemplacao AS valor_credito_contemplacao,
  cotas.atraso AS cota_status_atraso,
  cotas.qtdeatrasos AS cota_quantidade_parcelas_atraso,
  cotas.vlratraso AS cota_quantidade_valor_atraso,
  cotas.dataajuizamento AS data_ajuizamento,
  cotas.diasMaiorAtraso,
  cotas.motivoCancelQta AS motivo_cancelamento,
  CASE
    WHEN cotas.dataChecagem IS NOT NULL THEN 'Checada com sucesso'
WHEN cotas.dataChecagem IS NULL
AND cotas.dataAtivacao IS NOT NULL
AND TRIM(cotas.sitCota) != 'Ativa' THEN 'Cancelada Checagem'
WHEN cotas.dataChecagem IS NULL
AND cotas.dataAtivacao IS NOT NULL
AND TRIM(cotas.sitCota) = 'Ativa' THEN 'Efetivada Secretaria - Não checada'
WHEN cotas.dataAtivacao IS NULL
AND TRIM(cotas.sitCota) = 'Ativa' THEN 'Não efetivada - Secretaria'
WHEN cotas.dataAtivacao IS NULL
AND TRIM(cotas.sitCota) != 'Ativa' THEN 'Cancelada - Secretaria'
ELSE
  'Outros'
END
  AS estagio_vendas,
    estagio_vendas_ocorrencia.dataContato,
  CASE
    WHEN estagio_vendas_ocorrencia.checagem > 0 THEN 'Checada com sucesso'
WHEN estagio_vendas_ocorrencia.checagem = 0 THEN 'Checada sem sucesso'
WHEN estagio_vendas_ocorrencia.checagem IS NULL
AND estagio_vendas_ocorrencia.secretaria_vendas > 0 THEN 'Efetivada Secretaria - Não checada'
WHEN estagio_vendas_ocorrencia.checagem IS NULL
AND estagio_vendas_ocorrencia.secretaria_vendas IS NULL THEN 'Não efetivada - Secretaria'
ELSE
  'Outros'
END
AS estagio_vendas_agendamentos,
  CASE
    WHEN cotas.motivoCancelQta in (503, 504, 509, 489, 490, 476, 478) THEN 'Secretaria de Vendas'
WHEN cotas.motivoCancelQta in (399, 461, 497, 498, 519) THEN 'Checagem'
WHEN cotas.motivoCancelQta in (474, 480, 494, 514, 516) THEN 'Compliance'
ELSE
  'Efetivada'
END
AS estagio_vendas_posicao,
  pagamentos.data_pagamento_parcela_inicial,
  cotas.vlrpago AS cota_valor_pago,
  pagamentos.cota_valor_pagamento_parcela_inicial,
  pagamentos.pagamento_valor_faturado,
  CASE
    WHEN (RTRIM(tipocontemplacao) = 'LANCE LIVRE'
OR RTRIM(tipocontemplacao) = 'SORTEIO'
OR RTRIM(tipocontemplacao) = 'LANCE FIXO')
AND cotas.vlrcreditopendente = 0 THEN 'Faturado'
WHEN ((RTRIM(tipocontemplacao) = 'LANCE LIVRE'
OR RTRIM(tipocontemplacao) = 'SORTEIO'
OR RTRIM(tipocontemplacao) = 'LANCE FIXO'))
AND cotas.vlrcreditopendente > 0
AND pagamentos.pagamento_valor_faturado = 0 THEN 'Não faturado'
WHEN ((RTRIM(tipocontemplacao) = 'LANCE LIVRE'
OR RTRIM(tipocontemplacao) = 'SORTEIO'
OR RTRIM(tipocontemplacao) = 'LANCE FIXO'))
AND cotas.vlrcreditopendente > 0
AND pagamentos.pagamento_valor_faturado > 0 THEN 'Parcialmente faturado'
ELSE
  NULL
END
  AS status_faturamento,
  CASE
    WHEN cotas.vlrcreditocontemplacao = 0 THEN NULL
ELSE
  (pagamentos.pagamento_valor_faturado / cotas.vlrcreditocontemplacao)
END
  AS perc_faturado,
  CASE
    WHEN pagamentos.cota_valor_pagamento_parcela_inicial > 0
AND cotas.dataChecagem IS NOT NULL THEN 'Venda efetivada'
ELSE
  'Venda não efetivada'
END
  AS status_venda,
  'Produção atual' AS producao
FROM
  siens_bi.cotas cotas
LEFT JOIN (
SELECT
    pagamentos.proposta,
    MAX(CASE
        WHEN pagamentos.codMvto = '002' THEN pagamentos.dataPagamento
      ELSE
      NULL
    END
      ) AS data_pagamento_parcela_inicial,
    SUM(CASE
        WHEN pagamentos.codMvto = '002' THEN pagamentos.vlrPago
      ELSE
      0
    END
      ) AS cota_valor_pagamento_parcela_inicial,
    SUM(CASE
        WHEN pagamentos.codMvto = '030' THEN pagamentos.vlrPago
      ELSE
      0
    END
      ) AS pagamento_valor_faturado
FROM
    siens_bi.pagamentos pagamentos
WHERE
    pagamentos.codMvto IN ('002',
      '030')
GROUP BY
    pagamentos.proposta ) pagamentos
ON
  cotas.proposta = pagamentos.proposta
LEFT JOIN (
SELECT
    agendamentos.proposta,
    MAX(dataContato) AS dataContato,
    SUM(
      CASE
        WHEN agendamentos.codMotivo IN ('539', '584', '716') THEN 1
        WHEN agendamentos.codMotivo IN ('524',
        '526',
        '530',
        '536',
        '540',
        '542',
        '560') THEN 0
      ELSE
      NULL
    END
      ) AS checagem,
    SUM(
      CASE
        WHEN agendamentos.codMotivo IN ('566', '567') THEN 1
      ELSE
      NULL
    END
      ) AS secretaria_vendas
FROM
   siens_bi.agendamentos agendamentos
WHERE
    agendamentos.codMotivo IN ('539',
      '584',
      '716',
      '524',
      '526',
      '530',
      '536',
      '540',
      '542',
      '560',
      '566',
      '567')
GROUP BY
    agendamentos.proposta ) estagio_vendas_ocorrencia
ON
  cotas.proposta = estagio_vendas_ocorrencia.proposta