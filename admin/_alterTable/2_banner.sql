
drop table BANNER_STATS;
drop table BANNER;



CREATE TABLE `BANNER` (
    `id_banner` INTEGER NOT NULL AUTO_INCREMENT,
    `id_tipoBanner` INTEGER,
    `id_clifor` INTEGER,
    `descrizioneClifor` VARCHAR(254),
    `link` VARCHAR(254),
    `dataInizioCampagna` DATE,
    `dataFineCampagna` DATE,
    `flgAttivo` INTEGER,
    `impression` INTEGER,
    `clickThrough` INTEGER,
    `dataFineVld` DATE,
    `priorita` INTEGER,
    `titolo` VARCHAR(60),
    `descrizioneBanner` TEXT,
    `imgTmst` CHAR(16),
    `flgTipo` INTEGER,
    CONSTRAINT `PK_BANNER` PRIMARY KEY (`id_banner`)
);



# ---------------------------------------------------------------------- #
# Add table "BANNER_STATS"                                               #
# ---------------------------------------------------------------------- #


CREATE TABLE `BANNER_STATS` (
    `id_bannerStats` INTEGER NOT NULL AUTO_INCREMENT,
    `id_banner` INTEGER,
    `entryPoint` VARCHAR(254),
    `ipAddress` VARCHAR(40),
    `dataTimestamp` TIMESTAMP,
    `flgI_CT` INTEGER,
    CONSTRAINT `PK_BANNER_STATS` PRIMARY KEY (`id_bannerStats`)
);


ALTER TABLE `BANNER_STATS` ADD CONSTRAINT `BANNER_BANNER_STATS` 
    FOREIGN KEY (`id_banner`) REFERENCES `BANNER` (`id_banner`);

ALTER TABLE `BANNER` ADD CONSTRAINT `TIPO_BANNER_BANNER` 
    FOREIGN KEY (`id_tipoBanner`) REFERENCES `TIPO_BANNER` (`id_tipoBanner`);

ALTER TABLE `BANNER` ADD CONSTRAINT `CLIFOR_BANNER` 
    FOREIGN KEY (`id_clifor`) REFERENCES `CLIFOR` (`id_clifor`);