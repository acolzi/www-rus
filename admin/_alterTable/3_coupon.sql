

# ---------------------------------------------------------------------- #
# Add table "COUPON"                                                     #
# ---------------------------------------------------------------------- #

CREATE TABLE `COUPON` (
    `id_coupon` INTEGER NOT NULL AUTO_INCREMENT,
    `codice` VARCHAR(40),
    `serie` VARCHAR(40),
    `nFoto` INTEGER,
    `prezzo` DECIMAL(18,4),
    `id_rigaDocumento` INTEGER,
    CONSTRAINT `PK_COUPON` PRIMARY KEY (`id_coupon`)
);

CREATE UNIQUE INDEX `IDX_COUPON_1` ON `COUPON` (`codice`);

CREATE INDEX `IDX_COUPON_2` ON `COUPON` (`serie`);


ALTER TABLE `COUPON` ADD CONSTRAINT `RIGA_DOCUMENTO_COUPON` 
    FOREIGN KEY (`id_rigaDocumento`) REFERENCES `RIGA_DOCUMENTO` (`id_rigaDocumento`);

ALTER TABLE `COUPON` ADD COLUMN `printTmst` DATETIME;
