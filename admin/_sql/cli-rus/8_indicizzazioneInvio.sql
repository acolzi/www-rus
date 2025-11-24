
# ---------------------------------------------------------------------- #
# Alter table "FOTO"                                                     #
# ---------------------------------------------------------------------- #

ALTER TABLE `FOTO` ADD COLUMN `id_fotoExport` INTEGER;

ALTER TABLE `FOTO` ADD COLUMN `flgFotoInviata` INTEGER;

ALTER TABLE `FOTO` ADD COLUMN `flgPettoraleInviato` INTEGER;

# ---------------------------------------------------------------------- #
# Alter table "PUNTO_FOTO"                                               #
# ---------------------------------------------------------------------- #

ALTER TABLE `PUNTO_FOTO` ADD COLUMN `id_puntoFotoExport` INTEGER;

# ---------------------------------------------------------------------- #
# Alter table "GARA"                                                     #
# ---------------------------------------------------------------------- #

ALTER TABLE `GARA` ADD COLUMN `testoO` VARCHAR(60);

ALTER TABLE `GARA` ADD COLUMN `testoV` VARCHAR(60);

ALTER TABLE `GARA` ADD COLUMN `testoFont` VARCHAR(254);

ALTER TABLE `GARA` ADD COLUMN `testoSize` INTEGER;

ALTER TABLE `GARA` ADD COLUMN `testoColore` VARCHAR(7);

alter table GARA add column codGara integer;


# ---------------------------------------------------------------------- #
# Alter table "GARA"                                                     #
# ---------------------------------------------------------------------- #

ALTER TABLE `GARA` ADD COLUMN `flgTipoIndex` INTEGER;

