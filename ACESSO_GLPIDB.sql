SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'glpidb'
AND table_rows > 0;


select*from glpi_groups_users


Alter USER 'quatrodois'@% IDENTIFIED BY 'qu4tr0d01s';

GRANT SELECT ON glpidb.glpi_tickets TO 'quatrodois'@'%';
GRANT SELECT ON glpidb.glpi_groups_users TO 'quatrodois'@'%';
GRANT SELECT ON glpidb.glpi_groups TO 'quatrodois'@'%';
GRANT SELECT ON glpidb.glpi_ticketsatisfactions TO 'quatrodois'@'%';
GRANT SELECT ON glpidb.glpi_slas TO 'quatrodois'@'%';
GRANT SELECT ON glpidb.glpi_users TO 'quatrodois'@'%';
FLUSH PRIVILEGES;

UPDATE mysql.user SET Host='%' WHERE User='quatrodois' AND Host='localhost';
FLUSH PRIVILEGES;
