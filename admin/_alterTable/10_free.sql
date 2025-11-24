
ALTER TABLE `GARA` ADD COLUMN `flgFree` INTEGER;




# ---------------------------------------------------------------------- #
# Alter table "USERS"                                                    #
# ---------------------------------------------------------------------- #

ALTER TABLE `USERS` ADD COLUMN `tsInvioMailRecupero` DATETIME;


###########################################################################
UPDATE PARM SET testo='Rus 10.1', tipoParm='VERSIONE' where codice='DB_VERSION_RUS';


UPDATE PARM SET testo='RUS.10.1 ts', tipoParm='VERSIONE' where codice='DB_VERSION_RUS';