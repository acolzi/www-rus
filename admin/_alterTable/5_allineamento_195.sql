
#184
# ---------------------------------------------------------------------- #
# Alter table "IVA"                                                      #
# ---------------------------------------------------------------------- #

ALTER TABLE `IVA` ADD COLUMN `codiceExport` VARCHAR(10);



ALTER TABLE `DISTINTA_RIBA` MODIFY `flgContabilizzata` INTEGER;

#186

# ---------------------------------------------------------------------- #
# Alter table "DOCUMENTO"                                                #
# ---------------------------------------------------------------------- #

ALTER TABLE `DOCUMENTO` ADD COLUMN `bancaCFDesc` VARCHAR(60);

ALTER TABLE `DOCUMENTO` ADD COLUMN `ibanCF` CHAR(27);

ALTER TABLE `DOCUMENTO` ADD COLUMN `percScontoIncondizionato` DECIMAL(5,2);

#187

# ---------------------------------------------------------------------- #
# Alter table "RIGA_DOCUMENTO"                                           #
# ---------------------------------------------------------------------- #

ALTER TABLE `RIGA_DOCUMENTO` MODIFY `descrizioneRiga` VARCHAR(1000);

ALTER TABLE `RIGA_DOCUMENTO` MODIFY `notaRigaDocumento` VARCHAR(1000);


#188

# ---------------------------------------------------------------------- #
# Alter table "DOCUMENTO"                                                #
# ---------------------------------------------------------------------- #

ALTER TABLE `DOCUMENTO` ADD COLUMN `id_nazioneSped` CHAR(4);

##da noia una chiave stringa....
#ALTER TABLE `DOCUMENTO` ADD CONSTRAINT `NAZIONE_DOCUMENTO` 
#    FOREIGN KEY (`id_nazioneSped`) REFERENCES `NAZIONE` (`id_nazione`);
#alter table DOCUMENTO drop  FOREIGN KEY  NAZIONE_DOCUMENTO;



# ---------------------------------------------------------------------- #
# Alter table "CAUSALE_MAGAZZINO"                                        #
# ---------------------------------------------------------------------- #

ALTER TABLE `CAUSALE_MAGAZZINO` ADD COLUMN `flgAFTPartenza` INTEGER;

ALTER TABLE `CAUSALE_MAGAZZINO` ADD COLUMN `flgAFTArrivo` INTEGER;

#189

# ---------------------------------------------------------------------- #
# Alter table "CLIFOR"                                                   #
# ---------------------------------------------------------------------- #

ALTER TABLE `CLIFOR` ADD COLUMN `costoOrarioAssistenza` DECIMAL(18,4);


#190

# ---------------------------------------------------------------------- #
# Alter table "ARTICOLO"                                                 #
# ---------------------------------------------------------------------- #

ALTER TABLE `RIGA_DOCUMENTO` ADD COLUMN `descrizioneCodiceRiga` VARCHAR(40);

# ---------------------------------------------------------------------- #
# Alter table "CLIFOR"                                                   #
# ---------------------------------------------------------------------- #

ALTER TABLE `CLIFOR` ADD COLUMN `codiceIdentificativoFE` CHAR(7);


ALTER TABLE `CLIFOR` ADD COLUMN `flgPA` INTEGER;





##########
#### da qui....

# ---------------------------------------------------------------------- #
# Alter table "TIPO_DOCUMENTO"                                           #
# ---------------------------------------------------------------------- #

#ALTER TABLE `TIPO_DOCUMENTO` ADD COLUMN `suffissoFattElett` VARCHAR(5);


#ALTER TABLE `DOCUMENTO` drop COLUMN `tmstFileXml`;

ALTER TABLE `DOCUMENTO` ADD COLUMN `importoBolloEsenzione` DECIMAL(18,4);

ALTER TABLE `DOCUMENTO` ADD COLUMN `imponibileBolloEsenzione` DECIMAL(18,4);

# ---------------------------------------------------------------------- #
# Alter table "VETTORE"                                                  #
# ---------------------------------------------------------------------- #

ALTER TABLE `VETTORE` ADD COLUMN `id_nazione` CHAR(4);



# ---------------------------------------------------------------------- #
# Add table "STATUS_MSG"                                                 #
# ---------------------------------------------------------------------- #

CREATE TABLE `STATUS_MSG` (
    `id_statusMsg` INTEGER NOT NULL AUTO_INCREMENT,
    `tag` VARCHAR(40),
    `msg` VARCHAR(6000),
    CONSTRAINT `PK_STATUS_MSG` PRIMARY KEY (`id_statusMsg`)
);

CREATE UNIQUE INDEX `IDX_STATUS_MSG_1` ON `STATUS_MSG` (`tag`);


###allinemento tutti i campi tmst in datetime
ALTER TABLE `DOCUMENTO` ADD COLUMN `tmstFileXml` DATETIME;

alter table DOCUMENTO DROP COLUMN tmstFilePdf;
ALTER TABLE `DOCUMENTO` ADD COLUMN `tmstFilePdf` DATETIME;



##tmst stampato
ALTER TABLE `DOCUMENTO` CHANGE tmstStampato  tmstStampatoOld varchar(30);
ALTER TABLE `DOCUMENTO`  ADD COLUMN `tmstStampato` DATETIME;
update DOCUMENTO SET tmstStampato=tmstStampatoOld where tmstStampatoOld!='';
####ALTER TABLE `DOCUMENTO` MODIFY `tmstStampato` DATETIME;


ALTER TABLE `DOCUMENTO` ADD COLUMN `progFileFE` VARCHAR(5);

CREATE UNIQUE INDEX `IDX_DOCUMENTO_17` ON `DOCUMENTO` (`progFileFE`);

alter table PARM modify column tipoParm varchar(60);


#191

ALTER TABLE `REPARTO` ADD COLUMN `descrizione` VARCHAR(60);

# ---------------------------------------------------------------------- #
# Alter table "DOCUMENTO"                                                #
# ---------------------------------------------------------------------- #

ALTER TABLE `DOCUMENTO` ADD COLUMN `tmstInvioXml` DATETIME;

ALTER TABLE `DOCUMENTO` ADD COLUMN `flgStatoInvioXml` INTEGER;

#192

# ---------------------------------------------------------------------- #
# Alter table "ARTICOLO"                                                 #
# ---------------------------------------------------------------------- #

ALTER TABLE `ARTICOLO` ADD COLUMN `codiciMagazzino` VARCHAR(1000);

# ---------------------------------------------------------------------- #
# Alter table "DOCUMENTO"                                                #
# ---------------------------------------------------------------------- #

ALTER TABLE `DOCUMENTO` ADD COLUMN `codiceCIG` VARCHAR(40);

ALTER TABLE `DOCUMENTO` ADD COLUMN `codiceCUP` VARCHAR(40);

ALTER TABLE `DOCUMENTO` ADD COLUMN `codiceCommessa` VARCHAR(40);

# ---------------------------------------------------------------------- #
# Alter table "ARTICOLO_VARIANTE"                                        #
# ---------------------------------------------------------------------- #

ALTER TABLE `ARTICOLO_VARIANTE` ADD COLUMN `codiciMagazzino` VARCHAR(1000);

# ---------------------------------------------------------------------- #
# Alter table "ARTICOLO_TAGLIA"                                          #
# ---------------------------------------------------------------------- #

ALTER TABLE `ARTICOLO_TAGLIA` ADD COLUMN `codiciMagazzino` VARCHAR(1000);



# ---------------------------------------------------------------------- #
# Alter table "ARTICOLO"                                                 #
# ---------------------------------------------------------------------- #

CREATE INDEX `IDX_ARTICOLO_12` ON `ARTICOLO` (`codiciMagazzino`);

# ---------------------------------------------------------------------- #
# Alter table "ARTICOLO_VARIANTE"                                        #
# ---------------------------------------------------------------------- #

CREATE INDEX `IDX_ARTICOLO_VARIANTE_5` ON `ARTICOLO_VARIANTE` (`codiciMagazzino`);

# ---------------------------------------------------------------------- #
# Alter table "ARTICOLO_TAGLIA"                                          #
# ---------------------------------------------------------------------- #

CREATE INDEX `IDX_ARTICOLO_TAGLIA_1` ON `ARTICOLO_TAGLIA` (`codiciMagazzino`);


#192 bis

# ---------------------------------------------------------------------- #
# Alter table "CLIFOR"                                                   #
# ---------------------------------------------------------------------- #

ALTER TABLE `CLIFOR` ADD COLUMN `flgSplitPayment` INTEGER;


#193

# ---------------------------------------------------------------------- #
# Alter table "DOCUMENTO"                                                #
# ---------------------------------------------------------------------- #

ALTER TABLE `DOCUMENTO` ADD COLUMN `descrizioneDocumento` VARCHAR(60);

# ---------------------------------------------------------------------- #
# Alter table "RIGA_DOCUMENTO"                                           #
# ---------------------------------------------------------------------- #

ALTER TABLE `RIGA_DOCUMENTO` ADD COLUMN `stacchi` INTEGER;

ALTER TABLE `RIGA_DOCUMENTO` ADD COLUMN `metriStacchi` DOUBLE;

# ---------------------------------------------------------------------- #
# Alter table "TIPO_DOCUMENTO"                                           #
# ---------------------------------------------------------------------- #

ALTER TABLE `TIPO_DOCUMENTO` ADD COLUMN `flgAFT2` INTEGER;

ALTER TABLE `TIPO_DOCUMENTO` ADD COLUMN `id_causaleMagazzino2` INTEGER;

# ---------------------------------------------------------------------- #
# Add table "TELAIO"                                                     #
# ---------------------------------------------------------------------- #

CREATE TABLE `TELAIO` (
    `id_telaio` INTEGER NOT NULL AUTO_INCREMENT,
    `descrizione` VARCHAR(40),
    `codiceTelaio` VARCHAR(40),
    `flgTipoTelaio` INTEGER,
    `colpiMinuto` INTEGER,
    CONSTRAINT `PK_TELAIO` PRIMARY KEY (`id_telaio`)
);

ALTER TABLE `TIPO_DOCUMENTO` ADD CONSTRAINT `CAUSALE_MAGAZZINO_TIPO_DOCUMENTO_2` 
    FOREIGN KEY (`id_causaleMagazzino2`) REFERENCES `CAUSALE_MAGAZZINO` (`id_causaleMagazzino`);
	
	
# ---------------------------------------------------------------------- #
# Alter table "DOCUMENTO"                                                #
# ---------------------------------------------------------------------- #

ALTER TABLE `DOCUMENTO` ADD COLUMN `id_magFisicoPartenza2` INTEGER;

ALTER TABLE `DOCUMENTO` ADD COLUMN `id_magFisicoArrivo2` INTEGER;

# ---------------------------------------------------------------------- #
# Alter table "RIGA_DOCUMENTO"                                           #
# ---------------------------------------------------------------------- #

ALTER TABLE `RIGA_DOCUMENTO` ADD COLUMN `id_telaio` INTEGER;



ALTER TABLE `DOCUMENTO` ADD CONSTRAINT `MAG_FISICO_DOCUMENTO_PARTENZA_2` 
    FOREIGN KEY (`id_magFisicoPartenza2`) REFERENCES `MAG_FISICO` (`id_magFisico`);

ALTER TABLE `DOCUMENTO` ADD CONSTRAINT `MAG_FISICO_DOCUMENTO_ARRIVO_2` 
    FOREIGN KEY (`id_magFisicoArrivo2`) REFERENCES `MAG_FISICO` (`id_magFisico`);
	
	
	ALTER TABLE `RIGA_DOCUMENTO` ADD CONSTRAINT `TELAIO_RIGA_DOCUMENTO` 
    FOREIGN KEY (`id_telaio`) REFERENCES `TELAIO` (`id_telaio`);
	
	
	
	####
	
	UPDATE TIPO_DOCUMENTO SET flgAFT2=-1;
	
	####	####	####	####	####	####	####	####	####	####	####	####	####	####	####	####	####	####
		####	####	####	####	####	####	####	####	####	####	####	####	####	####	####	####	####
			####	####	####	####	####	####	####	####	####	####	####	####	####	####
			
ALTER TABLE `TIPO_DOCUMENTO` ADD COLUMN `flgGestioneDocArticolo` INTEGER;


#194

# ---------------------------------------------------------------------- #
# Alter table "RIGA_DOCUMENTO"                                           #
# ---------------------------------------------------------------------- #

ALTER TABLE `RIGA_DOCUMENTO` ADD COLUMN `rifTipoArticolo` INTEGER;


update RIGA_DOCUMENTO SET rifTipoArticolo=1;



# ---------------------------------------------------------------------- #
# Alter table "TIPO_DOCUMENTO"                                           #
# ---------------------------------------------------------------------- #

ALTER TABLE `TIPO_DOCUMENTO` ADD COLUMN `flgNoAnag` INTEGER;

ALTER TABLE `TIPO_DOCUMENTO` ADD COLUMN `flgNoAnag2` INTEGER;



# ---------------------------------------------------------------------- #
# Alter table "RIGA_DOCUMENTO"                                           #
# ---------------------------------------------------------------------- #

ALTER TABLE `RIGA_DOCUMENTO` ADD COLUMN `colpoIniziale` INTEGER;

ALTER TABLE `RIGA_DOCUMENTO` ADD COLUMN `colpoFinale` INTEGER;

ALTER TABLE `RIGA_DOCUMENTO` ADD COLUMN `tsInizioLavorazione` DATETIME;

ALTER TABLE `RIGA_DOCUMENTO` ADD COLUMN `flgStatoLavorazione` INTEGER;

ALTER TABLE `RIGA_DOCUMENTO` ADD COLUMN `tsFineLavorazione` DATETIME;



# ---------------------------------------------------------------------- #
# Add table "LAV_PEZZA"                                                  #
# ---------------------------------------------------------------------- #

CREATE TABLE `LAV_PEZZA` (
    `id_lavPezza` INTEGER NOT NULL AUTO_INCREMENT,
    `id_rigaDocumento` INTEGER,
    `id_clifor` INTEGER,
    `tsInserimento` DATETIME,
    `codicePezza` VARCHAR(40),
    `nColpi` INTEGER,
    CONSTRAINT `PK_LAV_PEZZA` PRIMARY KEY (`id_lavPezza`)
);

CREATE UNIQUE INDEX `IDX_LAV_PEZZA_1` ON `LAV_PEZZA` (`codicePezza`,`id_clifor`);

ALTER TABLE `LAV_PEZZA` ADD CONSTRAINT `RIGA_DOCUMENTO_LAV_PEZZA` 
    FOREIGN KEY (`id_rigaDocumento`) REFERENCES `RIGA_DOCUMENTO` (`id_rigaDocumento`);


ALTER TABLE `LAV_PEZZA` ADD CONSTRAINT `CLIFOR_LAV_PEZZA` 
    FOREIGN KEY (`id_clifor`) REFERENCES `CLIFOR` (`id_clifor`);
	
	
	
	
ALTER TABLE `LAV_PEZZA` ADD COLUMN `nColpiInizio` INTEGER;


#195

# ---------------------------------------------------------------------- #
# Alter table "DOCUMENTO"                                                #
# ---------------------------------------------------------------------- #

ALTER TABLE `DOCUMENTO` ADD COLUMN `id_telaio` INTEGER;

ALTER TABLE `DOCUMENTO` ADD COLUMN `colpoFinale` INTEGER;

ALTER TABLE `DOCUMENTO` ADD COLUMN `colpoIniziale` INTEGER;

ALTER TABLE `DOCUMENTO` ADD COLUMN `tsFineLavorazione` DATETIME;

ALTER TABLE `DOCUMENTO` ADD COLUMN `tsInizioLavorazione` DATETIME;

ALTER TABLE `DOCUMENTO` ADD COLUMN `flgStatoLavorazione` INTEGER;


ALTER TABLE `RIGA_DOCUMENTO` DROP FOREIGN KEY `TELAIO_RIGA_DOCUMENTO`;



# ---------------------------------------------------------------------- #
# Alter table "RIGA_DOCUMENTO"                                           #
# ---------------------------------------------------------------------- #

ALTER TABLE `RIGA_DOCUMENTO` DROP COLUMN `id_telaio`;

ALTER TABLE `RIGA_DOCUMENTO` DROP COLUMN `colpoIniziale`;

ALTER TABLE `RIGA_DOCUMENTO` DROP COLUMN `colpoFinale`;

ALTER TABLE `RIGA_DOCUMENTO` ADD COLUMN `codiceCartellinoIniziale` VARCHAR(40);

CREATE UNIQUE INDEX `IDX_RIGA_DOCUMENTO_6` ON `RIGA_DOCUMENTO` (`codiceCartellinoIniziale`);

ALTER TABLE `DOCUMENTO` ADD CONSTRAINT `TELAIO_DOCUMENTO` 
    FOREIGN KEY (`id_telaio`) REFERENCES `TELAIO` (`id_telaio`);