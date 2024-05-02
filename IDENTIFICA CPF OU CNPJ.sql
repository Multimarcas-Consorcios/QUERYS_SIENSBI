SELECT cpfCnpjCota ,
CASE WHEN LENGTH(cpfCnpjCota)=11 THEN
CONCAT(SUBSTRING(cpfCnpjCota,1,3),'.',SUBSTRING(cpfCnpjCota,4,3),'.',SUBSTRING(cpfCnpjCota,7,3),'-',SUBSTRING(cpfCnpjCota,10,2))
ELSE
CONCAT(SUBSTRING(cpfCnpjCota,1,2),'.',SUBSTRING(cpfCnpjCota,3,3),'.',SUBSTRING(cpfCnpjCota,6,3),'/'
,SUBSTRING(cpfCnpjCota,9,4),'-',SUBSTRING(cpfCnpjCota,13,2)) 
END
AS resultado FROM siens_bi.cotas
where grupo = '02050'
and cota = 147