CREATE USER 'LuanaSilva'@'%' IDENTIFIED BY 'LuaSilMM';
GRANT SELECT  ON siens_bi.* TO 'Matheus'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;

SHOW GRANTS FOR 'Igor'@'%';