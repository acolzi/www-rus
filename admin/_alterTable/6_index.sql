
# ---------------------------------------------------------------------- #
# Alter table "FOTO"                                                     #
# ---------------------------------------------------------------------- #

ALTER TABLE `FOTO` ADD COLUMN `pettorali` VARCHAR(254);

CREATE INDEX `IDX_FOTO_3` ON `FOTO` (`pettorali`);



# ---------------------------------------------------------------------- #
# Alter table "ACCESS"                                                   #
# ---------------------------------------------------------------------- #

ALTER TABLE `ACCESS` ADD COLUMN `suffissoE` VARCHAR(40);

# ---------------------------------------------------------------------- #
# Alter table "TIPO_DOCUMENTO"                                           #
# ---------------------------------------------------------------------- #

ALTER TABLE `TIPO_DOCUMENTO` ADD COLUMN `coloreNuovoDocumento` CHAR(7);

ALTER TABLE `TIPO_DOCUMENTO` ADD COLUMN `ordineNuovoDocumento` INTEGER;



ALTER TABLE `TIPO_DOCUMENTO` ADD COLUMN `flgNascondiNuovo` INTEGER;



# ---------------------------------------------------------------------- #
# Alter table "PUNTO_FOTO"                                               #
# ---------------------------------------------------------------------- #

ALTER TABLE `PUNTO_FOTO` ADD COLUMN `flgIndexOk` INTEGER;