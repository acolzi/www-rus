drop table ACCESS;
DROP TABLE USER_ACCESS;
RENAME TABLE parm to XXX;
RENAME TABLE XXX to PARM;

alter table PARM drop column lastUpdTmst;

ALTER TABLE `USERS` ADD COLUMN `style` VARCHAR(60);

ALTER TABLE `USERS` ADD COLUMN `flgMl` INTEGER;

ALTER TABLE `USERS` ADD COLUMN `langMl` CHAR(2);

ALTER TABLE `USERS` ADD COLUMN `flgOperatore` INTEGER;

ALTER TABLE `USERS` ADD COLUMN `flgNews` INTEGER;

ALTER TABLE `USERS` ADD COLUMN `imgProfilo` VARCHAR(30);

ALTER TABLE `USERS` ADD COLUMN `cittaNascita` VARCHAR(30);

ALTER TABLE `USERS` ADD COLUMN `provinciaNascita` VARCHAR(4);

ALTER TABLE `USERS` ADD COLUMN `elencoIpAbilitati` VARCHAR(254);


ALTER TABLE `USERS` MODIFY `pwd` VARCHAR(512);

ALTER TABLE `USERS` MODIFY `nota` TEXT;


ALTER TABLE `USERS` MODIFY `indirizzoSped` VARCHAR(60);

ALTER TABLE `USERS` MODIFY `provinciaSped` VARCHAR(30);

ALTER TABLE `USERS` MODIFY `cittaSped` VARCHAR(30);

ALTER TABLE `USERS` MODIFY `capSped` VARCHAR(10);

ALTER TABLE `USERS` MODIFY `presso` VARCHAR(60);

ALTER TABLE `USERS` MODIFY `controlCode` VARCHAR(30);

ALTER TABLE `USERS` MODIFY `pIva` VARCHAR(15);


ALTER TABLE `USERS` MODIFY `currentIp` CHAR(60);

ALTER TABLE `USERS` MODIFY `createIp` CHAR(60);

ALTER TABLE `USERS` MODIFY `oldPwd` TEXT;

ALTER TABLE `USERS` MODIFY `flgChangeLog` INTEGER;

ALTER TABLE `USERS` MODIFY `pwdSuper` VARCHAR(512);
############################################################################
############################################################################
############################################################################
############################################################################
############################################################################


# ---------------------------------------------------------------------- #
# Script generated with: DeZign for Databases V9.2.1                     #
# Target DBMS:           MySQL 5                                         #
# Project file:          abliaDbComuni3.dez                              #
# Project name:          DB COMUNI - ABLIA                               #
# Author:                Andrea Colzi                                    #
# Script type:           Database creation script                        #
# Created on:            2017-11-20 12:02                                #
# ---------------------------------------------------------------------- #


# ---------------------------------------------------------------------- #
# Add tables                                                             #
# ---------------------------------------------------------------------- #

# ---------------------------------------------------------------------- #
# Add table "MARCA"                                                      #
# ---------------------------------------------------------------------- #

CREATE TABLE `MARCA` (
    `id_marca` INTEGER NOT NULL AUTO_INCREMENT,
    `descrizione` VARCHAR(60),
    CONSTRAINT `PK_MARCA` PRIMARY KEY (`id_marca`)
);

CREATE UNIQUE INDEX `IDX_MARCA_1` ON `MARCA` (`descrizione` ASC);

# ---------------------------------------------------------------------- #
# Add table "COLORE"                                                     #
# ---------------------------------------------------------------------- #

CREATE TABLE `COLORE` (
    `id_colore` INTEGER NOT NULL AUTO_INCREMENT,
    `descrizione` VARCHAR(30),
    CONSTRAINT `PK_COLORE` PRIMARY KEY (`id_colore`)
);

CREATE UNIQUE INDEX `IDX_COLORE_1` ON `COLORE` (`descrizione` ASC);

# ---------------------------------------------------------------------- #
# Add table "CARATTERISTICA"                                             #
# ---------------------------------------------------------------------- #

CREATE TABLE `CARATTERISTICA` (
    `id_caratteristica` INTEGER NOT NULL AUTO_INCREMENT,
    `descrizione_it` VARCHAR(60),
    `descrizione_en` VARCHAR(60),
    `flgTipoVal` INTEGER,
    `flgCR` INTEGER DEFAULT 0,
    `ordine` INTEGER,
    `codiceAggiuntivo` VARCHAR(30),
    `flgRicercaWeb` INTEGER,
    CONSTRAINT `PK_CARATTERISTICA` PRIMARY KEY (`id_caratteristica`)
);

CREATE INDEX `IDX_CARATTERISTICA_1` ON `CARATTERISTICA` (`codiceAggiuntivo` ASC);

# ---------------------------------------------------------------------- #
# Add table "LISTA"                                                      #
# ---------------------------------------------------------------------- #

CREATE TABLE `LISTA` (
    `id_lista` INTEGER NOT NULL AUTO_INCREMENT,
    `id_caratteristica` INTEGER,
    `valore` VARCHAR(60),
    CONSTRAINT `PK_LISTA` PRIMARY KEY (`id_lista`)
);

CREATE INDEX `IDX_LISTA_1` ON `LISTA` (`id_caratteristica`);

# ---------------------------------------------------------------------- #
# Add table "TIPO_ACCESSORIO"                                            #
# ---------------------------------------------------------------------- #

CREATE TABLE `TIPO_ACCESSORIO` (
    `id_tipoAccessorio` INTEGER NOT NULL AUTO_INCREMENT,
    `descrizione_it` VARCHAR(60),
    `descrizione_en` VARCHAR(60),
    `flgDirezione` INTEGER,
    CONSTRAINT `PK_TIPO_ACCESSORIO` PRIMARY KEY (`id_tipoAccessorio`)
);

# ---------------------------------------------------------------------- #
# Add table "TIPO_PAGAMENTO"                                             #
# ---------------------------------------------------------------------- #

CREATE TABLE `TIPO_PAGAMENTO` (
    `id_tipoPagamento` INTEGER NOT NULL AUTO_INCREMENT,
    `periodicita` INTEGER,
    `descrizione_it` VARCHAR(60),
    `descrizione_en` VARCHAR(60),
    `flgTipoPagamento` INTEGER,
    `flgPrimaScadenza` INTEGER,
    `giornoFisso` INTEGER,
    `primaRata` INTEGER,
    `nRate` INTEGER,
    `codiceTenderCassa` CHAR(4),
    `flgWww` INTEGER,
    `flgAbilitatoNegozio` INTEGER,
    `flgAbilitatoCorriere` INTEGER,
    `codiceCassaEpson` INTEGER,
    `flgIncassoPagamento` INTEGER,
    CONSTRAINT `PK_TIPO_PAGAMENTO` PRIMARY KEY (`id_tipoPagamento`)
);

# ---------------------------------------------------------------------- #
# Add table "NAZIONE"                                                    #
# ---------------------------------------------------------------------- #

CREATE TABLE `NAZIONE` (
    `id_nazione` CHAR(4) NOT NULL,
    `codice` VARCHAR(16),
    `lang` CHAR(3),
    `descrizione_it` VARCHAR(60),
    `descrizione_en` VARCHAR(60),
    `flgCee` INTEGER,
    `flgAttiva` INTEGER,
    `costoSpedizione` DECIMAL(18,4),
    `codiceIstat` CHAR(3),
    `descrizioneInLingua` VARCHAR(60),
    CONSTRAINT `PK_NAZIONE` PRIMARY KEY (`id_nazione`)
);

CREATE INDEX `IDX_NAZIONE_1` ON `NAZIONE` (`lang`);

CREATE UNIQUE INDEX `IDX_NAZIONE_2` ON `NAZIONE` (`codice` ASC);

# ---------------------------------------------------------------------- #
# Add table "REGIONE"                                                    #
# ---------------------------------------------------------------------- #

CREATE TABLE `REGIONE` (
    `id_regione` VARCHAR(8) NOT NULL,
    `descrizione` VARCHAR(30),
    `id_nazione` CHAR(4),
    CONSTRAINT `PK_REGIONE` PRIMARY KEY (`id_regione`)
);

# ---------------------------------------------------------------------- #
# Add table "NEWSLETTER1"                                                #
# ---------------------------------------------------------------------- #

CREATE TABLE `NEWSLETTER1` (
    `id_newsletter` INTEGER NOT NULL AUTO_INCREMENT,
    `dataNewsletter` DATE,
    `titolo_it` VARCHAR(60),
    `titolo_en` VARCHAR(60),
    `imgTmst` CHAR(16),
    `testo_it` TEXT,
    `testo_en` TEXT,
    CONSTRAINT `PK_NEWSLETTER1` PRIMARY KEY (`id_newsletter`)
);

# ---------------------------------------------------------------------- #
# Add table "TIPO_TAGLIA"                                                #
# ---------------------------------------------------------------------- #

CREATE TABLE `TIPO_TAGLIA` (
    `id_tipoTaglia` INTEGER NOT NULL AUTO_INCREMENT,
    `descrizione` VARCHAR(60),
    `codice` VARCHAR(16),
    CONSTRAINT `PK_TIPO_TAGLIA` PRIMARY KEY (`id_tipoTaglia`)
);

CREATE UNIQUE INDEX `IDX_TIPO_TAGLIA_1` ON `TIPO_TAGLIA` (`codice`);

# ---------------------------------------------------------------------- #
# Add table "TABELLA_TAGLIA"                                             #
# ---------------------------------------------------------------------- #

CREATE TABLE `TABELLA_TAGLIA` (
    `id_tabellaTaglia` INTEGER NOT NULL AUTO_INCREMENT,
    `id_tipoTaglia` INTEGER,
    `descrizione` VARCHAR(60),
    `flgAltezzaCavallo` INTEGER,
    `flgColloCm` INTEGER,
    `flgColloPoll` INTEGER,
    `flgGiroCoscia` INTEGER,
    `flgLarghezzaFondoCm` INTEGER,
    `flgLunghezzaGamba` INTEGER,
    `flgLunghezzaTotale` INTEGER,
    `flgSpalleCm` INTEGER,
    `flgTagliaCollo` INTEGER,
    `flgTagliaLettere` INTEGER,
    `flgTagliaNum` INTEGER,
    `flgToraceCm` INTEGER,
    `flgVitaCm` INTEGER,
    `descrizioneImg_en` VARCHAR(254),
    `descrizioneImg_it` VARCHAR(254),
    `flgLunghezzaManica` INTEGER,
    `flgVitaCmNoTeso` INTEGER,
    `flgVitaCmTeso` INTEGER,
    `imgTmst` CHAR(16),
    CONSTRAINT `PK_TABELLA_TAGLIA` PRIMARY KEY (`id_tabellaTaglia`)
);

CREATE INDEX `IDX_TABELLA_TAGLIA_1` ON `TABELLA_TAGLIA` (`id_tipoTaglia`);

# ---------------------------------------------------------------------- #
# Add table "TAGLIA_MISURE"                                              #
# ---------------------------------------------------------------------- #

CREATE TABLE `TAGLIA_MISURE` (
    `id_tagliaMisure` INTEGER NOT NULL AUTO_INCREMENT,
    `id_tabellaTaglia` INTEGER,
    `ordine` INTEGER,
    `tagliaLettere` CHAR(10),
    `tagliaNum` CHAR(10),
    `tagliaCollo` CHAR(10),
    `colloCm` CHAR(10),
    `colloPoll` CHAR(10),
    `vitaCm` CHAR(10),
    `toraceCm` CHAR(10),
    `lunghezzaTotale` CHAR(10),
    `altezzaCavallo` CHAR(10),
    `giroCoscia` CHAR(10),
    `larghezzaFondoCm` CHAR(10),
    `lunghezzaGamba` CHAR(10),
    `spalleCm` CHAR(10),
    `lunghezzaManica` CHAR(10),
    `vitaCmNoTeso` CHAR(10),
    `vitaCmTeso` CHAR(10),
    CONSTRAINT `PK_TAGLIA_MISURE` PRIMARY KEY (`id_tagliaMisure`)
);

CREATE INDEX `IDX_TAGLIA_MISURE_1` ON `TAGLIA_MISURE` (`id_tabellaTaglia`);

CREATE UNIQUE INDEX `IDX_TAGLIA_MISURE_2` ON `TAGLIA_MISURE` (`ordine`,`id_tabellaTaglia`);

# ---------------------------------------------------------------------- #
# Add table "MAG_FISICO"                                                 #
# ---------------------------------------------------------------------- #

CREATE TABLE `MAG_FISICO` (
    `id_magFisico` INTEGER NOT NULL AUTO_INCREMENT,
    `descrizione` VARCHAR(60),
    `flgTipo` INTEGER,
    `flgFineLavorazione` INTEGER,
    CONSTRAINT `PK_MAG_FISICO` PRIMARY KEY (`id_magFisico`)
);
INSERT INTO `MAG_FISICO` VALUES (1,'Magazzino Base',1,0);

# ---------------------------------------------------------------------- #
# Add table "TIPO_BANNER"                                                #
# ---------------------------------------------------------------------- #

CREATE TABLE `TIPO_BANNER` (
    `id_tipoBanner` INTEGER NOT NULL AUTO_INCREMENT,
    `descrizione` VARCHAR(60),
    `larghezza` VARCHAR(10),
    `altezza` VARCHAR(10),
    CONSTRAINT `PK_TIPO_BANNER` PRIMARY KEY (`id_tipoBanner`)
);

# ---------------------------------------------------------------------- #
# Add table "EXCLUDE_KEYWORDS"                                           #
# ---------------------------------------------------------------------- #

CREATE TABLE `EXCLUDE_KEYWORDS` (
    `id_excludeKeywords` VARCHAR(30) NOT NULL,
    `lang` CHAR(2),
    `theKey` VARCHAR(60),
    CONSTRAINT `PK_EXCLUDE_KEYWORDS` PRIMARY KEY (`id_excludeKeywords`)
);

# ---------------------------------------------------------------------- #
# Add table "CAUSALE_MAGAZZINO"                                          #
# ---------------------------------------------------------------------- #

CREATE TABLE `CAUSALE_MAGAZZINO` (
    `id_causaleMagazzino` INTEGER NOT NULL AUTO_INCREMENT,
    `descrizione` VARCHAR(60),
    `id_magFisicoPartenza` INTEGER,
    `id_magFisicoArrivo` INTEGER,
    `flgCaricoPartenza` INTEGER,
    `flgScaricoPartenza` INTEGER,
    `flgCaricoArrivo` INTEGER,
    `flgScaricoArrivo` INTEGER,
    `flgPartenzaInterno` INTEGER,
    `flgArrivoInterno` INTEGER,
    `flgPartenzaLavorazione` INTEGER,
    `flgArrivoLavorazione` INTEGER,
    `nota` TEXT,
    CONSTRAINT `PK_CAUSALE_MAGAZZINO` PRIMARY KEY (`id_causaleMagazzino`)
);
INSERT INTO `CAUSALE_MAGAZZINO` VALUES (1,'Scarico per vendita',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL),(2,'Carico per Acquisto',NULL,1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(3,'Carico per reso da Cliente',NULL,1,NULL,NULL,NULL,NULL,NULL,-1,NULL,NULL,NULL),(4,'Scarico per reso a fornitori',1,NULL,NULL,NULL,-1,NULL,NULL,NULL,NULL,NULL,NULL),(5,'CARICO DIVERSIFICATO',NULL,1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(6,'SCARICO DIVERSIFICATO',1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL);

CREATE INDEX `IDX_CAUSALE_MAGAZZINO_1` ON `CAUSALE_MAGAZZINO` (`id_magFisicoPartenza`);

CREATE INDEX `IDX_CAUSALE_MAGAZZINO_2` ON `CAUSALE_MAGAZZINO` (`id_magFisicoArrivo`);

# ---------------------------------------------------------------------- #
# Add table "ESERCIZIO"                                                  #
# ---------------------------------------------------------------------- #

CREATE TABLE `ESERCIZIO` (
    `id_esercizio` INTEGER NOT NULL,
    `flgStato` INTEGER,
    CONSTRAINT `PK_ESERCIZIO` PRIMARY KEY (`id_esercizio`)
);

# ---------------------------------------------------------------------- #
# Add table "ASPETTO"                                                    #
# ---------------------------------------------------------------------- #

CREATE TABLE `ASPETTO` (
    `id_aspetto` INTEGER NOT NULL AUTO_INCREMENT,
    `descrizione` VARCHAR(40),
    CONSTRAINT `PK_ASPETTO` PRIMARY KEY (`id_aspetto`)
);

# ---------------------------------------------------------------------- #
# Add table "REGISTRO_IVA"                                               #
# ---------------------------------------------------------------------- #

CREATE TABLE `REGISTRO_IVA` (
    `id_registroIva` INTEGER NOT NULL,
    `anno` INTEGER,
    `dataUltimaStampa` DATE,
    `ultimaPagina` INTEGER,
    `ultimaRiga` INTEGER,
    `dataDa` DATE,
    `dataA` DATE,
    `flgPeriodo` CHAR(2),
    `flgTipoLiquidazione` INTEGER,
    `flgMeseStampato` INTEGER,
    `flgAnnoStampato` INTEGER,
    `flgTrimestreStampato` INTEGER,
    CONSTRAINT `PK_REGISTRO_IVA` PRIMARY KEY (`id_registroIva`)
);

# ---------------------------------------------------------------------- #
# Add table "CONTATORE"                                                  #
# ---------------------------------------------------------------------- #

CREATE TABLE `CONTATORE` (
    `id_contatore` INTEGER NOT NULL AUTO_INCREMENT,
    `descrizione` VARCHAR(30),
    `flgTipo` INTEGER,
    `flgControllo` INTEGER,
    `annoIniziale` INTEGER,
    `progIniziale` INTEGER,
    CONSTRAINT `PK_CONTATORE` PRIMARY KEY (`id_contatore`)
);
INSERT INTO `CONTATORE` VALUES (1,'Vendite',1,1,NULL,NULL),(2,'Acquisti',1,1,NULL,NULL),(3,'BOLLE EMESSE',1,1,NULL,NULL),(4,'Bolle da Fornitori',3,NULL,NULL,NULL),(5,'Bolle da Clienti',1,NULL,NULL,NULL),(6,'CORRISPETTIVI',1,0,NULL,NULL),(7,'ORDINI A FORNITORI',3,0,NULL,NULL),(8,'PRENOTAZIONI CLIENTI',1,0,NULL,NULL),(9,'DOCUMENTI INTERNI',1,0,NULL,NULL),(10,'RIPARAZIONI',1,0,NULL,NULL),(11,'CONTO VENDITA',1,0,NULL,NULL),(12,'ordini web',1,0,0,0);

# ---------------------------------------------------------------------- #
# Add table "LISTINO"                                                    #
# ---------------------------------------------------------------------- #

CREATE TABLE `LISTINO` (
    `id_listino` INTEGER NOT NULL AUTO_INCREMENT,
    `flgTipoL` INTEGER,
    `descrizione` VARCHAR(30),
    `percL` DECIMAL(5,2),
    `percL1` DECIMAL(5,2),
    `percL2` DECIMAL(5,2),
    `percL3` DECIMAL(5,2),
    CONSTRAINT `PK_LISTINO` PRIMARY KEY (`id_listino`)
);

# ---------------------------------------------------------------------- #
# Add table "REG_CASSA"                                                  #
# ---------------------------------------------------------------------- #

CREATE TABLE `REG_CASSA` (
    `id_regCassa` INTEGER NOT NULL AUTO_INCREMENT,
    `descrizione` VARCHAR(60),
    `ipCassa` CHAR(60),
    `porta` INTEGER,
    `flgTipoCassa` INTEGER,
    CONSTRAINT `PK_REG_CASSA` PRIMARY KEY (`id_regCassa`)
);

# ---------------------------------------------------------------------- #
# Add table "CAUSALE_TRASPORTO"                                          #
# ---------------------------------------------------------------------- #

CREATE TABLE `CAUSALE_TRASPORTO` (
    `id_causaleTrasporto` INTEGER NOT NULL AUTO_INCREMENT,
    `descrizione` VARCHAR(60),
    CONSTRAINT `PK_CAUSALE_TRASPORTO` PRIMARY KEY (`id_causaleTrasporto`)
);

# ---------------------------------------------------------------------- #
# Add table "TIPO_SPESA"                                                 #
# ---------------------------------------------------------------------- #

CREATE TABLE `TIPO_SPESA` (
    `id_tipoSpesa` INTEGER NOT NULL AUTO_INCREMENT,
    `descrizione` VARCHAR(60),
    CONSTRAINT `PK_TIPO_SPESA` PRIMARY KEY (`id_tipoSpesa`)
);

# ---------------------------------------------------------------------- #
# Add table "TEMPLATE_MSG"                                               #
# ---------------------------------------------------------------------- #

CREATE TABLE `TEMPLATE_MSG` (
    `id_templateMsg` INTEGER NOT NULL AUTO_INCREMENT,
    `descrizione` VARCHAR(60),
    `flgTipo` INTEGER,
    `testoMessaggio` TEXT,
    `imgTmst` CHAR(16),
    `oggettoEmail` VARCHAR(254),
    CONSTRAINT `PK_TEMPLATE_MSG` PRIMARY KEY (`id_templateMsg`)
);

# ---------------------------------------------------------------------- #
# Add table "WHITELIST"                                                  #
# ---------------------------------------------------------------------- #

CREATE TABLE `WHITELIST` (
    `id_whitelist` INTEGER NOT NULL AUTO_INCREMENT,
    `descrizione` VARCHAR(60),
    `ipAddress` CHAR(60),
    `flgAttivo` INTEGER,
    CONSTRAINT `PK_WHITELIST` PRIMARY KEY (`id_whitelist`)
);

# ---------------------------------------------------------------------- #
# Add table "TIPO_CONTRATTO"                                             #
# ---------------------------------------------------------------------- #

CREATE TABLE `TIPO_CONTRATTO` (
    `id_tipoContratto` INTEGER NOT NULL AUTO_INCREMENT,
    `descrizione` VARCHAR(60),
    `dataFineValiditaContratto` DATE,
    `durataMesi` INTEGER,
    `flgPrepagato` INTEGER,
    `messaggioSms` TEXT,
    `ggInvioMsg` INTEGER,
    CONSTRAINT `PK_TIPO_CONTRATTO` PRIMARY KEY (`id_tipoContratto`)
);

# ---------------------------------------------------------------------- #
# Add table "TIPO_POSTAZIONE"                                            #
# ---------------------------------------------------------------------- #

CREATE TABLE `TIPO_POSTAZIONE` (
    `id_tipoPostazione` INTEGER NOT NULL AUTO_INCREMENT,
    `descrizione` VARCHAR(30),
    CONSTRAINT `PK_TIPO_POSTAZIONE` PRIMARY KEY (`id_tipoPostazione`)
);

# ---------------------------------------------------------------------- #
# Add table "PORTO"                                                      #
# ---------------------------------------------------------------------- #

CREATE TABLE `PORTO` (
    `id_porto` INTEGER NOT NULL AUTO_INCREMENT,
    `descrizione` VARCHAR(60),
    `nota` VARCHAR(254),
    CONSTRAINT `PK_PORTO` PRIMARY KEY (`id_porto`)
);

# ---------------------------------------------------------------------- #
# Add table "TIPO_ALLEGATO_CLIFOR"                                       #
# ---------------------------------------------------------------------- #

CREATE TABLE `TIPO_ALLEGATO_CLIFOR` (
    `id_tipoAllegatoClifor` INTEGER NOT NULL AUTO_INCREMENT,
    `descrizione` VARCHAR(60),
    CONSTRAINT `PK_TIPO_ALLEGATO_CLIFOR` PRIMARY KEY (`id_tipoAllegatoClifor`)
);

# ---------------------------------------------------------------------- #
# Add table "TIPO_ALLEGATO_ARTICOLO"                                     #
# ---------------------------------------------------------------------- #

CREATE TABLE `TIPO_ALLEGATO_ARTICOLO` (
    `id_tipoAllegatoArticolo` INTEGER NOT NULL AUTO_INCREMENT,
    `descrizione` VARCHAR(40),
    CONSTRAINT `PK_TIPO_ALLEGATO_ARTICOLO` PRIMARY KEY (`id_tipoAllegatoArticolo`)
);

# ---------------------------------------------------------------------- #
# Add table "TIPO_ALLEGATO_DOCUMENTO"                                    #
# ---------------------------------------------------------------------- #

CREATE TABLE `TIPO_ALLEGATO_DOCUMENTO` (
    `id_tipoAllegatoDocumento` INTEGER NOT NULL AUTO_INCREMENT,
    `descrizione` VARCHAR(40),
    CONSTRAINT `PK_TIPO_ALLEGATO_DOCUMENTO` PRIMARY KEY (`id_tipoAllegatoDocumento`)
);

# ---------------------------------------------------------------------- #
# Add table "TIPO_NEWS"                                                  #
# ---------------------------------------------------------------------- #

CREATE TABLE `TIPO_NEWS` (
    `id_tipoNews` INTEGER NOT NULL AUTO_INCREMENT,
    `flgPubblica` INTEGER,
    CONSTRAINT `PK_TIPO_NEWS` PRIMARY KEY (`id_tipoNews`)
);

# ---------------------------------------------------------------------- #
# Add table "ALLEGATO_TEMPLATE_MSG"                                      #
# ---------------------------------------------------------------------- #

CREATE TABLE `ALLEGATO_TEMPLATE_MSG` (
    `id_allegatoTemplateMsg` INTEGER NOT NULL AUTO_INCREMENT,
    `id_templateMsg` INTEGER,
    `nomeFile` VARCHAR(60),
    CONSTRAINT `PK_ALLEGATO_TEMPLATE_MSG` PRIMARY KEY (`id_allegatoTemplateMsg`)
);

# ---------------------------------------------------------------------- #
# Add table "CONSEL_TABFIN"                                              #
# ---------------------------------------------------------------------- #

CREATE TABLE `CONSEL_TABFIN` (
    `id_conselTabfin` INTEGER NOT NULL AUTO_INCREMENT,
    `flgTipo` CHAR(3),
    `valoreBene` DECIMAL(18,4),
    `durata` INTEGER,
    `importoRata` DECIMAL(18,4),
    `tan` DECIMAL(5,2),
    `taeg` DECIMAL(5,2),
    `interessi` DECIMAL(18,4),
    `speseGestSingolaRata` DECIMAL(18,4),
    `speseGestTotaleRata` DECIMAL(18,4),
    `impostaBollo` DECIMAL(18,4),
    `importoTotaleDovuto` DECIMAL(18,4),
    CONSTRAINT `PK_CONSEL_TABFIN` PRIMARY KEY (`id_conselTabfin`)
);

CREATE INDEX `IDX_CONSEL_TABFIN_1` ON `CONSEL_TABFIN` (`flgTipo`);

CREATE INDEX `IDX_CONSEL_TABFIN_2` ON `CONSEL_TABFIN` (`importoRata` ASC);

CREATE INDEX `IDX_CONSEL_TABFIN_3` ON `CONSEL_TABFIN` (`durata` ASC);

# ---------------------------------------------------------------------- #
# Add table "PROMOZIONE"                                                 #
# ---------------------------------------------------------------------- #

CREATE TABLE `PROMOZIONE` (
    `id_promozione` INTEGER NOT NULL AUTO_INCREMENT,
    `descrizione_it` VARCHAR(254),
    `dataInizio` DATE,
    `dataFine` DATE,
    `percSconto` INTEGER,
    `codicePromozione` VARCHAR(30),
    `descrizione_en` VARCHAR(254),
    CONSTRAINT `PK_PROMOZIONE` PRIMARY KEY (`id_promozione`)
);

CREATE UNIQUE INDEX `IDX_PROMOZIONE_1` ON `PROMOZIONE` (`codicePromozione`);

# ---------------------------------------------------------------------- #
# Add table "DESC_TXT_LANG"                                              #
# ---------------------------------------------------------------------- #

CREATE TABLE `DESC_TXT_LANG` (
    `tabella` CHAR(40) NOT NULL,
    `idTabella` INTEGER NOT NULL,
    `campo` CHAR(40) NOT NULL,
    `lang` CHAR(3) NOT NULL,
    `descrizione` TEXT CHARACTER SET utf8,
    `descrizione254` VARCHAR(254) CHARACTER SET utf8,
    CONSTRAINT `PK_DESC_TXT_LANG` PRIMARY KEY (`tabella`, `idTabella`, `campo`, `lang`)
);

# ---------------------------------------------------------------------- #
# Add table "VETRINA"                                                    #
# ---------------------------------------------------------------------- #

CREATE TABLE `VETRINA` (
    `id_vetrina` INTEGER NOT NULL AUTO_INCREMENT,
    `descrizione` VARCHAR(30),
    CONSTRAINT `PK_VETRINA` PRIMARY KEY (`id_vetrina`)
);

# ---------------------------------------------------------------------- #
# Add table "COMPONENTE"                                                 #
# ---------------------------------------------------------------------- #

CREATE TABLE `COMPONENTE` (
    `id_componente` INTEGER NOT NULL AUTO_INCREMENT,
    `sigla` VARCHAR(5) NOT NULL,
    CONSTRAINT `PK_COMPONENTE` PRIMARY KEY (`id_componente`),
    CONSTRAINT `TUC_COMPONENTE_1` UNIQUE (`sigla`)
);

# ---------------------------------------------------------------------- #
# Add table "TIPOLOGIA_ARTICOLO"                                         #
# ---------------------------------------------------------------------- #

CREATE TABLE `TIPOLOGIA_ARTICOLO` (
    `id_tipologiaArticolo` INTEGER NOT NULL AUTO_INCREMENT,
    `descrizione` VARCHAR(60),
    `flgUdm` INTEGER,
    `flgKg` INTEGER,
    `flgMt` INTEGER,
    `flgNr` INTEGER,
    CONSTRAINT `PK_TIPOLOGIA_ARTICOLO` PRIMARY KEY (`id_tipologiaArticolo`)
);

# ---------------------------------------------------------------------- #
# Add table "TIPO_CLIFOR"                                                #
# ---------------------------------------------------------------------- #

CREATE TABLE `TIPO_CLIFOR` (
    `id_tipoClifor` INTEGER NOT NULL AUTO_INCREMENT,
    `descrizione` VARCHAR(60),
    `flgTipo` CHAR(1),
    `flgTipologia` INTEGER,
    CONSTRAINT `PK_TIPO_CLIFOR` PRIMARY KEY (`id_tipoClifor`)
);

# ---------------------------------------------------------------------- #
# Add table "MAIL_NEWSLETTER"                                            #
# ---------------------------------------------------------------------- #

CREATE TABLE `MAIL_NEWSLETTER` (
    `id_mailNewsletter` INTEGER NOT NULL AUTO_INCREMENT,
    `eMail` VARCHAR(255),
    `id_templateMsg` INTEGER,
    `dataTemplate` DATE,
    CONSTRAINT `PK_MAIL_NEWSLETTER` PRIMARY KEY (`id_mailNewsletter`)
);

CREATE UNIQUE INDEX `IDX_MAIL_NEWSLETTER_1` ON `MAIL_NEWSLETTER` (`eMail`);

# ---------------------------------------------------------------------- #
# Add table "PIANO_CONTI"                                                #
# ---------------------------------------------------------------------- #

CREATE TABLE `PIANO_CONTI` (
    `id_pianoConti` INTEGER NOT NULL AUTO_INCREMENT,
    `contoCompleto` VARCHAR(40),
    `descrizione` VARCHAR(254),
    `flgTipo` INTEGER,
    `flgCFBI` INTEGER,
    `flgMovimentabile` INTEGER,
    `mastro` VARCHAR(40),
    `conto` VARCHAR(40),
    `sottoconto` VARCHAR(40),
    CONSTRAINT `PK_PIANO_CONTI` PRIMARY KEY (`id_pianoConti`)
);

# ---------------------------------------------------------------------- #
# Add table "CAUSALE_CONTABILE"                                          #
# ---------------------------------------------------------------------- #

CREATE TABLE `CAUSALE_CONTABILE` (
    `id_causaleContabile` INTEGER NOT NULL AUTO_INCREMENT,
    `descrizione` VARCHAR(40),
    CONSTRAINT `PK_CAUSALE_CONTABILE` PRIMARY KEY (`id_causaleContabile`)
);

# ---------------------------------------------------------------------- #
# Add table "RIGA_CAUSALE_CONTABILE"                                     #
# ---------------------------------------------------------------------- #

CREATE TABLE `RIGA_CAUSALE_CONTABILE` (
    `id_rigaCausaleContabile` INTEGER NOT NULL AUTO_INCREMENT,
    `id_causaleContabile` INTEGER,
    `id_pianoConti` INTEGER,
    `flgDA` INTEGER,
    CONSTRAINT `PK_RIGA_CAUSALE_CONTABILE` PRIMARY KEY (`id_rigaCausaleContabile`)
);

# ---------------------------------------------------------------------- #
# Add table "ZONA"                                                       #
# ---------------------------------------------------------------------- #

CREATE TABLE `ZONA` (
    `id_zona` INTEGER NOT NULL AUTO_INCREMENT,
    `descrizione` VARCHAR(30),
    CONSTRAINT `PK_ZONA` PRIMARY KEY (`id_zona`)
);

# ---------------------------------------------------------------------- #
# Add table "ABI_CAB"                                                    #
# ---------------------------------------------------------------------- #

CREATE TABLE `ABI_CAB` (
    `id_abiCab` INTEGER NOT NULL AUTO_INCREMENT,
    `descrizione` VARCHAR(60),
    `agenzia` VARCHAR(40),
    `indirizzo` VARCHAR(60),
    `localita` VARCHAR(60),
    `cap` VARCHAR(10),
    `provincia` VARCHAR(4),
    `abi` VARCHAR(6),
    `cab` VARCHAR(6),
    `bic` VARCHAR(30),
    `codiceAlt` VARCHAR(40),
    CONSTRAINT `PK_ABI_CAB` PRIMARY KEY (`id_abiCab`)
);

CREATE UNIQUE INDEX `IDX_ABI_CAB_1` ON `ABI_CAB` (`abi`,`cab`);

# ---------------------------------------------------------------------- #
# Add table "FESTIVITA"                                                  #
# ---------------------------------------------------------------------- #

CREATE TABLE `FESTIVITA` (
    `id_festivita` INTEGER NOT NULL AUTO_INCREMENT,
    `descrizione` VARCHAR(254),
    `giorno` INTEGER,
    `mese` INTEGER,
    `anno` INTEGER,
    `flgTipo` INTEGER,
    `dataInizio` DATE,
    `dataFine` DATE,
    CONSTRAINT `PK_FESTIVITA` PRIMARY KEY (`id_festivita`)
);

# ---------------------------------------------------------------------- #
# Add table "MESE_ESCLUSO"                                               #
# ---------------------------------------------------------------------- #

CREATE TABLE `MESE_ESCLUSO` (
    `id_meseEscluso` INTEGER NOT NULL AUTO_INCREMENT,
    `id_tipoPagamento` INTEGER,
    `meseEscluso` INTEGER,
    `giornoEscluso` INTEGER,
    CONSTRAINT `PK_MESE_ESCLUSO` PRIMARY KEY (`id_meseEscluso`)
);

# ---------------------------------------------------------------------- #
# Add table "NO_MLIST"                                                   #
# ---------------------------------------------------------------------- #

CREATE TABLE `NO_MLIST` (
    `id_noMlist` INTEGER NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(40),
    `dataCancellazione` DATE,
    `oraCancellazione` TIME,
    `ipAddress` CHAR(60),
    CONSTRAINT `PK_NO_MLIST` PRIMARY KEY (`id_noMlist`)
);

CREATE UNIQUE INDEX `IDX_NO_MLIST_1` ON `NO_MLIST` (`email`);

# ---------------------------------------------------------------------- #
# Add table "FASE_LAVORAZIONE"                                           #
# ---------------------------------------------------------------------- #

CREATE TABLE `FASE_LAVORAZIONE` (
    `id_faseLavorazione` INTEGER NOT NULL AUTO_INCREMENT,
    `codFase` INTEGER,
    `descrizione` VARCHAR(40),
    `descrizioneBreve` VARCHAR(40),
    CONSTRAINT `PK_FASE_LAVORAZIONE` PRIMARY KEY (`id_faseLavorazione`)
);

CREATE INDEX `IDX_FASE_LAVORAZIONE_1` ON `FASE_LAVORAZIONE` (`codFase` ASC);

# ---------------------------------------------------------------------- #
# Add table "COLORE_FILATO"                                              #
# ---------------------------------------------------------------------- #

CREATE TABLE `COLORE_FILATO` (
    `id_coloreFilato` INTEGER NOT NULL AUTO_INCREMENT,
    `descrizione` VARCHAR(40),
    `flgGreggio` INTEGER,
    CONSTRAINT `PK_COLORE_FILATO` PRIMARY KEY (`id_coloreFilato`)
);

# ---------------------------------------------------------------------- #
# Add table "ARTICOLO_FILATO_COLORE"                                     #
# ---------------------------------------------------------------------- #

CREATE TABLE `ARTICOLO_FILATO_COLORE` (
    `id_articoloFilatoColore` INTEGER NOT NULL AUTO_INCREMENT,
    `id_coloreFilato` INTEGER,
    `quantitaCalcolate` BOOL,
    `quantitaMagazzinoMovimentoHtml` VARCHAR(200),
    `quantitaInArrivo` DOUBLE,
    `quantitaImpegnata` DOUBLE,
    `quantitaEffettiva` DOUBLE,
    `flgDispo` INTEGER,
    `quantita` DOUBLE,
    CONSTRAINT `PK_ARTICOLO_FILATO_COLORE` PRIMARY KEY (`id_articoloFilatoColore`)
);

CREATE UNIQUE INDEX `IDX_ARTICOLO_FILATO_COLORE_1` ON `ARTICOLO_FILATO_COLORE` (`id_coloreFilato`);

# ---------------------------------------------------------------------- #
# Add table "RINCORSO"                                                   #
# ---------------------------------------------------------------------- #

CREATE TABLE `RINCORSO` (
    `id_rincorso` INTEGER NOT NULL AUTO_INCREMENT,
    `descrizioneRincorso` VARCHAR(200),
    `dettaglioRincorso` VARCHAR(5000),
    CONSTRAINT `PK_RINCORSO` PRIMARY KEY (`id_rincorso`)
);

# ---------------------------------------------------------------------- #
# Add table "ARMATURA"                                                   #
# ---------------------------------------------------------------------- #

CREATE TABLE `ARMATURA` (
    `id_armatura` INTEGER NOT NULL AUTO_INCREMENT,
    `descrizione` VARCHAR(40),
    `numLicci` INTEGER,
    `numcolpi` INTEGER,
    `partenza` INTEGER,
    CONSTRAINT `PK_ARMATURA` PRIMARY KEY (`id_armatura`)
);

# ---------------------------------------------------------------------- #
# Add table "ARMATURA_DETTAGLIO"                                         #
# ---------------------------------------------------------------------- #

CREATE TABLE `ARMATURA_DETTAGLIO` (
    `id_armaturaDettaglio` INTEGER NOT NULL AUTO_INCREMENT,
    `id_armatura` INTEGER,
    `nRiga` INTEGER,
    `armaturaRiga` VARCHAR(100),
    CONSTRAINT `PK_ARMATURA_DETTAGLIO` PRIMARY KEY (`id_armaturaDettaglio`)
);

# ---------------------------------------------------------------------- #
# Add table "TIPO_LAVORAZIONE"                                           #
# ---------------------------------------------------------------------- #

CREATE TABLE `TIPO_LAVORAZIONE` (
    `id_tipoLavorazione` INTEGER NOT NULL AUTO_INCREMENT,
    `descrizione` VARCHAR(40),
    CONSTRAINT `PK_TIPO_LAVORAZIONE` PRIMARY KEY (`id_tipoLavorazione`)
);

# ---------------------------------------------------------------------- #
# Add table "STAGIONE"                                                   #
# ---------------------------------------------------------------------- #

CREATE TABLE `STAGIONE` (
    `id_stagione` INTEGER NOT NULL AUTO_INCREMENT,
    CONSTRAINT `PK_STAGIONE` PRIMARY KEY (`id_stagione`)
);

# ---------------------------------------------------------------------- #
# Add table "CONFEZIONE"                                                 #
# ---------------------------------------------------------------------- #

CREATE TABLE `CONFEZIONE` (
    `id_confezione` INTEGER NOT NULL AUTO_INCREMENT,
    `descrizione` VARCHAR(40),
    `flgTipo` INTEGER,
    CONSTRAINT `PK_CONFEZIONE` PRIMARY KEY (`id_confezione`)
);

# ---------------------------------------------------------------------- #
# Add table "MOVIMENTO_FILATO"                                           #
# ---------------------------------------------------------------------- #

CREATE TABLE `MOVIMENTO_FILATO` (
    `id_movimentoFilato` INTEGER NOT NULL AUTO_INCREMENT,
    `id_rigaDocumento` INTEGER,
    `id_causaleMagazzino` INTEGER,
    `id_magFisico` INTEGER,
    `id_clifor` INTEGER,
    `id_articoloFilatoColore` INTEGER,
    `id_confezione` INTEGER,
    `partita` VARCHAR(200),
    `bagno` VARCHAR(200),
    `kg` DOUBLE,
    CONSTRAINT `PK_MOVIMENTO_FILATO` PRIMARY KEY (`id_movimentoFilato`)
);

# ---------------------------------------------------------------------- #
# Add table "TIPO_DOCUMENTO"                                             #
# ---------------------------------------------------------------------- #

CREATE TABLE `TIPO_DOCUMENTO` (
    `id_tipoDocumento` INTEGER NOT NULL AUTO_INCREMENT,
    `flgTipologia` INTEGER,
    `codice` CHAR(5),
    `descrizione` VARCHAR(60),
    `flgClienteFornitore` CHAR(1),
    `flgMenu` INTEGER,
    `descMenu` VARCHAR(30),
    `id_contatore` INTEGER,
    `flgAutoAdd` INTEGER,
    `flgSingleLineArt` INTEGER,
    `id_tipoDocumentoFiglio` INTEGER,
    `descrizioneStampa` VARCHAR(30),
    `flgTipoDocumentoPrelevabile` INTEGER,
    `flgTipoStampa` INTEGER,
    `flgImportoIva` INTEGER,
    `flgCorrispettivi` INTEGER,
    `flgObbligoPrelievo` INTEGER,
    `flgGestioneDoc` INTEGER,
    `baseFont` VARCHAR(60),
    `baseFontG` VARCHAR(60),
    `flgAllegato` INTEGER,
    `flgNascondi` INTEGER,
    `numeroCopieStampa` INTEGER,
    `righePerPagina` INTEGER,
    `maxCarDesc` INTEGER,
    `coloreBordoEsterno` CHAR(7),
    `coloreBordoInterno` CHAR(7),
    `flgBordoRiga` INTEGER,
    `flgBordoColonna` INTEGER,
    `indentNuovaRiga` INTEGER,
    `riferimento` VARCHAR(40),
    `id_causaleContabile` INTEGER,
    `notaConfermaOrdine` VARCHAR(1000),
    `docFontSizeRow` INTEGER,
    `id_causaleMagazzino` INTEGER,
    `nota` TEXT,
    `flgAFT` INTEGER,
    CONSTRAINT `PK_TIPO_DOCUMENTO` PRIMARY KEY (`id_tipoDocumento`)
);
INSERT INTO `TIPO_DOCUMENTO` (id_tipoDocumento,id_causaleMagazzino,flgTipologia,codice,descrizione,flgClienteFornitore,flgMenu
,descMenu,id_contatore,flgAutoAdd,flgSingleLineArt,id_tipoDocumentoFiglio,descrizioneStampa,flgTipoDocumentoPrelevabile,flgTipoStampa,flgImportoIva
,flgCorrispettivi,flgObbligoPrelievo,flgGestioneDoc,baseFont,baseFontG,flgAllegato,flgNascondi)

VALUES 
(1,1,1,'SC','SCONTRINO','C',1,'CASSA',6,0,0,5,NULL,1,9,1,1,0,NULL,NULL,NULL,NULL,NULL),
(2,1,1,'FB','FATTURA ACCOMPAGNATORIA DI VENDITA','C',1,'FATT. VENDITA',1,1,0,0,'FATTURA',0,0,0,0,0,0,NULL,NULL,0,NULL),
(3,2,0,'BC','BOLLA DI CARICO','F',1,'BOLLA CARICO',2,1,1,0,NULL,0,0,0,0,0,1,NULL,NULL,NULL,NULL),
(5,NULL,1,'FSC','FATTURA DA SCONTRINO','C',0,NULL,1,0,0,0,'FATTURA'    ,0,0,0,0,0,NULL,NULL,NULL,0,NULL),
(6,NULL,1,'FD','FATTURA DIFFERITA','C',0,'FATT. DIFF',1,0,0,0,'FATTURA',0,0,0,0,0,0,NULL,NULL,0,NULL),
(7,NULL,0,'CON','DDT DI CONSEGNA','C',1,'DDT CONSEGNA',3,1,1,0,'DDT',1,2,0,0,0,0,NULL,NULL,0,NULL),
(8,NULL,3,'ORD','ORDINE A FORNITORE','F',1,'ORDINI FORNITORI',7,0,1,3,'ORDINE',1,1,0,0,0,9,NULL,NULL,NULL,NULL),
(9,NULL,4,'PRE','PRENOTAZIONI','C',1,'PRENOTAZIONI'  ,8,1,1,1,NULL,1,10,0,0,0   ,0   ,NULL,NULL,NULL,NULL),
(10,5,99,'CI','CARICO INTERNO','F',1,'CARICO INTERNO',9,0,0,0,NULL,0 ,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),
(11,6,99,'SI','SCARICO INTERNO','C',0,NULL,9,1,1,0,NULL  ,0 ,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
(13,NULL,0,'DDTSC','DDT DI CONSEGNA DA SCONTRINO','C',0,NULL,3,0,0,0,'DDT ',1,1,0,0,0,0,NULL,NULL,0,NULL),
(14,NULL,2,'NC','NOTA DI CREDITO','C',1,'Nota Credito',1,0,0,0,'NOTA DI CREDITO',0,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
(15,4,0,'RF','RESO A FORNITORE','F',0,NULL,3,0,0,0,'DDT RESO',0,2,0,0,0,0,NULL,NULL,0,NULL),
(16,NULL,5,'RIP','RIPARAZIONI','C',1,'RIPARAZIONI',10,0,0,0,'SCHEDA RIPARAZIONE',1,5,0,0,0,0,NULL,NULL,1,NULL),
(17,NULL,0,'DDTR','DDT INVIO IN RIPARAZIONE','F',1,'DDT C.TO RIPAR.',3,0,0,0,'DDT',0,2,0,0,0,0,NULL,NULL,0,NULL),
(18,6,99,'CVEN','CONTO VENDITA','A',0,NULL,11,0,0,0,NULL,0,2,0,0,0,NULL,NULL,NULL,NULL,NULL),
(19,5,99,'CIRIP','CARICO INTERNO X RIPARAZIONE','F',1,'CARICO INTERNO X RIP.',9,0,0,0,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL),
(20,6,99,'SIRIP','SCARICO INTERNO X RIPARAZIONE','C',1,'SCARICO INTERNO X RIP.',9,0,0,0,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL),
(21,NULL,4,'WWW','ORDINE WEB','C',0,NULL,12,0,0,0,NULL,0,2,0,0,0,0,NULL,NULL,0,NULL);     

update TIPO_DOCUMENTO SET id_tipoDocumentoFiglio=null where id_tipoDocumentoFiglio=0;

CREATE UNIQUE INDEX `IDX_TIPO_DOCUMENTO_1` ON `TIPO_DOCUMENTO` (`codice`);

CREATE INDEX `IDX_TIPO_DOCUMENTO_2` ON `TIPO_DOCUMENTO` (`id_contatore`);

CREATE INDEX `IDX_TIPO_DOCUMENTO_3` ON `TIPO_DOCUMENTO` (`id_tipoDocumentoFiglio`);

# ---------------------------------------------------------------------- #
# Add table "IVA"                                                        #
# ---------------------------------------------------------------------- #

CREATE TABLE `IVA` (
    `id_iva` INTEGER NOT NULL AUTO_INCREMENT,
    `descrizione` VARCHAR(30),
    `aliquota` INTEGER,
    `flgTipo` CHAR(1),
    `aliquotaIndetraibile` INTEGER,
    `notaEsenzione` VARCHAR(60),
    `flgMargine` INTEGER,
    `id_pianoConti` INTEGER,
    CONSTRAINT `PK_IVA` PRIMARY KEY (`id_iva`)
);
INSERT INTO `IVA` VALUES (1,'IVA 22 %',22,'I',0,NULL,0,null),(3,'ESENTE ART. 74',0,'E',0,NULL,0,null);

# ---------------------------------------------------------------------- #
# Add table "COMUNE"                                                     #
# ---------------------------------------------------------------------- #

CREATE TABLE `COMUNE` (
    `id_comune` INTEGER NOT NULL AUTO_INCREMENT,
    `id_regione` VARCHAR(8),
    `id_zona` INTEGER,
    `codice` CHAR(4) NOT NULL,
    `descrizione` VARCHAR(60),
    `provincia` VARCHAR(60),
    `cap` CHAR(5),
    `codiceComune` VARCHAR(6),
    `codiceZona` CHAR(1),
    CONSTRAINT `PK_COMUNE` PRIMARY KEY (`id_comune`)
);

CREATE INDEX `ComuniComune` ON `COMUNE` (`codice`);

CREATE INDEX `ComuniDescrizione` ON `COMUNE` (`descrizione`);

# ---------------------------------------------------------------------- #
# Add table "NEWS"                                                       #
# ---------------------------------------------------------------------- #

CREATE TABLE `NEWS` (
    `id_news` INTEGER NOT NULL AUTO_INCREMENT,
    `dataNews` DATE,
    `flgVisibile` INTEGER,
    `dataFineVld` DATE,
    `imgTmst` CHAR(16),
    `id_tipoNews` INTEGER,
    `dataInvio` DATE,
    `dataFine` DATE,
    CONSTRAINT `PK_NEWS` PRIMARY KEY (`id_news`)
);

# ---------------------------------------------------------------------- #
# Add table "ALLEGATO_NEWS"                                              #
# ---------------------------------------------------------------------- #

CREATE TABLE `ALLEGATO_NEWS` (
    `id_allegatoNews` INTEGER NOT NULL AUTO_INCREMENT,
    `nomeFile` VARCHAR(60),
    `id_news` INTEGER(11),
    `descrizioneAllegato` VARCHAR(254),
    CONSTRAINT `PK_ALLEGATO_NEWS` PRIMARY KEY (`id_allegatoNews`)
);

CREATE INDEX `IDX_ALLEGATO_NEWS_1` ON `ALLEGATO_NEWS` (`id_news`);

# ---------------------------------------------------------------------- #
# Add table "TAGLIA"                                                     #
# ---------------------------------------------------------------------- #

CREATE TABLE `TAGLIA` (
    `id_taglia` INTEGER NOT NULL AUTO_INCREMENT,
    `id_tipoTaglia` INTEGER,
    `ordine` INTEGER,
    `codice` VARCHAR(10),
    CONSTRAINT `PK_TAGLIA` PRIMARY KEY (`id_taglia`)
);

CREATE UNIQUE INDEX `IDX_TAGLIA_1` ON `TAGLIA` (`id_tipoTaglia`,`codice`);

# ---------------------------------------------------------------------- #
# Add table "POSTAZIONE"                                                 #
# ---------------------------------------------------------------------- #

CREATE TABLE `POSTAZIONE` (
    `id_postazione` INTEGER NOT NULL AUTO_INCREMENT,
    `id_tipoPostazione` INTEGER,
    `descrizione` VARCHAR(60),
    `ipAddress` CHAR(60),
    `stampanteA4` VARCHAR(60),
    `stampanteEtichette` VARCHAR(60),
    `id_regCassa` INTEGER,
    `hostname` VARCHAR(60),
    CONSTRAINT `PK_POSTAZIONE` PRIMARY KEY (`id_postazione`)
);

CREATE INDEX `IDX_POSTAZIONE_1` ON `POSTAZIONE` (`id_regCassa`);

# ---------------------------------------------------------------------- #
# Add table "DOC_PREL"                                                   #
# ---------------------------------------------------------------------- #

CREATE TABLE `DOC_PREL` (
    `id_docPrel` INTEGER NOT NULL AUTO_INCREMENT,
    `id_tipoDocumentoPrel` INTEGER,
    `id_tipoDocumento` INTEGER,
    CONSTRAINT `PK_DOC_PREL` PRIMARY KEY (`id_docPrel`)
);

CREATE INDEX `IDX_DOC_PREL_1` ON `DOC_PREL` (`id_tipoDocumentoPrel`);

CREATE INDEX `IDX_DOC_PREL_2` ON `DOC_PREL` (`id_tipoDocumento`);

# ---------------------------------------------------------------------- #
# Add table "CODA_MESSAGGI"                                              #
# ---------------------------------------------------------------------- #

CREATE TABLE `CODA_MESSAGGI` (
    `id_codaMessaggi` INTEGER NOT NULL AUTO_INCREMENT,
    `flgTipo` INTEGER,
    `flgStatoInvio` INTEGER,
    `dataCreazione` DATE,
    `testoMessaggio` TEXT,
    `cellulare` VARCHAR(254),
    `mailTo` VARCHAR(60),
    `mailCc` VARCHAR(60),
    `mailBcc` VARCHAR(60),
    `dataInvio` DATE,
    `result` TEXT,
    `riferimento` VARCHAR(60),
    `destinatario` VARCHAR(254),
    `oggettoEmail` VARCHAR(254),
    `imgTmst` CHAR(16),
    `campagna` VARCHAR(60),
    `id_templateMsg` INTEGER,
    `tmstPrimaLettura` VARCHAR(30),
    `tmstUltimaLettura` VARCHAR(30),
    `nLetture` INTEGER,
    `ipPrimaLettura` CHAR(60),
    `ipUltimaLettura` CHAR(60),
    `campiMail` VARCHAR(1000),
    CONSTRAINT `PK_CODA_MESSAGGI` PRIMARY KEY (`id_codaMessaggi`)
);

# ---------------------------------------------------------------------- #
# Add table "ALLEGATO_CODA_MESSAGGI"                                     #
# ---------------------------------------------------------------------- #

CREATE TABLE `ALLEGATO_CODA_MESSAGGI` (
    `id_allegatoCodaMessaggi` INTEGER NOT NULL AUTO_INCREMENT,
    `id_codaMessaggi` INTEGER,
    `nomeFile` VARCHAR(60),
    CONSTRAINT `PK_ALLEGATO_CODA_MESSAGGI` PRIMARY KEY (`id_allegatoCodaMessaggi`)
);

# ---------------------------------------------------------------------- #
# Add table "BANCA"                                                      #
# ---------------------------------------------------------------------- #

CREATE TABLE `BANCA` (
    `id_banca` INTEGER NOT NULL AUTO_INCREMENT,
    `id_abiCab` INTEGER,
    `id_pianoConti` INTEGER,
    `descrizione` VARCHAR(60),
    `iban` CHAR(27),
    `telefono` VARCHAR(30),
    `email` VARCHAR(60),
    `codiceAlt` VARCHAR(40),
    `ordine` INTEGER,
    `flgDefaultBonifico` INTEGER,
    CONSTRAINT `PK_BANCA` PRIMARY KEY (`id_banca`)
);

# ---------------------------------------------------------------------- #
# Add table "MOV_CONTABILE"                                              #
# ---------------------------------------------------------------------- #

CREATE TABLE `MOV_CONTABILE` (
    `id_movContabile` INTEGER NOT NULL AUTO_INCREMENT,
    `id_causaleContabile` INTEGER,
    `dataMovContabile` DATE,
    `descrizione` VARCHAR(254),
    `flgStato` INTEGER,
    CONSTRAINT `PK_MOV_CONTABILE` PRIMARY KEY (`id_movContabile`)
);

# ---------------------------------------------------------------------- #
# Add table "DISTINTA_RIBA"                                              #
# ---------------------------------------------------------------------- #

CREATE TABLE `DISTINTA_RIBA` (
    `id_distintaRiba` INTEGER NOT NULL AUTO_INCREMENT,
    `id_banca` INTEGER,
    `dataPresentazione` DATE,
    `flgStatoDistinta` INTEGER,
    `flgAccorpaScadenze` INTEGER,
    `flgContabilizzata` VARCHAR(40),
    `timestampElaborazione` INTEGER,
    `maxDistinta` DOUBLE,
    CONSTRAINT `PK_DISTINTA_RIBA` PRIMARY KEY (`id_distintaRiba`)
);

# ---------------------------------------------------------------------- #
# Add table "LAVORAZIONE"                                                #
# ---------------------------------------------------------------------- #

CREATE TABLE `LAVORAZIONE` (
    `id_lavorazione` INTEGER NOT NULL AUTO_INCREMENT,
    `descrizione` VARCHAR(40),
    `id_tipoLavorazione` INTEGER,
    CONSTRAINT `PK_LAVORAZIONE` PRIMARY KEY (`id_lavorazione`)
);

# ---------------------------------------------------------------------- #
# Add table "REPARTO"                                                    #
# ---------------------------------------------------------------------- #

CREATE TABLE `REPARTO` (
    `id_reparto` INTEGER NOT NULL AUTO_INCREMENT,
    `sigla` VARCHAR(16),
    `descrizione_it` VARCHAR(60),
    `descrizione_en` VARCHAR(60),
    `id_iva` INTEGER,
    `siglaEpson` INTEGER,
    CONSTRAINT `PK_REPARTO` PRIMARY KEY (`id_reparto`)
);

CREATE UNIQUE INDEX `IDX_REPARTO_1` ON `REPARTO` (`sigla` ASC);

CREATE INDEX `IDX_REPARTO_2` ON `REPARTO` (`id_iva`);

# ---------------------------------------------------------------------- #
# Add table "CLIFOR"                                                     #
# ---------------------------------------------------------------------- #

CREATE TABLE `CLIFOR` (
    `id_clifor` INTEGER NOT NULL AUTO_INCREMENT,
    `id_tipoPagamento` INTEGER,
    `codiceAlt` VARCHAR(16),
    `flgValido` INTEGER,
    `flgTipo` CHAR(1),
    `flgAzienda` INTEGER,
    `nominativo` VARCHAR(254),
    `cognome` VARCHAR(254),
    `contatto` VARCHAR(60),
    `nome` VARCHAR(60),
    `indirizzo` VARCHAR(60),
    `numeroCivico` VARCHAR(30),
    `id_comune` INTEGER,
    `id_nazione` CHAR(4),
    `id_comuneNascita` INTEGER,
    `dataNascita` DATE,
    `codFisc` VARCHAR(16),
    `pIva` CHAR(11),
    `eMail` VARCHAR(254),
    `fax` VARCHAR(30),
    `telefono` VARCHAR(30),
    `nota` TEXT,
    `imgTmst` CHAR(16),
    `flgPrivComunicazione` INTEGER,
    `flgPrivSensibili` INTEGER,
    `flgPrivTrattamento` INTEGER,
    `flgSesso` INTEGER,
    `dataRegistrazioneDI` DATE,
    `dichiarazioneIntento` VARCHAR(30),
    `flgArt8` INTEGER,
    `id_listino` INTEGER,
    `iban` CHAR(27),
    `capZona` VARCHAR(10),
    `www` VARCHAR(60),
    `cellulare` VARCHAR(30),
    `bancaDesc` VARCHAR(60),
    `flgMl` INTEGER,
    `descrizioneComune` VARCHAR(60),
    `provinciaComune` CHAR(30),
    `capComune` CHAR(10),
    `flgRC` INTEGER,
    `codiceCartaFidelity` VARCHAR(30),
    `descrizioneComuneNascita` VARCHAR(60),
    `telefonoAmm` VARCHAR(30),
    `cellulareAmm` VARCHAR(30),
    `eMailAmm` VARCHAR(60),
    `telefonoAltro` VARCHAR(30),
    `cellulareAltro` VARCHAR(30),
    `eMailAltro` VARCHAR(60),
    `descrizioneAltroContatto` VARCHAR(60),
    `numeroDocumento` VARCHAR(30),
    `dataScadenzaDocumento` DATE,
    `percProvvigione` DECIMAL(5,2),
    `flgDocumentoVerificato` INTEGER,
    `notePerCliente` TEXT,
    `flgNascondiWeb` INTEGER,
    `zona` VARCHAR(60),
    `id_pianoConti` INTEGER,
    `id_bancaAzienda` INTEGER,
    `speseIncasso` DECIMAL(18,4),
    `abi` VARCHAR(5),
    `cab` VARCHAR(5),
    `bic` VARCHAR(20),
    `id_agente` INTEGER,
    `id_respCommerciale` INTEGER,
    `percAgente` DECIMAL(5,2),
    `percRespCommerciale` DECIMAL(5,2),
    CONSTRAINT `PK_CLIFOR` PRIMARY KEY (`id_clifor`)
);
INSERT INTO `CLIFOR` (id_clifor,flgValido,flgTipo,cognome )VALUES (1,1,'F','CARICO/SCARICO INTERNO');

CREATE UNIQUE INDEX `IDX_CLIFOR_1` ON `CLIFOR` (`codiceAlt` ASC);

CREATE INDEX `IDX_CLIFOR_2` ON `CLIFOR` (`id_tipoPagamento`);

CREATE INDEX `IDX_CLIFOR_3` ON `CLIFOR` (`id_nazione`);

CREATE INDEX `IDX_CLIFOR_4` ON `CLIFOR` (`id_comune`);

CREATE INDEX `IDX_CLIFOR_5` ON `CLIFOR` (`id_comuneNascita`);

CREATE INDEX `IDX_CLIFOR_6` ON `CLIFOR` (`id_listino`);

CREATE UNIQUE INDEX `IDX_CLIFOR_7` ON `CLIFOR` (`codFisc`,`flgTipo`);

CREATE UNIQUE INDEX `IDX_CLIFOR_8` ON `CLIFOR` (`pIva`,`flgTipo`);

# ---------------------------------------------------------------------- #
# Add table "TIPO"                                                       #
# ---------------------------------------------------------------------- #

CREATE TABLE `TIPO` (
    `id_tipo` INTEGER(11) NOT NULL AUTO_INCREMENT,
    `ricaricoBase` INTEGER(11),
    `id_tipoPadre` INTEGER(11),
    `livello` INTEGER(11),
    `indici` VARCHAR(767) COLLATE latin1_swedish_ci,
    `flgFoglia` INTEGER(11),
    `flgNascondi` INTEGER(11) DEFAULT 0,
    `ordine` INTEGER(11),
    `codiceAlt` VARCHAR(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci,
    `id_reparto` INTEGER(11),
    `flgTipoMagazzino` INTEGER(11),
    `flgUsaVarianti` INTEGER(11),
    `flgStampaEtichette` INTEGER(11),
    `flgStampaAccessori` INTEGER(11),
    `descrizione` VARCHAR(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci,
    `flgPresente` INTEGER(11),
    `flgPresenteStock` INTEGER(11),
    `flgPresenteOfferte` INTEGER(11),
    `flgPresenteUsato` INTEGER(11),
    `descrizioneCompleta` VARCHAR(254),
    `flgRC` INTEGER,
    `flgEscludiWeb` INTEGER,
    `costoSpedizione` DECIMAL(18,4),
    `imgTmst` CHAR(16),
    `flgStampaBarcode` INTEGER,
    `id_tipoTaglia` INTEGER,
    `flgUsaTaglia` INTEGER,
    `flgNoListino` INTEGER,
    `seoTitle` VARCHAR(254),
    `seoDesc` TEXT,
    `seoH1` VARCHAR(254),
    `id_tipologiaArticolo` INTEGER,
    `descrizioneR` VARCHAR(1000),
    `flgAFT` INTEGER,
    PRIMARY KEY (`id_tipo`)
);

CREATE INDEX `IDX_TIPO_INDICI` ON `TIPO` (`indici`);

CREATE INDEX `TIPO_TIPO` ON `TIPO` (`id_tipoPadre`);

CREATE INDEX `REPARTO_TIPO` ON `TIPO` (`id_reparto`);

# ---------------------------------------------------------------------- #
# Add table "C_TIPO"                                                     #
# ---------------------------------------------------------------------- #

CREATE TABLE `C_TIPO` (
    `id_tipo` INTEGER NOT NULL,
    `id_caratteristica` INTEGER NOT NULL,
    CONSTRAINT `PK_C_TIPO` PRIMARY KEY (`id_tipo`, `id_caratteristica`)
);

CREATE INDEX `IDX_C_TIPO_1` ON `C_TIPO` (`id_tipo`);

CREATE INDEX `IDX_C_TIPO_2` ON `C_TIPO` (`id_caratteristica`);

# ---------------------------------------------------------------------- #
# Add table "VETTORE"                                                    #
# ---------------------------------------------------------------------- #

CREATE TABLE `VETTORE` (
    `id_vettore` INTEGER NOT NULL AUTO_INCREMENT,
    `id_comune` INTEGER,
    `descrizione` VARCHAR(60),
    `indirizzo` VARCHAR(60),
    `numeroCivico` VARCHAR(40),
    `linkTracking` VARCHAR(254),
    `pIva` VARCHAR(11),
    `codFiscale` VARCHAR(16),
    `iscrizioneAlbo` VARCHAR(40),
    CONSTRAINT `PK_VETTORE` PRIMARY KEY (`id_vettore`)
);

CREATE INDEX `IDX_VETTORE_1` ON `VETTORE` (`id_comune`);

# ---------------------------------------------------------------------- #
# Add table "BANNER"                                                     #
# ---------------------------------------------------------------------- #

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

CREATE INDEX `IDX_BANNER_1` ON `BANNER` (`id_tipoBanner`);

# ---------------------------------------------------------------------- #
# Add table "DESTINAZIONE_DIVERSA"                                       #
# ---------------------------------------------------------------------- #

CREATE TABLE `DESTINAZIONE_DIVERSA` (
    `id_destinazioneDiversa` INTEGER NOT NULL AUTO_INCREMENT,
    `id_clifor` INTEGER,
    `id_comuneDD` INTEGER,
    `id_nazioneDD` CHAR(4),
    `descrizioneDD` VARCHAR(60),
    `pressoDD` VARCHAR(60),
    `indirizzoDD` VARCHAR(60),
    `numeroCivicoDD` VARCHAR(10),
    `capZonaDD` CHAR(5),
    `telefonoDD` VARCHAR(30),
    `faxDD` VARCHAR(30),
    `eMailDD` VARCHAR(30),
    `descrizioneComuneDD` VARCHAR(60),
    `provinciaComuneDD` VARCHAR(30),
    `capComuneDD` CHAR(10),
    `flgDDDefault` INTEGER,
    CONSTRAINT `PK_DESTINAZIONE_DIVERSA` PRIMARY KEY (`id_destinazioneDiversa`)
);

CREATE INDEX `IDX_DESTINAZIONE_DIVERSA_1` ON `DESTINAZIONE_DIVERSA` (`id_clifor`);

CREATE INDEX `IDX_DESTINAZIONE_DIVERSA_2` ON `DESTINAZIONE_DIVERSA` (`id_nazioneDD`);

CREATE INDEX `IDX_DESTINAZIONE_DIVERSA_3` ON `DESTINAZIONE_DIVERSA` (`id_comuneDD`);

# ---------------------------------------------------------------------- #
# Add table "CONTRATTO"                                                  #
# ---------------------------------------------------------------------- #

CREATE TABLE `CONTRATTO` (
    `id_contratto` INTEGER NOT NULL AUTO_INCREMENT,
    `id_tipoContratto` INTEGER,
    `id_clifor` INTEGER,
    `descrizione` VARCHAR(60),
    `dataInizioContratto` DATE,
    `dataScadenzaContratto` DATE,
    `flgStato` INTEGER,
    `telefoniAssociati` VARCHAR(60),
    `notaContratto` TEXT,
    `logContratto` TEXT,
    `dataInvioAvvisoSms` DATE,
    CONSTRAINT `PK_CONTRATTO` PRIMARY KEY (`id_contratto`)
);

CREATE INDEX `IDX_CONTRATTO_1` ON `CONTRATTO` (`id_tipoContratto`);

CREATE INDEX `IDX_CONTRATTO_2` ON `CONTRATTO` (`id_clifor`);

# ---------------------------------------------------------------------- #
# Add table "ALLEGATO_CLIFOR"                                            #
# ---------------------------------------------------------------------- #

CREATE TABLE `ALLEGATO_CLIFOR` (
    `id_allegatoClifor` INTEGER NOT NULL AUTO_INCREMENT,
    `id_clifor` INTEGER,
    `id_tipoAllegatoClifor` INTEGER,
    `nomeFile` VARCHAR(254),
    `descrizioneAllegato` VARCHAR(254),
    `flgDefault` INTEGER,
    PRIMARY KEY (`id_allegatoClifor`)
);

# ---------------------------------------------------------------------- #
# Add table "LISTINO_TIPO"                                               #
# ---------------------------------------------------------------------- #

CREATE TABLE `LISTINO_TIPO` (
    `id_listinoTipo` INTEGER NOT NULL AUTO_INCREMENT,
    `flgTipoLT` INTEGER,
    `percLT` DECIMAL(5,2),
    `id_tipo` INTEGER(11),
    `id_listino` INTEGER,
    `indiciTipo` VARCHAR(767),
    `percLT1` DECIMAL(5,2),
    `percLT2` DECIMAL(5,2),
    `percLT3` DECIMAL(5,2),
    CONSTRAINT `PK_LISTINO_TIPO` PRIMARY KEY (`id_listinoTipo`)
);

CREATE INDEX `IDX_LISTINO_TIPO_1` ON `LISTINO_TIPO` (`indiciTipo`);

CREATE UNIQUE INDEX `IDX_LISTINO_TIPO_2` ON `LISTINO_TIPO` (`id_listino`,`id_tipo`);

# ---------------------------------------------------------------------- #
# Add table "CLIFOR_TIPO_CLIFOR"                                         #
# ---------------------------------------------------------------------- #

CREATE TABLE `CLIFOR_TIPO_CLIFOR` (
    `id_cliforTipoClifor` INTEGER NOT NULL AUTO_INCREMENT,
    `id_clifor` INTEGER,
    `id_tipoClifor` INTEGER,
    `percProvvigione` DECIMAL(5,2),
    CONSTRAINT `PK_CLIFOR_TIPO_CLIFOR` PRIMARY KEY (`id_cliforTipoClifor`)
);

# ---------------------------------------------------------------------- #
# Add table "CONTATTO"                                                   #
# ---------------------------------------------------------------------- #

CREATE TABLE `CONTATTO` (
    `id_contatto` INTEGER NOT NULL AUTO_INCREMENT,
    `descrizioneC` VARCHAR(40),
    `nomeC` VARCHAR(40),
    `telefonoC` VARCHAR(40),
    `emailC` VARCHAR(40),
    `id_clifor` INTEGER,
    `flgContattoDefault` INTEGER,
    CONSTRAINT `PK_CONTATTO` PRIMARY KEY (`id_contatto`)
);

# ---------------------------------------------------------------------- #
# Add table "ARTICOLO_FILATO"                                            #
# ---------------------------------------------------------------------- #

CREATE TABLE `ARTICOLO_FILATO` (
    `id_articoloFilato` INTEGER NOT NULL AUTO_INCREMENT,
    `codiceAF` VARCHAR(40),
    `id_tipo` INTEGER(11),
    `descrizione` VARCHAR(100),
    `titolo` INTEGER,
    `nCapi` INTEGER,
    `flgNaturaTinto` INTEGER,
    `id_iva` INTEGER,
    `quantitaCalcolate` BOOL,
    `quantitaEffettiva` DOUBLE,
    `quantitaImpegnata` DOUBLE,
    `quantitaInArrivo` DOUBLE,
    `quantitaMagazzinoMovimentoHtml` VARCHAR(200),
    `quantitaW` DOUBLE,
    `flgDispo` INTEGER,
    `percSconto` DECIMAL(5,2),
    `prezzoOfferta` DECIMAL(18,4),
    `prezzoPubblico` DECIMAL(18,4),
    CONSTRAINT `PK_ARTICOLO_FILATO` PRIMARY KEY (`id_articoloFilato`)
);

CREATE UNIQUE INDEX `IDX_ARTICOLO_FILATO_1` ON `ARTICOLO_FILATO` (`codiceAF`);

# ---------------------------------------------------------------------- #
# Add table "ARTICOLO_FILATO_FORNITORE"                                  #
# ---------------------------------------------------------------------- #

CREATE TABLE `ARTICOLO_FILATO_FORNITORE` (
    `id_articoloFilatoFornitore` INTEGER NOT NULL AUTO_INCREMENT,
    `id_articoloFilato` INTEGER,
    `id_clifor` INTEGER,
    `descrizione` VARCHAR(40),
    CONSTRAINT `PK_ARTICOLO_FILATO_FORNITORE` PRIMARY KEY (`id_articoloFilatoFornitore`)
);

# ---------------------------------------------------------------------- #
# Add table "COLORE_FILATO_FORNITORE"                                    #
# ---------------------------------------------------------------------- #

CREATE TABLE `COLORE_FILATO_FORNITORE` (
    `id_coloreFilatoFornitore` INTEGER NOT NULL AUTO_INCREMENT,
    `id_clifor` INTEGER,
    `id_coloreFilato` INTEGER,
    `descrizione` VARCHAR(40),
    CONSTRAINT `PK_COLORE_FILATO_FORNITORE` PRIMARY KEY (`id_coloreFilatoFornitore`)
);

# ---------------------------------------------------------------------- #
# Add table "ARTICOLO_FILATO_COMPONENTE"                                 #
# ---------------------------------------------------------------------- #

CREATE TABLE `ARTICOLO_FILATO_COMPONENTE` (
    `id_articoloFilatoComponente` INTEGER NOT NULL AUTO_INCREMENT,
    `id_componente` INTEGER,
    `id_articoloFilato` INTEGER,
    `percentuale` DECIMAL(5,2),
    CONSTRAINT `PK_ARTICOLO_FILATO_COMPONENTE` PRIMARY KEY (`id_articoloFilatoComponente`)
);

# ---------------------------------------------------------------------- #
# Add table "ARTICOLO_TESSUTO"                                           #
# ---------------------------------------------------------------------- #

CREATE TABLE `ARTICOLO_TESSUTO` (
    `id_articoloTessuto` INTEGER NOT NULL AUTO_INCREMENT,
    `id_tipo` INTEGER(11),
    `codiceAT` VARCHAR(40),
    `id_iva` INTEGER,
    `id_stagione` INTEGER,
    `flgTipoAT` INTEGER,
    `flgTipoTessutoM` INTEGER,
    `id_articoloTessutoPadre` INTEGER,
    `flgStato` INTEGER,
    `altezzaMin` INTEGER,
    `altezzaMax` INTEGER,
    `lunghezzaFinita` INTEGER,
    `pesoMin` DOUBLE,
    `pesoMax` DOUBLE,
    `pesoMq` DOUBLE,
    `lavaggio` INTEGER,
    `candeggio` INTEGER,
    `stiratura` INTEGER,
    `asciugatura` INTEGER,
    `pulituraSecco` INTEGER,
    `codiceDoganale` VARCHAR(40),
    `flgUdm` INTEGER,
    `prezzoBase` DECIMAL(18,4),
    `descrizione` VARCHAR(60),
    `altezzaGreggia` INTEGER,
    `altezzaPettine` DOUBLE,
    `caloOrdito` DECIMAL(5,2),
    `caloTrama` DECIMAL(5,2),
    `colpiFiniti` INTEGER,
    `colpiSpecchio` INTEGER,
    `colpiTelaio` INTEGER,
    `filiCimosse` INTEGER,
    `filiOrdito` INTEGER,
    `flgAccoppiato` INTEGER,
    `flgAcquistato` INTEGER,
    `flgJaquard` INTEGER,
    `flgTintoFiloPezza` INTEGER,
    `id_armatura` INTEGER,
    `id_rincorso` INTEGER,
    `impettinatura` INTEGER,
    `licci1` INTEGER,
    `licci2` INTEGER,
    `lunghezzaGreggia` INTEGER,
    `mtOrdito` INTEGER,
    `pesoGreggio` DOUBLE,
    `pettine` INTEGER,
    `pezzaPerTela` INTEGER,
    `tipoPettine` INTEGER,
    `quantitaCalcolate` BOOL,
    `quantitaEffettiva` DOUBLE,
    `quantitaImpegnata` DOUBLE,
    `quantitaInArrivo` DOUBLE,
    `quantitaMagazzinoMovimentoHtml` VARCHAR(200),
    `quantita` DOUBLE,
    `descLavorazione` VARCHAR(1000),
    CONSTRAINT `PK_ARTICOLO_TESSUTO` PRIMARY KEY (`id_articoloTessuto`)
);

CREATE UNIQUE INDEX `IDX_ARTICOLO_TESSUTO_1` ON `ARTICOLO_TESSUTO` (`codiceAT`);

# ---------------------------------------------------------------------- #
# Add table "ARTICOLO_TESSUTO_FILATO"                                    #
# ---------------------------------------------------------------------- #

CREATE TABLE `ARTICOLO_TESSUTO_FILATO` (
    `id_articoloTessutoFilato` INTEGER NOT NULL AUTO_INCREMENT,
    `id_articoloTessuto` INTEGER,
    `id_articoloFilatoColore` INTEGER,
    `serie` VARCHAR(40),
    `ordine` INTEGER,
    `percentuale` DECIMAL(5,2),
    `flgTramaOrdito` INTEGER,
    `noteOrdTess` VARCHAR(1000),
    CONSTRAINT `PK_ARTICOLO_TESSUTO_FILATO` PRIMARY KEY (`id_articoloTessutoFilato`)
);

# ---------------------------------------------------------------------- #
# Add table "ARTICOLO_TESSUTO_ACCOPPIATO"                                #
# ---------------------------------------------------------------------- #

CREATE TABLE `ARTICOLO_TESSUTO_ACCOPPIATO` (
    `id_articoloTessutoAccoppiato` INTEGER NOT NULL AUTO_INCREMENT,
    `id_articoloTessuto` INTEGER,
    `id_articoloTessutoComponente` INTEGER,
    CONSTRAINT `PK_ARTICOLO_TESSUTO_ACCOPPIATO` PRIMARY KEY (`id_articoloTessutoAccoppiato`)
);

# ---------------------------------------------------------------------- #
# Add table "ARTICOLO_TESSUTO_COMPONENTE"                                #
# ---------------------------------------------------------------------- #

CREATE TABLE `ARTICOLO_TESSUTO_COMPONENTE` (
    `id_articoloTessutoComponente` INTEGER NOT NULL AUTO_INCREMENT,
    `id_componente` INTEGER,
    `id_articoloTessuto` INTEGER,
    `percentuale` DECIMAL(5,2),
    CONSTRAINT `PK_ARTICOLO_TESSUTO_COMPONENTE` PRIMARY KEY (`id_articoloTessutoComponente`)
);

# ---------------------------------------------------------------------- #
# Add table "ARTICOLO_TESSUTO_LAVORAZIONE"                               #
# ---------------------------------------------------------------------- #

CREATE TABLE `ARTICOLO_TESSUTO_LAVORAZIONE` (
    `id_articoloTessutoLavorazione` INTEGER NOT NULL AUTO_INCREMENT,
    `id_lavorazione` INTEGER,
    `id_articoloTessuto` INTEGER,
    `ordine` INTEGER,
    `flgObbligatoria` INTEGER,
    CONSTRAINT `PK_ARTICOLO_TESSUTO_LAVORAZIONE` PRIMARY KEY (`id_articoloTessutoLavorazione`)
);

# ---------------------------------------------------------------------- #
# Add table "CLIFOR_LAVORAZIONE"                                         #
# ---------------------------------------------------------------------- #

CREATE TABLE `CLIFOR_LAVORAZIONE` (
    `id_cliforLavorazione` INTEGER NOT NULL AUTO_INCREMENT,
    `id_clifor` INTEGER,
    `id_lavorazione` INTEGER,
    CONSTRAINT `PK_CLIFOR_LAVORAZIONE` PRIMARY KEY (`id_cliforLavorazione`)
);

# ---------------------------------------------------------------------- #
# Add table "DOCUMENTO"                                                  #
# ---------------------------------------------------------------------- #

CREATE TABLE `DOCUMENTO` (
    `id_documento` INTEGER NOT NULL AUTO_INCREMENT,
    `id_tipoDocumento` INTEGER,
    `id_clifor` INTEGER NOT NULL,
    `id_vettore` INTEGER,
    `id_tipoPagamento` INTEGER,
    `flgPagamentoDataFissa` INTEGER,
    `dataScadenzaPagamento` DATE,
    `flgSys` INTEGER,
    `flgStato` INTEGER,
    `dataDocumento` DATE,
    `progDocumento` INTEGER,
    `progDocumentoAgg` CHAR(6) DEFAULT "",
    `id_esercizio` INTEGER,
    `id_contatore` INTEGER NOT NULL,
    `riferimento` VARCHAR(30),
    `dataRiferimento` DATE,
    `flgTipoDocumento` INTEGER,
    `sconto` DECIMAL(5,2),
    `dataPagamento` DATE,
    `dataRegistrazioneDI` DATE,
    `dichiarazioneIntento` VARCHAR(30),
    `flgArt8` INTEGER,
    `flgPagata` INTEGER,
    `flgExport` INTEGER,
    `flgTrasporto` INTEGER,
    `kg` DOUBLE,
    `nColli` INTEGER,
    `dataStampaBollato` DATE,
    `dataStampaIva` DATE,
    `flgTrasportoAssicurato` INTEGER,
    `notaSpedizione` VARCHAR(254),
    `dataConsegna` DATE,
    `oraConsegna` TIME,
    `speseTrasporto` DECIMAL(18,4),
    `speseAltre` DECIMAL(18,4),
    `descSpeseAltre` VARCHAR(60),
    `id_aspetto` INTEGER,
    `note` TEXT,
    `imponibileRighe` DECIMAL(18,4),
    `importoIvaRighe` DECIMAL(18,4),
    `imponibileTotale` DECIMAL(18,4),
    `importoIvaTotale` DECIMAL(18,4),
    `id_documentoFiglio` INTEGER,
    `flgEmettiFatturaScontrino` INTEGER,
    `echoScontrino` VARCHAR(30),
    `presso` VARCHAR(60),
    `id_comuneSped` INTEGER,
    `indirizzoSped` VARCHAR(60),
    `numeroCivicoSped` VARCHAR(10),
    `flgDocumentoPrelevato` INTEGER,
    `importoTotale` DECIMAL(18,4),
    `acconto` DECIMAL(18,4),
    `flgStatoPrenotazione` INTEGER,
    `id_causaleTrasporto` INTEGER,
    `kgNetto` DOUBLE,
    `volume` DECIMAL(18,4),
    `abbuono` DECIMAL(18,4),
    `speseIncasso` DECIMAL(18,4),
    `bancaDesc` VARCHAR(60),
    `iban` CHAR(27),
    `notePagamento` VARCHAR(60),
    `id_destinazioneDiversa` INTEGER,
    `dataAvviso` DATE,
    `dataChiusura` DATE,
    `nominativoDocumento` VARCHAR(254),
    `telDocumento` VARCHAR(30),
    `eMailDocumento` VARCHAR(254),
    `flgInviaAvviso` INTEGER,
    `percContIntegrativo` DECIMAL(5,2),
    `rimborsoArt15` DECIMAL(18,4),
    `percRitenutaAcconto` DECIMAL(5,2),
    `flgHaDocumentoPadre` INTEGER,
    `flgStatoRiparazione` INTEGER,
    `flgInGaranzia` INTEGER,
    `cauzione` DECIMAL(18,4),
    `descrizioneDifetto` TEXT,
    `interventoEffettuato` TEXT,
    `flgPreventivo` INTEGER,
    `importoPreventivo` DECIMAL(18,4),
    `notaAggiuntiva` TEXT,
    `descrizionePreventivo` TEXT,
    `faxDocumento` VARCHAR(30),
    `cellDocumento` VARCHAR(60),
    `id_usersIntervento` INTEGER,
    `id_usersChiusura` INTEGER,
    `id_users` INTEGER,
    `id_porto` INTEGER,
    `progDocumentoB` INTEGER,
    `progDocumentiAggB` CHAR(6),
    `id_esercizioB` INTEGER,
    `flgTipoMovimento` INTEGER,
    `id_cliforListino` INTEGER,
    `id_ivaDoc` INTEGER,
    `importoConsuntivo` DECIMAL(18,4),
    `descTransaction` VARCHAR(60),
    `dataTransaction` DATE,
    `flgProcediPagamento` INTEGER,
    `flgStatoOrdineWww` INTEGER,
    `id_documentoXpay` VARCHAR(40),
    `flgRitiroNegozio` INTEGER,
    `logRecord` TEXT,
    `id_magFisicoPartenza` INTEGER,
    `id_magFisicoArrivo` INTEGER,
    `dataDownload` DATE,
    `ipDownload` VARCHAR(254),
    `flgDownload` INTEGER,
    `tmstStampato` VARCHAR(60),
    `oraDownload` TIME,
    `bic` VARCHAR(30),
    `id_bancaAnticipo` INTEGER,
    `flgHasDocumentiPrelevabili` INTEGER,
    `flgSuper` INTEGER,
    `clienteNome` VARCHAR(254),
    `clienteCognome` VARCHAR(254),
    `clienteIndirizzo` VARCHAR(254),
    `clienteCf` VARCHAR(254),
    `clientePiva` VARCHAR(254),
    `flgEmsta` INTEGER,
    `notaSblocco` VARCHAR(1000),
    `cittaSped` VARCHAR(60),
    `provinciaSped` VARCHAR(40),
    `capSped` VARCHAR(40),
    `id_agente` INTEGER,
    `id_respCommerciale` INTEGER,
    `percAgente` DOUBLE,
    `percRespCommerciale` DOUBLE,
    `tmstFilePdf` VARCHAR(16),
    `tmstInvioMail` DATETIME,
    `flgWwwRichiedeFattura` INTEGER,
    CONSTRAINT `PK_DOCUMENTO` PRIMARY KEY (`id_documento`)
);

CREATE UNIQUE INDEX `IDX_DOCUMENTO_1` ON `DOCUMENTO` (`progDocumento` ASC,`id_contatore` ASC,`id_esercizio` ASC,`flgStato` ASC,`progDocumentoAgg` ASC);

CREATE INDEX `IDX_DOCUMENTO_2` ON `DOCUMENTO` (`id_tipoDocumento`);

CREATE INDEX `IDX_DOCUMENTO_3` ON `DOCUMENTO` (`id_vettore`);

CREATE INDEX `IDX_DOCUMENTO_4` ON `DOCUMENTO` (`id_tipoPagamento`);

CREATE INDEX `IDX_DOCUMENTO_5` ON `DOCUMENTO` (`id_clifor`);

CREATE INDEX `IDX_DOCUMENTO_6` ON `DOCUMENTO` (`id_aspetto`);

CREATE INDEX `IDX_DOCUMENTO_7` ON `DOCUMENTO` (`id_esercizio`);

CREATE INDEX `IDX_DOCUMENTO_8` ON `DOCUMENTO` (`id_documentoFiglio`);

CREATE INDEX `IDX_DOCUMENTO_9` ON `DOCUMENTO` (`id_comuneSped`);

CREATE INDEX `IDX_DOCUMENTO_10` ON `DOCUMENTO` (`id_causaleTrasporto`);

CREATE INDEX `IDX_DOCUMENTO_11` ON `DOCUMENTO` (`id_destinazioneDiversa`);

CREATE INDEX `IDX_DOCUMENTO_12` ON `DOCUMENTO` (`id_usersIntervento`);

CREATE INDEX `IDX_DOCUMENTO_13` ON `DOCUMENTO` (`id_usersChiusura`);

CREATE INDEX `IDX_DOCUMENTO_14` ON `DOCUMENTO` (`id_users`);

CREATE INDEX `IDX_DOCUMENTO_15` ON `DOCUMENTO` (`progDocumento` ASC);

CREATE UNIQUE INDEX `IDX_DOCUMENTO_16` ON `DOCUMENTO` (`id_documentoXpay`);

# ---------------------------------------------------------------------- #
# Add table "CLIFOR_USERS"                                               #
# ---------------------------------------------------------------------- #

CREATE TABLE `CLIFOR_USERS` (
    `id_cliforUsers` INTEGER NOT NULL AUTO_INCREMENT,
    `id_clifor` INTEGER,
    `id_users` INTEGER,
    CONSTRAINT `PK_CLIFOR_USERS` PRIMARY KEY (`id_cliforUsers`)
);

CREATE INDEX `IDX_CLIFOR_USERS_1` ON `CLIFOR_USERS` (`id_clifor`);

CREATE INDEX `IDX_CLIFOR_USERS_2` ON `CLIFOR_USERS` (`id_users`);

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

CREATE INDEX `IDX_BANNER_STATS_1` ON `BANNER_STATS` (`id_banner`);

# ---------------------------------------------------------------------- #
# Add table "DOC_FIGLIO_PADRE"                                           #
# ---------------------------------------------------------------------- #

CREATE TABLE `DOC_FIGLIO_PADRE` (
    `id_docFiglioPadre` INTEGER NOT NULL AUTO_INCREMENT,
    `id_documentoPadre` INTEGER,
    `id_documentoFiglio` INTEGER,
    CONSTRAINT `PK_DOC_FIGLIO_PADRE` PRIMARY KEY (`id_docFiglioPadre`)
);

CREATE INDEX `IDX_DOC_FIGLIO_PADRE_1` ON `DOC_FIGLIO_PADRE` (`id_documentoPadre`);

CREATE INDEX `IDX_DOC_FIGLIO_PADRE_2` ON `DOC_FIGLIO_PADRE` (`id_documentoFiglio`);

CREATE UNIQUE INDEX `IDX_DOC_FIGLIO_PADRE_3` ON `DOC_FIGLIO_PADRE` (`id_documentoPadre`,`id_documentoFiglio`);

# ---------------------------------------------------------------------- #
# Add table "ALLEGATO_DOCUMENTO"                                         #
# ---------------------------------------------------------------------- #

CREATE TABLE `ALLEGATO_DOCUMENTO` (
    `id_allegatoDocumento` INTEGER NOT NULL AUTO_INCREMENT,
    `id_documento` INTEGER,
    `id_tipoAllegatoDocumento` INTEGER,
    `nomeFile` VARCHAR(254),
    `descrizioneAllegato` VARCHAR(254),
    CONSTRAINT `PK_ALLEGATO_DOCUMENTO` PRIMARY KEY (`id_allegatoDocumento`)
);

# ---------------------------------------------------------------------- #
# Add table "DOCUMENTO_AGENTE"                                           #
# ---------------------------------------------------------------------- #

CREATE TABLE `DOCUMENTO_AGENTE` (
    `id_documentoAgente` INTEGER NOT NULL AUTO_INCREMENT,
    `id_documento` INTEGER,
    `id_clifor` INTEGER,
    `percDocumentoAgente` DECIMAL(5,2),
    CONSTRAINT `PK_DOCUMENTO_AGENTE` PRIMARY KEY (`id_documentoAgente`)
);

# ---------------------------------------------------------------------- #
# Add table "USER_CLIFOR"                                                #
# ---------------------------------------------------------------------- #

CREATE TABLE `USER_CLIFOR` (
    `id_userClifor` INTEGER NOT NULL AUTO_INCREMENT,
    `id_users` INTEGER,
    `id_clifor` INTEGER,
    CONSTRAINT `PK_USER_CLIFOR` PRIMARY KEY (`id_userClifor`)
);

# ---------------------------------------------------------------------- #
# Add table "NEWS_USERS"                                                 #
# ---------------------------------------------------------------------- #

CREATE TABLE `NEWS_USERS` (
    `id_newsUsers` INTEGER NOT NULL AUTO_INCREMENT,
    `id_news` INTEGER,
    `id_users` INTEGER,
    `tmstInvio` TIMESTAMP,
    `result` VARCHAR(254),
    CONSTRAINT `PK_NEWS_USERS` PRIMARY KEY (`id_newsUsers`)
);

# ---------------------------------------------------------------------- #
# Add table "DOCUMENTO_PAGAMENTO"                                        #
# ---------------------------------------------------------------------- #

CREATE TABLE `DOCUMENTO_PAGAMENTO` (
    `id_documentoPagamento` INTEGER NOT NULL AUTO_INCREMENT,
    `id_documento` INTEGER,
    `id_tipoPagamento` INTEGER,
    `data` DATE,
    `importo` DECIMAL(18,4),
    `nota` VARCHAR(254),
    `tipoMovimento` INTEGER,
    `flgTipoIncasso` INTEGER,
    CONSTRAINT `PK_DOCUMENTO_PAGAMENTO` PRIMARY KEY (`id_documentoPagamento`)
);

# ---------------------------------------------------------------------- #
# Add table "RIGA_MOV_CONTABILE"                                         #
# ---------------------------------------------------------------------- #

CREATE TABLE `RIGA_MOV_CONTABILE` (
    `id_rigaMovContabile` INTEGER NOT NULL AUTO_INCREMENT,
    `id_movContabile` INTEGER,
    `importo` DECIMAL(18,4),
    `flgDA` INTEGER,
    `id_pianoConti` INTEGER,
    `id_clifor` INTEGER,
    `id_banca` INTEGER,
    `id_documento` INTEGER,
    `id_iva` INTEGER,
    CONSTRAINT `PK_RIGA_MOV_CONTABILE` PRIMARY KEY (`id_rigaMovContabile`)
);

# ---------------------------------------------------------------------- #
# Add table "DOCUMENTO_SCADENZA"                                         #
# ---------------------------------------------------------------------- #

CREATE TABLE `DOCUMENTO_SCADENZA` (
    `id_documentoScadenza` INTEGER NOT NULL AUTO_INCREMENT,
    `id_documento` INTEGER,
    `id_distintaRiba` INTEGER,
    `dataScadenza` DATE,
    `importoScadenza` DECIMAL(18,4),
    `flgScadenzaSelezionata` INTEGER,
    CONSTRAINT `PK_DOCUMENTO_SCADENZA` PRIMARY KEY (`id_documentoScadenza`)
);

# ---------------------------------------------------------------------- #
# Add table "ARTICOLO_FILATO_COLORE_RITORTO"                             #
# ---------------------------------------------------------------------- #

CREATE TABLE `ARTICOLO_FILATO_COLORE_RITORTO` (
    `id_articoloFilatoColoreRitorto` INTEGER NOT NULL AUTO_INCREMENT,
    `id_articoloFilatoTestata` INTEGER,
    `id_coloreFilatoTestata` INTEGER,
    `id_articoloFilato` INTEGER,
    `id_coloreFilato` INTEGER,
    `perc` DECIMAL(5,2),
    CONSTRAINT `PK_ARTICOLO_FILATO_COLORE_RITORTO` PRIMARY KEY (`id_articoloFilatoColoreRitorto`)
);

# ---------------------------------------------------------------------- #
# Add table "ARTICOLO"                                                   #
# ---------------------------------------------------------------------- #

CREATE TABLE `ARTICOLO` (
    `id_articolo` INTEGER NOT NULL AUTO_INCREMENT,
    `id_iva` INTEGER,
    `id_tipo` INTEGER,
    `id_marca` INTEGER,
    `id_colore` INTEGER,
    `id_articoloVarianteBase` INTEGER,
    `id_tipoTaglia` INTEGER,
    `id_tabellaTaglia` INTEGER,
    `codice` VARCHAR(30),
    `codiceProduttore` VARCHAR(30),
    `codiciAlternativi` VARCHAR(254),
    `nome` VARCHAR(60) NOT NULL,
    `descrizione_it` VARCHAR(60),
    `descrizione_en` VARCHAR(60),
    `descrizioneCommerciale_it` TEXT,
    `descrizioneCommerciale_en` TEXT,
    `descrizioneTecnica_it` TEXT,
    `descrizioneTecnica_en` TEXT,
    `flgObsoleto` INTEGER,
    `flgNascondi` INTEGER DEFAULT 0,
    `flgStato` INTEGER,
    `flgStockOfferte` CHAR(1) DEFAULT '0',
    `dataScadenzaOfferta` DATE,
    `dataAggiornamento` DATE,
    `dataFineVld` DATE,
    `ordine` INTEGER DEFAULT 0,
    `imgTmst` CHAR(16),
    `mesigar` INTEGER,
    `prezzoPubblico` DECIMAL(18,4),
    `ricaricoBase` DOUBLE,
    `streetPrice` DECIMAL(18,4),
    `percSconto` DOUBLE,
    `quantita` DOUBLE,
    `quantitaPrenotata` DOUBLE,
    `pesoKg` DECIMAL,
    `volumeM3` DECIMAL(18,4),
    `descSearch` VARCHAR(254),
    `flgUsaVarianti` INTEGER,
    `flgStampaEtichette` INTEGER,
    `dataCambiamentoPrezzo` DATE,
    `flgUsaVariantiArt` INTEGER,
    `altreCompatibilita` VARCHAR(1000),
    `flgSerialiMassivi` INTEGER,
    `compatibilita` VARCHAR(1000),
    `qtaRiordino` DOUBLE,
    `flgStampaAccessori` INTEGER,
    `costoRivalutazione` DECIMAL(18,4),
    `flgNegativo` INTEGER,
    `quantitaEffettiva` DOUBLE,
    `caratteristiche` VARCHAR(254),
    `flgServizio` INTEGER,
    `flgRC` INTEGER,
    `flgNoListino` INTEGER,
    `flgEscludiWeb` INTEGER,
    `costoSpedizione` DECIMAL(18,4),
    `id_tipoAccessorio` INTEGER,
    `descrizioneVetrina_it` TEXT,
    `descrizioneVetrina_en` TEXT,
    `dataAggQuantita` DATE,
    `flgEscludiWebArt` INTEGER,
    `id_vetrina` INTEGER,
    `prezzoOfferta` DECIMAL(18,4),
    `altezzaMinima` INTEGER,
    `massaLineare` INTEGER,
    `codiceDoganale` VARCHAR(30),
    `lavaggio` INTEGER,
    `candeggio` INTEGER,
    `stiratura` INTEGER,
    `asciugatura` INTEGER,
    `pulituraSecco` INTEGER,
    `flgNoListinoArt` INTEGER,
    `seoDesc` TEXT,
    `seoH1` VARCHAR(254),
    `seoTitle` VARCHAR(254),
    `flgTipoMagazzino` INTEGER,
    `flgDispo` INTEGER,
    `abbuonoPrezzoPubblico` DECIMAL(18,4),
    `quantitaMagazzinoMovimentoHtml` VARCHAR(254),
    `quantitaW` DOUBLE,
    `quantitaImpegnata` DOUBLE,
    `quantitaInArrivo` DOUBLE,
    `quantitaCalcolate` BOOL,
    `flgWebNoVendita` INTEGER,
    `metaTag` VARCHAR(40),
    `metaDesc` VARCHAR(254),
    `flgArticoloComponente` INTEGER,
    `id_tipo2` INTEGER,
    `volumeCm3` INTEGER,
    CONSTRAINT `PK_ARTICOLO` PRIMARY KEY (`id_articolo`)
);

CREATE INDEX `IDX_ARTICOLO_1` ON `ARTICOLO` (`id_marca`);

CREATE INDEX `IDX_ARTICOLO_2` ON `ARTICOLO` (`id_colore`);

CREATE INDEX `IDX_ARTICOLO_3` ON `ARTICOLO` (`id_tipo`);

CREATE UNIQUE INDEX `IDX_ARTICOLO_4` ON `ARTICOLO` (`codice` ASC);

CREATE INDEX `IDX_ARTICOLO_5` ON `ARTICOLO` (`id_iva`);

CREATE INDEX `IDX_ARTICOLO_6` ON `ARTICOLO` (`id_tipoTaglia`);

CREATE INDEX `IDX_ARTICOLO_7` ON `ARTICOLO` (`id_articoloVarianteBase`);

CREATE INDEX `IDX_ARTICOLO_8` ON `ARTICOLO` (`id_tabellaTaglia`);

CREATE INDEX `IDX_ARTICOLO_9` ON `ARTICOLO` (`descrizione_it` ASC);

CREATE INDEX `IDX_ARTICOLO_10` ON `ARTICOLO` (`codiceProduttore` ASC);

CREATE INDEX `IDX_ARTICOLO_11` ON `ARTICOLO` (`codiciAlternativi` ASC);

# ---------------------------------------------------------------------- #
# Add table "CARATTERISTICA_ARTICOLO"                                    #
# ---------------------------------------------------------------------- #

CREATE TABLE `CARATTERISTICA_ARTICOLO` (
    `id_articolo` INTEGER NOT NULL,
    `id_caratteristica` INTEGER NOT NULL,
    `valI` INTEGER,
    `valS` VARCHAR(60),
    `valSN` INTEGER,
    `valD` DATE,
    `id_lista` INTEGER,
    `valDouble` DECIMAL(18,4),
    CONSTRAINT `PK_CARATTERISTICA_ARTICOLO` PRIMARY KEY (`id_articolo`, `id_caratteristica`)
);

CREATE INDEX `IDX_CARATTERISTICA_ARTICOLO_1` ON `CARATTERISTICA_ARTICOLO` (`id_caratteristica`);

CREATE INDEX `IDX_CARATTERISTICA_ARTICOLO_2` ON `CARATTERISTICA_ARTICOLO` (`id_lista`);

CREATE INDEX `IDX_CARATTERISTICA_ARTICOLO_3` ON `CARATTERISTICA_ARTICOLO` (`id_articolo`);

# ---------------------------------------------------------------------- #
# Add table "ACCESSORIO"                                                 #
# ---------------------------------------------------------------------- #

CREATE TABLE `ACCESSORIO` (
    `id_accessorio` INTEGER NOT NULL AUTO_INCREMENT,
    `id_tipoAccessorio` INTEGER,
    `id_articoloAssociato` INTEGER,
    `id_articolo` INTEGER,
    `id_articoloVarianteAssociato` INTEGER,
    `id_articoloVariante` INTEGER,
    `flgEstendiVariante` INTEGER,
    CONSTRAINT `PK_ACCESSORIO` PRIMARY KEY (`id_accessorio`)
);

CREATE INDEX `IDX_ACCESSORIO_1` ON `ACCESSORIO` (`id_tipoAccessorio` ASC);

CREATE INDEX `IDX_ACCESSORIO_2` ON `ACCESSORIO` (`id_articoloAssociato`);

CREATE INDEX `IDX_ACCESSORIO_3` ON `ACCESSORIO` (`id_articolo`);

CREATE INDEX `IDX_ACCESSORIO_4` ON `ACCESSORIO` (`id_articoloVarianteAssociato`);

CREATE INDEX `IDX_ACCESSORIO_5` ON `ACCESSORIO` (`id_articoloVariante`);

CREATE UNIQUE INDEX `IDX_ACCESSORIO_6` ON `ACCESSORIO` (`id_tipoAccessorio`,`id_articolo`,`id_articoloAssociato`,`id_articoloVariante`,`id_articoloVarianteAssociato`);

# ---------------------------------------------------------------------- #
# Add table "RIGA_DOCUMENTO"                                             #
# ---------------------------------------------------------------------- #

CREATE TABLE `RIGA_DOCUMENTO` (
    `id_rigaDocumento` INTEGER NOT NULL AUTO_INCREMENT,
    `id_documento` INTEGER,
    `id_articolo` INTEGER,
    `id_articoloVariante` INTEGER,
    `id_iva` INTEGER,
    `seriale` VARCHAR(30),
    `imponibile` DECIMAL(18,4),
    `quantita` DOUBLE,
    `descrizioneRiga` VARCHAR(254),
    `notaRigaDocumento` VARCHAR(254),
    `sconto` DECIMAL(5,2),
    `quantitaPrelevata` DOUBLE DEFAULT 0,
    `quantitaAssociata` DOUBLE DEFAULT 0,
    `flgRigaPrelevata` INTEGER,
    `id_reparto` INTEGER,
    `importo` DECIMAL(18,4),
    `flgReso` INTEGER,
    `flgPrenotazioneArrivata` INTEGER,
    `serialeSost` VARCHAR(30),
    `id_documentoPadre` INTEGER,
    `ordineRiga` INTEGER,
    `notaBarcode` VARCHAR(60),
    `id_rigaDocumentoPadre` INTEGER,
    `dataScadenzaLotto` DATE,
    `id_articoloTaglia` INTEGER,
    `percL1` DECIMAL(5,2),
    `percL2` DECIMAL(5,2),
    `percL3` DECIMAL(5,2),
    `kg` DOUBLE,
    `mt` DOUBLE,
    `nr` DOUBLE,
    `qtaSlipStampate` INTEGER,
    `statoPrenotazione` INTEGER,
    `id_causaleMagazzino` INTEGER DEFAULT null,
    `id_clifor` INTEGER DEFAULT null,
    `id_magFisico` INTEGER DEFAULT null,
    `segnoMov` INTEGER,
    `id_rigaDocumentoMov` INTEGER,
    `id_rigaDocumentoPrelevata` INTEGER,
    `id_pezza` INTEGER,
    `id_faseLavorazione` INTEGER,
    `id_articoloFilatoColoreRitorto` INTEGER,
    `id_articoloTessuto` INTEGER,
    CONSTRAINT `PK_RIGA_DOCUMENTO` PRIMARY KEY (`id_rigaDocumento`)
);

CREATE INDEX `IDX_RIGA_DOCUMENTO_1` ON `RIGA_DOCUMENTO` (`id_articolo`);

CREATE INDEX `IDX_RIGA_DOCUMENTO_2` ON `RIGA_DOCUMENTO` (`id_documento`);

CREATE INDEX `IDX_RIGA_DOCUMENTO_3` ON `RIGA_DOCUMENTO` (`id_iva`);

CREATE INDEX `IDX_RIGA_DOCUMENTO_4` ON `RIGA_DOCUMENTO` (`id_articoloVariante`);

CREATE INDEX `IDX_RIGA_DOCUMENTO_5` ON `RIGA_DOCUMENTO` (`id_reparto`);

# ---------------------------------------------------------------------- #
# Add table "ARTICOLO_VARIANTE"                                          #
# ---------------------------------------------------------------------- #

CREATE TABLE `ARTICOLO_VARIANTE` (
    `id_articoloVariante` INTEGER NOT NULL AUTO_INCREMENT,
    `id_articolo` INTEGER NOT NULL,
    `nomeV` VARCHAR(30),
    `codiceVariante` VARCHAR(30) NOT NULL,
    `imgTmst` CHAR(16),
    `descrizioneV_it` VARCHAR(60),
    `descrizioneV_en` VARCHAR(60),
    `descrizioneVetrinaV_it` VARCHAR(254),
    `descrizioneVetrinaV_en` VARCHAR(254),
    `flgNascondi` INTEGER DEFAULT 0,
    `flgUdmAv` INTEGER,
    `quantitaAv` DOUBLE,
    `codiciAlternativiV` VARCHAR(254),
    `id_vetrina` INTEGER,
    `qtaAttribuitaV` DOUBLE,
    `qtaInProduzioneV` DOUBLE,
    `codiceSerieV` VARCHAR(16),
    `flgStockV` INTEGER,
    `flgNonOrdinabile` INTEGER,
    `flgDispo` INTEGER,
    `flgInAggiornamento` INTEGER,
    `quantitaMagazzinoMovimentoHtml` VARCHAR(254),
    `flgListinoArticolo` INTEGER,
    `metaTag` VARCHAR(40),
    `metaDesc` VARCHAR(254),
    `quantitaCalcolateAv` BOOL,
    `flgWebNoVenditaAv` INTEGER,
    `flgEscludiWebAv` INTEGER,
    `quantitaImpegnataAv` DOUBLE,
    `quantitaInArrivoAv` DOUBLE,
    `quantitaAvW` DOUBLE,
    `quantitaEffettivaAv` DOUBLE,
    CONSTRAINT `PK_ARTICOLO_VARIANTE` PRIMARY KEY (`id_articoloVariante`)
);

CREATE INDEX `IDX_ARTICOLO_VARIANTE_1` ON `ARTICOLO_VARIANTE` (`id_articolo`);

CREATE UNIQUE INDEX `IDX_ARTICOLO_VARIANTE_2` ON `ARTICOLO_VARIANTE` (`id_articolo` ASC,`nomeV` ASC,`codiceSerieV` ASC);

CREATE UNIQUE INDEX `IDX_ARTICOLO_VARIANTE_3` ON `ARTICOLO_VARIANTE` (`codiceVariante` ASC);

CREATE INDEX `IDX_ARTICOLO_VARIANTE_4` ON `ARTICOLO_VARIANTE` (`codiciAlternativiV` ASC);

# ---------------------------------------------------------------------- #
# Add table "ARTICOLO_FORNITORE"                                         #
# ---------------------------------------------------------------------- #

CREATE TABLE `ARTICOLO_FORNITORE` (
    `id_clifor` INTEGER NOT NULL,
    `id_articolo` INTEGER NOT NULL,
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
    CONSTRAINT `PK_ARTICOLO_FORNITORE` PRIMARY KEY (`id_clifor`, `id_articolo`)
);

CREATE UNIQUE INDEX `IDX_ARTICOLO_FORNITORE1` ON `ARTICOLO_FORNITORE` (`codiceFornitore` ASC,`id_clifor` ASC);

CREATE INDEX `IDX_ARTICOLO_FORNITORE_2` ON `ARTICOLO_FORNITORE` (`id_clifor`);

CREATE INDEX `IDX_ARTICOLO_FORNITORE_3` ON `ARTICOLO_FORNITORE` (`id_articolo`);

# ---------------------------------------------------------------------- #
# Add table "ALLEGATO_ARTICOLO"                                          #
# ---------------------------------------------------------------------- #

CREATE TABLE `ALLEGATO_ARTICOLO` (
    `id_allegatoArticolo` INTEGER NOT NULL AUTO_INCREMENT,
    `id_articolo` INTEGER,
    `id_tipoAllegatoArticolo` INTEGER,
    `nomeFile` VARCHAR(60),
    `descrizioneAllegato` VARCHAR(254),
    CONSTRAINT `PK_ALLEGATO_ARTICOLO` PRIMARY KEY (`id_allegatoArticolo`)
);

CREATE INDEX `IDX_ALLEGATO_ARTICOLO_1` ON `ALLEGATO_ARTICOLO` (`id_articolo`);

# ---------------------------------------------------------------------- #
# Add table "LISTINO_PERS"                                               #
# ---------------------------------------------------------------------- #

CREATE TABLE `LISTINO_PERS` (
    `id_listinoPers` INTEGER NOT NULL AUTO_INCREMENT,
    `id_articolo` INTEGER,
    `id_clifor` INTEGER,
    `flgTipoLP` INTEGER,
    `percLP` DECIMAL(5,2),
    `prezzoLP` DECIMAL(18,4),
    `id_tipo` INTEGER(11),
    `indiciTipo` VARCHAR(1000),
    CONSTRAINT `PK_LISTINO_PERS` PRIMARY KEY (`id_listinoPers`)
);

CREATE INDEX `IDX_LISTINO_PERS_1` ON `LISTINO_PERS` (`id_articolo`);

CREATE INDEX `IDX_LISTINO_PERS_2` ON `LISTINO_PERS` (`id_clifor`);

CREATE UNIQUE INDEX `IDX_LISTINO_PERS_3` ON `LISTINO_PERS` (`id_articolo`,`id_clifor`);

CREATE UNIQUE INDEX `IDX_LISTINO_PERS_4` ON `LISTINO_PERS` (`id_clifor`,`id_tipo`);

# ---------------------------------------------------------------------- #
# Add table "RIGA_DOCUMENTO_P"                                           #
# ---------------------------------------------------------------------- #

CREATE TABLE `RIGA_DOCUMENTO_P` (
    `id_rigaDocumentoP` INTEGER NOT NULL AUTO_INCREMENT,
    `id_rigaDocumento` INTEGER NOT NULL,
    `id_rigaDocumentoPrelevata` INTEGER NOT NULL,
    `id_documento` INTEGER,
    `quantitaPrelevata` DOUBLE,
    CONSTRAINT `PK_RIGA_DOCUMENTO_P` PRIMARY KEY (`id_rigaDocumentoP`)
);

# ---------------------------------------------------------------------- #
# Add table "RIVALUTAZIONE"                                              #
# ---------------------------------------------------------------------- #

CREATE TABLE `RIVALUTAZIONE` (
    `id_rivalutazione` INTEGER NOT NULL AUTO_INCREMENT,
    `dataRivalutazione` DATE,
    `imponibileRivalutazione` DECIMAL(18,4),
    `id_articolo` INTEGER,
    CONSTRAINT `PK_RIVALUTAZIONE` PRIMARY KEY (`id_rivalutazione`)
);

CREATE INDEX `IDX_RIVALUTAZIONE_1` ON `RIVALUTAZIONE` (`id_articolo`);

# ---------------------------------------------------------------------- #
# Add table "LISTINO_SERVIZI_PERS"                                       #
# ---------------------------------------------------------------------- #

CREATE TABLE `LISTINO_SERVIZI_PERS` (
    `id_listinoServiziPers` INTEGER NOT NULL AUTO_INCREMENT,
    `id_articolo` INTEGER,
    `id_clifor` INTEGER,
    `flgUdm` INTEGER,
    `flgTipoLP` INTEGER,
    `percLP` DECIMAL(5,2),
    `prezzoLP` DECIMAL(18,4),
    `id_aspetto` INTEGER,
    `flgMinimoTassabile` INTEGER,
    CONSTRAINT `PK_LISTINO_SERVIZI_PERS` PRIMARY KEY (`id_listinoServiziPers`)
);

CREATE INDEX `IDX_LISTINO_SERVIZI_PERS_1` ON `LISTINO_SERVIZI_PERS` (`id_articolo`);

CREATE INDEX `IDX_LISTINO_SERVIZI_PERS_2` ON `LISTINO_SERVIZI_PERS` (`id_clifor`);

CREATE UNIQUE INDEX `IDX_LISTINO_SERVIZI_PERS_3` ON `LISTINO_SERVIZI_PERS` (`id_articolo`,`id_clifor`);

# ---------------------------------------------------------------------- #
# Add table "ARTICOLO_TAGLIA"                                            #
# ---------------------------------------------------------------------- #

CREATE TABLE `ARTICOLO_TAGLIA` (
    `id_articoloTaglia` INTEGER NOT NULL AUTO_INCREMENT,
    `id_articolo` INTEGER,
    `id_articoloVariante` INTEGER,
    `id_taglia` INTEGER,
    `codiceAT` CHAR(40),
    `flgDispo` INTEGER,
    `quantitaCalcolateAt` BOOL,
    `quantitaImpegnataAt` DOUBLE,
    `quantitaInArrivoAt` DOUBLE,
    `quantitaAtW` DOUBLE,
    `quantitaEffettivaAt` DOUBLE,
    `flgUdmAt` INTEGER,
    `quantitaAt` DOUBLE,
    `qtaAttribuitaT` DOUBLE,
    `qtaProduzioneT` DOUBLE,
    `quantitaMagazzinoMovimentoHtml` VARCHAR(254),
    CONSTRAINT `PK_ARTICOLO_TAGLIA` PRIMARY KEY (`id_articoloTaglia`)
);

# ---------------------------------------------------------------------- #
# Add table "ARTICOLO_COMPONENTE"                                        #
# ---------------------------------------------------------------------- #

CREATE TABLE `ARTICOLO_COMPONENTE` (
    `id_articoloComponente` INTEGER NOT NULL AUTO_INCREMENT,
    `id_componente` INTEGER,
    `id_articolo` INTEGER,
    `perc` DECIMAL(5,2),
    CONSTRAINT `PK_ARTICOLO_COMPONENTE` PRIMARY KEY (`id_articoloComponente`)
);

# ---------------------------------------------------------------------- #
# Add table "LISTINO_ARTICOLO"                                           #
# ---------------------------------------------------------------------- #

CREATE TABLE `LISTINO_ARTICOLO` (
    `id_listinoArticolo` INTEGER NOT NULL AUTO_INCREMENT,
    `id_listino` INTEGER,
    `id_articolo` INTEGER,
    `prezzoLA` DECIMAL(18,4),
    `id_articoloVariante` INTEGER,
    `percLA` DECIMAL(5,2),
    `prezzoOffertaLA` DECIMAL(18,4),
    `dataScadenzaOffertaLA` DATE,
    `abbuonoPrezzoPubblicoLA` DECIMAL(18,4),
    `dataCambiamentoPrezzoLA` DATE,
    `percLA1` DECIMAL(5,2),
    `percLA2` DECIMAL(5,2),
    `percLA3` DECIMAL(5,2),
    CONSTRAINT `PK_LISTINO_ARTICOLO` PRIMARY KEY (`id_listinoArticolo`)
);

# ---------------------------------------------------------------------- #
# Add table "CLIFOR_ARTICOLO"                                            #
# ---------------------------------------------------------------------- #

CREATE TABLE `CLIFOR_ARTICOLO` (
    `id_cliforArticolo` INTEGER NOT NULL AUTO_INCREMENT,
    `percArticolo` DECIMAL(5,2),
    `id_progettista` INTEGER,
    `id_articolo` INTEGER,
    CONSTRAINT `PK_CLIFOR_ARTICOLO` PRIMARY KEY (`id_cliforArticolo`)
);

# ---------------------------------------------------------------------- #
# Add table "RIGA_DOCUMENTO_PROGETTISTA"                                 #
# ---------------------------------------------------------------------- #

CREATE TABLE `RIGA_DOCUMENTO_PROGETTISTA` (
    `id_rigaDocumentoProgettista` INTEGER NOT NULL AUTO_INCREMENT,
    `id_rigaDocumento` INTEGER,
    `id_articolo` INTEGER,
    `id_clifor` INTEGER,
    `percArticolo` DECIMAL(5,2),
    `importoRiga` DECIMAL(18,4),
    `scontoRiga` DECIMAL(5,2),
    CONSTRAINT `PK_RIGA_DOCUMENTO_PROGETTISTA` PRIMARY KEY (`id_rigaDocumentoProgettista`)
);

# ---------------------------------------------------------------------- #
# Add table "RIGA_DOCUMENTO_P_M"                                         #
# ---------------------------------------------------------------------- #

CREATE TABLE `RIGA_DOCUMENTO_P_M` (
    `id_rigaDocumento` INTEGER NOT NULL,
    `id_rigaDocumentoPrelevata` INTEGER NOT NULL,
    `quantitaPrelevata` DOUBLE,
    CONSTRAINT `PK_RIGA_DOCUMENTO_P_M` PRIMARY KEY (`id_rigaDocumento`, `id_rigaDocumentoPrelevata`)
);

# ---------------------------------------------------------------------- #
# Add table "MOVIMENTO"                                                  #
# ---------------------------------------------------------------------- #

CREATE TABLE `MOVIMENTO` (
    `id_movimento` INTEGER NOT NULL AUTO_INCREMENT,
    `id_rigaDocumento` INTEGER,
    `id_articolo` INTEGER,
    `id_articoloVariante` INTEGER,
    `id_articoloTaglia` INTEGER,
    `id_magFisico` INTEGER,
    `id_clifor` INTEGER,
    `seriale` VARCHAR(30),
    `kg` DOUBLE,
    `mt` DOUBLE,
    `nr` DOUBLE,
    `id_rigaDocumentoP` INTEGER,
    `id_causaleMagazzino` INTEGER,
    `dataMovimento` DATE,
    CONSTRAINT `PK_MOVIMENTO` PRIMARY KEY (`id_movimento`)
);

CREATE INDEX `IDX_MOVIMENTO_1` ON `MOVIMENTO` (`seriale`);

# ---------------------------------------------------------------------- #
# Add table "INCASSO_PAGAMENTO"                                          #
# ---------------------------------------------------------------------- #

CREATE TABLE `INCASSO_PAGAMENTO` (
    `id_incassoPagamento` INTEGER NOT NULL AUTO_INCREMENT,
    `dataIP` DATE,
    `importoIP` DECIMAL(18,4),
    `notaIP` TEXT,
    `id_documento` INTEGER,
    `id_movimento` INTEGER,
    CONSTRAINT `PK_INCASSO_PAGAMENTO` PRIMARY KEY (`id_incassoPagamento`)
);

# ---------------------------------------------------------------------- #
# Add table "ARTICOLO_PROGETTISTA"                                       #
# ---------------------------------------------------------------------- #

CREATE TABLE `ARTICOLO_PROGETTISTA` (
    `id_articoloProgettista` INTEGER NOT NULL AUTO_INCREMENT,
    `id_articolo` INTEGER,
    `id_clifor` INTEGER,
    `percProvvigione` DECIMAL(5,2),
    CONSTRAINT `PK_ARTICOLO_PROGETTISTA` PRIMARY KEY (`id_articoloProgettista`)
);

# ---------------------------------------------------------------------- #
# Add table "ARTICOLO_ARTICOLO_COMPONENTE"                               #
# ---------------------------------------------------------------------- #

CREATE TABLE `ARTICOLO_ARTICOLO_COMPONENTE` (
    `id_articoloArticoloComponente` INTEGER NOT NULL AUTO_INCREMENT,
    `id_articoloComponente` INTEGER,
    `id_articolo` INTEGER NOT NULL,
    CONSTRAINT `PK_ARTICOLO_ARTICOLO_COMPONENTE` PRIMARY KEY (`id_articoloArticoloComponente`)
);

# ---------------------------------------------------------------------- #
# Add table "PEZZA"                                                      #
# ---------------------------------------------------------------------- #

CREATE TABLE `PEZZA` (
    `id_pezza` INTEGER NOT NULL AUTO_INCREMENT,
    `matricola` INTEGER,
    `id_tela` INTEGER,
    `id_articoloTessuto` INTEGER NOT NULL,
    `serie` VARCHAR(40),
    `colore` VARCHAR(40),
    `id_faseLavorazione` INTEGER,
    `id_rigaDocumento` INTEGER,
    `flgTipoProduzione` INTEGER,
    `flgAnnullata` INTEGER,
    `lunghezzaStandard` INTEGER,
    `pesoGreggio` DOUBLE,
    `pesoFinito` DOUBLE,
    `metriGreggi` DOUBLE,
    `metriFiniti` DOUBLE,
    `metriAbbuono` DOUBLE,
    `scelta` INTEGER,
    `partitaOrdito` VARCHAR(40),
    `partitaTrama` VARCHAR(40),
    CONSTRAINT `PK_PEZZA` PRIMARY KEY (`id_pezza`, `id_articoloTessuto`)
);

CREATE UNIQUE INDEX `IDX_PEZZA_1` ON `PEZZA` (`matricola`);

# ---------------------------------------------------------------------- #
# Add table "TELA"                                                       #
# ---------------------------------------------------------------------- #

CREATE TABLE `TELA` (
    `id_tela` INTEGER NOT NULL AUTO_INCREMENT,
    `id_cliforOrditura` INTEGER,
    `id_cliforTessitura` INTEGER,
    `progTela` INTEGER,
    `rigaTela` VARCHAR(40),
    `id_articoloTessuto` INTEGER,
    `serie` VARCHAR(40),
    `colore` VARCHAR(40),
    `id_rigaDocumento` INTEGER,
    `flgTipoPoduzione` INTEGER,
    `flgStatoTela` INTEGER,
    `pezzeDisposte` INTEGER,
    `pezzeAnnullate` INTEGER,
    `pezzeRientrate` INTEGER,
    CONSTRAINT `PK_TELA` PRIMARY KEY (`id_tela`)
);

CREATE UNIQUE INDEX `IDX_TELA_1` ON `TELA` (`progTela`,`rigaTela`);

# ---------------------------------------------------------------------- #
# Add table "PEZZA_PARTITA"                                              #
# ---------------------------------------------------------------------- #

CREATE TABLE `PEZZA_PARTITA` (
    `id_pezzaPartita` INTEGER NOT NULL AUTO_INCREMENT,
    `id_pezza` INTEGER,
    `id_articoloFilatoColore` INTEGER,
    `flgTramaOrdito` INTEGER,
    `partita` VARCHAR(40),
    `bagno` VARCHAR(40),
    CONSTRAINT `PK_PEZZA_PARTITA` PRIMARY KEY (`id_pezzaPartita`)
);

# ---------------------------------------------------------------------- #
# Add table "MOVIMENTO_PEZZA"                                            #
# ---------------------------------------------------------------------- #

CREATE TABLE `MOVIMENTO_PEZZA` (
    `id_movimentoPezza` INTEGER NOT NULL AUTO_INCREMENT,
    `id_pezza` INTEGER,
    `id_faseLavorazione` INTEGER,
    `dataMovimento` DATE,
    `id_clifor` INTEGER,
    `lunghezzaPezza` DOUBLE,
    `pesoPezza` DOUBLE,
    `id_rigaDocumento` INTEGER,
    CONSTRAINT `PK_MOVIMENTO_PEZZA` PRIMARY KEY (`id_movimentoPezza`)
);

# ---------------------------------------------------------------------- #
# Add table "TELA_PARTITA"                                               #
# ---------------------------------------------------------------------- #

CREATE TABLE `TELA_PARTITA` (
    `id_telaPartita` INTEGER NOT NULL AUTO_INCREMENT,
    `id_tela` INTEGER,
    `id_articoloFilatoColore` INTEGER,
    `flgTramaOrdito` INTEGER,
    `ordine` INTEGER,
    `partita` VARCHAR(40),
    `bagno` VARCHAR(40),
    CONSTRAINT `PK_TELA_PARTITA` PRIMARY KEY (`id_telaPartita`)
);

# ---------------------------------------------------------------------- #
# Add foreign key constraints                                            #
# ---------------------------------------------------------------------- #

ALTER TABLE `REPARTO` ADD CONSTRAINT `IVA_REPARTO` 
    FOREIGN KEY (`id_iva`) REFERENCES `IVA` (`id_iva`);

ALTER TABLE `ARTICOLO` ADD CONSTRAINT `MARCA_ARTICOLO` 
    FOREIGN KEY (`id_marca`) REFERENCES `MARCA` (`id_marca`);

ALTER TABLE `ARTICOLO` ADD CONSTRAINT `COLORE_ARTICOLO` 
    FOREIGN KEY (`id_colore`) REFERENCES `COLORE` (`id_colore`);

ALTER TABLE `ARTICOLO` ADD CONSTRAINT `TIPO_ARTICOLO` 
    FOREIGN KEY (`id_tipo`) REFERENCES `TIPO` (`id_tipo`);

ALTER TABLE `ARTICOLO` ADD CONSTRAINT `IVA_ARTICOLO` 
    FOREIGN KEY (`id_iva`) REFERENCES `IVA` (`id_iva`);

ALTER TABLE `ARTICOLO` ADD CONSTRAINT `TIPO_TAGLIA_ARTICOLO` 
    FOREIGN KEY (`id_tipoTaglia`) REFERENCES `TIPO_TAGLIA` (`id_tipoTaglia`);

ALTER TABLE `ARTICOLO` ADD CONSTRAINT `ARTICOLO_VARIANTE_ARTICOLO` 
    FOREIGN KEY (`id_articoloVarianteBase`) REFERENCES `ARTICOLO_VARIANTE` (`id_articoloVariante`);

ALTER TABLE `ARTICOLO` ADD CONSTRAINT `TABELLA_TAGLIA_ARTICOLO` 
    FOREIGN KEY (`id_tabellaTaglia`) REFERENCES `TABELLA_TAGLIA` (`id_tabellaTaglia`);

ALTER TABLE `ARTICOLO` ADD CONSTRAINT `TIPO_ACCESSORIO_ARTICOLO` 
    FOREIGN KEY (`id_tipoAccessorio`) REFERENCES `TIPO_ACCESSORIO` (`id_tipoAccessorio`);

ALTER TABLE `ARTICOLO` ADD CONSTRAINT `VETRINA_ARTICOLO` 
    FOREIGN KEY (`id_vetrina`) REFERENCES `VETRINA` (`id_vetrina`);

ALTER TABLE `ARTICOLO` ADD CONSTRAINT `TIPO_ARTICOLO_2` 
    FOREIGN KEY (`id_tipo2`) REFERENCES `TIPO` (`id_tipo`);

ALTER TABLE `CLIFOR` ADD CONSTRAINT `TIPO_PAGAMENTO_CLIFOR` 
    FOREIGN KEY (`id_tipoPagamento`) REFERENCES `TIPO_PAGAMENTO` (`id_tipoPagamento`);

ALTER TABLE `CLIFOR` ADD CONSTRAINT `NAZIONE_CLIFOR` 
    FOREIGN KEY (`id_nazione`) REFERENCES `NAZIONE` (`id_nazione`);

ALTER TABLE `CLIFOR` ADD CONSTRAINT `COMUNE_CLIFOR` 
    FOREIGN KEY (`id_comune`) REFERENCES `COMUNE` (`id_comune`);

ALTER TABLE `CLIFOR` ADD CONSTRAINT `COMUNE_CLIFOR_nasc` 
    FOREIGN KEY (`id_comuneNascita`) REFERENCES `COMUNE` (`id_comune`);

ALTER TABLE `CLIFOR` ADD CONSTRAINT `LISTINO_CLIFOR` 
    FOREIGN KEY (`id_listino`) REFERENCES `LISTINO` (`id_listino`);

ALTER TABLE `CLIFOR` ADD CONSTRAINT `PIANO_CONTI_CLIFOR` 
    FOREIGN KEY (`id_pianoConti`) REFERENCES `PIANO_CONTI` (`id_pianoConti`);

ALTER TABLE `CLIFOR` ADD CONSTRAINT `BANCA_CLIFOR_azienda` 
    FOREIGN KEY (`id_bancaAzienda`) REFERENCES `BANCA` (`id_banca`);

ALTER TABLE `CLIFOR` ADD CONSTRAINT `CLIFOR_CLIFOR_agente` 
    FOREIGN KEY (`id_agente`) REFERENCES `CLIFOR` (`id_clifor`);

ALTER TABLE `CLIFOR` ADD CONSTRAINT `CLIFOR_CLIFOR_resp_comm` 
    FOREIGN KEY (`id_respCommerciale`) REFERENCES `CLIFOR` (`id_clifor`);

ALTER TABLE `CARATTERISTICA_ARTICOLO` ADD CONSTRAINT `CARATTERISTICA_CARATTERISTICA_ARTICOLO` 
    FOREIGN KEY (`id_caratteristica`) REFERENCES `CARATTERISTICA` (`id_caratteristica`);

ALTER TABLE `CARATTERISTICA_ARTICOLO` ADD CONSTRAINT `LISTA_CARATTERISTICA_ARTICOLO` 
    FOREIGN KEY (`id_lista`) REFERENCES `LISTA` (`id_lista`);

ALTER TABLE `CARATTERISTICA_ARTICOLO` ADD CONSTRAINT `ARTICOLO_CARATTERISTICA_ARTICOLO` 
    FOREIGN KEY (`id_articolo`) REFERENCES `ARTICOLO` (`id_articolo`);

ALTER TABLE `LISTA` ADD CONSTRAINT `CARATTERISTICA_LISTA` 
    FOREIGN KEY (`id_caratteristica`) REFERENCES `CARATTERISTICA` (`id_caratteristica`);

ALTER TABLE `TIPO` ADD CONSTRAINT `TIPO_TIPO` 
    FOREIGN KEY (`id_tipoPadre`) REFERENCES `TIPO` (`id_tipo`);

ALTER TABLE `TIPO` ADD CONSTRAINT `REPARTO_TIPO` 
    FOREIGN KEY (`id_reparto`) REFERENCES `REPARTO` (`id_reparto`);

ALTER TABLE `TIPO` ADD CONSTRAINT `TIPO_TAGLIA_TIPO` 
    FOREIGN KEY (`id_tipoTaglia`) REFERENCES `TIPO_TAGLIA` (`id_tipoTaglia`);

ALTER TABLE `TIPO` ADD CONSTRAINT `TIPOLOGIA_ARTICOLO_TIPO` 
    FOREIGN KEY (`id_tipologiaArticolo`) REFERENCES `TIPOLOGIA_ARTICOLO` (`id_tipologiaArticolo`);

ALTER TABLE `C_TIPO` ADD CONSTRAINT `TIPO_C_TIPO` 
    FOREIGN KEY (`id_tipo`) REFERENCES `TIPO` (`id_tipo`);

ALTER TABLE `C_TIPO` ADD CONSTRAINT `CARATTERISTICA_C_TIPO` 
    FOREIGN KEY (`id_caratteristica`) REFERENCES `CARATTERISTICA` (`id_caratteristica`);

ALTER TABLE `ACCESSORIO` ADD CONSTRAINT `TIPO_ACCESSORIO_ACCESSORIO` 
    FOREIGN KEY (`id_tipoAccessorio`) REFERENCES `TIPO_ACCESSORIO` (`id_tipoAccessorio`);

ALTER TABLE `ACCESSORIO` ADD CONSTRAINT `ARTICOLO_ACCESSORIO_Assoc` 
    FOREIGN KEY (`id_articoloAssociato`) REFERENCES `ARTICOLO` (`id_articolo`);

ALTER TABLE `ACCESSORIO` ADD CONSTRAINT `ARTICOLO_ACCESSORIO` 
    FOREIGN KEY (`id_articolo`) REFERENCES `ARTICOLO` (`id_articolo`);

ALTER TABLE `ACCESSORIO` ADD CONSTRAINT `ARTICOLO_VARIANTE_ACCESSORIO_ass` 
    FOREIGN KEY (`id_articoloVarianteAssociato`) REFERENCES `ARTICOLO_VARIANTE` (`id_articoloVariante`);

ALTER TABLE `ACCESSORIO` ADD CONSTRAINT `ARTICOLO_VARIANTE_ACCESSORIO` 
    FOREIGN KEY (`id_articoloVariante`) REFERENCES `ARTICOLO_VARIANTE` (`id_articoloVariante`);

ALTER TABLE `DOCUMENTO` ADD CONSTRAINT `TIPO_DOCUMENTO_DOCUMENTO` 
    FOREIGN KEY (`id_tipoDocumento`) REFERENCES `TIPO_DOCUMENTO` (`id_tipoDocumento`);

ALTER TABLE `DOCUMENTO` ADD CONSTRAINT `VETTORE_DOCUMENTO` 
    FOREIGN KEY (`id_vettore`) REFERENCES `VETTORE` (`id_vettore`);

ALTER TABLE `DOCUMENTO` ADD CONSTRAINT `TIPO_PAGAMENTO_DOCUMENTO` 
    FOREIGN KEY (`id_tipoPagamento`) REFERENCES `TIPO_PAGAMENTO` (`id_tipoPagamento`);

ALTER TABLE `DOCUMENTO` ADD CONSTRAINT `CLIFOR_DOCUMENTO` 
    FOREIGN KEY (`id_clifor`) REFERENCES `CLIFOR` (`id_clifor`);

ALTER TABLE `DOCUMENTO` ADD CONSTRAINT `ASPETTO_DOCUMENTO` 
    FOREIGN KEY (`id_aspetto`) REFERENCES `ASPETTO` (`id_aspetto`);

ALTER TABLE `DOCUMENTO` ADD CONSTRAINT `ESERCIZIO_DOCUMENTO` 
    FOREIGN KEY (`id_esercizio`) REFERENCES `ESERCIZIO` (`id_esercizio`);

ALTER TABLE `DOCUMENTO` ADD CONSTRAINT `DOCUMENTO_DOCUMENTO` 
    FOREIGN KEY (`id_documentoFiglio`) REFERENCES `DOCUMENTO` (`id_documento`);

ALTER TABLE `DOCUMENTO` ADD CONSTRAINT `COMUNE_DOCUMENTO` 
    FOREIGN KEY (`id_comuneSped`) REFERENCES `COMUNE` (`id_comune`);

ALTER TABLE `DOCUMENTO` ADD CONSTRAINT `CAUSALE_TRASPORTO_DOCUMENTO` 
    FOREIGN KEY (`id_causaleTrasporto`) REFERENCES `CAUSALE_TRASPORTO` (`id_causaleTrasporto`);

ALTER TABLE `DOCUMENTO` ADD CONSTRAINT `DESTINAZIONE_DIVERSA_DOCUMENTO` 
    FOREIGN KEY (`id_destinazioneDiversa`) REFERENCES `DESTINAZIONE_DIVERSA` (`id_destinazioneDiversa`);




ALTER TABLE `DOCUMENTO` ADD CONSTRAINT `PORTO_DOCUMENTO` 
    FOREIGN KEY (`id_porto`) REFERENCES `PORTO` (`id_porto`);

ALTER TABLE `DOCUMENTO` ADD CONSTRAINT `CONTATORE_DOCUMENTO` 
    FOREIGN KEY (`id_contatore`) REFERENCES `CONTATORE` (`id_contatore`);

ALTER TABLE `DOCUMENTO` ADD CONSTRAINT `CLIFOR_DOCUMENTO_LISTINO` 
    FOREIGN KEY (`id_cliforListino`) REFERENCES `CLIFOR` (`id_clifor`);

ALTER TABLE `DOCUMENTO` ADD CONSTRAINT `IVA_DOCUMENTO` 
    FOREIGN KEY (`id_ivaDoc`) REFERENCES `IVA` (`id_iva`);

ALTER TABLE `DOCUMENTO` ADD CONSTRAINT `MAG_FISICO_DOCUMENTO_PARTENZA_PARTENZA` 
    FOREIGN KEY (`id_magFisicoPartenza`) REFERENCES `MAG_FISICO` (`id_magFisico`);

ALTER TABLE `DOCUMENTO` ADD CONSTRAINT `MAG_FISICO_DOCUMENTO_ARRIVO_ARRIVO` 
    FOREIGN KEY (`id_magFisicoArrivo`) REFERENCES `MAG_FISICO` (`id_magFisico`);

ALTER TABLE `DOCUMENTO` ADD CONSTRAINT `BANCA_DOCUMENTO_ANTICIPO` 
    FOREIGN KEY (`id_bancaAnticipo`) REFERENCES `BANCA` (`id_banca`);

ALTER TABLE `DOCUMENTO` ADD CONSTRAINT `CLIFOR_DOCUMENTO_agente` 
    FOREIGN KEY (`id_agente`) REFERENCES `CLIFOR` (`id_clifor`);

ALTER TABLE `DOCUMENTO` ADD CONSTRAINT `CLIFOR_DOCUMENTO_RESP_COMM` 
    FOREIGN KEY (`id_respCommerciale`) REFERENCES `CLIFOR` (`id_clifor`);

ALTER TABLE `RIGA_DOCUMENTO` ADD CONSTRAINT `ARTICOLO_RIGA_DOCUMENTO` 
    FOREIGN KEY (`id_articolo`) REFERENCES `ARTICOLO` (`id_articolo`);

ALTER TABLE `RIGA_DOCUMENTO` ADD CONSTRAINT `DOCUMENTO_RIGA_DOCUMENTO` 
    FOREIGN KEY (`id_documento`) REFERENCES `DOCUMENTO` (`id_documento`);

ALTER TABLE `RIGA_DOCUMENTO` ADD CONSTRAINT `IVA_RIGA_DOCUMENTO` 
    FOREIGN KEY (`id_iva`) REFERENCES `IVA` (`id_iva`);

ALTER TABLE `RIGA_DOCUMENTO` ADD CONSTRAINT `ARTICOLO_VARIANTE_RIGA_DOCUMENTO` 
    FOREIGN KEY (`id_articoloVariante`) REFERENCES `ARTICOLO_VARIANTE` (`id_articoloVariante`);

ALTER TABLE `RIGA_DOCUMENTO` ADD CONSTRAINT `REPARTO_RIGA_DOCUMENTO` 
    FOREIGN KEY (`id_reparto`) REFERENCES `REPARTO` (`id_reparto`);

ALTER TABLE `RIGA_DOCUMENTO` ADD CONSTRAINT `DOCUMENTOpadre_RIGA_DOCUMENTO` 
    FOREIGN KEY (`id_documentoPadre`) REFERENCES `DOCUMENTO` (`id_documento`);

ALTER TABLE `RIGA_DOCUMENTO` ADD CONSTRAINT `RIGA_DOCUMENTO_RIGA_DOCUMENTO` 
    FOREIGN KEY (`id_rigaDocumentoPadre`) REFERENCES `RIGA_DOCUMENTO` (`id_rigaDocumento`);

ALTER TABLE `RIGA_DOCUMENTO` ADD CONSTRAINT `ARTICOLO_TAGLIA_RIGA_DOCUMENTO` 
    FOREIGN KEY (`id_articoloTaglia`) REFERENCES `ARTICOLO_TAGLIA` (`id_articoloTaglia`);

ALTER TABLE `RIGA_DOCUMENTO` ADD CONSTRAINT `CAUSALE_MAGAZZINO_RIGA_DOCUMENTO` 
    FOREIGN KEY (`id_causaleMagazzino`) REFERENCES `CAUSALE_MAGAZZINO` (`id_causaleMagazzino`);

ALTER TABLE `RIGA_DOCUMENTO` ADD CONSTRAINT `CLIFOR_RIGA_DOCUMENTO` 
    FOREIGN KEY (`id_clifor`) REFERENCES `CLIFOR` (`id_clifor`);

ALTER TABLE `RIGA_DOCUMENTO` ADD CONSTRAINT `MAG_FISICO_RIGA_DOCUMENTO` 
    FOREIGN KEY (`id_magFisico`) REFERENCES `MAG_FISICO` (`id_magFisico`);

ALTER TABLE `RIGA_DOCUMENTO` ADD CONSTRAINT `RIGA_DOCUMENTO_RIGA_DOCUMENTO_MOV` 
    FOREIGN KEY (`id_rigaDocumentoMov`) REFERENCES `RIGA_DOCUMENTO` (`id_rigaDocumento`);

ALTER TABLE `RIGA_DOCUMENTO` ADD CONSTRAINT `RIGA_DOCUMENTO_RIGA_DOCUMENTO_PRELEVATA` 
    FOREIGN KEY (`id_rigaDocumentoPrelevata`) REFERENCES `RIGA_DOCUMENTO` (`id_rigaDocumento`);

ALTER TABLE `RIGA_DOCUMENTO` ADD CONSTRAINT `PEZZA_RIGA_DOCUMENTO` 
    FOREIGN KEY (`id_pezza`, `id_articoloTessuto`) REFERENCES `PEZZA` (`id_pezza`,`id_articoloTessuto`);

ALTER TABLE `RIGA_DOCUMENTO` ADD CONSTRAINT `FASE_LAVORAZIONE_RIGA_DOCUMENTO` 
    FOREIGN KEY (`id_faseLavorazione`) REFERENCES `FASE_LAVORAZIONE` (`id_faseLavorazione`);

ALTER TABLE `RIGA_DOCUMENTO` ADD CONSTRAINT `ARTICOLO_FILATO_COLORE_RITORTO_RIGA_DOCUMENTO` 
    FOREIGN KEY (`id_articoloFilatoColoreRitorto`) REFERENCES `ARTICOLO_FILATO_COLORE_RITORTO` (`id_articoloFilatoColoreRitorto`);

ALTER TABLE `TIPO_DOCUMENTO` ADD CONSTRAINT `CONTATORE_TIPO_DOCUMENTO` 
    FOREIGN KEY (`id_contatore`) REFERENCES `CONTATORE` (`id_contatore`);

ALTER TABLE `TIPO_DOCUMENTO` ADD CONSTRAINT `TIPO_DOCUMENTO_TIPO_DOCUMENTO` 
    FOREIGN KEY (`id_tipoDocumentoFiglio`) REFERENCES `TIPO_DOCUMENTO` (`id_tipoDocumento`);

ALTER TABLE `TIPO_DOCUMENTO` ADD CONSTRAINT `CAUSALE_CONTABILE_TIPO_DOCUMENTO` 
    FOREIGN KEY (`id_causaleContabile`) REFERENCES `CAUSALE_CONTABILE` (`id_causaleContabile`);

ALTER TABLE `TIPO_DOCUMENTO` ADD CONSTRAINT `CAUSALE_MAGAZZINO_TIPO_DOCUMENTO` 
    FOREIGN KEY (`id_causaleMagazzino`) REFERENCES `CAUSALE_MAGAZZINO` (`id_causaleMagazzino`);

ALTER TABLE `IVA` ADD CONSTRAINT `PIANO_CONTI_IVA` 
    FOREIGN KEY (`id_pianoConti`) REFERENCES `PIANO_CONTI` (`id_pianoConti`);

ALTER TABLE `VETTORE` ADD CONSTRAINT `COMUNE_VETTORE` 
    FOREIGN KEY (`id_comune`) REFERENCES `COMUNE` (`id_comune`);

ALTER TABLE `CLIFOR_USERS` ADD CONSTRAINT `CLIFOR_CLIFOR_USERS` 
    FOREIGN KEY (`id_clifor`) REFERENCES `CLIFOR` (`id_clifor`);

ALTER TABLE `COMUNE` ADD CONSTRAINT `REGIONE_COMUNE` 
    FOREIGN KEY (`id_regione`) REFERENCES `REGIONE` (`id_regione`);

ALTER TABLE `COMUNE` ADD CONSTRAINT `ZONA_COMUNE` 
    FOREIGN KEY (`id_zona`) REFERENCES `ZONA` (`id_zona`);

ALTER TABLE `REGIONE` ADD CONSTRAINT `NAZIONE_REGIONE` 
    FOREIGN KEY (`id_nazione`) REFERENCES `NAZIONE` (`id_nazione`);

ALTER TABLE `NEWS` ADD CONSTRAINT `TIPO_NEWS_NEWS` 
    FOREIGN KEY (`id_tipoNews`) REFERENCES `TIPO_NEWS` (`id_tipoNews`);

ALTER TABLE `ALLEGATO_NEWS` ADD CONSTRAINT `NEWS_ALLEGATO_NEWS` 
    FOREIGN KEY (`id_news`) REFERENCES `NEWS` (`id_news`);

ALTER TABLE `TAGLIA` ADD CONSTRAINT `TIPO_TAGLIA_TAGLIA` 
    FOREIGN KEY (`id_tipoTaglia`) REFERENCES `TIPO_TAGLIA` (`id_tipoTaglia`);

ALTER TABLE `ARTICOLO_VARIANTE` ADD CONSTRAINT `ARTICOLO_ARTICOLO_VARIANTE` 
    FOREIGN KEY (`id_articolo`) REFERENCES `ARTICOLO` (`id_articolo`);

ALTER TABLE `ARTICOLO_VARIANTE` ADD CONSTRAINT `VETRINA_ARTICOLO_VARIANTE` 
    FOREIGN KEY (`id_vetrina`) REFERENCES `VETRINA` (`id_vetrina`);

ALTER TABLE `ARTICOLO_FORNITORE` ADD CONSTRAINT `ARTICOLO_ARTICOLO_FORNITORE` 
    FOREIGN KEY (`id_articolo`) REFERENCES `ARTICOLO` (`id_articolo`);

ALTER TABLE `ARTICOLO_FORNITORE` ADD CONSTRAINT `CLIFOR_ARTICOLO_FORNITORE` 
    FOREIGN KEY (`id_clifor`) REFERENCES `CLIFOR` (`id_clifor`);

ALTER TABLE `ALLEGATO_ARTICOLO` ADD CONSTRAINT `ARTICOLO_ALLEGATO_ARTICOLO` 
    FOREIGN KEY (`id_articolo`) REFERENCES `ARTICOLO` (`id_articolo`);

ALTER TABLE `ALLEGATO_ARTICOLO` ADD CONSTRAINT `TIPO_ALLEGATO_ARTICOLO_ALLEGATO_ARTICOLO` 
    FOREIGN KEY (`id_tipoAllegatoArticolo`) REFERENCES `TIPO_ALLEGATO_ARTICOLO` (`id_tipoAllegatoArticolo`);

ALTER TABLE `TABELLA_TAGLIA` ADD CONSTRAINT `TIPO_TAGLIA_TABELLA_TAGLIA` 
    FOREIGN KEY (`id_tipoTaglia`) REFERENCES `TIPO_TAGLIA` (`id_tipoTaglia`);

ALTER TABLE `TAGLIA_MISURE` ADD CONSTRAINT `TABELLA_TAGLIA_TAGLIA_MISURE` 
    FOREIGN KEY (`id_tabellaTaglia`) REFERENCES `TABELLA_TAGLIA` (`id_tabellaTaglia`);

ALTER TABLE `BANNER_STATS` ADD CONSTRAINT `BANNER_BANNER_STATS` 
    FOREIGN KEY (`id_banner`) REFERENCES `BANNER` (`id_banner`);

ALTER TABLE `BANNER` ADD CONSTRAINT `TIPO_BANNER_BANNER` 
    FOREIGN KEY (`id_tipoBanner`) REFERENCES `TIPO_BANNER` (`id_tipoBanner`);

ALTER TABLE `BANNER` ADD CONSTRAINT `CLIFOR_BANNER` 
    FOREIGN KEY (`id_clifor`) REFERENCES `CLIFOR` (`id_clifor`);

ALTER TABLE `CAUSALE_MAGAZZINO` ADD CONSTRAINT `MAG_FISICO_CAUSALE_MAGAZZINO_part` 
    FOREIGN KEY (`id_magFisicoPartenza`) REFERENCES `MAG_FISICO` (`id_magFisico`);

ALTER TABLE `CAUSALE_MAGAZZINO` ADD CONSTRAINT `MAG_FISICO_CAUSALE_MAGAZZINO_arr` 
    FOREIGN KEY (`id_magFisicoArrivo`) REFERENCES `MAG_FISICO` (`id_magFisico`);

ALTER TABLE `DESTINAZIONE_DIVERSA` ADD CONSTRAINT `CLIFOR_DESTINAZIONE_DIVERSA` 
    FOREIGN KEY (`id_clifor`) REFERENCES `CLIFOR` (`id_clifor`);

ALTER TABLE `DESTINAZIONE_DIVERSA` ADD CONSTRAINT `NAZIONE_DESTINAZIONE_DIVERSA` 
    FOREIGN KEY (`id_nazioneDD`) REFERENCES `NAZIONE` (`id_nazione`);

ALTER TABLE `DESTINAZIONE_DIVERSA` ADD CONSTRAINT `COMUNE_DESTINAZIONE_DIVERSA` 
    FOREIGN KEY (`id_comuneDD`) REFERENCES `COMUNE` (`id_comune`);

ALTER TABLE `LISTINO_PERS` ADD CONSTRAINT `ARTICOLO_LISTINO_PERS` 
    FOREIGN KEY (`id_articolo`) REFERENCES `ARTICOLO` (`id_articolo`);

ALTER TABLE `LISTINO_PERS` ADD CONSTRAINT `CLIFOR_LISTINO_PERS` 
    FOREIGN KEY (`id_clifor`) REFERENCES `CLIFOR` (`id_clifor`);

ALTER TABLE `LISTINO_PERS` ADD CONSTRAINT `TIPO_LISTINO_PERS` 
    FOREIGN KEY (`id_tipo`) REFERENCES `TIPO` (`id_tipo`);

ALTER TABLE `POSTAZIONE` ADD CONSTRAINT `REG_CASSA_POSTAZIONE` 
    FOREIGN KEY (`id_regCassa`) REFERENCES `REG_CASSA` (`id_regCassa`);

ALTER TABLE `POSTAZIONE` ADD CONSTRAINT `TIPO_POSTAZIONE_POSTAZIONE` 
    FOREIGN KEY (`id_tipoPostazione`) REFERENCES `TIPO_POSTAZIONE` (`id_tipoPostazione`);

ALTER TABLE `DOC_PREL` ADD CONSTRAINT `TIPO_DOCUMENTO_DOC_PREL_prel` 
    FOREIGN KEY (`id_tipoDocumentoPrel`) REFERENCES `TIPO_DOCUMENTO` (`id_tipoDocumento`);

ALTER TABLE `DOC_PREL` ADD CONSTRAINT `TIPO_DOCUMENTO_DOC_PREL` 
    FOREIGN KEY (`id_tipoDocumento`) REFERENCES `TIPO_DOCUMENTO` (`id_tipoDocumento`);

ALTER TABLE `RIGA_DOCUMENTO_P` ADD CONSTRAINT `RIGA_DOCUMENTO_RIGA_DOCUMENTO_P_PRELEVATA` 
    FOREIGN KEY (`id_rigaDocumentoPrelevata`) REFERENCES `RIGA_DOCUMENTO` (`id_rigaDocumento`);

ALTER TABLE `RIGA_DOCUMENTO_P` ADD CONSTRAINT `RIGA_DOCUMENTO_RIGA_DOCUMENTO_P` 
    FOREIGN KEY (`id_rigaDocumento`) REFERENCES `RIGA_DOCUMENTO` (`id_rigaDocumento`);

ALTER TABLE `RIVALUTAZIONE` ADD CONSTRAINT `ARTICOLO_RIVALUTAZIONE` 
    FOREIGN KEY (`id_articolo`) REFERENCES `ARTICOLO` (`id_articolo`);

ALTER TABLE `CODA_MESSAGGI` ADD CONSTRAINT `TEMPLATE_MSG_CODA_MESSAGGI` 
    FOREIGN KEY (`id_templateMsg`) REFERENCES `TEMPLATE_MSG` (`id_templateMsg`);

ALTER TABLE `CONTRATTO` ADD CONSTRAINT `TIPO_CONTRATTO_CONTRATTO` 
    FOREIGN KEY (`id_tipoContratto`) REFERENCES `TIPO_CONTRATTO` (`id_tipoContratto`);

ALTER TABLE `CONTRATTO` ADD CONSTRAINT `CLIFOR_CONTRATTO` 
    FOREIGN KEY (`id_clifor`) REFERENCES `CLIFOR` (`id_clifor`);

ALTER TABLE `DOC_FIGLIO_PADRE` ADD CONSTRAINT `DOCUMENTO_DOC_FIGLIO_PADRE_PADRE` 
    FOREIGN KEY (`id_documentoPadre`) REFERENCES `DOCUMENTO` (`id_documento`);

ALTER TABLE `DOC_FIGLIO_PADRE` ADD CONSTRAINT `DOCUMENTO_DOC_FIGLIO_PADRE_figlio` 
    FOREIGN KEY (`id_documentoFiglio`) REFERENCES `DOCUMENTO` (`id_documento`);

ALTER TABLE `LISTINO_SERVIZI_PERS` ADD CONSTRAINT `ARTICOLO_LISTINO_SERVIZI_PERS` 
    FOREIGN KEY (`id_articolo`) REFERENCES `ARTICOLO` (`id_articolo`);

ALTER TABLE `LISTINO_SERVIZI_PERS` ADD CONSTRAINT `CLIFOR_LISTINO_SERVIZI_PERS` 
    FOREIGN KEY (`id_clifor`) REFERENCES `CLIFOR` (`id_clifor`);

ALTER TABLE `LISTINO_SERVIZI_PERS` ADD CONSTRAINT `ASPETTO_LISTINO_SERVIZI_PERS` 
    FOREIGN KEY (`id_aspetto`) REFERENCES `ASPETTO` (`id_aspetto`);

ALTER TABLE `ALLEGATO_CLIFOR` ADD CONSTRAINT `CLIFOR_ALLEGATO_CLIFOR` 
    FOREIGN KEY (`id_clifor`) REFERENCES `CLIFOR` (`id_clifor`);

ALTER TABLE `ALLEGATO_CLIFOR` ADD CONSTRAINT `TIPO_ALLEGATO_CLIFOR_ALLEGATO_CLIFOR` 
    FOREIGN KEY (`id_tipoAllegatoClifor`) REFERENCES `TIPO_ALLEGATO_CLIFOR` (`id_tipoAllegatoClifor`);

ALTER TABLE `ALLEGATO_DOCUMENTO` ADD CONSTRAINT `DOCUMENTO_ALLEGATO_DOCUMENTO` 
    FOREIGN KEY (`id_documento`) REFERENCES `DOCUMENTO` (`id_documento`);

ALTER TABLE `ALLEGATO_DOCUMENTO` ADD CONSTRAINT `TIPO_ALLEGATO_DOCUMENTO_ALLEGATO_DOCUMENTO` 
    FOREIGN KEY (`id_tipoAllegatoDocumento`) REFERENCES `TIPO_ALLEGATO_DOCUMENTO` (`id_tipoAllegatoDocumento`);

ALTER TABLE `ALLEGATO_TEMPLATE_MSG` ADD CONSTRAINT `TEMPLATE_MSG_ALLEGATO_TEMPLATE_MSG` 
    FOREIGN KEY (`id_templateMsg`) REFERENCES `TEMPLATE_MSG` (`id_templateMsg`);

ALTER TABLE `ALLEGATO_CODA_MESSAGGI` ADD CONSTRAINT `CODA_MESSAGGI_ALLEGATO_CODA_MESSAGGI` 
    FOREIGN KEY (`id_codaMessaggi`) REFERENCES `CODA_MESSAGGI` (`id_codaMessaggi`);

ALTER TABLE `LISTINO_TIPO` ADD CONSTRAINT `TIPO_LISTINO_TIPO` 
    FOREIGN KEY (`id_tipo`) REFERENCES `TIPO` (`id_tipo`);

ALTER TABLE `LISTINO_TIPO` ADD CONSTRAINT `LISTINO_LISTINO_TIPO` 
    FOREIGN KEY (`id_listino`) REFERENCES `LISTINO` (`id_listino`);

ALTER TABLE `ARTICOLO_TAGLIA` ADD CONSTRAINT `ARTICOLO_ARTICOLO_TAGLIA` 
    FOREIGN KEY (`id_articolo`) REFERENCES `ARTICOLO` (`id_articolo`);

ALTER TABLE `ARTICOLO_TAGLIA` ADD CONSTRAINT `ARTICOLO_VARIANTE_ARTICOLO_TAGLIA` 
    FOREIGN KEY (`id_articoloVariante`) REFERENCES `ARTICOLO_VARIANTE` (`id_articoloVariante`);

ALTER TABLE `ARTICOLO_TAGLIA` ADD CONSTRAINT `TAGLIA_ARTICOLO_TAGLIA` 
    FOREIGN KEY (`id_taglia`) REFERENCES `TAGLIA` (`id_taglia`);

ALTER TABLE `ARTICOLO_COMPONENTE` ADD CONSTRAINT `COMPONENTE_ARTICOLO_COMPONENTE` 
    FOREIGN KEY (`id_componente`) REFERENCES `COMPONENTE` (`id_componente`);

ALTER TABLE `ARTICOLO_COMPONENTE` ADD CONSTRAINT `ARTICOLO_COMPOSIZIONE` 
    FOREIGN KEY (`id_articolo`) REFERENCES `ARTICOLO` (`id_articolo`);

ALTER TABLE `LISTINO_ARTICOLO` ADD CONSTRAINT `LISTINO_LISTINO_ARTICOLO` 
    FOREIGN KEY (`id_listino`) REFERENCES `LISTINO` (`id_listino`);

ALTER TABLE `LISTINO_ARTICOLO` ADD CONSTRAINT `ARTICOLO_LISTINO_ARTICOLO` 
    FOREIGN KEY (`id_articolo`) REFERENCES `ARTICOLO` (`id_articolo`);

ALTER TABLE `LISTINO_ARTICOLO` ADD CONSTRAINT `ARTICOLO_VARIANTE_LISTINO_ARTICOLO` 
    FOREIGN KEY (`id_articoloVariante`) REFERENCES `ARTICOLO_VARIANTE` (`id_articoloVariante`);

ALTER TABLE `DOCUMENTO_AGENTE` ADD CONSTRAINT `DOCUMENTO_DOCUMENTO_AGENTE` 
    FOREIGN KEY (`id_documento`) REFERENCES `DOCUMENTO` (`id_documento`);

ALTER TABLE `DOCUMENTO_AGENTE` ADD CONSTRAINT `CLIFOR_DOCUMENTO_AGENTE_agente` 
    FOREIGN KEY (`id_clifor`) REFERENCES `CLIFOR` (`id_clifor`);

ALTER TABLE `CLIFOR_ARTICOLO` ADD CONSTRAINT `CLIFOR_CLIFOR_ARTICOLO` 
    FOREIGN KEY (`id_progettista`) REFERENCES `CLIFOR` (`id_clifor`);

ALTER TABLE `CLIFOR_ARTICOLO` ADD CONSTRAINT `ARTICOLO_CLIFOR_ARTICOLO` 
    FOREIGN KEY (`id_articolo`) REFERENCES `ARTICOLO` (`id_articolo`);

ALTER TABLE `RIGA_DOCUMENTO_PROGETTISTA` ADD CONSTRAINT `RIGA_DOCUMENTO_RIGA_DOCUMENTO_PROGETTISTA` 
    FOREIGN KEY (`id_rigaDocumento`) REFERENCES `RIGA_DOCUMENTO` (`id_rigaDocumento`);

ALTER TABLE `RIGA_DOCUMENTO_PROGETTISTA` ADD CONSTRAINT `ARTICOLO_RIGA_DOCUMENTO_PROGETTISTA` 
    FOREIGN KEY (`id_articolo`) REFERENCES `ARTICOLO` (`id_articolo`);

ALTER TABLE `RIGA_DOCUMENTO_PROGETTISTA` ADD CONSTRAINT `CLIFOR_RIGA_DOCUMENTO_PROGETTISTA` 
    FOREIGN KEY (`id_clifor`) REFERENCES `CLIFOR` (`id_clifor`);

ALTER TABLE `RIGA_DOCUMENTO_P_M` ADD CONSTRAINT `RIGA_DOCUMENTO_RIGA_DOCUMENTO_P_M_PRELEVATA` 
    FOREIGN KEY (`id_rigaDocumentoPrelevata`) REFERENCES `RIGA_DOCUMENTO` (`id_rigaDocumento`);

ALTER TABLE `RIGA_DOCUMENTO_P_M` ADD CONSTRAINT `RIGA_DOCUMENTO_RIGA_DOCUMENTO_P_M` 
    FOREIGN KEY (`id_rigaDocumento`) REFERENCES `RIGA_DOCUMENTO` (`id_rigaDocumento`);

ALTER TABLE `MOVIMENTO` ADD CONSTRAINT `RIGA_DOCUMENTO_MOVIMENTO` 
    FOREIGN KEY (`id_rigaDocumento`) REFERENCES `RIGA_DOCUMENTO` (`id_rigaDocumento`);

ALTER TABLE `MOVIMENTO` ADD CONSTRAINT `ARTICOLO_MOVIMENTO` 
    FOREIGN KEY (`id_articolo`) REFERENCES `ARTICOLO` (`id_articolo`);

ALTER TABLE `MOVIMENTO` ADD CONSTRAINT `ARTICOLO_VARIANTE_MOVIMENTO` 
    FOREIGN KEY (`id_articoloVariante`) REFERENCES `ARTICOLO_VARIANTE` (`id_articoloVariante`);

ALTER TABLE `MOVIMENTO` ADD CONSTRAINT `ARTICOLO_TAGLIA_MOVIMENTO` 
    FOREIGN KEY (`id_articoloTaglia`) REFERENCES `ARTICOLO_TAGLIA` (`id_articoloTaglia`);

ALTER TABLE `MOVIMENTO` ADD CONSTRAINT `MAG_FISICO_MOVIMENTO` 
    FOREIGN KEY (`id_magFisico`) REFERENCES `MAG_FISICO` (`id_magFisico`);

ALTER TABLE `MOVIMENTO` ADD CONSTRAINT `CLIFOR_MOVIMENTO` 
    FOREIGN KEY (`id_clifor`) REFERENCES `CLIFOR` (`id_clifor`);

ALTER TABLE `MOVIMENTO` ADD CONSTRAINT `RIGA_DOCUMENTO_P_MOVIMENTO` 
    FOREIGN KEY (`id_rigaDocumentoP`) REFERENCES `RIGA_DOCUMENTO_P` (`id_rigaDocumentoP`);

ALTER TABLE `MOVIMENTO` ADD CONSTRAINT `CAUSALE_MAGAZZINO_MOVIMENTO` 
    FOREIGN KEY (`id_causaleMagazzino`) REFERENCES `CAUSALE_MAGAZZINO` (`id_causaleMagazzino`);

ALTER TABLE `CLIFOR_TIPO_CLIFOR` ADD CONSTRAINT `CLIFOR_CLIFOR_TIPO_CLIFOR` 
    FOREIGN KEY (`id_clifor`) REFERENCES `CLIFOR` (`id_clifor`);

ALTER TABLE `CLIFOR_TIPO_CLIFOR` ADD CONSTRAINT `TIPO_CLIFOR_CLIFOR_TIPO_CLIFOR` 
    FOREIGN KEY (`id_tipoClifor`) REFERENCES `TIPO_CLIFOR` (`id_tipoClifor`);

ALTER TABLE `MAIL_NEWSLETTER` ADD CONSTRAINT `TEMPLATE_MSG_MAIL_NEWSLETTER` 
    FOREIGN KEY (`id_templateMsg`) REFERENCES `TEMPLATE_MSG` (`id_templateMsg`);



ALTER TABLE `USER_CLIFOR` ADD CONSTRAINT `CLIFOR_USER_CLIFOR` 
    FOREIGN KEY (`id_clifor`) REFERENCES `CLIFOR` (`id_clifor`);

ALTER TABLE `NEWS_USERS` ADD CONSTRAINT `NEWS_NEWS_USERS` 
    FOREIGN KEY (`id_news`) REFERENCES `NEWS` (`id_news`);



ALTER TABLE `INCASSO_PAGAMENTO` ADD CONSTRAINT `DOCUMENTO_INCASSO_PAGAMENTO` 
    FOREIGN KEY (`id_documento`) REFERENCES `DOCUMENTO` (`id_documento`);

ALTER TABLE `INCASSO_PAGAMENTO` ADD CONSTRAINT `MOVIMENTO_INCASSO_PAGAMENTO` 
    FOREIGN KEY (`id_movimento`) REFERENCES `MOVIMENTO` (`id_movimento`);

ALTER TABLE `BANCA` ADD CONSTRAINT `PIANO_CONTI_BANCA` 
    FOREIGN KEY (`id_pianoConti`) REFERENCES `PIANO_CONTI` (`id_pianoConti`);

ALTER TABLE `BANCA` ADD CONSTRAINT `ABI_CAB_BANCA` 
    FOREIGN KEY (`id_abiCab`) REFERENCES `ABI_CAB` (`id_abiCab`);

ALTER TABLE `DOCUMENTO_PAGAMENTO` ADD CONSTRAINT `DOCUMENTO_DOCUMENTO_PAGAMENTO` 
    FOREIGN KEY (`id_documento`) REFERENCES `DOCUMENTO` (`id_documento`);

ALTER TABLE `DOCUMENTO_PAGAMENTO` ADD CONSTRAINT `TIPO_PAGAMENTO_DOCUMENTO_PAGAMENTO` 
    FOREIGN KEY (`id_tipoPagamento`) REFERENCES `TIPO_PAGAMENTO` (`id_tipoPagamento`);

ALTER TABLE `MOV_CONTABILE` ADD CONSTRAINT `CAUSALE_CONTABILE_MOV_CONTABILE` 
    FOREIGN KEY (`id_causaleContabile`) REFERENCES `CAUSALE_CONTABILE` (`id_causaleContabile`);

ALTER TABLE `RIGA_MOV_CONTABILE` ADD CONSTRAINT `MOV_CONTABILE_RIGA_MOV_CONTABILE` 
    FOREIGN KEY (`id_movContabile`) REFERENCES `MOV_CONTABILE` (`id_movContabile`);

ALTER TABLE `RIGA_MOV_CONTABILE` ADD CONSTRAINT `PIANO_CONTI_RIGA_MOV_CONTABILE` 
    FOREIGN KEY (`id_pianoConti`) REFERENCES `PIANO_CONTI` (`id_pianoConti`);

ALTER TABLE `RIGA_MOV_CONTABILE` ADD CONSTRAINT `CLIFOR_RIGA_MOV_CONTABILE` 
    FOREIGN KEY (`id_clifor`) REFERENCES `CLIFOR` (`id_clifor`);

ALTER TABLE `RIGA_MOV_CONTABILE` ADD CONSTRAINT `BANCA_RIGA_MOV_CONTABILE` 
    FOREIGN KEY (`id_banca`) REFERENCES `BANCA` (`id_banca`);

ALTER TABLE `RIGA_MOV_CONTABILE` ADD CONSTRAINT `DOCUMENTO_RIGA_MOV_CONTABILE` 
    FOREIGN KEY (`id_documento`) REFERENCES `DOCUMENTO` (`id_documento`);

ALTER TABLE `RIGA_MOV_CONTABILE` ADD CONSTRAINT `IVA_RIGA_MOV_CONTABILE` 
    FOREIGN KEY (`id_iva`) REFERENCES `IVA` (`id_iva`);

ALTER TABLE `RIGA_CAUSALE_CONTABILE` ADD CONSTRAINT `PIANO_CONTI_RIGA_CAUSALE_CONTABILE` 
    FOREIGN KEY (`id_pianoConti`) REFERENCES `PIANO_CONTI` (`id_pianoConti`);

ALTER TABLE `RIGA_CAUSALE_CONTABILE` ADD CONSTRAINT `CAUSALE_CONTABILE_RIGA_CAUSALE_CONTABILE` 
    FOREIGN KEY (`id_causaleContabile`) REFERENCES `CAUSALE_CONTABILE` (`id_causaleContabile`);

ALTER TABLE `DOCUMENTO_SCADENZA` ADD CONSTRAINT `DOCUMENTO_DOCUMENTO_SCADENZA` 
    FOREIGN KEY (`id_documento`) REFERENCES `DOCUMENTO` (`id_documento`);

ALTER TABLE `DOCUMENTO_SCADENZA` ADD CONSTRAINT `DISTINTA_RIBA_DOCUMENTO_SCADENZA` 
    FOREIGN KEY (`id_distintaRiba`) REFERENCES `DISTINTA_RIBA` (`id_distintaRiba`);

ALTER TABLE `DISTINTA_RIBA` ADD CONSTRAINT `BANCA_DISTINTA_RIBA` 
    FOREIGN KEY (`id_banca`) REFERENCES `BANCA` (`id_banca`);

ALTER TABLE `MESE_ESCLUSO` ADD CONSTRAINT `TIPO_PAGAMENTO_MESE_ESCLUSO` 
    FOREIGN KEY (`id_tipoPagamento`) REFERENCES `TIPO_PAGAMENTO` (`id_tipoPagamento`);

ALTER TABLE `ARTICOLO_PROGETTISTA` ADD CONSTRAINT `ARTICOLO_ARTICOLO_PROGETTISTA` 
    FOREIGN KEY (`id_articolo`) REFERENCES `ARTICOLO` (`id_articolo`);

ALTER TABLE `ARTICOLO_PROGETTISTA` ADD CONSTRAINT `CLIFOR_ARTICOLO_PROGETTISTA` 
    FOREIGN KEY (`id_clifor`) REFERENCES `CLIFOR` (`id_clifor`);

ALTER TABLE `CONTATTO` ADD CONSTRAINT `CLIFOR_CONTATTO` 
    FOREIGN KEY (`id_clifor`) REFERENCES `CLIFOR` (`id_clifor`);

ALTER TABLE `ARTICOLO_ARTICOLO_COMPONENTE` ADD CONSTRAINT `ARTICOLO_COMP` 
    FOREIGN KEY (`id_articoloComponente`) REFERENCES `ARTICOLO` (`id_articolo`);

ALTER TABLE `ARTICOLO_ARTICOLO_COMPONENTE` ADD CONSTRAINT `ARTICOLO_PRINCIPALE` 
    FOREIGN KEY (`id_articolo`) REFERENCES `ARTICOLO` (`id_articolo`);

ALTER TABLE `PEZZA` ADD CONSTRAINT `TELA_PEZZA` 
    FOREIGN KEY (`id_tela`) REFERENCES `TELA` (`id_tela`);

ALTER TABLE `PEZZA` ADD CONSTRAINT `ARTICOLO_TESSUTO_PEZZA` 
    FOREIGN KEY (`id_articoloTessuto`) REFERENCES `ARTICOLO_TESSUTO` (`id_articoloTessuto`);

ALTER TABLE `PEZZA` ADD CONSTRAINT `FASE_LAVORAZIONE_PEZZA` 
    FOREIGN KEY (`id_faseLavorazione`) REFERENCES `FASE_LAVORAZIONE` (`id_faseLavorazione`);

ALTER TABLE `PEZZA` ADD CONSTRAINT `RIGA_DOCUMENTO_PEZZA` 
    FOREIGN KEY (`id_rigaDocumento`) REFERENCES `RIGA_DOCUMENTO` (`id_rigaDocumento`);

ALTER TABLE `ARTICOLO_FILATO_COLORE_RITORTO` ADD CONSTRAINT `COLORE_FILATO_ARTICOLO_FILATO_COLORE_RITORTO_TESTATA` 
    FOREIGN KEY (`id_coloreFilatoTestata`) REFERENCES `COLORE_FILATO` (`id_coloreFilato`);

ALTER TABLE `ARTICOLO_FILATO_COLORE_RITORTO` ADD CONSTRAINT `COLORE_FILATO_ARTICOLO_FILATO_COLORE_RITORTO` 
    FOREIGN KEY (`id_coloreFilato`) REFERENCES `COLORE_FILATO` (`id_coloreFilato`);

ALTER TABLE `ARTICOLO_FILATO_COLORE_RITORTO` ADD CONSTRAINT `ARTICOLO_FILATO_ARTICOLO_FILATO_COLORE_RITORTO_TESTATA` 
    FOREIGN KEY (`id_articoloFilatoTestata`) REFERENCES `ARTICOLO_FILATO` (`id_articoloFilato`);

ALTER TABLE `ARTICOLO_FILATO_COLORE_RITORTO` ADD CONSTRAINT `ARTICOLO_FILATO_ARTICOLO_FILATO_COLORE_RITORTO` 
    FOREIGN KEY (`id_articoloFilato`) REFERENCES `ARTICOLO_FILATO` (`id_articoloFilato`);

ALTER TABLE `ARTICOLO_FILATO_COLORE` ADD CONSTRAINT `COLORE_FILATO_ARTICOLO_FILATO_COLORE` 
    FOREIGN KEY (`id_coloreFilato`) REFERENCES `COLORE_FILATO` (`id_coloreFilato`);

ALTER TABLE `ARTICOLO_FILATO` ADD CONSTRAINT `IVA_ARTICOLO_FILATO` 
    FOREIGN KEY (`id_iva`) REFERENCES `IVA` (`id_iva`);

ALTER TABLE `ARTICOLO_FILATO` ADD CONSTRAINT `TIPO_ARTICOLO_FILATO` 
    FOREIGN KEY (`id_tipo`) REFERENCES `TIPO` (`id_tipo`);

ALTER TABLE `ARTICOLO_FILATO_FORNITORE` ADD CONSTRAINT `ARTICOLO_FILATO_ARTICOLO_FILATO_FORNITORE` 
    FOREIGN KEY (`id_articoloFilato`) REFERENCES `ARTICOLO_FILATO` (`id_articoloFilato`);

ALTER TABLE `ARTICOLO_FILATO_FORNITORE` ADD CONSTRAINT `CLIFOR_ARTICOLO_FILATO_FORNITORE` 
    FOREIGN KEY (`id_clifor`) REFERENCES `CLIFOR` (`id_clifor`);

ALTER TABLE `COLORE_FILATO_FORNITORE` ADD CONSTRAINT `COLORE_FILATO_COLORE_FILATO_FORNITORE` 
    FOREIGN KEY (`id_coloreFilato`) REFERENCES `COLORE_FILATO` (`id_coloreFilato`);

ALTER TABLE `COLORE_FILATO_FORNITORE` ADD CONSTRAINT `CLIFOR_COLORE_FILATO_FORNITORE` 
    FOREIGN KEY (`id_clifor`) REFERENCES `CLIFOR` (`id_clifor`);

ALTER TABLE `ARTICOLO_FILATO_COMPONENTE` ADD CONSTRAINT `COMPONENTE_ARTICOLO_FILATO_COMPONENTE` 
    FOREIGN KEY (`id_componente`) REFERENCES `COMPONENTE` (`id_componente`);

ALTER TABLE `ARTICOLO_FILATO_COMPONENTE` ADD CONSTRAINT `ARTICOLO_FILATO_ARTICOLO_FILATO_COMPONENTE` 
    FOREIGN KEY (`id_articoloFilato`) REFERENCES `ARTICOLO_FILATO` (`id_articoloFilato`);

ALTER TABLE `ARTICOLO_TESSUTO` ADD CONSTRAINT `ARTICOLO_TESSUTO_ARTICOLO_TESSUTO_padre` 
    FOREIGN KEY (`id_articoloTessutoPadre`) REFERENCES `ARTICOLO_TESSUTO` (`id_articoloTessuto`);

ALTER TABLE `ARTICOLO_TESSUTO` ADD CONSTRAINT `RINCORSO_ARTICOLO_TESSUTO` 
    FOREIGN KEY (`id_rincorso`) REFERENCES `RINCORSO` (`id_rincorso`);

ALTER TABLE `ARTICOLO_TESSUTO` ADD CONSTRAINT `ARMATURA_ARTICOLO_TESSUTO` 
    FOREIGN KEY (`id_armatura`) REFERENCES `ARMATURA` (`id_armatura`);

ALTER TABLE `ARTICOLO_TESSUTO` ADD CONSTRAINT `IVA_ARTICOLO_TESSUTO` 
    FOREIGN KEY (`id_iva`) REFERENCES `IVA` (`id_iva`);

ALTER TABLE `ARTICOLO_TESSUTO` ADD CONSTRAINT `STAGIONE_ARTICOLO_TESSUTO` 
    FOREIGN KEY (`id_stagione`) REFERENCES `STAGIONE` (`id_stagione`);

ALTER TABLE `ARTICOLO_TESSUTO` ADD CONSTRAINT `TIPO_ARTICOLO_TESSUTO` 
    FOREIGN KEY (`id_tipo`) REFERENCES `TIPO` (`id_tipo`);

ALTER TABLE `ARTICOLO_TESSUTO_FILATO` ADD CONSTRAINT `ARTICOLO_TESSUTO_ARTICOLO_TESSUTO_FILATO` 
    FOREIGN KEY (`id_articoloTessuto`) REFERENCES `ARTICOLO_TESSUTO` (`id_articoloTessuto`);

ALTER TABLE `ARTICOLO_TESSUTO_FILATO` ADD CONSTRAINT `ARTICOLO_FILATO_COLORE_ARTICOLO_TESSUTO_FILATO` 
    FOREIGN KEY (`id_articoloFilatoColore`) REFERENCES `ARTICOLO_FILATO_COLORE` (`id_articoloFilatoColore`);

ALTER TABLE `ARTICOLO_TESSUTO_ACCOPPIATO` ADD CONSTRAINT `ARTICOLO_TESSUTO_ARTICOLO_TESSUTO_ACCOPPIATO_COMPONENTE` 
    FOREIGN KEY (`id_articoloTessutoComponente`) REFERENCES `ARTICOLO_TESSUTO` (`id_articoloTessuto`);

ALTER TABLE `ARTICOLO_TESSUTO_ACCOPPIATO` ADD CONSTRAINT `ARTICOLO_TESSUTO_ARTICOLO_TESSUTO_ACCOPPIATO` 
    FOREIGN KEY (`id_articoloTessuto`) REFERENCES `ARTICOLO_TESSUTO` (`id_articoloTessuto`);

ALTER TABLE `ARTICOLO_TESSUTO_COMPONENTE` ADD CONSTRAINT `COMPONENTE_ARTICOLO_TESSUTO_COMPONENTE` 
    FOREIGN KEY (`id_componente`) REFERENCES `COMPONENTE` (`id_componente`);

ALTER TABLE `ARTICOLO_TESSUTO_COMPONENTE` ADD CONSTRAINT `ARTICOLO_TESSUTO_ARTICOLO_TESSUTO_COMPONENTE` 
    FOREIGN KEY (`id_articoloTessuto`) REFERENCES `ARTICOLO_TESSUTO` (`id_articoloTessuto`);

ALTER TABLE `ARMATURA_DETTAGLIO` ADD CONSTRAINT `ARMATURA_ARMATURA_DETTAGLIO` 
    FOREIGN KEY (`id_armatura`) REFERENCES `ARMATURA` (`id_armatura`);

ALTER TABLE `TELA` ADD CONSTRAINT `ARTICOLO_TESSUTO_TELA` 
    FOREIGN KEY (`id_articoloTessuto`) REFERENCES `ARTICOLO_TESSUTO` (`id_articoloTessuto`);

ALTER TABLE `TELA` ADD CONSTRAINT `RIGA_DOCUMENTO_TELA` 
    FOREIGN KEY (`id_rigaDocumento`) REFERENCES `RIGA_DOCUMENTO` (`id_rigaDocumento`);

ALTER TABLE `TELA` ADD CONSTRAINT `CLIFOR_TELA_TESSITURA` 
    FOREIGN KEY (`id_cliforTessitura`) REFERENCES `CLIFOR` (`id_clifor`);

ALTER TABLE `TELA` ADD CONSTRAINT `CLIFOR_TELA_ORDITURA` 
    FOREIGN KEY (`id_cliforOrditura`) REFERENCES `CLIFOR` (`id_clifor`);

ALTER TABLE `ARTICOLO_TESSUTO_LAVORAZIONE` ADD CONSTRAINT `ARTICOLO_TESSUTO_ARTICOLO_TESSUTO_LAVORAZIONE` 
    FOREIGN KEY (`id_articoloTessuto`) REFERENCES `ARTICOLO_TESSUTO` (`id_articoloTessuto`);

ALTER TABLE `ARTICOLO_TESSUTO_LAVORAZIONE` ADD CONSTRAINT `LAVORAZIONE_ARTICOLO_TESSUTO_LAVORAZIONE` 
    FOREIGN KEY (`id_lavorazione`) REFERENCES `LAVORAZIONE` (`id_lavorazione`);

ALTER TABLE `LAVORAZIONE` ADD CONSTRAINT `TIPO_LAVORAZIONE_LAVORAZIONE` 
    FOREIGN KEY (`id_tipoLavorazione`) REFERENCES `TIPO_LAVORAZIONE` (`id_tipoLavorazione`);

ALTER TABLE `CLIFOR_LAVORAZIONE` ADD CONSTRAINT `LAVORAZIONE_CLIFOR_LAVORAZIONE` 
    FOREIGN KEY (`id_lavorazione`) REFERENCES `LAVORAZIONE` (`id_lavorazione`);

ALTER TABLE `CLIFOR_LAVORAZIONE` ADD CONSTRAINT `CLIFOR_CLIFOR_LAVORAZIONE` 
    FOREIGN KEY (`id_clifor`) REFERENCES `CLIFOR` (`id_clifor`);

ALTER TABLE `MOVIMENTO_FILATO` ADD CONSTRAINT `CONFEZIONE_MOVIMENTO_FILATO` 
    FOREIGN KEY (`id_confezione`) REFERENCES `CONFEZIONE` (`id_confezione`);

ALTER TABLE `PEZZA_PARTITA` ADD CONSTRAINT `PEZZA_PEZZA_PARTITA` 
    FOREIGN KEY (`id_pezza`) REFERENCES `PEZZA` (`id_pezza`);

ALTER TABLE `PEZZA_PARTITA` ADD CONSTRAINT `ARTICOLO_FILATO_COLORE_PEZZA_PARTITA` 
    FOREIGN KEY (`id_articoloFilatoColore`) REFERENCES `ARTICOLO_FILATO_COLORE` (`id_articoloFilatoColore`);

ALTER TABLE `MOVIMENTO_PEZZA` ADD CONSTRAINT `PEZZA_MOVIMENTO_PEZZA` 
    FOREIGN KEY (`id_pezza`) REFERENCES `PEZZA` (`id_pezza`);

ALTER TABLE `MOVIMENTO_PEZZA` ADD CONSTRAINT `FASE_LAVORAZIONE_MOVIMENTO_PEZZA` 
    FOREIGN KEY (`id_faseLavorazione`) REFERENCES `FASE_LAVORAZIONE` (`id_faseLavorazione`);

ALTER TABLE `MOVIMENTO_PEZZA` ADD CONSTRAINT `CLIFOR_MOVIMENTO_PEZZA` 
    FOREIGN KEY (`id_clifor`) REFERENCES `CLIFOR` (`id_clifor`);

ALTER TABLE `MOVIMENTO_PEZZA` ADD CONSTRAINT `RIGA_DOCUMENTO_MOVIMENTO_PEZZA` 
    FOREIGN KEY (`id_rigaDocumento`) REFERENCES `RIGA_DOCUMENTO` (`id_rigaDocumento`);

ALTER TABLE `TELA_PARTITA` ADD CONSTRAINT `TELA_TELA_PARTITA` 
    FOREIGN KEY (`id_tela`) REFERENCES `TELA` (`id_tela`);

ALTER TABLE `TELA_PARTITA` ADD CONSTRAINT `ARTICOLO_FILATO_COLORE_TELA_PARTITA` 
    FOREIGN KEY (`id_articoloFilatoColore`) REFERENCES `ARTICOLO_FILATO_COLORE` (`id_articoloFilatoColore`);












############################################################################
############################################################################
############################################################################
############################################################################
############################################################################


ALTER TABLE `USERS` ADD COLUMN `pwdSuper` VARCHAR(512);

ALTER TABLE `USERS` ADD COLUMN `imgTmst` CHAR(40);

ALTER TABLE `USERS` ADD COLUMN `flgUsaDomainController` INTEGER;

ALTER TABLE `USERS` ADD COLUMN `utenteDominio` VARCHAR(40);
ALTER TABLE `USERS` MODIFY `oldPwd` TEXT;
ALTER TABLE `USERS` MODIFY `currentIp` CHAR(60);

ALTER TABLE `USERS` MODIFY `createIp` CHAR(60);


ALTER TABLE `USERS` ADD COLUMN `id_clifor` INTEGER;
ALTER TABLE `USERS` ADD CONSTRAINT `CLIFOR_USERS_1` 
    FOREIGN KEY (`id_clifor`) REFERENCES `CLIFOR` (`id_clifor`);


#----------------------------------------------- #
# Add table "PUNTO_FOTO"                                                 #
# ---------------------------------------------------------------------- #

CREATE TABLE `PUNTO_FOTO` (
    `id_puntoFoto` INTEGER NOT NULL AUTO_INCREMENT,
    `id_gara` INTEGER,
    `descrizionePuntoFoto` VARCHAR(60),
    `pathRelativoFoto` VARCHAR(60),
    `tipoPuntoFoto` VARCHAR(40),
    CONSTRAINT `PK_PUNTO_FOTO` PRIMARY KEY (`id_puntoFoto`)
);

CREATE INDEX `IDX_PUNTO_FOTO_1` ON `PUNTO_FOTO` (`id_gara`);

# ---------------------------------------------------------------------- #
# Add table "GARA"                                                       #
# ---------------------------------------------------------------------- #

CREATE TABLE `GARA` (
    `id_gara` INTEGER NOT NULL AUTO_INCREMENT,
    `id_tipoGara` INTEGER,
    `descrizione` VARCHAR(100),
    `localita` VARCHAR(40),
    `dataGaraInizio` DATE,
    `dataGaraFine` DATE,
    `pathBase` VARCHAR(60),
    `imgTmst` VARCHAR(16),
    CONSTRAINT `PK_GARA` PRIMARY KEY (`id_gara`)
);

# ---------------------------------------------------------------------- #
# Add table "TIPO_GARA"                                                  #
# ---------------------------------------------------------------------- #

CREATE TABLE `TIPO_GARA` (
    `id_tipoGara` INTEGER NOT NULL AUTO_INCREMENT,
    `descrizione` VARCHAR(60),
    `indici` VARCHAR(1000),
    `ordine` INTEGER,
    `imgTmst` CHAR(16),
    `id_tipoGaraPadre` INTEGER,
    CONSTRAINT `PK_TIPO_GARA` PRIMARY KEY (`id_tipoGara`)
);

# ---------------------------------------------------------------------- #
# Add foreign key constraints                                            #
# ---------------------------------------------------------------------- #



# ---------------------------------------------------------------------- #
# Add foreign key constraints                                            #
# ---------------------------------------------------------------------- #

ALTER TABLE `PUNTO_FOTO` ADD CONSTRAINT `GARA_PUNTO_FOTO` 
    FOREIGN KEY (`id_gara`) REFERENCES `GARA` (`id_gara`);

ALTER TABLE `GARA` ADD CONSTRAINT `TIPO_GARA_GARA` 
    FOREIGN KEY (`id_tipoGara`) REFERENCES `TIPO_GARA` (`id_tipoGara`);

ALTER TABLE `TIPO_GARA` ADD CONSTRAINT `TIPO_GARA_TIPO_GARA` 
    FOREIGN KEY (`id_tipoGaraPadre`) REFERENCES `TIPO_GARA` (`id_tipoGara`);



# ---------------------------------------------------------------------- #
# Add table "TABLE_DESC"                                                 #
# ---------------------------------------------------------------------- #

CREATE TABLE `TABLE_DESC` (
    `id_tableDesc` INTEGER NOT NULL AUTO_INCREMENT,
    `id_access` VARCHAR(30),
    `nomeColonna` VARCHAR(40),
    `label` VARCHAR(60),
    `flgPk` INTEGER,
    `flgHidden` INTEGER,
    `flgTipo` INTEGER,
    `flgFormField` INTEGER,
    `flgCR` INTEGER,
    `ordineCR` INTEGER,
    `rowNumbCR` INTEGER,
    `colLgCR` INTEGER,
    `colXsCR` INTEGER,
    `numColSearch` INTEGER,
    `ordine` INTEGER,
    `rowNumb` INTEGER,
    `colLg` INTEGER,
    `colXs` INTEGER,
    `ajaxSearchString` VARCHAR(300),
    `maxLenght` INTEGER,
    `flgReadOnly` INTEGER,
    `tabName` VARCHAR(40),
    `tabOrder` INTEGER,
    `flgRequired` INTEGER,
    `ajaxFieldsMapping` VARCHAR(200),
    `comboFlgValuelist` VARCHAR(300),
    `toolTip` VARCHAR(250),
    `flgHtml` INTEGER,
    `flgAutoPD` INTEGER,
    `ajaxNChar` INTEGER,
    `ajaxNextAction` VARCHAR(40),
    `flgAjaxUseSubmit` INTEGER,
    `flgAjaxUseMono` INTEGER,
    `ajaxJavascriptmodify` VARCHAR(40),
    `ajaxJavascriptnew` VARCHAR(40),
    CONSTRAINT `PK_TABLE_DESC` PRIMARY KEY (`id_tableDesc`)
);

CREATE UNIQUE INDEX `IDX_TABLE_DESC_1` ON `TABLE_DESC` (`id_access`,`nomeColonna`);



# ---------------------------------------------------------------------- #
# ---------------------------------------------------------------------- #
# ---------------------------------------------------------------------- #
# ---------------------------------------------------------------------- #
# ---------------------------------------------------------------------- #


# ---------------------------------------------------------------------- #
# Add table "ACCESS"                                                     #
# ---------------------------------------------------------------------- #

CREATE TABLE `ACCESS` (
    `id_access` VARCHAR(30) NOT NULL,
    `descrizione` VARCHAR(30),
    `flgSafeUpdate` INTEGER,
    `attrMaiuscoli` VARCHAR(1000),
    `attrMinuscoli` VARCHAR(1000),
    `attr1Maiuscoli` VARCHAR(1000),
    `flgTabella` INTEGER,
    `versione` VARCHAR(20),
    `flgDeleteCascade` INTEGER,
    `servletPath` VARCHAR(40),
    `flgMaskType` INTEGER,
    `id_accessHeader` VARCHAR(30),
    `nomeClasse` VARCHAR(40),
    `flgAutoPD` INTEGER,
    `flgCombo` INTEGER,
    `comboDescColumn` VARCHAR(60),
    `ajaxSearchServlet` VARCHAR(40),
    `ajstReturnFields` VARCHAR(200),
    `help` VARCHAR(10000),
    `flgAutoCR` INTEGER,
    `flgAutoAJST` INTEGER,
    `flgRicercaSearchTxt` INTEGER,
    CONSTRAINT `PK_ACCESS` PRIMARY KEY (`id_access`)
);

# ---------------------------------------------------------------------- #
# Add table "USER_ACCESS"                                                #
# ---------------------------------------------------------------------- #

CREATE TABLE `USER_ACCESS` (
    `id_userAccess` INTEGER NOT NULL AUTO_INCREMENT,
    `id_users` INTEGER NOT NULL,
    `id_access` VARCHAR(30) NOT NULL,
    `flgRW` INTEGER DEFAULT 0,
    CONSTRAINT `PK_USER_ACCESS` PRIMARY KEY (`id_userAccess`)
);

CREATE UNIQUE INDEX `IDX_USER_ACCESS_1` ON `USER_ACCESS` (`id_users`,`id_access`);

# ---------------------------------------------------------------------- #
# Alter table "PARM"                                                     #
# ---------------------------------------------------------------------- #

DROP INDEX `TUC_PARM_1` ON `PARM`;

DROP INDEX `IDX_PARM_1` ON `PARM`;

# Remove autoinc for PK drop #

ALTER TABLE `PARM` MODIFY `id_parm` INTEGER(11) NOT NULL;

ALTER TABLE `PARM` DROP COLUMN `r`;

ALTER TABLE `PARM` DROP COLUMN `g`;

ALTER TABLE `PARM` DROP COLUMN `b`;

ALTER TABLE `PARM` DROP COLUMN `lastUpdId_user`;

ALTER TABLE `PARM` DROP COLUMN `lastUpdTmst`;

ALTER TABLE `PARM` ADD COLUMN `coloreHex` VARCHAR(7);

ALTER TABLE `PARM` MODIFY `id_parm` INTEGER NOT NULL;

ALTER TABLE `PARM` MODIFY `codice` VARCHAR(254) NOT NULL;

ALTER TABLE `PARM` MODIFY `descrizione` VARCHAR(60);

ALTER TABLE `PARM` MODIFY `testo` TEXT;

ALTER TABLE `PARM` MODIFY `tipoParm` VARCHAR(30);

ALTER TABLE `PARM` MODIFY `flgTipo` INTEGER;

ALTER TABLE `PARM` MODIFY `flgAdmin` INTEGER DEFAULT 0;

ALTER TABLE `PARM` MODIFY `nota` TEXT;

ALTER TABLE `PARM` MODIFY `nota` TEXT AFTER `codice`;

ALTER TABLE `PARM` MODIFY `descrizione` VARCHAR(60) AFTER `nota`;

ALTER TABLE `PARM` MODIFY `testo` TEXT AFTER `descrizione`;

ALTER TABLE `PARM` MODIFY `numero` DECIMAL(18,4) AFTER `testo`;

ALTER TABLE `PARM` MODIFY `dataParm` DATE AFTER `numero`;

ALTER TABLE `PARM` MODIFY `ora` TIME AFTER `dataParm`;

ALTER TABLE `PARM` MODIFY `tipoParm` VARCHAR(30) AFTER `ora`;

ALTER TABLE `PARM` MODIFY `flgTipo` INTEGER AFTER `tipoParm`;

ALTER TABLE `PARM` MODIFY `flgAdmin` INTEGER DEFAULT 0 AFTER `flgTipo`;

ALTER TABLE `PARM` MODIFY `id_parm` INTEGER NOT NULL AUTO_INCREMENT;

CREATE UNIQUE INDEX `codice` ON `PARM` (`codice`);

# ---------------------------------------------------------------------- #
# Add foreign key constraints                                            #
# ---------------------------------------------------------------------- #

ALTER TABLE `ACCESS` ADD CONSTRAINT `ACCESS_ACCESS` 
    FOREIGN KEY (`id_accessHeader`) REFERENCES `ACCESS` (`id_access`);

ALTER TABLE `USER_ACCESS` ADD CONSTRAINT `ACCESS_USER_ACCESS` 
    FOREIGN KEY (`id_access`) REFERENCES `ACCESS` (`id_access`);

#ALTER TABLE `USER_ACCESS` ADD CONSTRAINT `USERS_USER_ACCESS` 
#    FOREIGN KEY (`id_users`) REFERENCES `USERS` (`id_users`);




# ---------------------------------------------------------------------- #
# Alter table "LOG"                                                      #
# ---------------------------------------------------------------------- #

DROP INDEX `IDX_LOG_1` ON `LOG`;

DROP INDEX `IDX_LOG_2` ON `LOG`;

# Remove autoinc for PK drop #

ALTER TABLE `LOG` MODIFY `id_log` INTEGER(11) NOT NULL;

ALTER TABLE `LOG` DROP COLUMN `lastUpdId_user`;

ALTER TABLE `LOG` DROP COLUMN `lastUpdTmst`;

ALTER TABLE `LOG` ADD COLUMN `tabella` VARCHAR(60);

ALTER TABLE `LOG` ADD COLUMN `oraLog` TIME;

ALTER TABLE `LOG` ADD COLUMN `pk` VARCHAR(40);

ALTER TABLE `LOG` ADD COLUMN `pkValue` VARCHAR(40);

ALTER TABLE `LOG` MODIFY `id_log` INTEGER NOT NULL;

ALTER TABLE `LOG` MODIFY `descrizione` TEXT;

ALTER TABLE `LOG` MODIFY `id_users` INTEGER;

ALTER TABLE `LOG` MODIFY `ipAddress` CHAR(60);

ALTER TABLE `LOG` MODIFY `flgMovimento` INTEGER;

ALTER TABLE `LOG` MODIFY `id_blacklist` INTEGER;

ALTER TABLE `LOG` MODIFY `id_users` INTEGER AFTER `id_log`;

ALTER TABLE `LOG` MODIFY `id_blacklist` INTEGER AFTER `id_users`;

ALTER TABLE `LOG` MODIFY `dataLog` DATE AFTER `id_blacklist`;

ALTER TABLE `LOG` MODIFY `descrizione` TEXT AFTER `dataLog`;

ALTER TABLE `LOG` MODIFY `ipAddress` CHAR(60) AFTER `descrizione`;

ALTER TABLE `LOG` MODIFY `flgMovimento` INTEGER AFTER `ipAddress`;

ALTER TABLE `LOG` MODIFY `id_log` INTEGER NOT NULL AUTO_INCREMENT;

CREATE INDEX `IDX_LOG_3` ON `LOG` (`tabella`);

CREATE INDEX `IDX_LOG_4` ON `LOG` (`flgMovimento`);

CREATE INDEX `IDX_LOG_5` ON `LOG` (`pkValue`);

CREATE INDEX `IDX_LOG_6` ON `LOG` (`id_users`);

CREATE INDEX `IDX_LOG_7` ON `LOG` (`id_blacklist`);

CREATE INDEX `IDX_LOG_1` ON `LOG` (`pk`);

CREATE INDEX `IDX_LOG_2` ON `LOG` (`dataLog`);

# ---------------------------------------------------------------------- #
# Add foreign key constraints                                            #
# ---------------------------------------------------------------------- #

ALTER TABLE `LOG` ADD CONSTRAINT `USERS_LOG` 
    FOREIGN KEY (`id_users`) REFERENCES `USERS` (`id_users`);

ALTER TABLE `LOG` ADD CONSTRAINT `BLACKLIST_LOG` 
    FOREIGN KEY (`id_blacklist`) REFERENCES `BLACKLIST` (`id_blacklist`);
	
	
	
# ---------------------------------------------------------------------- #
# Alter table "TIPO_GARA"                                                #
# ---------------------------------------------------------------------- #

ALTER TABLE `TIPO_GARA` ADD COLUMN `flgNascondi` INTEGER;

ALTER TABLE `TIPO_GARA` ADD COLUMN `flgFoglia` INTEGER;

ALTER TABLE `TIPO_GARA` ADD COLUMN `livello` INTEGER;

ALTER TABLE `TIPO_GARA` ADD COLUMN `descrizioneR` VARCHAR(1000);




# ---------------------------------------------------------------------- #
# Alter table "FOTO"                                                     #
# ---------------------------------------------------------------------- #

ALTER TABLE `FOTO` DROP COLUMN `lastUpdTmst`;

ALTER TABLE `FOTO` DROP COLUMN `lastUpdId_user`;



ALTER TABLE `FOTO` ADD COLUMN `id_gara` INTEGER;

ALTER TABLE `FOTO` ADD COLUMN `id_puntoFoto` INTEGER;

# ---------------------------------------------------------------------- #
# Add foreign key constraints                                            #
# ---------------------------------------------------------------------- #

ALTER TABLE `FOTO` ADD CONSTRAINT `GARA_FOTO` 
    FOREIGN KEY (`id_gara`) REFERENCES `GARA` (`id_gara`);

ALTER TABLE `FOTO` ADD CONSTRAINT `PUNTO_FOTO_FOTO` 
    FOREIGN KEY (`id_puntoFoto`) REFERENCES `PUNTO_FOTO` (`id_puntoFoto`);




# ---------------------------------------------------------------------- #
# Alter table "FOTO"                                                     #
# ---------------------------------------------------------------------- #

ALTER TABLE `FOTO` DROP COLUMN `fileName`;

# ---------------------------------------------------------------------- #
# Alter table "GARA"                                                     #
# ---------------------------------------------------------------------- #

ALTER TABLE `GARA` ADD COLUMN `flgEventoInLinea` INTEGER;

## update foto vecchie...

update FOTO SET file=replace (file,"_usr_home_web_www.pierogiacomelli.com_www__mypics","_home_sites_regalamiunsorriso_www__mypics");



