
##225

# ---------------------------------------------------------------------- #
# Alter table "TIPO"                                                     #
# ---------------------------------------------------------------------- #

ALTER TABLE `TIPO` ADD COLUMN `tag` VARCHAR(254);

CREATE INDEX `IDX_TIPO_4` ON `TIPO` (`tag`);



##226
#ALTER TABLE `CLIFOR` DROP FOREIGN KEY `NAZIONE_CLIFOR`;



DROP INDEX `IDX_CLIFOR_1` ON `CLIFOR`;

CREATE UNIQUE INDEX `IDX_CLIFOR_1` ON `CLIFOR` (`codiceAlt` ASC,`flgTipo` ASC);

# ---------------------------------------------------------------------- #

#ALTER TABLE `ACCESS` DROP FOREIGN KEY `ACCESS_ACCESS`;



# ---------------------------------------------------------------------- #
# Alter table "ARTICOLO"                                                 #
# ---------------------------------------------------------------------- #

ALTER TABLE `ARTICOLO` ADD COLUMN `descrizioneSearch` VARCHAR(254);

CREATE INDEX `IDX_ARTICOLO_8` ON `ARTICOLO` (`descrizioneSearch`);


##227
# ---------------------------------------------------------------------- #
# Alter table "DOCUMENTO"                                                #
# ---------------------------------------------------------------------- #

ALTER TABLE `DOCUMENTO` ADD COLUMN `flgBartolini` INTEGER;

ALTER TABLE `DOCUMENTO` ADD COLUMN `valoreDichiarato` DECIMAL(18,4);

ALTER TABLE `DOCUMENTO` ADD COLUMN `costoEffettivoSped` DECIMAL(18,4);

ALTER TABLE `DOCUMENTO` ADD COLUMN `dataSpedizione` DATE;

ALTER TABLE `DOCUMENTO` ADD COLUMN `dataInvioMailSped` DATE;

ALTER TABLE `DOCUMENTO` ADD COLUMN `flgTipoRitiro` INTEGER;

ALTER TABLE `DOCUMENTO` ADD COLUMN `flgAvvisoConsegna` INTEGER;


ALTER TABLE `DOCUMENTO` ADD COLUMN `flgModoAccredito` INTEGER;


ALTER TABLE `DOCUMENTO` CHANGE `kg` `kgLordo` DOUBLE;



CREATE TABLE `ARTICOLO_USATO` (
    `id_articoloUsato` INTEGER NOT NULL AUTO_INCREMENT,
    `id_articolo` INTEGER,
    `dataDocumento` DATE,
    `numeroDocumento` VARCHAR(40),
    `flgTipoDocumento` INTEGER,
    `importo` DECIMAL(18,4),
    `id_fornitore` INTEGER,
    `id_rigaDocumento` INTEGER,
    `id_cliente` INTEGER,
    `tmstStampa` VARCHAR(40),
    `descrizioneRigaDocumento` VARCHAR(254),
    CONSTRAINT `PK_ARTICOLO_USATO` PRIMARY KEY (`id_articoloUsato`)
);

# ---------------------------------------------------------------------- #
# Add foreign key constraints                                            #
# ---------------------------------------------------------------------- #

ALTER TABLE `ARTICOLO_USATO` ADD CONSTRAINT `ARTICOLO_ARTICOLO_USATO` 
    FOREIGN KEY (`id_articolo`) REFERENCES `ARTICOLO` (`id_articolo`);

ALTER TABLE `ARTICOLO_USATO` ADD CONSTRAINT `CLIFOR_ARTICOLO_USATO_fornitore` 
    FOREIGN KEY (`id_fornitore`) REFERENCES `CLIFOR` (`id_clifor`);

ALTER TABLE `ARTICOLO_USATO` ADD CONSTRAINT `CLIFOR_ARTICOLO_USATO_cliente` 
    FOREIGN KEY (`id_cliente`) REFERENCES `CLIFOR` (`id_clifor`);

ALTER TABLE `ARTICOLO_USATO` ADD CONSTRAINT `RIGA_DOCUMENTO_ARTICOLO_USATO` 
    FOREIGN KEY (`id_rigaDocumento`) REFERENCES `RIGA_DOCUMENTO` (`id_rigaDocumento`);
	
	
	
# ---------------------------------------------------------------------- #
# Alter table "USERS"                                                    #
# ---------------------------------------------------------------------- #

ALTER TABLE `USERS` ADD COLUMN `codiceAlt` VARCHAR(40);

CREATE UNIQUE INDEX `IDX_USERS_3` ON `USERS` (`codiceAlt`);

#ALTER TABLE `DESTINAZIONE_DIVERSA` DROP FOREIGN KEY `NAZIONE_DESTINAZIONE_DIVERSA`;
##ALTER TABLE `CLIFOR` DROP FOREIGN KEY `NAZIONE_CLIFOR`;

# ---------------------------------------------------------------------- #
# Alter table "DOCUMENTO"                                                #
# ---------------------------------------------------------------------- #

ALTER TABLE `DOCUMENTO` MODIFY `notePagamento` VARCHAR(254);

# ---------------------------------------------------------------------- #
# Alter table "TIPO_DOCUMENTO"                                           #
# ---------------------------------------------------------------------- #

ALTER TABLE `TIPO_DOCUMENTO` ADD COLUMN `flgUsato` INTEGER;

ALTER TABLE `TIPO_DOCUMENTO` ADD COLUMN `flgMovMagazzino` INTEGER;

#################################################################################
#################################################################################
#################################################################################
#################################################################################
#################################################################################
#################################################################################
#################################################################################
#################################################################################
#################################################################################
#################################################################################


# ---------------------------------------------------------------------- #
# Alter table "ARTICOLO"                                                 #
# ---------------------------------------------------------------------- #

ALTER TABLE `ARTICOLO` ADD COLUMN `scaffale` VARCHAR(40);

# ---------------------------------------------------------------------- #
# Alter table "ARTICOLO_USATO"                                           #
# ---------------------------------------------------------------------- #

ALTER TABLE `ARTICOLO_USATO` ADD COLUMN `codiceAlt` INTEGER;

CREATE UNIQUE INDEX `IDX_ARTICOLO_USATO_1` ON `ARTICOLO_USATO` (`codiceAlt`);


# ---------------------------------------------------------------------- #
# Alter table "ARTICOLO"                                                 #
# ---------------------------------------------------------------------- #

ALTER TABLE `ARTICOLO` ADD COLUMN `flgContoVendita` INTEGER;

# ---------------------------------------------------------------------- #
# Alter table "ARTICOLO"                                                 #
# ---------------------------------------------------------------------- #


##ALTER TABLE `ARTICOLO` ADD COLUMN `descrizioneSearch` varchar(254);


#CREATE INDEX `IDX_ARTICOLO_8` ON `ARTICOLO` (`descrizioneSearch`);



# ---------------------------------------------------------------------- #

ALTER TABLE `ARTICOLO` ADD COLUMN `flgInEsaurimento` INTEGER;
# ---------------------------------------------------------------------- #
# Alter table "TABLE_DESC"                                               #
# ---------------------------------------------------------------------- #

ALTER TABLE `TABLE_DESC` ADD COLUMN `valoreDefaultCR` VARCHAR(40);



# ---------------------------------------------------------------------- #
# Alter table "ARTICOLO"                                                 #
# ---------------------------------------------------------------------- #

ALTER TABLE `ARTICOLO` ADD COLUMN `descrizioneSearchFT` VARCHAR(254);

CREATE FULLTEXT INDEX `IDX_ARTICOLO_9` ON `ARTICOLO` (`descrizioneSearchFT`);


# ---------------------------------------------------------------------- #
# Alter table "ARTICOLO"                                                 #
# ---------------------------------------------------------------------- #

ALTER TABLE `ARTICOLO` ADD COLUMN `idTipoSearch` VARCHAR(400);

CREATE INDEX `IDX_ARTICOLO_10` ON `ARTICOLO` (`idTipoSearch`);


# ---------------------------------------------------------------------- #
# Alter table "ARTICOLO"                                                 #
# ---------------------------------------------------------------------- #

ALTER TABLE `ARTICOLO` ADD COLUMN `tipoOrdineSearch` INTEGER;

ALTER TABLE `ARTICOLO` ADD COLUMN `tipoDescrizioneSearch` VARCHAR(60);


CREATE INDEX `IDX_ARTICOLO_11` ON `ARTICOLO` (`tipoOrdineSearch` ASC);

##CREATE INDEX `IDX_ARTICOLO_12` ON `ARTICOLO` (`tipoDescrizioneSearch` ASC);


##228

	
	INSERT INTO TIPO_STAMPA_DOCUMENTO (codice,descrizione) values (12,"FT. ACQ. O BOLLA DI CARICO");
	
	
	
##### drop articolo fornitore	
	

# ---------------------------------------------------------------------- #
# Drop foreign key constraints                                           #
# ---------------------------------------------------------------------- #

ALTER TABLE `ARTICOLO_FORNITORE` DROP FOREIGN KEY `ARTICOLO_ARTICOLO_FORNITORE`;

ALTER TABLE `ARTICOLO_FORNITORE` DROP FOREIGN KEY `CLIFOR_ARTICOLO_FORNITORE`;


# Drop constraints #

ALTER TABLE `ARTICOLO_FORNITORE` DROP PRIMARY KEY;

DROP TABLE `ARTICOLO_FORNITORE`;



CREATE TABLE `ARTICOLO_FORNITORE` (
    `id_articoloFornitore` INTEGER NOT NULL AUTO_INCREMENT,
    `id_clifor` INTEGER NOT NULL,
    `id_articolo` INTEGER,
    `id_articoloTessuto` INTEGER,
    `id_articoloTessutoColore` INTEGER,
    `id_articoloVariante` INTEGER,
    `codiceFornitore` VARCHAR(16),
    `costo` DECIMAL(18,4),
    `costoVecchio` DECIMAL(18,4),
    `dataUltimoPrezzo` DATE,
    `flgFuoriListino` INTEGER,
    `costoScontoQta` INTEGER,
    `costoSconto` DECIMAL(18,4),
    `dispSede` INTEGER,
    `dispCash` INTEGER,
    `flgAbituale` INTEGER,
    CONSTRAINT `PK_ARTICOLO_FORNITORE` PRIMARY KEY (`id_articoloFornitore`)
);

CREATE UNIQUE INDEX `IDX_ARTICOLO_FORNITORE1` ON `ARTICOLO_FORNITORE` (`codiceFornitore` ASC,`id_clifor` ASC);

# ---------------------------------------------------------------------- #
# Add foreign key constraints                                            #
# ---------------------------------------------------------------------- #

ALTER TABLE `ARTICOLO_FORNITORE` ADD CONSTRAINT `ARTICOLO_ARTICOLO_FORNITORE` 
    FOREIGN KEY (`id_articolo`) REFERENCES `ARTICOLO` (`id_articolo`);

ALTER TABLE `ARTICOLO_FORNITORE` ADD CONSTRAINT `CLIFOR_ARTICOLO_FORNITORE` 
    FOREIGN KEY (`id_clifor`) REFERENCES `CLIFOR` (`id_clifor`);

ALTER TABLE `ARTICOLO_FORNITORE` ADD CONSTRAINT `ARTICOLO_TESSUTO_ARTICOLO_FORNITORE` 
    FOREIGN KEY (`id_articoloTessuto`) REFERENCES `ARTICOLO_TESSUTO` (`id_articoloTessuto`);

ALTER TABLE `ARTICOLO_FORNITORE` ADD CONSTRAINT `ARTICOLO_TESSUTO_COLORE_ARTICOLO_FORNITORE` 
    FOREIGN KEY (`id_articoloTessutoColore`) REFERENCES `ARTICOLO_TESSUTO_COLORE` (`id_articoloTessutoColore`);

ALTER TABLE `ARTICOLO_FORNITORE` ADD CONSTRAINT `ARTICOLO_VARIANTE_ARTICOLO_FORNITORE` 
    FOREIGN KEY (`id_articoloVariante`) REFERENCES `ARTICOLO_VARIANTE` (`id_articoloVariante`);
	
	
	
# ---------------------------------------------------------------------- #
# Alter table "ARTICOLO_TESSUTO"                                         #
# ---------------------------------------------------------------------- #

ALTER TABLE `ARTICOLO_TESSUTO` ADD COLUMN `dataUltimoPrezzoAcquisto` DATE;
##
##229
# ---------------------------------------------------------------------- #
# Alter table "DOCUMENTO"                                                #
# ---------------------------------------------------------------------- #

ALTER TABLE `DOCUMENTO` ADD COLUMN `progOrdineWww` INTEGER;

CREATE INDEX `IDX_DOCUMENTO_18` ON `DOCUMENTO` (`progOrdineWww`);

##aggionamento attuali
update DOCUMENTO SET progOrdineWww=id_documento where id_tipoDocumento=21;







# ---------------------------------------------------------------------- #
# Alter table "ACCESS_GROUP"                                             #
# ---------------------------------------------------------------------- #

ALTER TABLE `ACCESS_GROUP` ADD COLUMN `nota` VARCHAR(1000);



##230

# ---------------------------------------------------------------------- #
# Alter table "ARTICOLO"                                                 #
# ---------------------------------------------------------------------- #

ALTER TABLE `ARTICOLO` ADD COLUMN `id_confezionistaDefault` INTEGER;


ALTER TABLE `ARTICOLO` ADD CONSTRAINT `CLIFOR_ARTICOLO_conf_default` 
    FOREIGN KEY (`id_confezionistaDefault`) REFERENCES `CLIFOR` (`id_clifor`);
	
	CREATE UNIQUE INDEX `IDX_ARTICOLO_13` ON `ARTICOLO` (`nome`);
	
	
	#231
	
# ---------------------------------------------------------------------- #
# Alter table "ARTICOLO"                                                 #
# ---------------------------------------------------------------------- #

ALTER TABLE `ARTICOLO` ADD COLUMN `flgDisponibilitaWeb` INTEGER;

ALTER TABLE `ARTICOLO` ADD COLUMN `flgModImportazione` INTEGER;




#233

# ---------------------------------------------------------------------- #
# Alter table "DOCUMENTO"                                                #
# ---------------------------------------------------------------------- #

ALTER TABLE `DOCUMENTO` ADD COLUMN `tmstInvioMailOrdine` DATETIME;


# ---------------------------------------------------------------------- #

ALTER TABLE `DOCUMENTO` ADD COLUMN `trackingSpedizione` VARCHAR(40);



# ---------------------------------------------------------------------- #
# Alter table "TIPO"                                                     #
# ---------------------------------------------------------------------- #

ALTER TABLE `TIPO` ADD COLUMN `ordineGlobale` VARCHAR(500);

CREATE INDEX `IDX_TIPO_5` ON `TIPO` (`ordineGlobale` ASC);

CREATE INDEX `IDX_TIPO_6` ON `TIPO` (`ordine` ASC);



# ---------------------------------------------------------------------- #
# Alter table "CLIFOR"                                                   #
# ---------------------------------------------------------------------- #

ALTER TABLE `CLIFOR` MODIFY `capZona` VARCHAR(40);

# ---------------------------------------------------------------------- #
# Alter table "DESTINAZIONE_DIVERSA"                                     #
# ---------------------------------------------------------------------- #

ALTER TABLE `DESTINAZIONE_DIVERSA` MODIFY `capZonaDD` CHAR(40);




##234

# ---------------------------------------------------------------------- #
# Alter table "BANNER"                                                   #
# ---------------------------------------------------------------------- #

CREATE INDEX `IDX_BANNER_1` ON `BANNER` (`flgAttivo`);

CREATE INDEX `IDX_BANNER_2` ON `BANNER` (`flgTipo`);

CREATE INDEX `IDX_BANNER_3` ON `BANNER` (`dataInizioCampagna`);

CREATE INDEX `IDX_BANNER_4` ON `BANNER` (`dataFineCampagna`);

# ---------------------------------------------------------------------- #
# Alter table "DESTINAZIONE_DIVERSA"                                     #
# ---------------------------------------------------------------------- #

ALTER TABLE `DESTINAZIONE_DIVERSA` MODIFY `numeroCivicoDD` VARCHAR(40);



# ---------------------------------------------------------------------- #
# Alter table "ARTICOLO"                                                 #
# ---------------------------------------------------------------------- #

CREATE INDEX `IDX_ARTICOLO_14` ON `ARTICOLO` (`flgEscludiWeb`);

CREATE INDEX `IDX_ARTICOLO_15` ON `ARTICOLO` (`flgNascondi`);

# ---------------------------------------------------------------------- #
# Alter table "TIPO"                                                     #
# ---------------------------------------------------------------------- #

CREATE INDEX `IDX_TIPO_7` ON `TIPO` (`flgNascondi`);



DROP INDEX `IDX_ARTICOLO_13` ON `ARTICOLO`;

CREATE UNIQUE INDEX `IDX_ARTICOLO_13` ON `ARTICOLO` (`nome` ASC);



CREATE INDEX `IDX_CLIFOR_9` ON `CLIFOR` (`cognome` ASC);

CREATE INDEX `IDX_CLIFOR_10` ON `CLIFOR` (`nome` ASC);

CREATE INDEX `IDX_CLIFOR_11` ON `CLIFOR` (`flgTipo`);




DROP INDEX `IDX_TIPO_5` ON `TIPO`;

ALTER TABLE `TIPO` MODIFY `ordineGlobale` INTEGER;

CREATE INDEX `IDX_TIPO_8` ON `TIPO` (`livello` ASC,`ordine` ASC);

CREATE INDEX `IDX_TIPO_5` ON `TIPO` (`ordineGlobale` ASC);



##235

# ---------------------------------------------------------------------- #
# Alter table "IVA"                                                      #
# ---------------------------------------------------------------------- #

ALTER TABLE `IVA` ADD COLUMN `descrizioneRigaStampa` VARCHAR(30);



##236

# ---------------------------------------------------------------------- #
# Alter table "MARCA"                                                    #
# ---------------------------------------------------------------------- #

ALTER TABLE `MARCA` ADD COLUMN `tag` VARCHAR(254);

##CREATE INDEX `IDX_MARCA_2` ON `MARCA` (`indiciTipo`);

CREATE INDEX `IDX_MARCA_3` ON `MARCA` (`tag`);

##237


# ---------------------------------------------------------------------- #
# Alter table "RIGA_DOCUMENTO"                                           #
# ---------------------------------------------------------------------- #

ALTER TABLE `RIGA_DOCUMENTO` ADD COLUMN `flgDescPadreGenerazioneRiga` VARCHAR(40);

# ---------------------------------------------------------------------- #
# Alter table "ARTICOLO"                                                 #
# ---------------------------------------------------------------------- #

ALTER TABLE `ARTICOLO` ADD COLUMN `prezzoPubblicoIvaOrd` DECIMAL(18,4);

CREATE INDEX `IDX_ARTICOLO_16` ON `ARTICOLO` (`prezzoPubblicoIvaOrd`);



##238



# ---------------------------------------------------------------------- #
# Add table "ATTIVITA_APPL"                                              #
# ---------------------------------------------------------------------- #

CREATE TABLE `ATTIVITA_APPL` (
    `id_attivitaAppl` INTEGER NOT NULL AUTO_INCREMENT,
    `id_tipoAttivita` INTEGER,
    `id_clifor` INTEGER NOT NULL,
    `nomeAttivita` VARCHAR(60),
    `descrizioneAttivita` TEXT,
    `indirizzoAttivita` VARCHAR(60),
    `numeroCivicoAttivita` VARCHAR(30),
    `id_comune` INTEGER,
    `descrizioneComuneAttivita` VARCHAR(60),
    `descrizioneProvinciaAttivita` CHAR(2),
    `capComuneAttivita` CHAR(5),
    `flgPayPal` INTEGER,
    `flgGusti` INTEGER,
    `dataIscrizione` DATE,
    `codiceAttivita` VARCHAR(40),
    `noteAttivita` TEXT,
    CONSTRAINT `PK_ATTIVITA_APPL` PRIMARY KEY (`id_attivitaAppl`)
);

CREATE UNIQUE INDEX `IDX_ATTIVITA_APPL_1` ON `ATTIVITA_APPL` (`codiceAttivita`);

# ---------------------------------------------------------------------- #
# Add table "TIPO_ATTIVITA"                                              #
# ---------------------------------------------------------------------- #

CREATE TABLE `TIPO_ATTIVITA` (
    `id_tipoAttivita` INTEGER NOT NULL AUTO_INCREMENT,
    `descrizione` VARCHAR(40),
    CONSTRAINT `PK_TIPO_ATTIVITA` PRIMARY KEY (`id_tipoAttivita`)
);

# ---------------------------------------------------------------------- #
# Add table "ABBONAMENTO"                                                #
# ---------------------------------------------------------------------- #

CREATE TABLE `ABBONAMENTO` (
    `id_attivitaAppl` INTEGER,
    `id_abbonamento` INTEGER NOT NULL AUTO_INCREMENT,
    `dataInizio` VARCHAR(40),
    `dataFine` VARCHAR(40),
    `costoMensile` DECIMAL(18,4),
    CONSTRAINT `PK_ABBONAMENTO` PRIMARY KEY (`id_abbonamento`)
);

# ---------------------------------------------------------------------- #
# Add foreign key constraints                                            #
# ---------------------------------------------------------------------- #

ALTER TABLE `ATTIVITA_APPL` ADD CONSTRAINT `CLIFOR_ATTIVITA_APPL` 
    FOREIGN KEY (`id_clifor`) REFERENCES `CLIFOR` (`id_clifor`);

ALTER TABLE `ATTIVITA_APPL` ADD CONSTRAINT `COMUNE_ATTIVITA_APPL` 
    FOREIGN KEY (`id_comune`) REFERENCES `COMUNE` (`id_comune`);

ALTER TABLE `ATTIVITA_APPL` ADD CONSTRAINT `TIPO_ATTIVITA_ATTIVITA_APPL` 
    FOREIGN KEY (`id_tipoAttivita`) REFERENCES `TIPO_ATTIVITA` (`id_tipoAttivita`);

ALTER TABLE `ABBONAMENTO` ADD CONSTRAINT `ATTIVITA_APPL_ABBONAMENTO` 
    FOREIGN KEY (`id_attivitaAppl`) REFERENCES `ATTIVITA_APPL` (`id_attivitaAppl`);
	
	
	
	##239
	
# ---------------------------------------------------------------------- #
# Alter table "ARTICOLO"                                                 #
# ---------------------------------------------------------------------- #

ALTER TABLE `ARTICOLO` ADD COLUMN `flgSubito` INTEGER;



##240


# ---------------------------------------------------------------------- #
# Alter table "BLACKLIST"                                                #
# ---------------------------------------------------------------------- #

ALTER TABLE `BLACKLIST` ADD COLUMN `notaBlacklist` TEXT;

CREATE UNIQUE INDEX `IDX_BLACKLIST_1` ON `BLACKLIST` (`ipAddress`);

CREATE UNIQUE INDEX `IDX_BLACKLIST_2` ON `BLACKLIST` (`eMail`);



# ---------------------------------------------------------------------- #
# Alter table "BLACKLIST"                                                #
# ---------------------------------------------------------------------- #

ALTER TABLE `BLACKLIST` ADD COLUMN `tmstStartBlacklist` DATETIME;

ALTER TABLE `BLACKLIST` ADD COLUMN `fatalCount` INTEGER;

ALTER TABLE `BLACKLIST` ADD COLUMN `tmstStartCount` DATETIME;


# ---------------------------------------------------------------------- #
# Alter table "ATTIVITA_APPL"                                            #
# ---------------------------------------------------------------------- #

ALTER TABLE `ATTIVITA_APPL` ADD COLUMN `imgTmst` CHAR(16);






