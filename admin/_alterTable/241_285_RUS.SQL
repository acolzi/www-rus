
# ---------------------------------------------------------------------- #
# Drop foreign key constraints                                           #
# ---------------------------------------------------------------------- #

ALTER TABLE `ABBONAMENTO` DROP FOREIGN KEY `ATTIVITA_APPL_ABBONAMENTO`;

ALTER TABLE `ATTIVITA_APPL` DROP FOREIGN KEY `CLIFOR_ATTIVITA_APPL`;

ALTER TABLE `ATTIVITA_APPL` DROP FOREIGN KEY `COMUNE_ATTIVITA_APPL`;

ALTER TABLE `ATTIVITA_APPL` DROP FOREIGN KEY `TIPO_ATTIVITA_ATTIVITA_APPL`;

# ---------------------------------------------------------------------- #
# Drop table "ATTIVITA_APPL"                                             #
# ---------------------------------------------------------------------- #

# Remove autoinc for PK drop #

ALTER TABLE `ATTIVITA_APPL` MODIFY `id_attivitaAppl` INTEGER NOT NULL;

# Drop constraints #

ALTER TABLE `ATTIVITA_APPL` DROP PRIMARY KEY;

DROP TABLE `ATTIVITA_APPL`;
# ---------------------------------------------------------------------- #
# Add table "ATTIVITA"                                                   #
# ---------------------------------------------------------------------- #

CREATE TABLE `ATTIVITA` (
    `id_attivita` INTEGER NOT NULL AUTO_INCREMENT,
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
    `flgGusti` INTEGER,
    `dataIscrizione` DATE,
    `codiceAttivita` VARCHAR(40),
    `noteAttivita` TEXT,
    `imgTmst` CHAR(16),
    `fglMainSxCategorie` INTEGER,
    `flgMainSxVetrinaBestseller` INTEGER,
    `flgMainSxVetrinaOfferte` INTEGER,
    `flgMainSxUltimiVisualizzati` INTEGER,
    `mainSxText` TEXT,
    `flgMainBanner` INTEGER,
    `flgMainVetrina` INTEGER,
    `flgMainVetrinaCategorie` INTEGER,
    `flgTopTelefono` INTEGER,
    `flgTopLingue` INTEGER,
    `flgTopMail` INTEGER,
    `topColoreHex` VARCHAR(7),
    `flgHeadCategorie` INTEGER,
    `flgHeadMarche` INTEGER,
    `flgHeadNewsType` INTEGER,
    `flgHeadPagine` INTEGER,
    `headColoreHex` VARCHAR(7),
    `flgDetailReviws` INTEGER,
    `flgDetailRelatedProducts` INTEGER,
    `detailDxText` TEXT,
    `flgDetailDxVetrinaBestseller` INTEGER,
    `flgDetailDxVetrinaOfferte` INTEGER,
    `flgCoupon` INTEGER,
    `flgCheckoutGuest` INTEGER,
    `accountFacebook` VARCHAR(60),
    `accountTwitter` VARCHAR(60),
    `accountInstagram` VARCHAR(60),
    `flgSocialSide` INTEGER,
    `flgFooterSocial` INTEGER,
    CONSTRAINT `PK_ATTIVITA` PRIMARY KEY (`id_attivita`)
);

CREATE UNIQUE INDEX `IDX_ATTIVITA_1` ON `ATTIVITA` (`codiceAttivita`);


# ---------------------------------------------------------------------- #
# Add table "ATTIVITA_TIPO_PAGAMENTO"                                    #
# ---------------------------------------------------------------------- #

CREATE TABLE `ATTIVITA_TIPO_PAGAMENTO` (
    `id_attivitaTipoPagamento` INTEGER NOT NULL AUTO_INCREMENT,
    `id_attivita` INTEGER,
    `id_tipoPagamento` INTEGER,
    CONSTRAINT `PK_ATTIVITA_TIPO_PAGAMENTO` PRIMARY KEY (`id_attivitaTipoPagamento`)
);




ALTER TABLE `ATTIVITA` ADD CONSTRAINT `CLIFOR_ATTIVITA` 
    FOREIGN KEY (`id_clifor`) REFERENCES `CLIFOR` (`id_clifor`);

ALTER TABLE `ATTIVITA` ADD CONSTRAINT `COMUNE_ATTIVITA` 
    FOREIGN KEY (`id_comune`) REFERENCES `COMUNE` (`id_comune`);

ALTER TABLE `ATTIVITA` ADD CONSTRAINT `TIPO_ATTIVITA_ATTIVITA` 
    FOREIGN KEY (`id_tipoAttivita`) REFERENCES `TIPO_ATTIVITA` (`id_tipoAttivita`);

ALTER TABLE `ABBONAMENTO` ADD CONSTRAINT `ATTIVITA_ABBONAMENTO` 
    FOREIGN KEY (`id_attivitaAppl`) REFERENCES `ATTIVITA` (`id_attivita`);

ALTER TABLE `ATTIVITA_TIPO_PAGAMENTO` ADD CONSTRAINT `ATTIVITA_ATTIVITA_TIPO_PAGAMENTO` 
    FOREIGN KEY (`id_attivita`) REFERENCES `ATTIVITA` (`id_attivita`);

ALTER TABLE `ATTIVITA_TIPO_PAGAMENTO` ADD CONSTRAINT `TIPO_PAGAMENTO_ATTIVITA_TIPO_PAGAMENTO` 
    FOREIGN KEY (`id_tipoPagamento`) REFERENCES `TIPO_PAGAMENTO` (`id_tipoPagamento`);





# ---------------------------------------------------------------------- #
# Drop foreign key constraints                                           #
# ---------------------------------------------------------------------- #

ALTER TABLE `ABBONAMENTO` DROP FOREIGN KEY `ATTIVITA_ABBONAMENTO`;

# ---------------------------------------------------------------------- #
# Alter table "ABBONAMENTO"                                              #
# ---------------------------------------------------------------------- #

ALTER TABLE `ABBONAMENTO` CHANGE `id_attivitaAppl` `id_attivita` INTEGER;

# ---------------------------------------------------------------------- #
# Add foreign key constraints                                            #
# ---------------------------------------------------------------------- #

ALTER TABLE `ABBONAMENTO` ADD CONSTRAINT `ATTIVITA_ABBONAMENTO` 
    FOREIGN KEY (`id_attivita`) REFERENCES `ATTIVITA` (`id_attivita`);



ALTER TABLE `ATTIVITA` CHANGE `flgDetailReviws` `flgDetailReviews` INTEGER;




ALTER TABLE `ATTIVITA` DROP FOREIGN KEY `CLIFOR_ATTIVITA`;

ALTER TABLE `ATTIVITA` DROP FOREIGN KEY `COMUNE_ATTIVITA`;

ALTER TABLE `ATTIVITA` DROP FOREIGN KEY `TIPO_ATTIVITA_ATTIVITA`;

ALTER TABLE `ABBONAMENTO` DROP FOREIGN KEY `ATTIVITA_ABBONAMENTO`;

ALTER TABLE `ATTIVITA_TIPO_PAGAMENTO` DROP FOREIGN KEY `ATTIVITA_ATTIVITA_TIPO_PAGAMENTO`;

# ---------------------------------------------------------------------- #
# Alter table "ATTIVITA"                                                 #
# ---------------------------------------------------------------------- #

ALTER TABLE `ATTIVITA` CHANGE `id_comune` `id_comuneAttivita` INTEGER;

# ---------------------------------------------------------------------- #
# Add foreign key constraints                                            #
# ---------------------------------------------------------------------- #

ALTER TABLE `ATTIVITA` ADD CONSTRAINT `CLIFOR_ATTIVITA` 
    FOREIGN KEY (`id_clifor`) REFERENCES `CLIFOR` (`id_clifor`);

ALTER TABLE `ATTIVITA` ADD CONSTRAINT `COMUNE_ATTIVITA` 
    FOREIGN KEY (`id_comuneAttivita`) REFERENCES `COMUNE` (`id_comune`);

ALTER TABLE `ATTIVITA` ADD CONSTRAINT `TIPO_ATTIVITA_ATTIVITA` 
    FOREIGN KEY (`id_tipoAttivita`) REFERENCES `TIPO_ATTIVITA` (`id_tipoAttivita`);

ALTER TABLE `ABBONAMENTO` ADD CONSTRAINT `ATTIVITA_ABBONAMENTO` 
    FOREIGN KEY (`id_attivita`) REFERENCES `ATTIVITA` (`id_attivita`);

ALTER TABLE `ATTIVITA_TIPO_PAGAMENTO` ADD CONSTRAINT `ATTIVITA_ATTIVITA_TIPO_PAGAMENTO` 
    FOREIGN KEY (`id_attivita`) REFERENCES `ATTIVITA` (`id_attivita`);


# ---------------------------------------------------------------------- #
# Alter table "ATTIVITA"                                                 #
# ---------------------------------------------------------------------- #

ALTER TABLE `ATTIVITA` ADD COLUMN `capZonaAttivita` VARCHAR(10);

ALTER TABLE `ATTIVITA` MODIFY `capZonaAttivita` VARCHAR(10) AFTER `capComuneAttivita`;


# ---------------------------------------------------------------------- #
# Alter table "ATTIVITA"                                                 #
# ---------------------------------------------------------------------- #

ALTER TABLE `ATTIVITA` ADD COLUMN `flgDefault` INTEGER;


ALTER TABLE `ATTIVITA` ADD COLUMN `telefonoAttivita` VARCHAR(40);

ALTER TABLE `ATTIVITA` ADD COLUMN `emailAttivita` VARCHAR(60);

ALTER TABLE `ATTIVITA` MODIFY `telefonoAttivita` VARCHAR(40) AFTER `capZonaAttivita`;

ALTER TABLE `ATTIVITA` MODIFY `emailAttivita` VARCHAR(60) AFTER `telefonoAttivita`;



# ---------------------------------------------------------------------- #
# Alter table "ATTIVITA"                                                 #
# ---------------------------------------------------------------------- #

ALTER TABLE `ATTIVITA` ADD COLUMN `topLingueAttivita` VARCHAR(40);

ALTER TABLE `ATTIVITA` MODIFY `topLingueAttivita` VARCHAR(40) AFTER `flgTopLingue`;



# ---------------------------------------------------------------------- #
# Alter table "ATTIVITA"                                                 #
# ---------------------------------------------------------------------- #

ALTER TABLE `ATTIVITA` ADD COLUMN `mailFrom` VARCHAR(40);

ALTER TABLE `ATTIVITA` ADD COLUMN `mailTitolarePrivacy` TEXT;

ALTER TABLE `ATTIVITA` ADD COLUMN `mailFooter` TEXT;

ALTER TABLE `ATTIVITA` ADD COLUMN `mailTitle` VARCHAR(40);



# ---------------------------------------------------------------------- #
# Alter table "TIPO_PAGAMENTO"                                           #
# ---------------------------------------------------------------------- #

ALTER TABLE `TIPO_PAGAMENTO` ADD COLUMN `flgAbilitatoStranieri` INTEGER;

# ---------------------------------------------------------------------- #
# Alter table "ATTIVITA"                                                 #
# ---------------------------------------------------------------------- #

ALTER TABLE `ATTIVITA` ADD COLUMN `flgCartProcediPagamento` INTEGER;

ALTER TABLE `ATTIVITA` ADD COLUMN `id_vettore` INTEGER;

ALTER TABLE `ATTIVITA` ADD COLUMN `mailCoordinateBancarie` VARCHAR(254);


# ---------------------------------------------------------------------- #
# Alter table "ATTIVITA"                                                 #
# ---------------------------------------------------------------------- #

ALTER TABLE `ATTIVITA` DROP COLUMN `noteAttivita`;

ALTER TABLE `ATTIVITA` DROP COLUMN `flgHeadPagine`;

ALTER TABLE `ATTIVITA` ADD COLUMN `mainSxTitle` TEXT;

ALTER TABLE `ATTIVITA` ADD COLUMN `cartTitle` VARCHAR(60);

ALTER TABLE `ATTIVITA` ADD COLUMN `cartText` TEXT;

ALTER TABLE `ATTIVITA` ADD COLUMN `privacy` TEXT;

ALTER TABLE `ATTIVITA` ADD COLUMN `termConditions` TEXT;

ALTER TABLE `ATTIVITA` ADD COLUMN `returnConditions` TEXT;

ALTER TABLE `ATTIVITA` ADD COLUMN `detailTitle` VARCHAR(60);

ALTER TABLE `ATTIVITA` ADD COLUMN `detailText` TEXT;

ALTER TABLE `ATTIVITA` DROP COLUMN `paypalApiUsername`;

ALTER TABLE `ATTIVITA` CHANGE `paypalApiPwd` `paypalClientId` VARCHAR(254);

ALTER TABLE `ATTIVITA` CHANGE `paypalApiSignature` `paypalClientSecret` VARCHAR(254);


# ---------------------------------------------------------------------- #
# Alter table "ATTIVITA"                                                 #
# ---------------------------------------------------------------------- #



#
ALTER TABLE `ATTIVITA` ADD COLUMN `flgDetailCompara` INTEGER;
#
ALTER TABLE `ATTIVITA` ADD COLUMN `flgDetailWishlist` INTEGER;
#
ALTER TABLE `ATTIVITA` ADD COLUMN `flgDetailShareAddThis` INTEGER;

ALTER TABLE `ATTIVITA` ADD COLUMN `flgNewsletterType` INTEGER;

ALTER TABLE `ATTIVITA` ADD COLUMN `mailchimpSubscribeForm` TEXT;

ALTER TABLE `ATTIVITA` ADD COLUMN `tagManagerHead` TEXT;

ALTER TABLE `ATTIVITA` ADD COLUMN `tagManagerBody` TEXT;

#############################


# ---------------------------------------------------------------------- #
# Alter table "ATTIVITA"                                                 #
# ---------------------------------------------------------------------- #

ALTER TABLE `ATTIVITA` ADD COLUMN `flgMainMiniBanner` INTEGER;


#####7-6-2020

# ---------------------------------------------------------------------- #
# Alter table "MARCA"                                                    #
# ---------------------------------------------------------------------- #

ALTER TABLE `MARCA` ADD COLUMN `imgTmst` CHAR(16);




ALTER TABLE `ARTICOLO_FORNITORE` ADD COLUMN `flgPromo` INTEGER;





# ---------------------------------------------------------------------- #
# Alter table "ARTICOLO"                                                 #
# ---------------------------------------------------------------------- #

ALTER TABLE `ARTICOLO` ADD COLUMN `codicePromozioneA` VARCHAR(40);

# ---------------------------------------------------------------------- #
# Alter table "CLIFOR"                                                   #
# ---------------------------------------------------------------------- #

ALTER TABLE `CLIFOR` ADD COLUMN `flgTaxFree` INTEGER;

# ---------------------------------------------------------------------- #
# Alter table "ARTICOLO_VARIANTE"                                        #
# ---------------------------------------------------------------------- #

ALTER TABLE `ARTICOLO_VARIANTE` ADD COLUMN `codicePromozioneAV` VARCHAR(40);

# ---------------------------------------------------------------------- #
# Alter table "PROMOZIONE"                                               #
# ---------------------------------------------------------------------- #

ALTER TABLE `PROMOZIONE` ADD COLUMN `flgInvioML` INTEGER;

ALTER TABLE `PROMOZIONE` ADD COLUMN `flgArticolo` INTEGER;



# ---------------------------------------------------------------------- #
# Alter table "ARTICOLO"                                                 #
# ---------------------------------------------------------------------- #

ALTER TABLE `ARTICOLO` ADD COLUMN `costoPrecedente` DECIMAL(18,4);

ALTER TABLE `ARTICOLO` ADD COLUMN `imponibilePrecedente` DECIMAL(18,4);


ALTER TABLE `ATTIVITA` ADD COLUMN `flgMainSxCategorie` INTEGER;


ALTER TABLE `ATTIVITA` ADD COLUMN `mainSubtitleBottomBorderHex` VARCHAR(7);

#####

ALTER TABLE `ATTIVITA` MODIFY `footerTextliAHex` VARCHAR(7);




# ---------------------------------------------------------------------- #
# Alter table "ATTIVITA"                                                 #
# ---------------------------------------------------------------------- #

ALTER TABLE `ATTIVITA` ADD COLUMN `indirizzoSede` VARCHAR(60);

ALTER TABLE `ATTIVITA` ADD COLUMN `numeroCivicoSede` VARCHAR(30);

ALTER TABLE `ATTIVITA` ADD COLUMN `id_comuneSede` INTEGER;

ALTER TABLE `ATTIVITA` ADD COLUMN `descrizioneComuneSede` VARCHAR(60);

ALTER TABLE `ATTIVITA` ADD COLUMN `descrizioneProvinciaSede` CHAR(2);

ALTER TABLE `ATTIVITA` ADD COLUMN `capComuneSede` CHAR(5);

ALTER TABLE `ATTIVITA` ADD COLUMN `capZonaSede` VARCHAR(10);

ALTER TABLE `ATTIVITA` ADD COLUMN `telefonoSede` VARCHAR(40);

ALTER TABLE `ATTIVITA` ADD COLUMN `codFisc` VARCHAR(16);

ALTER TABLE `ATTIVITA` ADD COLUMN `pIva` VARCHAR(16);

ALTER TABLE `ATTIVITA` ADD COLUMN `pec` VARCHAR(40);

ALTER TABLE `ATTIVITA` ADD COLUMN `codiceIdentificativoFE` VARCHAR(7);


ALTER TABLE `ATTIVITA` ADD CONSTRAINT `COMUNE_ATTIVITA_sede` 
    FOREIGN KEY (`id_comuneSede`) REFERENCES `COMUNE` (`id_comune`);
	
	
	
	
# ---------------------------------------------------------------------- #
# Alter table "ATTIVITA"                                                 #
# ---------------------------------------------------------------------- #
ALTER TABLE `ATTIVITA` DROP FOREIGN KEY `CLIFOR_ATTIVITA`;

ALTER TABLE `ATTIVITA` DROP COLUMN `id_clifor`;

ALTER TABLE `ATTIVITA` ADD COLUMN `contatto` VARCHAR(60);




# ---------------------------------------------------------------------- #
# Alter table "ARTICOLO_FORNITORE"                                       #
# ---------------------------------------------------------------------- #

ALTER TABLE `ARTICOLO_FORNITORE` ADD COLUMN `streetPrice` DECIMAL(18,4);


####

# ---------------------------------------------------------------------- #
# Alter table "ATTIVITA"                                                 #
# ---------------------------------------------------------------------- #

ALTER TABLE `ATTIVITA` ADD COLUMN `flgAcquistaSoloDisponibile` INTEGER;

ALTER TABLE `ATTIVITA` ADD COLUMN `qtaDisponibilitaBassa` INTEGER;


###### 18-06

ALTER TABLE `ARTICOLO` ADD COLUMN `percRicaricoEffettivo` DECIMAL(5,2);

######################################################################
#insert into PARM (codice) values ('DB_VERSION');
UPDATE PARM SET testo='245' where codice='DB_VERSION';
######################################################################

# ---------------------------------------------------------------------- #
# Alter table "ARTICOLO"                                                 #
# ---------------------------------------------------------------------- #

ALTER TABLE `ARTICOLO` ADD COLUMN `costoPrecedente` DECIMAL(18,4);

ALTER TABLE `ARTICOLO` ADD COLUMN `imponibilePrecedente` DECIMAL(18,4);


ALTER TABLE `ATTIVITA` ADD COLUMN `flgMainSxCategorie` INTEGER;


ALTER TABLE `ATTIVITA` ADD COLUMN `mainSubtitleBottomBorderHex` VARCHAR(7);

#####





# ---------------------------------------------------------------------- #
# Alter table "ATTIVITA"                                                 #
# ---------------------------------------------------------------------- #

ALTER TABLE `ATTIVITA` ADD COLUMN `indirizzoSede` VARCHAR(60);

ALTER TABLE `ATTIVITA` ADD COLUMN `numeroCivicoSede` VARCHAR(30);

ALTER TABLE `ATTIVITA` ADD COLUMN `id_comuneSede` INTEGER;

ALTER TABLE `ATTIVITA` ADD COLUMN `descrizioneComuneSede` VARCHAR(60);

ALTER TABLE `ATTIVITA` ADD COLUMN `descrizioneProvinciaSede` CHAR(2);

ALTER TABLE `ATTIVITA` ADD COLUMN `capComuneSede` CHAR(5);

ALTER TABLE `ATTIVITA` ADD COLUMN `capZonaSede` VARCHAR(10);

ALTER TABLE `ATTIVITA` ADD COLUMN `telefonoSede` VARCHAR(40);

ALTER TABLE `ATTIVITA` ADD COLUMN `codFisc` VARCHAR(16);

ALTER TABLE `ATTIVITA` ADD COLUMN `pIva` VARCHAR(16);

ALTER TABLE `ATTIVITA` ADD COLUMN `pec` VARCHAR(40);

ALTER TABLE `ATTIVITA` ADD COLUMN `codiceIdentificativoFE` VARCHAR(7);


ALTER TABLE `ATTIVITA` ADD CONSTRAINT `COMUNE_ATTIVITA_sede` 
    FOREIGN KEY (`id_comuneSede`) REFERENCES `COMUNE` (`id_comune`);
	
	
	
	
# ---------------------------------------------------------------------- #
# Alter table "ATTIVITA"                                                 #
# ---------------------------------------------------------------------- #
ALTER TABLE `ATTIVITA` DROP FOREIGN KEY `CLIFOR_ATTIVITA`;

ALTER TABLE `ATTIVITA` DROP COLUMN `id_clifor`;

ALTER TABLE `ATTIVITA` ADD COLUMN `contatto` VARCHAR(60);




# ---------------------------------------------------------------------- #
# Alter table "ARTICOLO_FORNITORE"                                       #
# ---------------------------------------------------------------------- #

ALTER TABLE `ARTICOLO_FORNITORE` ADD COLUMN `streetPrice` DECIMAL(18,4);


####

# ---------------------------------------------------------------------- #
# Alter table "ATTIVITA"                                                 #
# ---------------------------------------------------------------------- #

ALTER TABLE `ATTIVITA` ADD COLUMN `flgAcquistaSoloDisponibile` INTEGER;

ALTER TABLE `ATTIVITA` ADD COLUMN `qtaDisponibilitaBassa` INTEGER;


###### 18-06

ALTER TABLE `ARTICOLO` ADD COLUMN `percRicaricoEffettivo` DECIMAL(5,2);

######################################################################
#insert into PARM (codice) values ('DB_VERSION');
UPDATE PARM SET testo='245' where codice='DB_VERSION';
######################################################################




# ---------------------------------------------------------------------- #
# Alter table "ATTIVITA"                                                 #
# ---------------------------------------------------------------------- #

ALTER TABLE `ATTIVITA` ADD COLUMN `googleFtpUser` VARCHAR(60);

ALTER TABLE `ATTIVITA` ADD COLUMN `googleFtpPassword` VARCHAR(60);

ALTER TABLE `ATTIVITA` ADD COLUMN `flgGoogleMerchant` INTEGER;

ALTER TABLE `ATTIVITA` ADD COLUMN `googleNomiFileFeed` VARCHAR(1000);




######################################################################
#insert into PARM (codice) values ('DB_VERSION');
UPDATE PARM SET testo='246' where codice='DB_VERSION';
######################################################################
ALTER TABLE DESC_TXT_LANG MODIFY COLUMN descrizione254 VARCHAR(300);


######################################################################
#insert into PARM (codice) values ('DB_VERSION');
UPDATE PARM SET testo='247' where codice='DB_VERSION';
######################################################################

# ---------------------------------------------------------------------- #
# Alter table "ARTICOLO"                                                 #
# ---------------------------------------------------------------------- #

ALTER TABLE `ARTICOLO` ADD COLUMN `googleFeedFileName` VARCHAR(40);

######################################################################
#insert into PARM (codice) values ('DB_VERSION');
UPDATE PARM SET testo='248' where codice='DB_VERSION';
######################################################################




# ---------------------------------------------------------------------- #
# Alter table "TIPO_PAGAMENTO"                                           #
# ---------------------------------------------------------------------- #

ALTER TABLE `TIPO_PAGAMENTO` ADD COLUMN `imgTmst` CHAR(16);

ALTER TABLE `MARCA` ADD COLUMN `imgTmst` CHAR(16);


# ---------------------------------------------------------------------- #
# Alter table "ATTIVITA"                                                 #
# ---------------------------------------------------------------------- #

ALTER TABLE `ATTIVITA` ADD COLUMN `deliveryFreeAbove` DECIMAL(18,4);

ALTER TABLE `ATTIVITA` MODIFY `capComuneAttivita` CHAR(5) NOT NULL;

######################################################################
#insert into PARM (codice) values ('DB_VERSION');
UPDATE PARM SET testo='249' where codice='DB_VERSION';
######################################################################



# ---------------------------------------------------------------------- #
# Add table "WISHLIST"                                                   #
# ---------------------------------------------------------------------- #

CREATE TABLE `WISHLIST` (
    `id_wishlist` INTEGER NOT NULL AUTO_INCREMENT,
    `id_users` INTEGER,
    `id_articolo` INTEGER,
    `id_articoloVariante` INTEGER,
    `id_articoloTaglia` INTEGER,
    `flgAbilitaAvviso` INTEGER,
    `prezzoWL` DECIMAL(18,4),
    `dataWL` DATE,
    `oraWL` TIME,
    `prezzoUltimoAvviso` DECIMAL(18,4),
    `tmstUltimoAvviso` DATETIME,
    CONSTRAINT `PK_WISHLIST` PRIMARY KEY (`id_wishlist`)
);

# ---------------------------------------------------------------------- #
# Add foreign key constraints                                            #
# ---------------------------------------------------------------------- #

ALTER TABLE `WISHLIST` ADD CONSTRAINT `ARTICOLO_WISHLIST` 
    FOREIGN KEY (`id_articolo`) REFERENCES `ARTICOLO` (`id_articolo`);

ALTER TABLE `WISHLIST` ADD CONSTRAINT `ARTICOLO_TAGLIA_WISHLIST` 
    FOREIGN KEY (`id_articoloTaglia`) REFERENCES `ARTICOLO_TAGLIA` (`id_articoloTaglia`);

ALTER TABLE `WISHLIST` ADD CONSTRAINT `ARTICOLO_VARIANTE_WISHLIST` 
    FOREIGN KEY (`id_articoloVariante`) REFERENCES `ARTICOLO_VARIANTE` (`id_articoloVariante`);


	
	
	
	DROP INDEX `IDX_CLIFOR_8` ON `CLIFOR`;

ALTER TABLE `CLIFOR` MODIFY `pIva` VARCHAR(16);

CREATE UNIQUE INDEX `IDX_CLIFOR_8` ON `CLIFOR` (`pIva`,`flgTipo`);

	######################################################################
#insert into PARM (codice) values ('DB_VERSION');
UPDATE PARM SET testo='250' where codice='DB_VERSION';
######################################################################
ALTER TABLE `ARTICOLO` ADD COLUMN `flgKitArt` INTEGER;



# ---------------------------------------------------------------------- #
# Alter table "ARTICOLO_VARIANTE"                                        #
# ---------------------------------------------------------------------- #

ALTER TABLE `ARTICOLO_VARIANTE` ADD COLUMN `coloreVHex` VARCHAR(7);

	######################################################################
#insert into PARM (codice) values ('DB_VERSION');
UPDATE PARM SET testo='251' where codice='DB_VERSION';
######################################################################


# ---------------------------------------------------------------------- #
# Alter table "ATTIVITA"                                                 #
# ---------------------------------------------------------------------- #

ALTER TABLE `ATTIVITA` ADD COLUMN `cellulareAttivita` VARCHAR(40);

ALTER TABLE `ATTIVITA` ADD COLUMN `flgTopChatWhatsapp` INTEGER;

ALTER TABLE `ATTIVITA` ADD COLUMN `flgTopChatTelegram` INTEGER;

ALTER TABLE `ATTIVITA` ADD COLUMN `chatTelegramUsername` VARCHAR(40);

ALTER TABLE `ATTIVITA` ADD COLUMN `flgFooterChatWhatsapp` INTEGER ;

ALTER TABLE `ATTIVITA` ADD COLUMN `flgFooterChatTelegram` INTEGER ;

ALTER TABLE `ATTIVITA` ADD COLUMN `flgSubito` INTEGER;



	######################################################################
#insert into PARM (codice) values ('DB_VERSION');
UPDATE PARM SET testo='252' where codice='DB_VERSION';
######################################################################

ALTER TABLE `ARTICOLO` ADD COLUMN `flgRichiediQuotazione` INTEGER;


# ---------------------------------------------------------------------- #
# Alter table "ATTIVITA"                                                 #
# ---------------------------------------------------------------------- #

ALTER TABLE `ATTIVITA` ADD COLUMN `flgQuotazione` INTEGER;

# ---------------------------------------------------------------------- #
# Add table "QUOTAZIONE_ARTICOLO"                                        #
# ---------------------------------------------------------------------- #

CREATE TABLE `QUOTAZIONE_ARTICOLO` (
    `id_quotazioneArticolo` INTEGER NOT NULL AUTO_INCREMENT,
    `id_users` INTEGER,
    `id_articolo` INTEGER,
    `id_articoloVariante` INTEGER,
    `id_articoloTaglia` INTEGER,
    `flgAbilitaAvviso` INTEGER,
    `prezzoQA` DECIMAL(18,4),
    `dataQA` DATE,
    `dataFineQA` DATE,
    `tmstUltimoAvviso` DATETIME,
    CONSTRAINT `PK_QUOTAZIONE_ARTICOLO` PRIMARY KEY (`id_quotazioneArticolo`)
);


ALTER TABLE `QUOTAZIONE_ARTICOLO` ADD CONSTRAINT `ARTICOLO_QUOTAZIONE_ARTICOLO` 
    FOREIGN KEY (`id_articolo`) REFERENCES `ARTICOLO` (`id_articolo`);

ALTER TABLE `QUOTAZIONE_ARTICOLO` ADD CONSTRAINT `ARTICOLO_VARIANTE_QUOTAZIONE_ARTICOLO` 
    FOREIGN KEY (`id_articoloVariante`) REFERENCES `ARTICOLO_VARIANTE` (`id_articoloVariante`);

ALTER TABLE `QUOTAZIONE_ARTICOLO` ADD CONSTRAINT `ARTICOLO_TAGLIA_QUOTAZIONE_ARTICOLO` 
    FOREIGN KEY (`id_articoloTaglia`) REFERENCES `ARTICOLO_TAGLIA` (`id_articoloTaglia`);


ALTER TABLE `ARTICOLO` MODIFY `percRicaricoEffettivo` DECIMAL(18,4);


	######################################################################
#insert into PARM (codice) values ('DB_VERSION');
UPDATE PARM SET testo='253' where codice='DB_VERSION';
######################################################################

# ---------------------------------------------------------------------- #
# Alter table "ACCESS"                                                   #
# ---------------------------------------------------------------------- #

ALTER TABLE `ACCESS` MODIFY `nomeClasse` VARCHAR(80);

# ---------------------------------------------------------------------- #
# Alter table "ARTICOLO"                                                 #
# ---------------------------------------------------------------------- #

ALTER TABLE `ARTICOLO` ADD COLUMN `countImportNonTrovato` INTEGER;

ALTER TABLE `ARTICOLO` ADD COLUMN `dataImportNonTrovato` DATE;
update articolo set countImportNonTrovato=0;
ALTER TABLE `ARTICOLO` MODIFY `countImportNonTrovato` INTEGER NOT NULL;


	######################################################################
#insert into PARM (codice) values ('DB_VERSION');
UPDATE PARM SET testo='254' where codice='DB_VERSION';
######################################################################


# ---------------------------------------------------------------------- #
# Alter table "RIGA_DOCUMENTO"                                           #
# ---------------------------------------------------------------------- #

ALTER TABLE `RIGA_DOCUMENTO` DROP COLUMN `prezzoAlColpo`;

;




# ---------------------------------------------------------------------- #
# Alter table "ATTIVITA"                                                 #
# ---------------------------------------------------------------------- #

ALTER TABLE `ATTIVITA` ADD COLUMN `mainUltimiNum` INTEGER;

ALTER TABLE `ATTIVITA` ADD COLUMN `flgMainUltimi` INTEGER;

ALTER TABLE `ATTIVITA` ADD COLUMN `flgMainUltimaNews` INTEGER;

###

ALTER TABLE `TIPO` ADD COLUMN `id_marche` VARCHAR(254);

CREATE INDEX `IDX_TIPO_9` ON `TIPO` (`id_marche`);


# ---------------------------------------------------------------------- #
# Alter table "ATTIVITA"                                                 #
# ---------------------------------------------------------------------- #

ALTER TABLE `ATTIVITA` ADD COLUMN `deliveryCost` DECIMAL(18,4);


#####

# ---------------------------------------------------------------------- #
# Alter table "ARTICOLO"                                                 #
# ---------------------------------------------------------------------- #

DROP INDEX `IDX_ARTICOLO_9` ON `ARTICOLO`;

DROP INDEX `IDX_ARTICOLO_10` ON `ARTICOLO`;

DROP INDEX `IDX_ARTICOLO_11` ON `ARTICOLO`;

DROP INDEX `IDX_ARTICOLO_12` ON `ARTICOLO`;

DROP INDEX `IDX_ARTICOLO_13` ON `ARTICOLO`;

DROP INDEX `IDX_ARTICOLO_14` ON `ARTICOLO`;

DROP INDEX `IDX_ARTICOLO_15` ON `ARTICOLO`;

DROP INDEX `IDX_ARTICOLO_16` ON `ARTICOLO`;

DROP INDEX `IDX_ARTICOLO_17` ON `ARTICOLO`;

ALTER TABLE `ARTICOLO` DROP COLUMN `descrizioneSearchFT`;

CREATE INDEX `IDX_ARTICOLO_9` ON `ARTICOLO` (`idTipoSearch`);

CREATE INDEX `IDX_ARTICOLO_10` ON `ARTICOLO` (`tipoOrdineSearch` ASC);

CREATE INDEX `IDX_ARTICOLO_11` ON `ARTICOLO` (`tipoDescrizioneSearch` ASC);

CREATE  INDEX `IDX_ARTICOLO_12` ON `ARTICOLO` (`nome` ASC);

CREATE INDEX `IDX_ARTICOLO_13` ON `ARTICOLO` (`flgEscludiWeb`);

CREATE INDEX `IDX_ARTICOLO_14` ON `ARTICOLO` (`flgNascondi`);

CREATE INDEX `IDX_ARTICOLO_15` ON `ARTICOLO` (`prezzoPubblicoIvaOrd`);

CREATE INDEX `IDX_ARTICOLO_16` ON `ARTICOLO` (`tagArticolo`);

	######################################################################
#insert into PARM (codice) values ('DB_VERSION');
UPDATE PARM SET testo='256' where codice='DB_VERSION';
######################################################################

alter table ARTICOLO ADD COLUMN sitemapPriority INTEGER;

######################################################################
#insert into PARM (codice) values ('DB_VERSION');
UPDATE PARM SET testo='257' where codice='DB_VERSION';
######################################################################



# ---------------------------------------------------------------------- #
# Alter table "ARTICOLO"                                                 #
# ---------------------------------------------------------------------- #

DROP INDEX `IDX_ARTICOLO_8` ON `ARTICOLO`;

ALTER TABLE `ARTICOLO` ADD COLUMN `keywords` VARCHAR(254);

ALTER TABLE `ARTICOLO` MODIFY `descrizioneSearch` VARCHAR(1000);

CREATE INDEX `IDX_ARTICOLO_8` ON `ARTICOLO` (`descrizioneSearch`);


####


# ---------------------------------------------------------------------- #
# Alter table "ATTIVITA"                                                 #
# ---------------------------------------------------------------------- #

ALTER TABLE `ATTIVITA` ADD COLUMN `recaptchaV2Key` VARCHAR(60);


alter table ARTICOLO modify percRicaricoEffettivo double;

######################################################################
#insert into PARM (codice) values ('DB_VERSION');
UPDATE PARM SET testo='258' where codice='DB_VERSION';
######################################################################


# ---------------------------------------------------------------------- #
# Alter table "ARTICOLO"                                                 #
# ---------------------------------------------------------------------- #

#ALTER TABLE `ARTICOLO` ADD COLUMN `percAggEbay` DECIMAL(5,2);

#ALTER TABLE `ARTICOLO` ADD COLUMN `prezzoBaseEbay` DECIMAL(18,4);

ALTER TABLE `ARTICOLO` ADD COLUMN `flgB2b` INTEGER;

ALTER TABLE `ARTICOLO` ADD COLUMN `flgB2bArt` INTEGER;

ALTER TABLE `ARTICOLO` ADD COLUMN `readyForWeb` VARCHAR(60);

CREATE INDEX `IDX_ARTICOLO_17` ON `ARTICOLO` (`readyForWeb`);

#####






######################################################################
#insert into PARM (codice) values ('DB_VERSION');
UPDATE PARM SET testo='259' where codice='DB_VERSION';
######################################################################


# ---------------------------------------------------------------------- #
# Alter table "ARTICOLO"                                                 #
# ---------------------------------------------------------------------- #

ALTER TABLE `ARTICOLO` ADD COLUMN `ebayItemId` VARCHAR(40);

CREATE INDEX `IDX_ARTICOLO_18` ON `ARTICOLO` (`ebayItemId`);

# ---------------------------------------------------------------------- #
# Alter table "TIPO"                                                     #
# ---------------------------------------------------------------------- #

# ---------------------------------------------------------------------- #
# Alter table "ARTICOLO_VARIANTE"                                        #
# ---------------------------------------------------------------------- #

ALTER TABLE `ARTICOLO_VARIANTE` ADD COLUMN `descrizioneSearchAv` VARCHAR(1000);

ALTER TABLE `ARTICOLO_VARIANTE` ADD COLUMN `keywordAv` VARCHAR(200);

ALTER TABLE `ARTICOLO_VARIANTE` ADD COLUMN `ebayItemIdAv` VARCHAR(40);

ALTER TABLE `ARTICOLO_VARIANTE` ADD COLUMN `flgSubitoAv` INTEGER;

ALTER TABLE `ARTICOLO_VARIANTE` ADD COLUMN `flgGoogleAv` INTEGER;

ALTER TABLE `ARTICOLO_VARIANTE` ADD COLUMN `flgEbayAv` INTEGER;

CREATE INDEX `IDX_ARTICOLO_VARIANTE_6` ON `ARTICOLO_VARIANTE` (`descrizioneSearchAv`);

CREATE INDEX `IDX_ARTICOLO_VARIANTE_7` ON `ARTICOLO_VARIANTE` (`ebayItemIdAv`);

# ---------------------------------------------------------------------- #
# Alter table "ATTIVITA"                                                 #
# ---------------------------------------------------------------------- #

ALTER TABLE `ATTIVITA` ADD COLUMN `id_listinoEbay` INTEGER;


ALTER TABLE `ATTIVITA` ADD CONSTRAINT `LISTINO_ATTIVITA_EBAY` 
    FOREIGN KEY (`id_listinoEbay`) REFERENCES `LISTINO` (`id_listino`);

#ALTER TABLE `ARTICOLO` DROP COLUMN `percAggEbay`;

#ALTER TABLE `ARTICOLO` DROP COLUMN `prezzoBaseEbay`;

#####


# ---------------------------------------------------------------------- #
# Alter table "ARTICOLO"                                                 #
# ---------------------------------------------------------------------- #

DROP INDEX `IDX_ARTICOLO_17` ON `ARTICOLO`;

DROP INDEX `IDX_ARTICOLO_18` ON `ARTICOLO`;

ALTER TABLE `ARTICOLO` MODIFY `readyForWeb` VARCHAR(40);

ALTER TABLE `ARTICOLO` MODIFY `ebayItemId` VARCHAR(16);

CREATE INDEX `IDX_ARTICOLO_17` ON `ARTICOLO` (`readyForWeb`);

CREATE UNIQUE INDEX `IDX_ARTICOLO_18` ON `ARTICOLO` (`ebayItemId`);

# ---------------------------------------------------------------------- #
# Alter table "ARTICOLO_VARIANTE"                                        #
# ---------------------------------------------------------------------- #

DROP INDEX `IDX_ARTICOLO_VARIANTE_7` ON `ARTICOLO_VARIANTE`;

ALTER TABLE `ARTICOLO_VARIANTE` ADD COLUMN `readyForWebAv` VARCHAR(40);

CREATE INDEX `IDX_ARTICOLO_VARIANTE_8` ON `ARTICOLO_VARIANTE` (`readyForWebAv`);


ALTER TABLE `ARTICOLO_VARIANTE` CHANGE `keywordAv` `keywordsAv` VARCHAR(200);


##tex

ALTER TABLE LAV_PEZZA dROP COLUMN codicePezzaUnico;


######################################################################
#insert into PARM (codice) values ('DB_VERSION');
UPDATE PARM SET testo='260' where codice='DB_VERSION';
######################################################################


# ---------------------------------------------------------------------- #
# Alter table "ATTIVITA"                                                 #
# ---------------------------------------------------------------------- #

ALTER TABLE `ATTIVITA` ADD COLUMN `flgEbay` INTEGER;


######################################################################
#insert into PARM (codice) values ('DB_VERSION');
UPDATE PARM SET testo='261' where codice='DB_VERSION';
######################################################################


# ---------------------------------------------------------------------- #
# Alter table "ATTIVITA"                                                 #
# ---------------------------------------------------------------------- #

ALTER TABLE `ATTIVITA` ADD COLUMN `cciaa` VARCHAR(10);

ALTER TABLE `ATTIVITA` ADD COLUMN `faxAttivita` VARCHAR(40);

ALTER TABLE `ATTIVITA` MODIFY `capComuneAttivita` CHAR(5);




ALTER TABLE `TIPO` ADD COLUMN `ebayCategoryId` VARCHAR(10);

ALTER TABLE `TIPO` ADD COLUMN `ebayCategoryDesc` VARCHAR(40);


# ---------------------------------------------------------------------- #
# Alter table "ARTICOLO"                                                 #
# ---------------------------------------------------------------------- #

ALTER TABLE `ARTICOLO` ADD COLUMN `ebayOfferId` VARCHAR(40);

# ---------------------------------------------------------------------- #
# Alter table "ARTICOLO_VARIANTE"                                        #
# ---------------------------------------------------------------------- #

ALTER TABLE `ARTICOLO_VARIANTE` ADD COLUMN `ebayOfferIdAv` VARCHAR(40);


# ---------------------------------------------------------------------- #
# Alter table "ATTIVITA"                                                 #
# ---------------------------------------------------------------------- #

ALTER TABLE `ATTIVITA` ADD COLUMN `ebayFulfillmentPolicyId` VARCHAR(40);

ALTER TABLE `ATTIVITA` ADD COLUMN `ebayPaymentPolicyId` VARCHAR(40);

ALTER TABLE `ATTIVITA` ADD COLUMN `ebayReturnPolicyId` VARCHAR(40);

ALTER TABLE `ATTIVITA` ADD COLUMN `ebayMerchantLocationKey` VARCHAR(40);


######################################################################
#insert into PARM (codice) values ('DB_VERSION');
UPDATE PARM SET testo='262' where codice='DB_VERSION';
######################################################################


# ---------------------------------------------------------------------- #
# Alter table "USERS"                                                    #
# ---------------------------------------------------------------------- #

ALTER TABLE `USERS` MODIFY `imgTmst` VARCHAR(24);

# ---------------------------------------------------------------------- #
# Alter table "MARCA"                                                    #
# ---------------------------------------------------------------------- #

ALTER TABLE `MARCA` MODIFY `imgTmst` VARCHAR(24);

# ---------------------------------------------------------------------- #
# Alter table "ARTICOLO"                                                 #
# ---------------------------------------------------------------------- #

ALTER TABLE `ARTICOLO` MODIFY `imgTmst` VARCHAR(24);

# ---------------------------------------------------------------------- #
# Alter table "CLIFOR"                                                   #
# ---------------------------------------------------------------------- #

ALTER TABLE `CLIFOR` MODIFY `imgTmst` VARCHAR(24);

# ---------------------------------------------------------------------- #
# Alter table "TIPO"                                                     #
# ---------------------------------------------------------------------- #

ALTER TABLE `TIPO` MODIFY `imgTmst` VARCHAR(24);

# ---------------------------------------------------------------------- #
# Alter table "TIPO_PAGAMENTO"                                           #
# ---------------------------------------------------------------------- #

ALTER TABLE `TIPO_PAGAMENTO` MODIFY `imgTmst` VARCHAR(24);

# ---------------------------------------------------------------------- #
# Alter table "NEWS"                                                     #
# ---------------------------------------------------------------------- #

ALTER TABLE `NEWS` MODIFY `imgTmst` VARCHAR(24);

# ---------------------------------------------------------------------- #
# Alter table "NEWSLETTER1"                                              #
# ---------------------------------------------------------------------- #

ALTER TABLE `NEWSLETTER1` MODIFY `imgTmst` VARCHAR(24);

# ---------------------------------------------------------------------- #
# Alter table "ARTICOLO_VARIANTE"                                        #
# ---------------------------------------------------------------------- #

ALTER TABLE `ARTICOLO_VARIANTE` MODIFY `imgTmst` VARCHAR(24);

# ---------------------------------------------------------------------- #
# Alter table "TABELLA_TAGLIA"                                           #
# ---------------------------------------------------------------------- #

ALTER TABLE `TABELLA_TAGLIA` MODIFY `imgTmst` VARCHAR(24);

# ---------------------------------------------------------------------- #
# Alter table "BANNER"                                                   #
# ---------------------------------------------------------------------- #

ALTER TABLE `BANNER` MODIFY `imgTmst` VARCHAR(24);

# ---------------------------------------------------------------------- #
# Alter table "CODA_MESSAGGI"                                            #
# ---------------------------------------------------------------------- #

ALTER TABLE `CODA_MESSAGGI` MODIFY `imgTmst` VARCHAR(24);

# ---------------------------------------------------------------------- #
# Alter table "TEMPLATE_MSG"                                             #
# ---------------------------------------------------------------------- #

ALTER TABLE `TEMPLATE_MSG` MODIFY `imgTmst` VARCHAR(24);

# ---------------------------------------------------------------------- #
# Alter table "ATTIVITA"                                                 #
# ---------------------------------------------------------------------- #

ALTER TABLE `ATTIVITA` MODIFY `imgTmst` VARCHAR(24);



######################################################################
#insert into PARM (codice) values ('DB_VERSION');
UPDATE PARM SET testo='263' where codice='DB_VERSION';
######################################################################



# ---------------------------------------------------------------------- #
# Alter table "ARTICOLO"                                                 #
# ---------------------------------------------------------------------- #

ALTER TABLE `ARTICOLO` ADD COLUMN `flgQtaEbay1` INTEGER;

# ---------------------------------------------------------------------- #
# Alter table "ARTICOLO_VARIANTE"                                        #
# ---------------------------------------------------------------------- #

ALTER TABLE `ARTICOLO_VARIANTE` ADD COLUMN `flgQtaEbay1Av` INTEGER;

####


# ---------------------------------------------------------------------- #
# Alter table "ATTIVITA"                                                 #
# ---------------------------------------------------------------------- #

ALTER TABLE `ATTIVITA` ADD COLUMN `ebayOAuthRefreshToken` TEXT;

ALTER TABLE `ATTIVITA` ADD COLUMN `ebayOAuthRefreshTokenExpire` DATETIME;

ALTER TABLE `ATTIVITA` ADD COLUMN `ebayOAuthUserToken` TEXT;

ALTER TABLE `ATTIVITA` ADD COLUMN `ebayOAuthUserTokenExpire` DATETIME;





######################################################################
#insert into PARM (codice) values ('DB_VERSION');
UPDATE PARM SET testo='264' where codice='DB_VERSION';
######################################################################

# ---------------------------------------------------------------------- #
# Drop foreign key constraints                                           #
# ---------------------------------------------------------------------- #


ALTER TABLE `ARTICOLO` DROP FOREIGN KEY `TIPO_ARTICOLO`;

ALTER TABLE `ARTICOLO` DROP FOREIGN KEY `IVA_ARTICOLO`;

ALTER TABLE `ARTICOLO` DROP FOREIGN KEY `TIPO_TAGLIA_ARTICOLO`;

ALTER TABLE `ARTICOLO` DROP FOREIGN KEY `ARTICOLO_VARIANTE_ARTICOLO`;

ALTER TABLE `ARTICOLO` DROP FOREIGN KEY `TABELLA_TAGLIA_ARTICOLO`;

ALTER TABLE `ARTICOLO` DROP FOREIGN KEY `TIPO_ACCESSORIO_ARTICOLO`;

ALTER TABLE `ARTICOLO` DROP FOREIGN KEY `VETRINA_ARTICOLO`;

ALTER TABLE `ARTICOLO` DROP FOREIGN KEY `TIPO_ARTICOLO_2`;

#ALTER TABLE `ARTICOLO` DROP FOREIGN KEY `CLIFOR_ARTICOLO_conf_default`;

ALTER TABLE `ACCESSORIO` DROP FOREIGN KEY `ARTICOLO_ACCESSORIO_Assoc`;

ALTER TABLE `ACCESSORIO` DROP FOREIGN KEY `ARTICOLO_ACCESSORIO`;

ALTER TABLE `CARATTERISTICA_ARTICOLO` DROP FOREIGN KEY `ARTICOLO_CARATTERISTICA_ARTICOLO`;

ALTER TABLE `RIGA_DOCUMENTO` DROP FOREIGN KEY `ARTICOLO_RIGA_DOCUMENTO`;

ALTER TABLE `ARTICOLO_VARIANTE` DROP FOREIGN KEY `ARTICOLO_ARTICOLO_VARIANTE`;

ALTER TABLE `ARTICOLO_FORNITORE` DROP FOREIGN KEY `ARTICOLO_ARTICOLO_FORNITORE`;

ALTER TABLE `ALLEGATO_ARTICOLO` DROP FOREIGN KEY `ARTICOLO_ALLEGATO_ARTICOLO`;

ALTER TABLE `LISTINO_PERS` DROP FOREIGN KEY `ARTICOLO_LISTINO_PERS`;

ALTER TABLE `RIVALUTAZIONE` DROP FOREIGN KEY `ARTICOLO_RIVALUTAZIONE`;

ALTER TABLE `LISTINO_SERVIZI_PERS` DROP FOREIGN KEY `ARTICOLO_LISTINO_SERVIZI_PERS`;

ALTER TABLE `ARTICOLO_TAGLIA` DROP FOREIGN KEY `ARTICOLO_ARTICOLO_TAGLIA`;

ALTER TABLE `ARTICOLO_COMPONENTE` DROP FOREIGN KEY `ARTICOLO_COMPOSIZIONE`;

ALTER TABLE `LISTINO_ARTICOLO` DROP FOREIGN KEY `ARTICOLO_LISTINO_ARTICOLO`;

ALTER TABLE `MOVIMENTO` DROP FOREIGN KEY `ARTICOLO_MOVIMENTO`;

ALTER TABLE `ARTICOLO_PROGETTISTA` DROP FOREIGN KEY `ARTICOLO_ARTICOLO_PROGETTISTA`;

ALTER TABLE `ARTICOLO_ARTICOLO_COMPONENTE` DROP FOREIGN KEY `ARTICOLO_COMP`;

ALTER TABLE `ARTICOLO_ARTICOLO_COMPONENTE` DROP FOREIGN KEY `ARTICOLO_PRINCIPALE`;

ALTER TABLE `ARTICOLO_ARTICOLO_TESSUTO` DROP FOREIGN KEY `ARTICOLO_ARTICOLO_ARTICOLO_TESSUTO`;

ALTER TABLE `DOCUMENTO` DROP FOREIGN KEY `ARTICOLO_DOCUMENTO`;

ALTER TABLE `KIT` DROP FOREIGN KEY `ARTICOLO_KIT_PRIMARIO`;

ALTER TABLE `KIT` DROP FOREIGN KEY `ARTICOLO_KIT_SECONDARIO`;

ALTER TABLE `ARTICOLO_USATO` DROP FOREIGN KEY `ARTICOLO_ARTICOLO_USATO`;

ALTER TABLE `WISHLIST` DROP FOREIGN KEY `ARTICOLO_WISHLIST`;

ALTER TABLE `QUOTAZIONE_ARTICOLO` DROP FOREIGN KEY `ARTICOLO_QUOTAZIONE_ARTICOLO`;

# ---------------------------------------------------------------------- #
# Alter table "ARTICOLO"                                                 #
# ---------------------------------------------------------------------- #

ALTER TABLE `ARTICOLO` ADD COLUMN `id_listinoEbay` INTEGER;

# ---------------------------------------------------------------------- #
# Add foreign key constraints                                            #
# ---------------------------------------------------------------------- #

ALTER TABLE `ARTICOLO` ADD CONSTRAINT `MARCA_ARTICOLO` 
    FOREIGN KEY (`id_marca`) REFERENCES `MARCA` (`id_marca`);

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

#ALTER TABLE `ARTICOLO` ADD CONSTRAINT `CLIFOR_ARTICOLO_conf_default` 
#    FOREIGN KEY (`id_confezionistaDefault`) REFERENCES `CLIFOR` (`id_clifor`);

ALTER TABLE `ARTICOLO` ADD CONSTRAINT `LISTINO_ARTICOLO_ebay` 
    FOREIGN KEY (`id_listinoEbay`) REFERENCES `LISTINO` (`id_listino`);

ALTER TABLE `ACCESSORIO` ADD CONSTRAINT `ARTICOLO_ACCESSORIO_Assoc` 
    FOREIGN KEY (`id_articoloAssociato`) REFERENCES `ARTICOLO` (`id_articolo`);

ALTER TABLE `ACCESSORIO` ADD CONSTRAINT `ARTICOLO_ACCESSORIO` 
    FOREIGN KEY (`id_articolo`) REFERENCES `ARTICOLO` (`id_articolo`);

ALTER TABLE `CARATTERISTICA_ARTICOLO` ADD CONSTRAINT `ARTICOLO_CARATTERISTICA_ARTICOLO` 
    FOREIGN KEY (`id_articolo`) REFERENCES `ARTICOLO` (`id_articolo`);

ALTER TABLE `RIGA_DOCUMENTO` ADD CONSTRAINT `ARTICOLO_RIGA_DOCUMENTO` 
    FOREIGN KEY (`id_articolo`) REFERENCES `ARTICOLO` (`id_articolo`);

ALTER TABLE `ARTICOLO_VARIANTE` ADD CONSTRAINT `ARTICOLO_ARTICOLO_VARIANTE` 
    FOREIGN KEY (`id_articolo`) REFERENCES `ARTICOLO` (`id_articolo`);

ALTER TABLE `ARTICOLO_FORNITORE` ADD CONSTRAINT `ARTICOLO_ARTICOLO_FORNITORE` 
    FOREIGN KEY (`id_articolo`) REFERENCES `ARTICOLO` (`id_articolo`);

ALTER TABLE `ALLEGATO_ARTICOLO` ADD CONSTRAINT `ARTICOLO_ALLEGATO_ARTICOLO` 
    FOREIGN KEY (`id_articolo`) REFERENCES `ARTICOLO` (`id_articolo`);

ALTER TABLE `LISTINO_PERS` ADD CONSTRAINT `ARTICOLO_LISTINO_PERS` 
    FOREIGN KEY (`id_articolo`) REFERENCES `ARTICOLO` (`id_articolo`);

ALTER TABLE `RIVALUTAZIONE` ADD CONSTRAINT `ARTICOLO_RIVALUTAZIONE` 
    FOREIGN KEY (`id_articolo`) REFERENCES `ARTICOLO` (`id_articolo`);

ALTER TABLE `LISTINO_SERVIZI_PERS` ADD CONSTRAINT `ARTICOLO_LISTINO_SERVIZI_PERS` 
    FOREIGN KEY (`id_articolo`) REFERENCES `ARTICOLO` (`id_articolo`);

ALTER TABLE `ARTICOLO_TAGLIA` ADD CONSTRAINT `ARTICOLO_ARTICOLO_TAGLIA` 
    FOREIGN KEY (`id_articolo`) REFERENCES `ARTICOLO` (`id_articolo`);

ALTER TABLE `ARTICOLO_COMPONENTE` ADD CONSTRAINT `ARTICOLO_COMPOSIZIONE` 
    FOREIGN KEY (`id_articolo`) REFERENCES `ARTICOLO` (`id_articolo`);

ALTER TABLE `LISTINO_ARTICOLO` ADD CONSTRAINT `ARTICOLO_LISTINO_ARTICOLO` 
    FOREIGN KEY (`id_articolo`) REFERENCES `ARTICOLO` (`id_articolo`);

ALTER TABLE `MOVIMENTO` ADD CONSTRAINT `ARTICOLO_MOVIMENTO` 
    FOREIGN KEY (`id_articolo`) REFERENCES `ARTICOLO` (`id_articolo`);

ALTER TABLE `ARTICOLO_PROGETTISTA` ADD CONSTRAINT `ARTICOLO_ARTICOLO_PROGETTISTA` 
    FOREIGN KEY (`id_articolo`) REFERENCES `ARTICOLO` (`id_articolo`);

ALTER TABLE `ARTICOLO_ARTICOLO_COMPONENTE` ADD CONSTRAINT `ARTICOLO_COMP` 
    FOREIGN KEY (`id_articoloComponente`) REFERENCES `ARTICOLO` (`id_articolo`);

ALTER TABLE `ARTICOLO_ARTICOLO_COMPONENTE` ADD CONSTRAINT `ARTICOLO_PRINCIPALE` 
    FOREIGN KEY (`id_articolo`) REFERENCES `ARTICOLO` (`id_articolo`);

ALTER TABLE `ARTICOLO_ARTICOLO_TESSUTO` ADD CONSTRAINT `ARTICOLO_ARTICOLO_ARTICOLO_TESSUTO` 
    FOREIGN KEY (`id_articolo`) REFERENCES `ARTICOLO` (`id_articolo`);

ALTER TABLE `DOCUMENTO` ADD CONSTRAINT `ARTICOLO_DOCUMENTO` 
    FOREIGN KEY (`id_articolo`) REFERENCES `ARTICOLO` (`id_articolo`);

ALTER TABLE `KIT` ADD CONSTRAINT `ARTICOLO_KIT_PRIMARIO` 
    FOREIGN KEY (`id_articolo`) REFERENCES `ARTICOLO` (`id_articolo`);

ALTER TABLE `KIT` ADD CONSTRAINT `ARTICOLO_KIT_SECONDARIO` 
    FOREIGN KEY (`id_articoloSecondario`) REFERENCES `ARTICOLO` (`id_articolo`);

ALTER TABLE `ARTICOLO_USATO` ADD CONSTRAINT `ARTICOLO_ARTICOLO_USATO` 
    FOREIGN KEY (`id_articolo`) REFERENCES `ARTICOLO` (`id_articolo`);

ALTER TABLE `WISHLIST` ADD CONSTRAINT `ARTICOLO_WISHLIST` 
    FOREIGN KEY (`id_articolo`) REFERENCES `ARTICOLO` (`id_articolo`);

ALTER TABLE `QUOTAZIONE_ARTICOLO` ADD CONSTRAINT `ARTICOLO_QUOTAZIONE_ARTICOLO` 
    FOREIGN KEY (`id_articolo`) REFERENCES `ARTICOLO` (`id_articolo`);
	
	
	
### solo ccc
update ARTICOLO set id_listinoEbay=3;
	
	
######################################################################
#insert into PARM (codice) values ('DB_VERSION');
UPDATE PARM SET testo='265' where codice='DB_VERSION';
######################################################################


# ---------------------------------------------------------------------- #
# Alter table "ARTICOLO"                                                 #
# ---------------------------------------------------------------------- #

ALTER TABLE `ARTICOLO` ADD COLUMN `prezzoSuEbayIva` DECIMAL(18,4);


	
######################################################################
#insert into PARM (codice) values ('DB_VERSION');
UPDATE PARM SET testo='266' where codice='DB_VERSION';
######################################################################


# ---------------------------------------------------------------------- #
# Alter table "IVA"                                                      #
# ---------------------------------------------------------------------- #

ALTER TABLE `IVA` MODIFY `flgTipo` CHAR(2);


# ---------------------------------------------------------------------- #
# Alter table "TIPOLOGIA_DOCUMENTO"                                      #
# ---------------------------------------------------------------------- #

ALTER TABLE `TIPOLOGIA_DOCUMENTO` ADD COLUMN `flgTDFelett` VARCHAR(4);
update TIPOLOGIA_DOCUMENTO SET flgTDFelett='TD01' WHERE codice=1;
update TIPOLOGIA_DOCUMENTO SET flgTDFelett='TD04' WHERE codice=2;

######################################################################
#insert into PARM (codice) values ('DB_VERSION');
UPDATE PARM SET testo='267' where codice='DB_VERSION';
######################################################################



# ---------------------------------------------------------------------- #
# Add table "ARTICOLO_CLIENTE"                                           #
# ---------------------------------------------------------------------- #

CREATE TABLE `ARTICOLO_CLIENTE` (
    `id_articoloCliente` INTEGER NOT NULL AUTO_INCREMENT,
    `id_clifor` INTEGER,
    `id_articolo` INTEGER,
    `id_articoloVariante` INTEGER,
    `id_tipo` INTEGER(11),
    CONSTRAINT `PK_ARTICOLO_CLIENTE` PRIMARY KEY (`id_articoloCliente`)
);

# ---------------------------------------------------------------------- #
# Add foreign key constraints                                            #
# ---------------------------------------------------------------------- #

ALTER TABLE `ARTICOLO_CLIENTE` ADD CONSTRAINT `ARTICOLO_ARTICOLO_CLIENTE` 
    FOREIGN KEY (`id_articolo`) REFERENCES `ARTICOLO` (`id_articolo`);

ALTER TABLE `ARTICOLO_CLIENTE` ADD CONSTRAINT `ARTICOLO_VARIANTE_ARTICOLO_CLIENTE` 
    FOREIGN KEY (`id_articoloVariante`) REFERENCES `ARTICOLO_VARIANTE` (`id_articoloVariante`);

ALTER TABLE `ARTICOLO_CLIENTE` ADD CONSTRAINT `TIPO_ARTICOLO_CLIENTE` 
    FOREIGN KEY (`id_tipo`) REFERENCES `TIPO` (`id_tipo`);

ALTER TABLE `ARTICOLO_CLIENTE` ADD CONSTRAINT `CLIFOR_ARTICOLO_CLIENTE` 
    FOREIGN KEY (`id_clifor`) REFERENCES `CLIFOR` (`id_clifor`);
	
	
	ALTER TABLE `ARTICOLO_CLIENTE` ADD COLUMN `indiciTipo` VARCHAR(1000);
	
	######################################################################
#insert into PARM (codice) values ('DB_VERSION');
UPDATE PARM SET testo='268' where codice='DB_VERSION';
######################################################################



# ---------------------------------------------------------------------- #
# Alter table "ARTICOLO"                                                 #
# ---------------------------------------------------------------------- #



ALTER TABLE `ARTICOLO` ADD COLUMN `qtaEbay` INTEGER;


update ARTICOLO SET qtaEbay=2 where flgQtaEbay1=1;
	ALTER TABLE `ARTICOLO` DROP COLUMN `flgQtaEbay1`;



# ---------------------------------------------------------------------- #
# Alter table "ARTICOLO_VARIANTE"                                        #
# ---------------------------------------------------------------------- #

ALTER TABLE `ARTICOLO_VARIANTE` CHANGE `flgQtaEbay1Av` `qtaEbayAv` INTEGER;



	######################################################################
#insert into PARM (codice) values ('DB_VERSION');
UPDATE PARM SET testo='269' where codice='DB_VERSION';
######################################################################


# ---------------------------------------------------------------------- #
# Alter table "ARTICOLO"                                                 #
# ---------------------------------------------------------------------- #

ALTER TABLE `ARTICOLO` ADD COLUMN `qtaSuEbay` INTEGER;

ALTER TABLE `ARTICOLO` ADD COLUMN `impression` INTEGER;

ALTER TABLE `ARTICOLO` ADD COLUMN `tmstLastImpression` DATETIME;

# ---------------------------------------------------------------------- #
# Alter table "ARTICOLO_VARIANTE"                                        #
# ---------------------------------------------------------------------- #

ALTER TABLE `ARTICOLO_VARIANTE` ADD COLUMN `qtaSuEbayAv` INTEGER;

ALTER TABLE `ARTICOLO_VARIANTE` ADD COLUMN `impressionAv` INTEGER;

ALTER TABLE `ARTICOLO_VARIANTE` ADD COLUMN `tmstLastImpressionAv` DATETIME;

# ---------------------------------------------------------------------- #

ALTER TABLE `TIPO_PAGAMENTO` ADD COLUMN `percWwwSconto` DECIMAL(5,2);

ALTER TABLE `TIPO_PAGAMENTO` ADD COLUMN `percWwwCommissione` DECIMAL(5,2);



	######################################################################
#insert into PARM (codice) values ('DB_VERSION');
UPDATE PARM SET testo='270' where codice='DB_VERSION';
######################################################################


ALTER TABLE `ARTICOLO` ADD COLUMN `qtaMaxAcquistoWww` INTEGER;


	######################################################################
#insert into PARM (codice) values ('DB_VERSION');
UPDATE PARM SET testo='272' where codice='DB_VERSION';
######################################################################


# ---------------------------------------------------------------------- #
# Alter table "ARTICOLO_FORNITORE"                                       #
# ---------------------------------------------------------------------- #

ALTER TABLE `ARTICOLO_FORNITORE` ADD COLUMN `costoAggiuntivo` DECIMAL(18,4);


	######################################################################
#insert into PARM (codice) values ('DB_VERSION');
UPDATE PARM SET testo='273' where codice='DB_VERSION';
######################################################################

#alter table BLACKLIST add column ipMax integer unsigned;
#alter table BLACKLIST add column ipMin integer unsigned;


#####################################################################
#insert into PARM (codice) values ('DB_VERSION');
UPDATE PARM SET testo='274' where codice='DB_VERSION';
######################################################################


# ---------------------------------------------------------------------- #
# Alter table "NAZIONE"                                                  #
# ---------------------------------------------------------------------- #
ALTER TABLE `NAZIONE` ADD COLUMN `flgGoogleMerchant` INTEGER;
update NAZIONE SET flgGoogleMerchant=1;

###################################################################
#insert into PARM (codice) values ('DB_VERSION');
UPDATE PARM SET testo='275' where codice='DB_VERSION';
######################################################################



# ---------------------------------------------------------------------- #
# Alter table "ARTICOLO"                                                 #
# ---------------------------------------------------------------------- #

ALTER TABLE `ARTICOLO` ADD COLUMN `id_fornitoreCostoNuovo` INTEGER;



ALTER TABLE `ARTICOLO` ADD CONSTRAINT `CLIFOR_ARTICOLO_forn_costo_nuovo` 
    FOREIGN KEY (`id_fornitoreCostoNuovo`) REFERENCES `CLIFOR` (`id_clifor`);
	
	
	
# ---------------------------------------------------------------------- #
# Alter table "ARTICOLO_FORNITORE"                                       #
# ---------------------------------------------------------------------- #



CREATE UNIQUE INDEX `IDX_ARTICOLO_FORNITORE_2` ON `ARTICOLO_FORNITORE` (`codiceFornitore`,`id_clifor`);

	
###################################################################
#insert into PARM (codice) values ('DB_VERSION');
UPDATE PARM SET testo='276' where codice='DB_VERSION';
######################################################################


# ---------------------------------------------------------------------- #
# Alter table "TIPO"                                                     #
# ---------------------------------------------------------------------- #

ALTER TABLE `TIPO` ADD COLUMN `googleProductCategory` INTEGER;


	
# ---------------------------------------------------------------------- #
# Add table "GOOGLE_CATEGORY"                                            #
# ---------------------------------------------------------------------- #

CREATE TABLE `GOOGLE_CATEGORY` (
    `id_googleCategory` INTEGER NOT NULL AUTO_INCREMENT,
    `codice` INTEGER,
    `descrizione` VARCHAR(1000),
    CONSTRAINT `PK_GOOGLE_CATEGORY` PRIMARY KEY (`id_googleCategory`)
);

CREATE INDEX `IDX_GOOGLE_CATEGORY_1` ON `GOOGLE_CATEGORY` (`descrizione`);

CREATE UNIQUE INDEX `IDX_GOOGLE_CATEGORY_2` ON `GOOGLE_CATEGORY` (`codice`);



# ---------------------------------------------------------------------- #
# Alter table "TIPO"                                                     #
# ---------------------------------------------------------------------- #

ALTER TABLE `TIPO` ADD COLUMN `id_googleCategory` INTEGER;


ALTER TABLE `TIPO` ADD CONSTRAINT `GOOGLE_CATEGORY_TIPO` 
    FOREIGN KEY (`id_googleCategory`) REFERENCES `GOOGLE_CATEGORY` (`id_googleCategory`);

insert into GOOGLE_CATEGORY (codice,descrizione) values(166,'Abbigliamento e accessori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1604,'Abbigliamento e accessori > Abbigliamento');
insert into GOOGLE_CATEGORY (codice,descrizione) values(208,'Abbigliamento e accessori > Abbigliamento > Abbigliamento da notte e da camera');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5713,'Abbigliamento e accessori > Abbigliamento > Abbigliamento da notte e da camera > Abbigliamento da camera');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2302,'Abbigliamento e accessori > Abbigliamento > Abbigliamento da notte e da camera > Accappatoi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5513,'Abbigliamento e accessori > Abbigliamento > Abbigliamento da notte e da camera > Camicie da notte');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2580,'Abbigliamento e accessori > Abbigliamento > Abbigliamento da notte e da camera > Pigiami');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5322,'Abbigliamento e accessori > Abbigliamento > Abbigliamento per attività fisica');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5460,'Abbigliamento e accessori > Abbigliamento > Abbigliamento per attività fisica > Abbigliamento da caccia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5462,'Abbigliamento e accessori > Abbigliamento > Abbigliamento per attività fisica > Abbigliamento da caccia > Ghillie suit (tute mimetiche)');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5461,'Abbigliamento e accessori > Abbigliamento > Abbigliamento per attività fisica > Abbigliamento da caccia > Gilet per caccia e pesca');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5552,'Abbigliamento e accessori > Abbigliamento > Abbigliamento per attività fisica > Abbigliamento da caccia > Pantaloni tattici e per caccia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5555,'Abbigliamento e accessori > Abbigliamento > Abbigliamento per attività fisica > Abbigliamento da paintball');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5517,'Abbigliamento e accessori > Abbigliamento > Abbigliamento per attività fisica > Abbigliamento di protezione da moto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6006,'Abbigliamento e accessori > Abbigliamento > Abbigliamento per attività fisica > Abbigliamento di protezione da moto > Giacche da motociclista');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7003,'Abbigliamento e accessori > Abbigliamento > Abbigliamento per attività fisica > Abbigliamento di protezione da moto > Pantaloni da motociclista');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5463,'Abbigliamento e accessori > Abbigliamento > Abbigliamento per attività fisica > Abbigliamento di protezione da moto > Tute da moto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5697,'Abbigliamento e accessori > Abbigliamento > Abbigliamento per attività fisica > Abbigliamento sportivo da ciclista');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3729,'Abbigliamento e accessori > Abbigliamento > Abbigliamento per attività fisica > Abbigliamento sportivo da ciclista > Calzamaglie da ciclista');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3455,'Abbigliamento e accessori > Abbigliamento > Abbigliamento per attività fisica > Abbigliamento sportivo da ciclista > Magliette da ciclista');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3188,'Abbigliamento e accessori > Abbigliamento > Abbigliamento per attività fisica > Abbigliamento sportivo da ciclista > Pantaloncini da ciclista');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3128,'Abbigliamento e accessori > Abbigliamento > Abbigliamento per attività fisica > Abbigliamento sportivo da ciclista > Tute da ciclista');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6087,'Abbigliamento e accessori > Abbigliamento > Abbigliamento per attività fisica > Abbigliamento sportivo da ciclista > Tute per bicicletta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5378,'Abbigliamento e accessori > Abbigliamento > Abbigliamento per attività fisica > Pantaloncini boxe');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3951,'Abbigliamento e accessori > Abbigliamento > Abbigliamento per attività fisica > Pantaloncini da football');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5379,'Abbigliamento e accessori > Abbigliamento > Abbigliamento per attività fisica > Pantaloncini per arti marziali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499979,'Abbigliamento e accessori > Abbigliamento > Abbigliamento per attività fisica > Vestiti, gonne e costumi da danza');
insert into GOOGLE_CATEGORY (codice,descrizione) values(182,'Abbigliamento e accessori > Abbigliamento > Abbigliamento per bambini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5424,'Abbigliamento e accessori > Abbigliamento > Abbigliamento per bambini > Abiti per bebè e bimbi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5621,'Abbigliamento e accessori > Abbigliamento > Abbigliamento per bambini > Biancheria intima per bimbi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5411,'Abbigliamento e accessori > Abbigliamento > Abbigliamento per bambini > Body per bimbi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5423,'Abbigliamento e accessori > Abbigliamento > Abbigliamento per bambini > Calzini per bebè e bimbi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5622,'Abbigliamento e accessori > Abbigliamento > Abbigliamento per bambini > Completi per bebè e bimbi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5549,'Abbigliamento e accessori > Abbigliamento > Abbigliamento per bambini > Copripannolini per bebè e bimbi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5409,'Abbigliamento e accessori > Abbigliamento > Abbigliamento per bambini > Costumi da bagno per bebè e bimbi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5410,'Abbigliamento e accessori > Abbigliamento > Abbigliamento per bambini > Maglie per bebè e bimbi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5408,'Abbigliamento e accessori > Abbigliamento > Abbigliamento per bambini > Pantaloni per bebè e bimbi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5425,'Abbigliamento e accessori > Abbigliamento > Abbigliamento per bambini > Soprabiti per bebè e bimbi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5412,'Abbigliamento e accessori > Abbigliamento > Abbigliamento per bambini > Tutine da nanna e copertine avvolgi bebè');
insert into GOOGLE_CATEGORY (codice,descrizione) values(203,'Abbigliamento e accessori > Abbigliamento > Abbigliamento per esterno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3066,'Abbigliamento e accessori > Abbigliamento > Abbigliamento per esterno > Abiti impermeabili');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5506,'Abbigliamento e accessori > Abbigliamento > Abbigliamento per esterno > Calzoni pesanti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5598,'Abbigliamento e accessori > Abbigliamento > Abbigliamento per esterno > Cappotti e giacche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1831,'Abbigliamento e accessori > Abbigliamento > Abbigliamento per esterno > Gilet');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5909,'Abbigliamento e accessori > Abbigliamento > Abbigliamento per esterno > Pantaloni e completi da neve');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5514,'Abbigliamento e accessori > Abbigliamento > Abbigliamento per esterno > Pantaloni impermeabili');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5388,'Abbigliamento e accessori > Abbigliamento > Abbigliamento tradizionale e cerimoniale');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5483,'Abbigliamento e accessori > Abbigliamento > Abbigliamento tradizionale e cerimoniale > Abbigliamento cerimonie religiose');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8149,'Abbigliamento e accessori > Abbigliamento > Abbigliamento tradizionale e cerimoniale > Abbigliamento cerimonie religiose > Vestiti per battesimo e comunione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6227,'Abbigliamento e accessori > Abbigliamento > Abbigliamento tradizionale e cerimoniale > Abbigliamento giapponese nero formale');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5673,'Abbigliamento e accessori > Abbigliamento > Abbigliamento tradizionale e cerimoniale > Complementi per kimono');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6031,'Abbigliamento e accessori > Abbigliamento > Abbigliamento tradizionale e cerimoniale > Dirndl');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5343,'Abbigliamento e accessori > Abbigliamento > Abbigliamento tradizionale e cerimoniale > Kimono');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7281,'Abbigliamento e accessori > Abbigliamento > Abbigliamento tradizionale e cerimoniale > Pantaloni di pelle tradizionali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5674,'Abbigliamento e accessori > Abbigliamento > Abbigliamento tradizionale e cerimoniale > Pantaloni hakama');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8248,'Abbigliamento e accessori > Abbigliamento > Abbigliamento tradizionale e cerimoniale > Sari e lehenga');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5676,'Abbigliamento e accessori > Abbigliamento > Abbigliamento tradizionale e cerimoniale > Yukata');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2271,'Abbigliamento e accessori > Abbigliamento > Abiti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1594,'Abbigliamento e accessori > Abbigliamento > Abiti da uomo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1580,'Abbigliamento e accessori > Abbigliamento > Abiti da uomo > Smoking e abiti da sera');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1516,'Abbigliamento e accessori > Abbigliamento > Abiti da uomo > Tailleur giacca e gonna');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5183,'Abbigliamento e accessori > Abbigliamento > Abiti da uomo > Tailleur giacca e pantaloni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(213,'Abbigliamento e accessori > Abbigliamento > Biancheria intima e calze');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2563,'Abbigliamento e accessori > Abbigliamento > Biancheria intima e calze > Accessori lingerie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1675,'Abbigliamento e accessori > Abbigliamento > Biancheria intima e calze > Accessori lingerie > Giarrettiere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2160,'Abbigliamento e accessori > Abbigliamento > Biancheria intima e calze > Accessori lingerie > Reggicalze');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7207,'Abbigliamento e accessori > Abbigliamento > Biancheria intima e calze > Accessori per reggiseni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7209,'Abbigliamento e accessori > Abbigliamento > Biancheria intima e calze > Accessori per reggiseni > Copri capezzoli e nascondi capezzoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7211,'Abbigliamento e accessori > Abbigliamento > Biancheria intima e calze > Accessori per reggiseni > Imbottire ed estensioni per reggiseno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7210,'Abbigliamento e accessori > Abbigliamento > Biancheria intima e calze > Accessori per reggiseni > Imbottiture');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7208,'Abbigliamento e accessori > Abbigliamento > Biancheria intima e calze > Accessori per reggiseni > Imbottiture per reggiseno con velcro');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1807,'Abbigliamento e accessori > Abbigliamento > Biancheria intima e calze > Calzamaglie intime uomo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(209,'Abbigliamento e accessori > Abbigliamento > Biancheria intima e calze > Calze');
insert into GOOGLE_CATEGORY (codice,descrizione) values(215,'Abbigliamento e accessori > Abbigliamento > Biancheria intima e calze > Calzetteria');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1578,'Abbigliamento e accessori > Abbigliamento > Biancheria intima e calze > Indumenti modellanti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2562,'Abbigliamento e accessori > Abbigliamento > Biancheria intima e calze > Intimo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1772,'Abbigliamento e accessori > Abbigliamento > Biancheria intima e calze > Lingerie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2745,'Abbigliamento e accessori > Abbigliamento > Biancheria intima e calze > Magliette intime');
insert into GOOGLE_CATEGORY (codice,descrizione) values(214,'Abbigliamento e accessori > Abbigliamento > Biancheria intima e calze > Reggiseni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5834,'Abbigliamento e accessori > Abbigliamento > Biancheria intima e calze > Slip intimo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5327,'Abbigliamento e accessori > Abbigliamento > Biancheria intima e calze > Sospensori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2963,'Abbigliamento e accessori > Abbigliamento > Biancheria intima e calze > Sottogonne e sottopantaloni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(212,'Abbigliamento e accessori > Abbigliamento > Camicie e top');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7313,'Abbigliamento e accessori > Abbigliamento > Completi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(211,'Abbigliamento e accessori > Abbigliamento > Costumi da bagno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1581,'Abbigliamento e accessori > Abbigliamento > Gonne');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5344,'Abbigliamento e accessori > Abbigliamento > Gonne pantalone');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5182,'Abbigliamento e accessori > Abbigliamento > Monopezzi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5490,'Abbigliamento e accessori > Abbigliamento > Monopezzi > Body e body con calzamaglia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7132,'Abbigliamento e accessori > Abbigliamento > Monopezzi > Salopette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5250,'Abbigliamento e accessori > Abbigliamento > Monopezzi > Tute e tutine');
insert into GOOGLE_CATEGORY (codice,descrizione) values(207,'Abbigliamento e accessori > Abbigliamento > Pantaloncini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(204,'Abbigliamento e accessori > Abbigliamento > Pantaloni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2306,'Abbigliamento e accessori > Abbigliamento > Uniformi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2292,'Abbigliamento e accessori > Abbigliamento > Uniformi > Camici bianchi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7235,'Abbigliamento e accessori > Abbigliamento > Uniformi > Divise per operatori alimentari');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7237,'Abbigliamento e accessori > Abbigliamento > Uniformi > Divise per operatori alimentari > Cappelli da cuoco');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2396,'Abbigliamento e accessori > Abbigliamento > Uniformi > Divise per operatori alimentari > Giacche da cuoco');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7236,'Abbigliamento e accessori > Abbigliamento > Uniformi > Divise per operatori alimentari > Pantaloni da cuoco');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3598,'Abbigliamento e accessori > Abbigliamento > Uniformi > Divise sportive');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3191,'Abbigliamento e accessori > Abbigliamento > Uniformi > Divise sportive > Divise da baseball');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3439,'Abbigliamento e accessori > Abbigliamento > Uniformi > Divise sportive > Divise da basket');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5564,'Abbigliamento e accessori > Abbigliamento > Uniformi > Divise sportive > Divise da calcio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3683,'Abbigliamento e accessori > Abbigliamento > Uniformi > Divise sportive > Divise da cheerleader');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3724,'Abbigliamento e accessori > Abbigliamento > Uniformi > Divise sportive > Divise da cricket');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3888,'Abbigliamento e accessori > Abbigliamento > Uniformi > Divise sportive > Divise da football americano');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3958,'Abbigliamento e accessori > Abbigliamento > Uniformi > Divise sportive > Divise da hockey');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3379,'Abbigliamento e accessori > Abbigliamento > Uniformi > Divise sportive > Divise da softball');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3253,'Abbigliamento e accessori > Abbigliamento > Uniformi > Divise sportive > Uniformi da arbitro');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3852,'Abbigliamento e accessori > Abbigliamento > Uniformi > Divise sportive > Uniformi da lotta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4003,'Abbigliamento e accessori > Abbigliamento > Uniformi > Divise sportive > Uniformi per arti marziali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5878,'Abbigliamento e accessori > Abbigliamento > Uniformi > Tute da volo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5484,'Abbigliamento e accessori > Abbigliamento > Uniformi > Tute e pantaloni da lavoro');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3414,'Abbigliamento e accessori > Abbigliamento > Uniformi > Uniformi agenti di sicurezza');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5949,'Abbigliamento e accessori > Abbigliamento > Uniformi > Uniformi militari');
insert into GOOGLE_CATEGORY (codice,descrizione) values(206,'Abbigliamento e accessori > Abbigliamento > Uniformi > Uniformi scolastiche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5441,'Abbigliamento e accessori > Abbigliamento > Vestiti da sposa');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5329,'Abbigliamento e accessori > Abbigliamento > Vestiti da sposa > Abiti da sposa');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5330,'Abbigliamento e accessori > Abbigliamento > Vestiti da sposa > Abiti per feste di matrimonio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(167,'Abbigliamento e accessori > Accessori di abbigliamento');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5390,'Abbigliamento e accessori > Accessori di abbigliamento > Accessori abbigliamento tradizionale');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5685,'Abbigliamento e accessori > Accessori di abbigliamento > Accessori abbigliamento tradizionale > Calze tabi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5687,'Abbigliamento e accessori > Accessori di abbigliamento > Accessori abbigliamento tradizionale > Obi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2020,'Abbigliamento e accessori > Accessori di abbigliamento > Accessori capelli e fazzoletti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1922,'Abbigliamento e accessori > Accessori di abbigliamento > Accessori capelli e fazzoletti > Copricapi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7054,'Abbigliamento e accessori > Accessori di abbigliamento > Accessori capelli e fazzoletti > Fascinator');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5939,'Abbigliamento e accessori > Accessori di abbigliamento > Accessori capelli e fazzoletti > Turbanti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5422,'Abbigliamento e accessori > Accessori di abbigliamento > Accessori di abbigliamento per bebè e bimbi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5625,'Abbigliamento e accessori > Accessori di abbigliamento > Accessori di abbigliamento per bebè e bimbi > Cappelli per bebè e bimbi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5623,'Abbigliamento e accessori > Accessori di abbigliamento > Accessori di abbigliamento per bebè e bimbi > Cinghie primi passi per bebè e bimbi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5624,'Abbigliamento e accessori > Accessori di abbigliamento > Accessori di abbigliamento per bebè e bimbi > Guanti e muffole per bebè e bimbi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5626,'Abbigliamento e accessori > Accessori di abbigliamento > Accessori di abbigliamento per bebè e bimbi > Indumenti protettivi per bebè');
insert into GOOGLE_CATEGORY (codice,descrizione) values(171,'Abbigliamento e accessori > Accessori di abbigliamento > Accessori per capelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7305,'Abbigliamento e accessori > Accessori di abbigliamento > Accessori per capelli > Accessori per parrucca');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7307,'Abbigliamento e accessori > Accessori di abbigliamento > Accessori per capelli > Accessori per parrucca > Calotte per parrucca');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7306,'Abbigliamento e accessori > Accessori di abbigliamento > Accessori per capelli > Accessori per parrucca > Colla e adesivi per parrucca');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8451,'Abbigliamento e accessori > Accessori di abbigliamento > Accessori per capelli > Ciambelle e modellatori di volume per capelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5915,'Abbigliamento e accessori > Accessori di abbigliamento > Accessori per capelli > Corone per capelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5914,'Abbigliamento e accessori > Accessori di abbigliamento > Accessori per capelli > Diademi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4057,'Abbigliamento e accessori > Accessori di abbigliamento > Accessori per capelli > Extension per capelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1662,'Abbigliamento e accessori > Accessori di abbigliamento > Accessori per capelli > Fasce per capelli/cerchietti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1948,'Abbigliamento e accessori > Accessori di abbigliamento > Accessori per capelli > Forcelle per capelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(502988,'Abbigliamento e accessori > Accessori di abbigliamento > Accessori per capelli > Forcine, pinze e mollette per capelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1483,'Abbigliamento e accessori > Accessori di abbigliamento > Accessori per capelli > Nastri elastici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(181,'Abbigliamento e accessori > Accessori di abbigliamento > Accessori per capelli > Parrucche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2477,'Abbigliamento e accessori > Accessori di abbigliamento > Accessori per capelli > Pettinini per capelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6183,'Abbigliamento e accessori > Accessori di abbigliamento > Accessori per capelli > Retine per capelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5443,'Abbigliamento e accessori > Accessori di abbigliamento > Accessori sposa');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5446,'Abbigliamento e accessori > Accessori di abbigliamento > Accessori sposa > Veli da sposa');
insert into GOOGLE_CATEGORY (codice,descrizione) values(168,'Abbigliamento e accessori > Accessori di abbigliamento > Bandane e fazzoletti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6985,'Abbigliamento e accessori > Accessori di abbigliamento > Borchie per bottoni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(179,'Abbigliamento e accessori > Accessori di abbigliamento > Bretelle');
insert into GOOGLE_CATEGORY (codice,descrizione) values(173,'Abbigliamento e accessori > Accessori di abbigliamento > Cappelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(169,'Abbigliamento e accessori > Accessori di abbigliamento > Cinture');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6268,'Abbigliamento e accessori > Accessori di abbigliamento > Collane di fiori polinesiane');
insert into GOOGLE_CATEGORY (codice,descrizione) values(176,'Abbigliamento e accessori > Accessori di abbigliamento > Cravatte e cravattini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499972,'Abbigliamento e accessori > Accessori di abbigliamento > Fasce');
insert into GOOGLE_CATEGORY (codice,descrizione) values(502987,'Abbigliamento e accessori > Accessori di abbigliamento > Fasce di sostegno e cinture premaman');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5207,'Abbigliamento e accessori > Accessori di abbigliamento > Fazzoletti taschino');
insert into GOOGLE_CATEGORY (codice,descrizione) values(180,'Abbigliamento e accessori > Accessori di abbigliamento > Fermacravatte');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3913,'Abbigliamento e accessori > Accessori di abbigliamento > Fibbie di cinture');
insert into GOOGLE_CATEGORY (codice,descrizione) values(193,'Abbigliamento e accessori > Accessori di abbigliamento > Gemelli da camicia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(170,'Abbigliamento e accessori > Accessori di abbigliamento > Guanti e muffole');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7133,'Abbigliamento e accessori > Accessori di abbigliamento > Manicotti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(178,'Abbigliamento e accessori > Accessori di abbigliamento > Occhiali da sole');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6238,'Abbigliamento e accessori > Accessori di abbigliamento > Paraorecchie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1786,'Abbigliamento e accessori > Accessori di abbigliamento > Passamontagna');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1893,'Abbigliamento e accessori > Accessori di abbigliamento > Polsini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5942,'Abbigliamento e accessori > Accessori di abbigliamento > Scaldabraccia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7230,'Abbigliamento e accessori > Accessori di abbigliamento > Scaldacollo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5941,'Abbigliamento e accessori > Accessori di abbigliamento > Scaldamuscoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(177,'Abbigliamento e accessori > Accessori di abbigliamento > Sciarpe e scialli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4179,'Abbigliamento e accessori > Accessori di abbigliamento > Spillette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6984,'Abbigliamento e accessori > Accessori di abbigliamento > Tendicollo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5114,'Abbigliamento e accessori > Accessori di abbigliamento > Ventagli decorativi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6552,'Abbigliamento e accessori > Accessori per borsette e portafogli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5841,'Abbigliamento e accessori > Accessori per borsette e portafogli > Catene per portafogli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6277,'Abbigliamento e accessori > Accessori per borsette e portafogli > Cordini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(175,'Abbigliamento e accessori > Accessori per borsette e portafogli > Portachiavi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6460,'Abbigliamento e accessori > Accessori per borsette e portafogli > Portassegni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1933,'Abbigliamento e accessori > Accessori per scarpe');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5385,'Abbigliamento e accessori > Accessori per scarpe > Coperture scarpe');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5567,'Abbigliamento e accessori > Accessori per scarpe > Fodere per stivali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7078,'Abbigliamento e accessori > Accessori per scarpe > Ghette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2427,'Abbigliamento e accessori > Accessori per scarpe > Speroni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1856,'Abbigliamento e accessori > Accessori per scarpe > Stringhe per scarpe');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6551,'Abbigliamento e accessori > Borsette, portafogli e custodie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3032,'Abbigliamento e accessori > Borsette, portafogli e custodie > Borsette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6169,'Abbigliamento e accessori > Borsette, portafogli e custodie > Custodie per biglietti da visita');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6170,'Abbigliamento e accessori > Borsette, portafogli e custodie > Portabadge e portacartellino');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2668,'Abbigliamento e accessori > Borsette, portafogli e custodie > Portafogli e portabanconote');
insert into GOOGLE_CATEGORY (codice,descrizione) values(184,'Abbigliamento e accessori > Costumi e accessori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5192,'Abbigliamento e accessori > Costumi e accessori > Accessori per costumi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8018,'Abbigliamento e accessori > Costumi e accessori > Accessori per costumi > Bigiotteria');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7304,'Abbigliamento e accessori > Costumi e accessori > Accessori per costumi > Calotte effetto calvo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5426,'Abbigliamento e accessori > Costumi e accessori > Accessori per costumi > Cappelli per costumi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500118,'Abbigliamento e accessori > Costumi e accessori > Accessori per costumi > Effetti speciali per costumi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8200,'Abbigliamento e accessori > Costumi e accessori > Accessori per costumi > Guanti per costumi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5907,'Abbigliamento e accessori > Costumi e accessori > Accessori per costumi > Mantelle per maschere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500008,'Abbigliamento e accessori > Costumi e accessori > Accessori per costumi > Prodotti del tabacco per costumi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8017,'Abbigliamento e accessori > Costumi e accessori > Accessori per costumi > Set di accessori per costumi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5193,'Abbigliamento e accessori > Costumi e accessori > Costumi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5194,'Abbigliamento e accessori > Costumi e accessori > Maschere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5387,'Abbigliamento e accessori > Costumi e accessori > Scarpe per costumi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(188,'Abbigliamento e accessori > Preziosi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5122,'Abbigliamento e accessori > Preziosi > Accessori per orologi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7471,'Abbigliamento e accessori > Preziosi > Accessori per orologi > Adesivi e decalcomanie per orologi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6870,'Abbigliamento e accessori > Preziosi > Accessori per orologi > Avvolgitori per orologi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5123,'Abbigliamento e accessori > Preziosi > Accessori per orologi > Cinturini per orologi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(200,'Abbigliamento e accessori > Preziosi > Anelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(191,'Abbigliamento e accessori > Preziosi > Bracciali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(189,'Abbigliamento e accessori > Preziosi > Cavigliere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(192,'Abbigliamento e accessori > Preziosi > Ciondoli e pendenti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(196,'Abbigliamento e accessori > Preziosi > Collane');
insert into GOOGLE_CATEGORY (codice,descrizione) values(190,'Abbigliamento e accessori > Preziosi > Gioielli per il corpo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(194,'Abbigliamento e accessori > Preziosi > Orecchini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(201,'Abbigliamento e accessori > Preziosi > Orologi da polso');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6463,'Abbigliamento e accessori > Preziosi > Set gioielli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(197,'Abbigliamento e accessori > Preziosi > Spille e spillette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(187,'Abbigliamento e accessori > Scarpe');
insert into GOOGLE_CATEGORY (codice,descrizione) values(436,'Arredamento');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6913,'Arredamento > Accessori da tavolo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6911,'Arredamento > Accessori da tavolo > Gambe per tavoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6910,'Arredamento > Accessori da tavolo > Pianali per tavoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503765,'Arredamento > Accessori per arredamento da ufficio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503766,'Arredamento > Accessori per arredamento da ufficio > Accessori e componenti per scrivania');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6909,'Arredamento > Accessori per arredamento da ufficio > Accessori per postazioni da lavoro');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7559,'Arredamento > Accessori per arredamento da ufficio > Accessori per sedie da ufficio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7212,'Arredamento > Accessori per divani');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500064,'Arredamento > Accessori per divani > Moduli sezioni per divano');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7213,'Arredamento > Accessori per divani > Supporti per sedie e divani');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6915,'Arredamento > Accessori per la separazione di ambienti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6963,'Arredamento > Accessori per mobili da esterni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6964,'Arredamento > Accessori per mobili da esterni > Teloni per mobili da esterni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8023,'Arredamento > Accessori per scaffali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8024,'Arredamento > Accessori per scaffali > Scaffali di ricambio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7248,'Arredamento > Accessori per sedie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8206,'Arredamento > Accessori per sedie > Parti ricambio per sedie sospese');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6356,'Arredamento > Armadietti e portaoggetti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(463,'Arredamento > Armadietti e portaoggetti > Archivi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4063,'Arredamento > Armadietti e portaoggetti > Armadi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5938,'Arredamento > Armadietti e portaoggetti > Armadietti e stipi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6357,'Arredamento > Armadietti e portaoggetti > Armadietti per vini e liquori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4205,'Arredamento > Armadietti e portaoggetti > Bauli e cassapanche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6947,'Arredamento > Armadietti e portaoggetti > Bauli e cassapanche > Cassapanche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4268,'Arredamento > Armadietti e portaoggetti > Bauli e cassapanche > Scatole portagiochi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(447,'Arredamento > Armadietti e portaoggetti > Buffet e credenze');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4195,'Arredamento > Armadietti e portaoggetti > Cassettiere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4148,'Arredamento > Armadietti e portaoggetti > Componenti di arredo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6360,'Arredamento > Armadietti e portaoggetti > Componenti di arredo > Coiffeuse');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2081,'Arredamento > Armadietti e portaoggetti > Componenti di arredo > Componenti di arredo bagno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6934,'Arredamento > Armadietti e portaoggetti > Pensili da cucina');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6539,'Arredamento > Armadietti e portaoggetti > Portariviste');
insert into GOOGLE_CATEGORY (codice,descrizione) values(465846,'Arredamento > Armadietti e portaoggetti > Postazioni per stiratura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5578,'Arredamento > Armadietti e portaoggetti > Rastrelliere vini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6358,'Arredamento > Armadietti e portaoggetti > Scaffali e armadietti per supporti multimediali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(448,'Arredamento > Armadietti e portaoggetti > Vetrinette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4299,'Arredamento > Arredi per esterno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7310,'Arredamento > Arredi per esterno > Contenitori per esterno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6892,'Arredamento > Arredi per esterno > Letti per esterni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6368,'Arredamento > Arredi per esterno > Mobili-sedie da esterno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4513,'Arredamento > Arredi per esterno > Mobili-sedie da esterno > Divani per esterno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4105,'Arredamento > Arredi per esterno > Mobili-sedie da esterno > Lettini prendisole');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5044,'Arredamento > Arredi per esterno > Mobili-sedie da esterno > Panchine da esterno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6828,'Arredamento > Arredi per esterno > Mobili-sedie da esterno > Sedie da esterno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500111,'Arredamento > Arredi per esterno > Mobili-sedie da esterno > Unità per divano componibile da esterno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6822,'Arredamento > Arredi per esterno > Ottomane da esterno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6367,'Arredamento > Arredi per esterno > Set di mobili da esterno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2684,'Arredamento > Arredi per esterno > Tavoli da esterno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(442,'Arredamento > Carrelli e isole');
insert into GOOGLE_CATEGORY (codice,descrizione) values(453,'Arredamento > Carrelli e isole > Carrelli da cucina');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6374,'Arredamento > Carrelli e isole > Isole per cucina');
insert into GOOGLE_CATEGORY (codice,descrizione) values(460,'Arredamento > Divani');
insert into GOOGLE_CATEGORY (codice,descrizione) values(450,'Arredamento > Futon');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6433,'Arredamento > Letti e accessori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4437,'Arredamento > Letti e accessori > Accessori per letti e telai per letto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2720,'Arredamento > Letti e accessori > Basi per materassi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505764,'Arredamento > Letti e accessori > Letti e telai per letti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2696,'Arredamento > Letti e accessori > Materassi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(451,'Arredamento > Letti e accessori > Testiere e controtestiere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6362,'Arredamento > Mobili da ufficio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6908,'Arredamento > Mobili da ufficio > Postazioni da lavoro');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4191,'Arredamento > Mobili da ufficio > Scrivanie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2045,'Arredamento > Mobili da ufficio > Sedie da ufficio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500061,'Arredamento > Mobili da ufficio > Set di mobili da ufficio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6363,'Arredamento > Mobili da ufficio > Tavoli da lavoro');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2242,'Arredamento > Mobili da ufficio > Tavoli da lavoro > Tavoli da disegno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4317,'Arredamento > Mobili da ufficio > Tavoli da lavoro > Tavoli per sale riunioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(554,'Arredamento > Mobili per bebè e bimbi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7068,'Arredamento > Mobili per bebè e bimbi > Accessori per culle');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7070,'Arredamento > Mobili per bebè e bimbi > Accessori per lettini bambino');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7071,'Arredamento > Mobili per bebè e bimbi > Accessori per lettini bambino > Kit trasformazione culla');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7072,'Arredamento > Mobili per bebè e bimbi > Accessori per lettini bambino > Paracolpi per lettino');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6969,'Arredamento > Mobili per bebè e bimbi > Accessori per seggioloni e rialzi per sedie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6393,'Arredamento > Mobili per bebè e bimbi > Ceste e culle');
insert into GOOGLE_CATEGORY (codice,descrizione) values(558,'Arredamento > Mobili per bebè e bimbi > Fasciatoi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6394,'Arredamento > Mobili per bebè e bimbi > Lettini e letti per bimbi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(559,'Arredamento > Mobili per bebè e bimbi > Seggioloni e seggiolini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6349,'Arredamento > Mobili per bebè e bimbi > Set di mobili per bebè e bimbi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(458,'Arredamento > Ottomane');
insert into GOOGLE_CATEGORY (codice,descrizione) values(441,'Arredamento > Panche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6851,'Arredamento > Panche > Cassapanche e panche per ingressi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6850,'Arredamento > Panche > Panche per cucina e sala da pranzo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4241,'Arredamento > Panche > Panchette imbottite');
insert into GOOGLE_CATEGORY (codice,descrizione) values(457,'Arredamento > Postazioni multimediali e svago');
insert into GOOGLE_CATEGORY (codice,descrizione) values(464,'Arredamento > Scaffalature');
insert into GOOGLE_CATEGORY (codice,descrizione) values(465,'Arredamento > Scaffalature > Librerie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6372,'Arredamento > Scaffalature > Scaffali e mensole per pareti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(443,'Arredamento > Sedie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(456,'Arredamento > Sedie > Chaise');
insert into GOOGLE_CATEGORY (codice,descrizione) values(438,'Arredamento > Sedie > Poltrone a sacco');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6859,'Arredamento > Sedie > Poltrone letto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2919,'Arredamento > Sedie > Poltrone massaggianti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6499,'Arredamento > Sedie > Poltrone, sedie con schienale reclinabile e poltrone reclinabili');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2002,'Arredamento > Sedie > Sedie a dondolo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6800,'Arredamento > Sedie > Sedie da gioco');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500051,'Arredamento > Sedie > Sedie da pavimento');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3358,'Arredamento > Sedie > Sedie e sgabelli pieghevoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5886,'Arredamento > Sedie > Sedie per cucina e sala da pranzo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7197,'Arredamento > Sedie > Sedie sospese');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1463,'Arredamento > Sedie > Sgabelli da bar e da tavolo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4163,'Arredamento > Separè');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6345,'Arredamento > Set di mobili');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500000,'Arredamento > Set di mobili > Set di mobili per bagno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6346,'Arredamento > Set di mobili > Set di mobili per camera da letto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6347,'Arredamento > Set di mobili > Set di mobili per cucina e sala da pranzo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6348,'Arredamento > Set di mobili > Set di mobili per salotto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2786,'Arredamento > Sopramaterassi per Futon');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6392,'Arredamento > Tavoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(462,'Arredamento > Tavoli > Comodini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4484,'Arredamento > Tavoli > Kotatsu');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4355,'Arredamento > Tavoli > Tavoli cucina e sala da pranzo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2693,'Arredamento > Tavoli > Tavoli da poker e da gioco');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5121,'Arredamento > Tavoli > Tavoli macchine da cucire');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6351,'Arredamento > Tavoli > Tavoli per attività');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4080,'Arredamento > Tavoli > Tavoli pieghevoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6369,'Arredamento > Tavoli > Tavolini decorativi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1549,'Arredamento > Tavoli > Tavolini decorativi > Tavolini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1602,'Arredamento > Tavoli > Tavolini decorativi > Tavolini da divano');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1395,'Arredamento > Tavoli > Tavolini decorativi > Tavolini da salotto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6860,'Arredamento > Telai per futon');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8,'Arte e svago');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499969,'Arte e svago > Biglietti per eventi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5710,'Arte e svago > Hobby e arti creative');
insert into GOOGLE_CATEGORY (codice,descrizione) values(55,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8072,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori per amplificatori di strumenti musicali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6970,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori per amplificatori di strumenti musicali > Amplificatori per strumenti musicali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8461,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori per amplificatori di strumenti musicali > Custodie per amplificatori di strumenti musicali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8462,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori per amplificatori di strumenti musicali > Manopole per amplificatori di strumenti musicali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8073,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori per amplificatori di strumenti musicali > Pedaliere per amplificatori di strumenti musicali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7364,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori per amplificatori di strumenti musicali > Supporti per amplificatori per strumenti musicali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8480,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori per amplificatori di strumenti musicali > Valvole per amplificatori di strumenti musicali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7277,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori per leggii musicali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7279,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori per leggii musicali > Borse per leggii musicali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7278,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori per leggii musicali > Clip per partiture musicali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7280,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori per leggii musicali > Luci per leggii musicali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(57,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori per ottoni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4797,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori per ottoni > Cura e pulitura ottoni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4891,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori per ottoni > Cura e pulitura ottoni > Kit pulizia ottoni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4894,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori per ottoni > Cura e pulitura ottoni > Lubrificanti per ottoni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4895,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori per ottoni > Cura e pulitura ottoni > Panni lucidatura ottoni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4892,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori per ottoni > Cura e pulitura ottoni > Prodotti pulizia/igienizzanti ottoni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4893,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori per ottoni > Cura e pulitura ottoni > Protezioni ottoni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4890,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori per ottoni > Cura e pulitura ottoni > Spazzole e bacchette per pulitura ottoni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505310,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori per ottoni > Custodie e gigbag per ottoni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505308,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori per ottoni > Imboccature per ottoni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4798,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori per ottoni > Pezzi di ricambio ottoni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505768,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori per ottoni > Sordine per ottoni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505309,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori per ottoni > Tracolle e supporti per ottoni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3465,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori per percussioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7150,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori per percussioni > Accessori per bacchette e spazzole da batteria');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7151,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori per percussioni > Accessori per bacchette e spazzole da batteria > Borse e contenitori per bacchette e spazzole da batteria');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7282,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori per percussioni > Accessori per percussioni a mano');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7283,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori per percussioni > Accessori per percussioni a mano > Custodie e borse per percussioni a mano');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7284,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori per percussioni > Accessori per percussioni a mano > Supporti e pedane per percussioni a mano');
insert into GOOGLE_CATEGORY (codice,descrizione) values(59,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori per percussioni > Bacchette e spazzole da batteria');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7099,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori per percussioni > Kit per percussioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7103,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori per percussioni > Kit per percussioni > Battitori grancassa');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7101,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori per percussioni > Kit per percussioni > Pedali tamburo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7102,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori per percussioni > Kit per percussioni > Sistemi di montaggio per percussioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4631,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori per percussioni > Mazzuole per percussioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7455,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori per percussioni > Moduli per batterie elettroniche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7100,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori per percussioni > Piatti e tamburo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7231,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori per percussioni > Sordine per piatti e tamburi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7308,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori per percussioni > Supporti per percussioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7153,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori per percussioni > Timpani tamburo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7152,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori per percussioni > Tiranti tamburo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(60,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori per tastiera');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7357,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori per tastiera > Custodie e borse per tastiere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3588,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori per tastiera > Leggii per tastiere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3324,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori per tastiera > Pedali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(61,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a corda');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3502,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a corda > Accessori per chitarra');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3176,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a corda > Accessori per chitarra > Accordatori per chitarra');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503721,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a corda > Accessori per chitarra > Avvolgicorde per chitarra');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5367,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a corda > Accessori per chitarra > Capotasti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503032,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a corda > Accessori per chitarra > Componenti e accessori per chitarra');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3178,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a corda > Accessori per chitarra > Corde per chitarra');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3882,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a corda > Accessori per chitarra > Custodie e gigbag chitarra');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3775,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a corda > Accessori per chitarra > Pick-up chitarra acustica');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3412,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a corda > Accessori per chitarra > Pick-up chitarra elettrica');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4111,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a corda > Accessori per chitarra > Plettri per chitarra');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5368,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a corda > Accessori per chitarra > Slide per chitarra');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3646,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a corda > Accessori per chitarra > Supporti per chitarra');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499688,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a corda > Accessori per chitarra > Tracolle per chitarra');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3392,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a corda > Accessori per chitarra > Umidificatori per chitarra');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503033,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a corda > Accessori per strumenti ad arco');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503040,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a corda > Accessori per strumenti ad arco > Archetti per strumenti ad arco');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503038,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a corda > Accessori per strumenti ad arco > Componenti e accessori per strumenti ad arco');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503034,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a corda > Accessori per strumenti ad arco > Corde per strumenti ad arco');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8209,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a corda > Accessori per strumenti ad arco > Custodie per archetti di strumenti a corda');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503039,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a corda > Accessori per strumenti ad arco > Custodie per strumenti ad arco');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503036,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a corda > Accessori per strumenti ad arco > Pickup per strumenti ad arco');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503037,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a corda > Accessori per strumenti ad arco > Sordine per strumenti ad arco');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503035,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a corda > Accessori per strumenti ad arco > Supporti per strumenti ad arco');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4806,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a corda > Cura e pulitura strumenti a corda');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3374,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a corda > Cura e pulitura strumenti a corda > Colofonia per archetto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4912,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a corda > Cura e pulitura strumenti a corda > Lucidatura strumenti a corda');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4911,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a corda > Cura e pulitura strumenti a corda > Panni pulitura strumenti corda');
insert into GOOGLE_CATEGORY (codice,descrizione) values(62,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4955,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per armonica');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4956,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per armonica > Custodie per armonica');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5046,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per armonica > Porta armonica');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4791,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per clarinetto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4824,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per clarinetto > Ance per clarinetto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4825,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per clarinetto > Collarini/supporti clarinetto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4818,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per clarinetto > Cura e pulitura clarinetto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4826,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per clarinetto > Cura e pulitura clarinetto > Kit pulizia clarinetto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4827,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per clarinetto > Cura e pulitura clarinetto > Protezioni cuscinetti clarinetto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4828,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per clarinetto > Cura e pulitura clarinetto > Scovoli per clarinetto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4819,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per clarinetto > Custodie e gigbag clarinetti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4820,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per clarinetto > Legature e cappucci clarinetto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4822,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per clarinetto > Pezzi per clarinetto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4829,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per clarinetto > Pezzi per clarinetto > Barilotti per clarinetto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4831,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per clarinetto > Pezzi per clarinetto > Bocchini clarinetto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4830,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per clarinetto > Pezzi per clarinetto > Campane per clarinetto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4832,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per clarinetto > Pezzi per clarinetto > Piccole parti clarinetto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4823,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per clarinetto > Supporti per clarinetto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4790,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per fagotto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4812,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per fagotto > Ance per fagotto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4814,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per fagotto > Collarini e supporti fagotto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4809,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per fagotto > Cura e pulitura fagotto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4815,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per fagotto > Cura e pulitura fagotto > Scovoli fagotto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4810,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per fagotto > Custodie e gigbag fagotti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4811,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per fagotto > Pezzi per fagotto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4816,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per fagotto > Pezzi per fagotto > Bocal per fagotto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4817,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per fagotto > Pezzi per fagotto > Piccole parti fagotto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4813,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per fagotto > Supporti per fagotto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4792,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per flauto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4833,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per flauto > Cura e pulitura flauto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4839,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per flauto > Cura e pulitura flauto > Bacchette pulitura flauto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4838,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per flauto > Cura e pulitura flauto > Kit pulizia flauto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4840,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per flauto > Cura e pulitura flauto > Scovoli per flauto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4834,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per flauto > Custodie e gigbag flauti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4836,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per flauto > Pezzi per flauto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4842,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per flauto > Pezzi per flauto > Piccole parti flauto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4841,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per flauto > Pezzi per flauto > Testate per flauto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4837,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per flauto > Supporti per flauto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503747,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per flauto dolce');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503750,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per flauto dolce > Componenti per flauto dolce');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503749,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per flauto dolce > Cura e pulizia del flauto dolce');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503748,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per flauto dolce > Custodie per flauto dolce');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4793,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per oboe');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4847,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per oboe > Ance per oboe');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4848,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per oboe > Collarini e supporti oboe');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4843,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per oboe > Cura e pulizia oboe');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4849,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per oboe > Cura e pulizia oboe > Kit pulizia oboe');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4850,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per oboe > Cura e pulizia oboe > Scovoli per oboe');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4844,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per oboe > Custodie e gigbag oboe');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4845,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per oboe > Pezzi per oboe');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4851,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per oboe > Pezzi per oboe > Piccole parti oboe');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4846,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per oboe > Supporti per oboe');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4794,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per sassofono');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4858,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per sassofono > Ance per sassofono');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4859,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per sassofono > Collarini/supporti sassofono');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4852,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per sassofono > Cura e pulitura sassofono');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4860,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per sassofono > Cura e pulitura sassofono > Kit pulizia sassofono');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4861,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per sassofono > Cura e pulitura sassofono > Protezioni cuscinetti sassofono');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4862,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per sassofono > Cura e pulitura sassofono > Scovoli per sassofono');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4853,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per sassofono > Custodie e gigbag sassofoni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4854,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per sassofono > Legature/cappucci sassofono');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4856,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per sassofono > Pezzi per sassofono');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4863,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per sassofono > Pezzi per sassofono > Bocchini per sassofono');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4864,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per sassofono > Pezzi per sassofono > Colli per sassofono');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4865,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per sassofono > Pezzi per sassofono > Piccole parti sassofono');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4857,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Accessori per sassofono > Supporti per sassofono');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4939,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Coltelli ance strumenti a fiato');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4957,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Custodie ance strumenti a fiato');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4866,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Grasso sugheri strumenti a fiato');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4867,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accessori strumenti a fiato > Panni lucidatura strumenti a fiato');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3270,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Accordatori elettronici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(56,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Amplificatori strumenti musicali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505288,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Bacchette da direttore d \'orchestra');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4142,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Leggii per musica');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505365,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Metronomi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505328,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Panchette e sgabelli per strumenti musicali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500001,'Arte e svago > Hobby e arti creative > Accessori per orchestre e strumenti musicali > Supporti a forma di lira e lavagnette per musica');
insert into GOOGLE_CATEGORY (codice,descrizione) values(16,'Arte e svago > Hobby e arti creative > Artigianato e hobby');
insert into GOOGLE_CATEGORY (codice,descrizione) values(504643,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Accessori da strumenti per hobby e artigianato');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6136,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Accessori da strumenti per hobby e artigianato > Accessori per filatoi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499918,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Accessori da strumenti per hobby e artigianato > Blocchi per timbri');
insert into GOOGLE_CATEGORY (codice,descrizione) values(232168,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Accessori da strumenti per hobby e artigianato > Lame per taglierine');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5120,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Accessori da strumenti per hobby e artigianato > Piedini macchina da cucire');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503348,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Accessori da strumenti per hobby e artigianato > Ricambi per macchine da cucire');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505286,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Accessori da strumenti per hobby e artigianato > Tavoli prolunga per macchine da cucire');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4580,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Accessori da strumenti per hobby e artigianato > Valigette e coperture per macchine da cucire');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505370,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Kit per hobby e artigianato');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4778,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Kit per hobby e artigianato > Kit da disegno e pittura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6382,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Kit per hobby e artigianato > Kit di riparazione per tessuto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505374,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Kit per hobby e artigianato > Kit per creare candele');
insert into GOOGLE_CATEGORY (codice,descrizione) values(502979,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Kit per hobby e artigianato > Kit per creare gioielli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503758,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Kit per hobby e artigianato > Kit per creare timbri e album di ricordi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6989,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Kit per hobby e artigianato > Kit per la fabbricazione di incenso');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6829,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Kit per hobby e artigianato > Kit per mosaici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4986,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Kit per hobby e artigianato > Kit per realizzare giochi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7096,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Kit per hobby e artigianato > Kit per ricamo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505372,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7403,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Base per stoppini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(24,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Carta per hobby e artigianato');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505400,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Carta per hobby e artigianato > Carta per acquerello e disegno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505399,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Carta per hobby e artigianato > Carta per album di ricordi e cartoncini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2967,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Carta per hobby e artigianato > Carta per origami');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6110,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Carta per hobby e artigianato > Carta trasferibile');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2532,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Carta per hobby e artigianato > Cartoncino colorato');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8168,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Carta per hobby e artigianato > Lamine per fai da te');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2741,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Carta per hobby e artigianato > Pergamena');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505375,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Cera grezza per candele');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505380,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Chiusure e cerniere per attività creative');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4226,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Chiusure e cerniere per attività creative > Bottoni e automatici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4174,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Chiusure e cerniere per attività creative > Cerniere lampo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6145,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Chiusure e cerniere per attività creative > Chiusure in velcro');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505408,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Chiusure e cerniere per attività creative > Ganci e fermagli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505409,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Chiusure e cerniere per attività creative > Occhielli e asole di rinforzo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500056,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Chiusure e cerniere per attività creative > Tiretti per cerniera');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505379,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Decorazioni e ornamenti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5996,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Decorazioni e ornamenti > Accessori per gioielli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4054,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Decorazioni e ornamenti > Adesivi decorativi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6146,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Decorazioni e ornamenti > Elastico');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1927,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Decorazioni e ornamenti > Etichette da cucire');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505413,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Decorazioni e ornamenti > Fiocchi e coccarde');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505410,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Decorazioni e ornamenti > Lustrini e paillette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505412,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Decorazioni e ornamenti > Nastri e trine');
insert into GOOGLE_CATEGORY (codice,descrizione) values(32,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Decorazioni e ornamenti > Perline');
insert into GOOGLE_CATEGORY (codice,descrizione) values(198,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Decorazioni e ornamenti > Pietre preziose');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505411,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Decorazioni e ornamenti > Piume');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5982,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Decorazioni e ornamenti > Strass e lustrini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6955,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Decorazioni e ornamenti > Toppe in tessuto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505382,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Fibre per attività creative');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6140,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Fibre per attività creative > Fibra non filata');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2669,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Fibre per attività creative > Filati');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6540,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Fibre per attività creative > Fili per perline e gioielli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(49,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Fibre per attività creative > Filo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505377,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Filo per attività creative');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505418,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Filo per attività creative > Filo per fiorista');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6102,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Filo per attività creative > Filo per perle');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5062,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Filo per attività creative > Scovolini per attività decorative');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505381,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Forme e basi per attività creative');
insert into GOOGLE_CATEGORY (codice,descrizione) values(504419,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Forme e basi per attività creative > Cornici floreali e ghirlande');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505404,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Forme e basi per attività creative > Forme e legno per attività creative');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505403,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Forme e basi per attività creative > Forme per cartapesta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6117,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Forme e basi per attività creative > Schiuma e polistirolo per articoli artistici realizzati a mano');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505376,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Magneti e adesivi per attività creative');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503745,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Magneti e adesivi per attività creative > Colla da ufficio e per attività creative');
insert into GOOGLE_CATEGORY (codice,descrizione) values(36,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Magneti e adesivi per attività creative > Magneti per lavoretti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6418,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Magneti e adesivi per attività creative > Nastro adesivo a caldo per tessuto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7192,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Magneti e adesivi per attività creative > Nastro da fiorista');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505419,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Magneti e adesivi per attività creative > Nastro decorativo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6142,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Materiale per imbottitura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505405,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Materiale per imbottitura > Forme per cuscini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505407,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Materiale per imbottitura > Imbottiture in fibre naturali e sintetiche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505406,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Materiale per imbottitura > Palline per imbottitura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(44,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Materiali per ceramica e scultura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3692,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Materiali per ceramica e scultura > Creta e pasta da modellare');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505804,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Materiali per ceramica e scultura > Garza di gesso');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505402,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Materiali per ceramica e scultura > Materiali per decorare la porcellana');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505401,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Materiali per ceramica e scultura > Mix per cartapesta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505383,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Pelle e vinile');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6121,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Polvere per goffratura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505378,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Smalto, inchiostro e vernice per attività creative');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505415,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Smalto, inchiostro e vernice per attività creative > Coloranti per attività creative');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500094,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Smalto, inchiostro e vernice per attività creative > Fissanti per pittura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505416,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Smalto, inchiostro e vernice per attività creative > Inchiostro per attività artistiche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6558,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Smalto, inchiostro e vernice per attività creative > Medium per pittura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505417,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Smalto, inchiostro e vernice per attività creative > Pittura per hobby e artigianato');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499879,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Smalto, inchiostro e vernice per attività creative > Smalto per ceramica e terracotta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505414,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Smalto, inchiostro e vernice per attività creative > Tamponi per inchiostro');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7402,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Stoppini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505384,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Tessili');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7076,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Tessili > Fodere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(47,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Tessili > Stoffa');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505397,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Tessili > Tele per attività creative');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6144,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Tessili > Tele per attività creative > Plastic canvas');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505398,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Tessili > Tele per attività creative > Tela aida per punto croce');
insert into GOOGLE_CATEGORY (codice,descrizione) values(19,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Tessili > Tele per attività creative > Tele da pittura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505396,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Materiali per hobby e artigianato > Tessili > Tessuto da stampare');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505369,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Organizzazione delle attività creative');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499971,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Organizzazione delle attività creative > Kit per cucito e arti tessili');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505394,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Organizzazione delle attività creative > Organizer per aghi, spilli e uncinetti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505395,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Organizzazione delle attività creative > Organizer per filati');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505371,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Stampi e modelli per artigianato');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3697,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Stampi e modelli per artigianato > Modelli da cucire');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505373,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Stampi e modelli per artigianato > Modelli per cucito');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6999,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Stampi e modelli per artigianato > Modelli per decorazioni con perline');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8007,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Stampi e modelli per artigianato > Stampi per artigianato');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6135,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Stampi e modelli per artigianato > Stampi per feltratura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(504639,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505393,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Aghi e uncinetti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6139,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Aghi e uncinetti > Aghi da maglia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5992,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Aghi e uncinetti > Aghi per cucire');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4579,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Aghi e uncinetti > Aghi per macchine da cucire');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6127,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Aghi e uncinetti > Uncinetti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6168,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Aghi e uncinetti > Uncinetti tunisini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6158,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Cornici, cerchi e tenditori per arte tessile');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6133,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Cuscinetti e tappetini per feltratura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6156,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Ditali e protezioni per cucito');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6151,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Fili di blocco per maglieria');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505388,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Macchine per tessili');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6137,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Macchine per tessili > Filatoi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(615,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Macchine per tessili > Macchine da cucire');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6134,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Macchine per tessili > Macchine e aghi per feltratura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505422,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Macchine per tessili > Telai a mano');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505421,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Macchine per tessili > Telai meccanici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6150,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Manichini per sarte');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4073,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Pistole a caldo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5921,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Scatole e tavoli luminosi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6101,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Spille di sicurezza');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6159,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Spilli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505386,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Strumenti per creare decorazioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505387,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Strumenti per filati');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6153,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Strumenti per filati > Arcolai e dipanatori per filati');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6164,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Strumenti per filati > Cardalana');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6138,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Strumenti per filati > Fusi manuali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6155,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Strumenti per filati > Guide per filati');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6163,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Strumenti per filati > Infilatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6166,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Strumenti per filati > Navette per telaio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6167,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Strumenti per filati > Pettini per telaio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6154,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Strumenti per filati > Rocchetti per filati');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505392,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Strumenti per marcare e misurare oggetti d \'artigianato');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6157,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Strumenti per marcare e misurare oggetti d \'artigianato > Calibri e righelli per arte tessile');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3083,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Strumenti per marcare e misurare oggetti d \'artigianato > Compassi per bozze');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5883,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Strumenti per marcare e misurare oggetti d \'artigianato > Macchine per stencil');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6160,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Strumenti per marcare e misurare oggetti d \'artigianato > Marcatori e contatori di punti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(18,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Strumenti per marcare e misurare oggetti d \'artigianato > Pennelli per artisti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6126,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Strumenti per marcare e misurare oggetti d \'artigianato > Rulli manuali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6125,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Strumenti per marcare e misurare oggetti d \'artigianato > Spatole per serigrafia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2671,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Strumenti per marcare e misurare oggetti d \'artigianato > Stencil e stampi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505420,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Strumenti per marcare e misurare oggetti d \'artigianato > Strumenti per pirografia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4032,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Strumenti per marcare e misurare oggetti d \'artigianato > Timbri decorativi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505391,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Strumenti per mescolare i colori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1653,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Strumenti per mescolare i colori > Mestichini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1719,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Strumenti per mescolare i colori > Tavolozze');
insert into GOOGLE_CATEGORY (codice,descrizione) values(504640,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Strumenti per taglio e goffratura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(504641,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Strumenti per taglio e goffratura > Forbici da ufficio e per attività creative');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6447,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Strumenti per taglio e goffratura > Forbici taglia fili e taglia lana');
insert into GOOGLE_CATEGORY (codice,descrizione) values(504642,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Strumenti per taglio e goffratura > Goffratrice e taglierini per attività creative');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6122,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Strumenti per taglio e goffratura > Penne e strumenti per goffratura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6119,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Strumenti per taglio e goffratura > Piegatrici e marcatori per carta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7340,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Strumenti per taglio e goffratura > Strumenti per goffratura a caldo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6161,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Strumenti per taglio e goffratura > Tagliapunti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5136,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Strumenti per taglio e goffratura > Taglierini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5137,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Tappetini da taglio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6152,'Arte e svago > Hobby e arti creative > Artigianato e hobby > Strumenti per hobby e artigianato > Tappetini di blocco per maglieria');
insert into GOOGLE_CATEGORY (codice,descrizione) values(216,'Arte e svago > Hobby e arti creative > Collezionismo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6000,'Arte e svago > Hobby e arti creative > Collezionismo > Accessori per modellini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(220,'Arte e svago > Hobby e arti creative > Collezionismo > Armi da collezione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5311,'Arte e svago > Hobby e arti creative > Collezionismo > Armi da collezione > Coltelli da collezione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499953,'Arte e svago > Hobby e arti creative > Collezionismo > Armi da collezione > Pistole da collezione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(221,'Arte e svago > Hobby e arti creative > Collezionismo > Armi da collezione > Spade da collezione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1340,'Arte e svago > Hobby e arti creative > Collezionismo > Armi da collezione > Supporti e vetrine per spade');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3599,'Arte e svago > Hobby e arti creative > Collezionismo > Autografi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6997,'Arte e svago > Hobby e arti creative > Collezionismo > Carte collezionabili');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3865,'Arte e svago > Hobby e arti creative > Collezionismo > Collezionismo - Sport');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4333,'Arte e svago > Hobby e arti creative > Collezionismo > Collezionismo - Sport > Accessori autografati sport');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4180,'Arte e svago > Hobby e arti creative > Collezionismo > Collezionismo - Sport > Accessori autografati sport > Accessori autografati automobilismo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4149,'Arte e svago > Hobby e arti creative > Collezionismo > Collezionismo - Sport > Accessori autografati sport > Accessori autografati baseball e softball');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4279,'Arte e svago > Hobby e arti creative > Collezionismo > Collezionismo - Sport > Accessori autografati sport > Accessori autografati basket');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4093,'Arte e svago > Hobby e arti creative > Collezionismo > Collezionismo - Sport > Accessori autografati sport > Accessori autografati calcio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4124,'Arte e svago > Hobby e arti creative > Collezionismo > Collezionismo - Sport > Accessori autografati sport > Accessori autografati football');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4144,'Arte e svago > Hobby e arti creative > Collezionismo > Collezionismo - Sport > Accessori autografati sport > Accessori autografati hockey');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6186,'Arte e svago > Hobby e arti creative > Collezionismo > Collezionismo - Sport > Accessori autografati sport > Accessori autografati sport tennis');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8210,'Arte e svago > Hobby e arti creative > Collezionismo > Collezionismo - Sport > Accessori autografati sport > Cimeli autografati boxe');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3515,'Arte e svago > Hobby e arti creative > Collezionismo > Collezionismo - Sport > Accessori tifosi di sport');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6187,'Arte e svago > Hobby e arti creative > Collezionismo > Collezionismo - Sport > Accessori tifosi di sport > Accessori per fan del tennis');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1051,'Arte e svago > Hobby e arti creative > Collezionismo > Collezionismo - Sport > Accessori tifosi di sport > Accessori tifosi automobilismo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1074,'Arte e svago > Hobby e arti creative > Collezionismo > Collezionismo - Sport > Accessori tifosi di sport > Accessori tifosi baseball e softball');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1084,'Arte e svago > Hobby e arti creative > Collezionismo > Collezionismo - Sport > Accessori tifosi di sport > Accessori tifosi basket');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3576,'Arte e svago > Hobby e arti creative > Collezionismo > Collezionismo - Sport > Accessori tifosi di sport > Accessori tifosi calcio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1095,'Arte e svago > Hobby e arti creative > Collezionismo > Collezionismo - Sport > Accessori tifosi di sport > Accessori tifosi football');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4006,'Arte e svago > Hobby e arti creative > Collezionismo > Collezionismo - Sport > Accessori tifosi di sport > Accessori tifosi hockey');
insert into GOOGLE_CATEGORY (codice,descrizione) values(219,'Arte e svago > Hobby e arti creative > Collezionismo > Francobolli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(37,'Arte e svago > Hobby e arti creative > Collezionismo > Modelli in scala');
insert into GOOGLE_CATEGORY (codice,descrizione) values(217,'Arte e svago > Hobby e arti creative > Collezionismo > Monete e banconote');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3893,'Arte e svago > Hobby e arti creative > Collezionismo > Pubblicità vintage');
insert into GOOGLE_CATEGORY (codice,descrizione) values(218,'Arte e svago > Hobby e arti creative > Collezionismo > Rocce e fossili');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1312,'Arte e svago > Hobby e arti creative > Collezionismo > Sigilli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(33,'Arte e svago > Hobby e arti creative > Giocoleria');
insert into GOOGLE_CATEGORY (codice,descrizione) values(35,'Arte e svago > Hobby e arti creative > Magia e oggetti insoliti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5999,'Arte e svago > Hobby e arti creative > Modellismo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5151,'Arte e svago > Hobby e arti creative > Modellismo > Accessori per modellini di treni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4175,'Arte e svago > Hobby e arti creative > Modellismo > Kit di modelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3885,'Arte e svago > Hobby e arti creative > Modellismo > Modelli di missili');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5150,'Arte e svago > Hobby e arti creative > Modellismo > Modellini treni/set di treni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3577,'Arte e svago > Hobby e arti creative > Produzione casalinga di birra e vino');
insert into GOOGLE_CATEGORY (codice,descrizione) values(502980,'Arte e svago > Hobby e arti creative > Produzione casalinga di birra e vino > Bottiglie per imbottigliare');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3014,'Arte e svago > Hobby e arti creative > Produzione casalinga di birra e vino > Grano e malto per birra');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499891,'Arte e svago > Hobby e arti creative > Produzione casalinga di birra e vino > Kit per la produzione casalinga di birra e vino');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2579,'Arte e svago > Hobby e arti creative > Produzione casalinga di birra e vino > Produzione di vino');
insert into GOOGLE_CATEGORY (codice,descrizione) values(54,'Arte e svago > Hobby e arti creative > Strumenti musicali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4984,'Arte e svago > Hobby e arti creative > Strumenti musicali > Cornamuse');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4983,'Arte e svago > Hobby e arti creative > Strumenti musicali > Fisarmoniche/fisarmoniche portatili');
insert into GOOGLE_CATEGORY (codice,descrizione) values(63,'Arte e svago > Hobby e arti creative > Strumenti musicali > Ottoni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(67,'Arte e svago > Hobby e arti creative > Strumenti musicali > Ottoni > Corni a pistoni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505769,'Arte e svago > Hobby e arti creative > Strumenti musicali > Ottoni > Corni alti e baritoni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(65,'Arte e svago > Hobby e arti creative > Strumenti musicali > Ottoni > Eufoni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505770,'Arte e svago > Hobby e arti creative > Strumenti musicali > Ottoni > Trombe e cornette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(70,'Arte e svago > Hobby e arti creative > Strumenti musicali > Ottoni > Tromboni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(72,'Arte e svago > Hobby e arti creative > Strumenti musicali > Ottoni > Tube');
insert into GOOGLE_CATEGORY (codice,descrizione) values(75,'Arte e svago > Hobby e arti creative > Strumenti musicali > Percussioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2518,'Arte e svago > Hobby e arti creative > Strumenti musicali > Percussioni > Batterie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2856,'Arte e svago > Hobby e arti creative > Strumenti musicali > Percussioni > Batterie elettroniche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2797,'Arte e svago > Hobby e arti creative > Strumenti musicali > Percussioni > Casse chiare');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3015,'Arte e svago > Hobby e arti creative > Strumenti musicali > Percussioni > Charleston');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6098,'Arte e svago > Hobby e arti creative > Strumenti musicali > Percussioni > Gong');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2917,'Arte e svago > Hobby e arti creative > Strumenti musicali > Percussioni > Grancasse');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7431,'Arte e svago > Hobby e arti creative > Strumenti musicali > Percussioni > Metallofoni e xilofoni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7285,'Arte e svago > Hobby e arti creative > Strumenti musicali > Percussioni > Percussioni a mano');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7291,'Arte e svago > Hobby e arti creative > Strumenti musicali > Percussioni > Percussioni a mano > Blocchi musicali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7293,'Arte e svago > Hobby e arti creative > Strumenti musicali > Percussioni > Percussioni a mano > Campanacci musicali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7555,'Arte e svago > Hobby e arti creative > Strumenti musicali > Percussioni > Percussioni a mano > Campane e campanelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2515,'Arte e svago > Hobby e arti creative > Strumenti musicali > Percussioni > Percussioni a mano > Cembali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7288,'Arte e svago > Hobby e arti creative > Strumenti musicali > Percussioni > Percussioni a mano > Cimbali per dita e mani');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7286,'Arte e svago > Hobby e arti creative > Strumenti musicali > Percussioni > Percussioni a mano > Güiro e raganelle');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7289,'Arte e svago > Hobby e arti creative > Strumenti musicali > Percussioni > Percussioni a mano > Nacchere e legnetti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7287,'Arte e svago > Hobby e arti creative > Strumenti musicali > Percussioni > Percussioni a mano > Sonagli musicali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7295,'Arte e svago > Hobby e arti creative > Strumenti musicali > Percussioni > Percussioni a mano > Tamburi manuali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7298,'Arte e svago > Hobby e arti creative > Strumenti musicali > Percussioni > Percussioni a mano > Tamburi manuali > Bonghi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7297,'Arte e svago > Hobby e arti creative > Strumenti musicali > Percussioni > Percussioni a mano > Tamburi manuali > Cajón');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7296,'Arte e svago > Hobby e arti creative > Strumenti musicali > Percussioni > Percussioni a mano > Tamburi manuali > Conga');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7302,'Arte e svago > Hobby e arti creative > Strumenti musicali > Percussioni > Percussioni a mano > Tamburi manuali > Tabla');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7299,'Arte e svago > Hobby e arti creative > Strumenti musicali > Percussioni > Percussioni a mano > Tamburi manuali > Tamburi a calice');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7300,'Arte e svago > Hobby e arti creative > Strumenti musicali > Percussioni > Percussioni a mano > Tamburi manuali > Tamburi a cornice');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7301,'Arte e svago > Hobby e arti creative > Strumenti musicali > Percussioni > Percussioni a mano > Tamburi manuali > Tamburi parlanti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7290,'Arte e svago > Hobby e arti creative > Strumenti musicali > Percussioni > Percussioni a mano > Triangoli musicali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7294,'Arte e svago > Hobby e arti creative > Strumenti musicali > Percussioni > Percussioni a mano > Vibraslap');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3043,'Arte e svago > Hobby e arti creative > Strumenti musicali > Percussioni > Piatti per batteria');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7232,'Arte e svago > Hobby e arti creative > Strumenti musicali > Percussioni > Sordine per esercitazioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3005,'Arte e svago > Hobby e arti creative > Strumenti musicali > Percussioni > Tom-tom');
insert into GOOGLE_CATEGORY (codice,descrizione) values(76,'Arte e svago > Hobby e arti creative > Strumenti musicali > Pianoforti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(77,'Arte e svago > Hobby e arti creative > Strumenti musicali > Strumenti a corda');
insert into GOOGLE_CATEGORY (codice,descrizione) values(84,'Arte e svago > Hobby e arti creative > Strumenti musicali > Strumenti a corda > Arpe');
insert into GOOGLE_CATEGORY (codice,descrizione) values(80,'Arte e svago > Hobby e arti creative > Strumenti musicali > Strumenti a corda > Chitarre');
insert into GOOGLE_CATEGORY (codice,descrizione) values(78,'Arte e svago > Hobby e arti creative > Strumenti musicali > Strumenti a corda > Contrabbassi verticali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(85,'Arte e svago > Hobby e arti creative > Strumenti musicali > Strumenti a corda > Viole');
insert into GOOGLE_CATEGORY (codice,descrizione) values(86,'Arte e svago > Hobby e arti creative > Strumenti musicali > Strumenti a corda > Violini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(79,'Arte e svago > Hobby e arti creative > Strumenti musicali > Strumenti a corda > Violoncelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(87,'Arte e svago > Hobby e arti creative > Strumenti musicali > Strumenti a fiato');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4743,'Arte e svago > Hobby e arti creative > Strumenti musicali > Strumenti a fiato > Armoniche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(88,'Arte e svago > Hobby e arti creative > Strumenti musicali > Strumenti a fiato > Clarinetti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4540,'Arte e svago > Hobby e arti creative > Strumenti musicali > Strumenti a fiato > Fagotti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6728,'Arte e svago > Hobby e arti creative > Strumenti musicali > Strumenti a fiato > Fischietti da capotreno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6721,'Arte e svago > Hobby e arti creative > Strumenti musicali > Strumenti a fiato > Fischietti in latta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(89,'Arte e svago > Hobby e arti creative > Strumenti musicali > Strumenti a fiato > Flauti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(90,'Arte e svago > Hobby e arti creative > Strumenti musicali > Strumenti a fiato > Flauti dolci');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7188,'Arte e svago > Hobby e arti creative > Strumenti musicali > Strumenti a fiato > Flauti per bambini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4744,'Arte e svago > Hobby e arti creative > Strumenti musicali > Strumenti a fiato > Marranzani');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5481,'Arte e svago > Hobby e arti creative > Strumenti musicali > Strumenti a fiato > Melodica');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4541,'Arte e svago > Hobby e arti creative > Strumenti musicali > Strumenti a fiato > Oboe');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7249,'Arte e svago > Hobby e arti creative > Strumenti musicali > Strumenti a fiato > Ocarine');
insert into GOOGLE_CATEGORY (codice,descrizione) values(91,'Arte e svago > Hobby e arti creative > Strumenti musicali > Strumenti a fiato > Sassofoni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7250,'Arte e svago > Hobby e arti creative > Strumenti musicali > Strumenti a fiato > Tubi sonori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6001,'Arte e svago > Hobby e arti creative > Strumenti musicali > Strumenti musicali elettronici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(245,'Arte e svago > Hobby e arti creative > Strumenti musicali > Strumenti musicali elettronici > Campionatori di audio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6002,'Arte e svago > Hobby e arti creative > Strumenti musicali > Strumenti musicali elettronici > Controller MIDI');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6003,'Arte e svago > Hobby e arti creative > Strumenti musicali > Strumenti musicali elettronici > Sintetizzatori audio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(74,'Arte e svago > Hobby e arti creative > Strumenti musicali > Strumenti musicali elettronici > Tastiere musicali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5709,'Arte e svago > Party e festeggiamenti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(96,'Arte e svago > Party e festeggiamenti > Articoli per la festa');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505763,'Arte e svago > Party e festeggiamenti > Articoli per la festa > Addobbi per sedie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1887,'Arte e svago > Party e festeggiamenti > Articoli per la festa > Biglietti di risposta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(328061,'Arte e svago > Party e festeggiamenti > Articoli per la festa > Biglietti per consigli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4730,'Arte e svago > Party e festeggiamenti > Articoli per la festa > Candeline');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5043,'Arte e svago > Party e festeggiamenti > Articoli per la festa > Cannucce e mescolatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6906,'Arte e svago > Party e festeggiamenti > Articoli per la festa > Cappellini da festa');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7097,'Arte e svago > Party e festeggiamenti > Articoli per la festa > Contenitori per biglietti e portainviti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2781,'Arte e svago > Party e festeggiamenti > Articoli per la festa > Coriandoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8110,'Arte e svago > Party e festeggiamenti > Articoli per la festa > Decorazioni gonfiabili per feste');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7007,'Arte e svago > Party e festeggiamenti > Articoli per la festa > Decorazioni per cocktail');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4914,'Arte e svago > Party e festeggiamenti > Articoli per la festa > Fuochi d \'artificio e petardi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3735,'Arte e svago > Party e festeggiamenti > Articoli per la festa > Giochi alcolici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3361,'Arte e svago > Party e festeggiamenti > Articoli per la festa > Giochi alcolici > Birra pong');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3440,'Arte e svago > Party e festeggiamenti > Articoli per la festa > Giochi alcolici > Birra pong > Tavoli per birra pong');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7160,'Arte e svago > Party e festeggiamenti > Articoli per la festa > Giochi per feste');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1371,'Arte e svago > Party e festeggiamenti > Articoli per la festa > Inviti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(502972,'Arte e svago > Party e festeggiamenti > Articoli per la festa > Kit di articoli per feste');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6311,'Arte e svago > Party e festeggiamenti > Articoli per la festa > Kit di palloncini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2587,'Arte e svago > Party e festeggiamenti > Articoli per la festa > Palloncini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3994,'Arte e svago > Party e festeggiamenti > Articoli per la festa > Piñatas');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8216,'Arte e svago > Party e festeggiamenti > Articoli per la festa > Pon-pon decorativi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8038,'Arte e svago > Party e festeggiamenti > Articoli per la festa > Programmi di eventi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4915,'Arte e svago > Party e festeggiamenti > Articoli per la festa > Scintilline');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2104,'Arte e svago > Party e festeggiamenti > Articoli per la festa > Segnaposti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1484,'Arte e svago > Party e festeggiamenti > Articoli per la festa > Sigilli per buste');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4351,'Arte e svago > Party e festeggiamenti > Articoli per la festa > Stelle filanti spray');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2531,'Arte e svago > Party e festeggiamenti > Articoli per la festa > Striscioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2783,'Arte e svago > Party e festeggiamenti > Articoli per la festa > Strumenti che fanno rumore/trombette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5472,'Arte e svago > Party e festeggiamenti > Articoli per la festa > Supporti segnaposto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(502981,'Arte e svago > Party e festeggiamenti > Articoli per la festa > Tende a fili e stelle filanti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5452,'Arte e svago > Party e festeggiamenti > Articoli per la festa > Tutto per la festa');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5453,'Arte e svago > Party e festeggiamenti > Articoli per la festa > Tutto per la festa > Bomboniere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(408,'Arte e svago > Party e festeggiamenti > Effetti visivi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5967,'Arte e svago > Party e festeggiamenti > Effetti visivi > Controller effetti speciali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(410,'Arte e svago > Party e festeggiamenti > Effetti visivi > Luci per effetti visivi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(409,'Arte e svago > Party e festeggiamenti > Effetti visivi > Macchine della nebbia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5711,'Arte e svago > Party e festeggiamenti > Effetti visivi > Palle da discoteca');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503028,'Arte e svago > Party e festeggiamenti > Effetti visivi > Supporto luci per effetti speciali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2559,'Arte e svago > Party e festeggiamenti > Regali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(95,'Arte e svago > Party e festeggiamenti > Regali > Biglietti di auguri e note');
insert into GOOGLE_CATEGORY (codice,descrizione) values(53,'Arte e svago > Party e festeggiamenti > Regali > Buoni regalo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(94,'Arte e svago > Party e festeggiamenti > Regali > Confezioni regalo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2816,'Arte e svago > Party e festeggiamenti > Regali > Confezioni regalo > Carta da regalo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6712,'Arte e svago > Party e festeggiamenti > Regali > Confezioni regalo > Carta velina');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5091,'Arte e svago > Party e festeggiamenti > Regali > Confezioni regalo > Confezioni regalo e scatole di latta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8213,'Arte e svago > Party e festeggiamenti > Regali > Confezioni regalo > Etichette e biglietti per regali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5838,'Arte e svago > Party e festeggiamenti > Regali > Confezioni regalo > Sacchetti regalo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2899,'Arte e svago > Party e festeggiamenti > Regali > Fiori freschi recisi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5916,'Arte e svago > Party e festeggiamenti > Regali > Mazzolini di fiori e fiori all \'occhiello per abito');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6100,'Arte e svago > Party e festeggiamenti > Regali > Spilloni ornamentali per corpetto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5868,'Arte e svago > Party e festeggiamenti > Trofei e premi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(632,'Articoli di ferramenta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2878,'Articoli di ferramenta > Accessori ferramenta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4696,'Articoli di ferramenta > Accessori ferramenta > Articoli per mobiletti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4699,'Articoli di ferramenta > Accessori ferramenta > Articoli per mobiletti > Ante per mobiletti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(232167,'Articoli di ferramenta > Accessori ferramenta > Articoli per mobiletti > Bocchette per serrature di armadietti e mobili');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4698,'Articoli di ferramenta > Accessori ferramenta > Articoli per mobiletti > Cerniere per mobili');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4697,'Articoli di ferramenta > Accessori ferramenta > Articoli per mobiletti > Piastre posteriori mobiletti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4700,'Articoli di ferramenta > Accessori ferramenta > Articoli per mobiletti > Pomelli/maniglie mobiletti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500054,'Articoli di ferramenta > Accessori ferramenta > Avvitatori da ferramenta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500055,'Articoli di ferramenta > Accessori ferramenta > Avvitatori da ferramenta > Barre filettate');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2408,'Articoli di ferramenta > Accessori ferramenta > Avvitatori da ferramenta > Chiodi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1739,'Articoli di ferramenta > Accessori ferramenta > Avvitatori da ferramenta > Dadi e bulloni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2195,'Articoli di ferramenta > Accessori ferramenta > Avvitatori da ferramenta > Guarnizioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7062,'Articoli di ferramenta > Accessori ferramenta > Avvitatori da ferramenta > Rivetti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1508,'Articoli di ferramenta > Accessori ferramenta > Avvitatori da ferramenta > Tasselli per cartongesso');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2251,'Articoli di ferramenta > Accessori ferramenta > Avvitatori da ferramenta > Viti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2230,'Articoli di ferramenta > Accessori ferramenta > Avvitatori da ferramenta > Viti tubolari');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7086,'Articoli di ferramenta > Accessori ferramenta > Blocchi di cemento');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1318,'Articoli di ferramenta > Accessori ferramenta > Bobine');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1771,'Articoli di ferramenta > Accessori ferramenta > Cerniere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503773,'Articoli di ferramenta > Accessori ferramenta > Cerniere, ganci e fibbie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(502978,'Articoli di ferramenta > Accessori ferramenta > Cerniere, ganci e fibbie > Fascette varie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(502992,'Articoli di ferramenta > Accessori ferramenta > Cerniere, ganci e fibbie > Fibbie per usi pratici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503770,'Articoli di ferramenta > Accessori ferramenta > Cerniere, ganci e fibbie > Ganci di sollevamento, morsetti e moschettoni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503764,'Articoli di ferramenta > Accessori ferramenta > Cerniere, ganci e fibbie > Maglie e connettori per catene');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3974,'Articoli di ferramenta > Accessori ferramenta > Conservazione/ordine attrezzi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3280,'Articoli di ferramenta > Accessori ferramenta > Conservazione/ordine attrezzi > Armadietti per attrezzi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3919,'Articoli di ferramenta > Accessori ferramenta > Conservazione/ordine attrezzi > Banchi da lavoro');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6876,'Articoli di ferramenta > Accessori ferramenta > Conservazione/ordine attrezzi > Borse porta-attrezzi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3980,'Articoli di ferramenta > Accessori ferramenta > Conservazione/ordine attrezzi > Cassette degli attrezzi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2485,'Articoli di ferramenta > Accessori ferramenta > Conservazione/ordine attrezzi > Cinture portautensili');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4031,'Articoli di ferramenta > Accessori ferramenta > Conservazione/ordine attrezzi > Custodie per attrezzi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500103,'Articoli di ferramenta > Accessori ferramenta > Conservazione/ordine attrezzi > Fodere e inserti per l \'organizzazione di strumenti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4199,'Articoli di ferramenta > Accessori ferramenta > Conservazione/ordine attrezzi > Portacanna dell \'acqua');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500030,'Articoli di ferramenta > Accessori ferramenta > Coperte e coperture per spostamenti e isolamento acustico');
insert into GOOGLE_CATEGORY (codice,descrizione) values(502977,'Articoli di ferramenta > Accessori ferramenta > Corde, fili e catene');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1492,'Articoli di ferramenta > Accessori ferramenta > Corde, fili e catene > Catene');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4469,'Articoli di ferramenta > Accessori ferramenta > Corde, fili e catene > Catenelle');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3053,'Articoli di ferramenta > Accessori ferramenta > Corde, fili e catene > Cavi e funi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6297,'Articoli di ferramenta > Accessori ferramenta > Corde, fili e catene > Cinghie di fissaggio carichi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6298,'Articoli di ferramenta > Accessori ferramenta > Corde, fili e catene > Corde elastiche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6904,'Articoli di ferramenta > Accessori ferramenta > Corde, fili e catene > Fil di ferro');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5119,'Articoli di ferramenta > Accessori ferramenta > Corde, fili e catene > Spago');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1816,'Articoli di ferramenta > Accessori ferramenta > Filtri e schermature');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8470,'Articoli di ferramenta > Accessori ferramenta > Guide per cassetti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499933,'Articoli di ferramenta > Accessori ferramenta > Molle');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7557,'Articoli di ferramenta > Accessori ferramenta > Nastri segnaletici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7270,'Articoli di ferramenta > Accessori ferramenta > Perni e cilindri');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8113,'Articoli di ferramenta > Accessori ferramenta > Piastre base per pali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8112,'Articoli di ferramenta > Accessori ferramenta > Picchetti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499981,'Articoli di ferramenta > Accessori ferramenta > Rotelle');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505320,'Articoli di ferramenta > Accessori ferramenta > Staffe e jack da parete');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7092,'Articoli di ferramenta > Accessori ferramenta > Staffe e supporti di rinforzo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503731,'Articoli di ferramenta > Accessori ferramenta > Stampi per fusione di metalli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1979,'Articoli di ferramenta > Accessori ferramenta > Teli protettivi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4988,'Articoli di ferramenta > Accessori ferramenta > Teloni di plastica');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6770,'Articoli di ferramenta > Accessori ferramenta > Tubi di lubrificazione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6841,'Articoli di ferramenta > Accessori ferramenta > Tubi per gas');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6769,'Articoli di ferramenta > Accessori ferramenta > Tubi pneumatici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3650,'Articoli di ferramenta > Accessori per attrezzi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3744,'Articoli di ferramenta > Accessori per attrezzi > Accessori fresatrici verticali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3673,'Articoli di ferramenta > Accessori per attrezzi > Accessori fresatrici verticali > Punte fresatrici verticali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3300,'Articoli di ferramenta > Accessori per attrezzi > Accessori fresatrici verticali > Tavoli fresatrici verticali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7326,'Articoli di ferramenta > Accessori per attrezzi > Accessori per asce');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7370,'Articoli di ferramenta > Accessori per attrezzi > Accessori per asce > Manici per asce');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7369,'Articoli di ferramenta > Accessori per attrezzi > Accessori per asce > Teste per asce');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4487,'Articoli di ferramenta > Accessori per attrezzi > Accessori per carteggio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3240,'Articoli di ferramenta > Accessori per attrezzi > Accessori per carteggio > Carta vetrata e spugne carteggio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6471,'Articoli di ferramenta > Accessori per attrezzi > Accessori per conducenti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3470,'Articoli di ferramenta > Accessori per attrezzi > Accessori per limatrici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3210,'Articoli di ferramenta > Accessori per attrezzi > Accessori per limatrici > Coltelli stozzatori limatrice');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7056,'Articoli di ferramenta > Accessori per attrezzi > Accessori per martelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7087,'Articoli di ferramenta > Accessori per attrezzi > Accessori per martelli > Accessori per martelli ad aria compressa');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7055,'Articoli di ferramenta > Accessori per attrezzi > Accessori per martelli > Manici di martelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7057,'Articoli di ferramenta > Accessori per attrezzi > Accessori per martelli > Teste per martelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505323,'Articoli di ferramenta > Accessori per attrezzi > Accessori per picconi e zappe');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505324,'Articoli di ferramenta > Accessori per attrezzi > Accessori per picconi e zappe > Manici per picconi e zappe');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6939,'Articoli di ferramenta > Accessori per attrezzi > Accessori per sabbiatura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6940,'Articoli di ferramenta > Accessori per attrezzi > Accessori per sabbiatura > Dispositivi per sabbiatura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499947,'Articoli di ferramenta > Accessori per attrezzi > Accessori per saldatura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6549,'Articoli di ferramenta > Accessori per attrezzi > Accessori per seghe');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7515,'Articoli di ferramenta > Accessori per attrezzi > Accessori per seghe > Accessori per seghe a nastro');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6503,'Articoli di ferramenta > Accessori per attrezzi > Accessori per seghe > Accessori per seghe circolari');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7345,'Articoli di ferramenta > Accessori per attrezzi > Accessori per seghe > Accessori per seghe circolari manuali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6501,'Articoli di ferramenta > Accessori per attrezzi > Accessori per seghe > Accessori per seghe da tavolo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7346,'Articoli di ferramenta > Accessori per attrezzi > Accessori per seghe > Accessori per seghetti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499859,'Articoli di ferramenta > Accessori per attrezzi > Accessori per smerigliatrici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499860,'Articoli di ferramenta > Accessori per attrezzi > Accessori per smerigliatrici > Dischi e punte per smerigliatrici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8117,'Articoli di ferramenta > Accessori per attrezzi > Accessori per taglierine');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8118,'Articoli di ferramenta > Accessori per attrezzi > Accessori per taglierine > Pinze di serraggio con dado');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3944,'Articoli di ferramenta > Accessori per attrezzi > Accessori per trapani e cacciavite');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7140,'Articoli di ferramenta > Accessori per attrezzi > Accessori per trapani e cacciavite > Adattatori e estensioni per punte di trapano');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6378,'Articoli di ferramenta > Accessori per attrezzi > Accessori per trapani e cacciavite > Affilatori per punte di trapano');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8275,'Articoli di ferramenta > Accessori per attrezzi > Accessori per trapani e cacciavite > Guide e supporti per punte');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8276,'Articoli di ferramenta > Accessori per attrezzi > Accessori per trapani e cacciavite > Mandrini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1540,'Articoli di ferramenta > Accessori per attrezzi > Accessori per trapani e cacciavite > Punte di trapano e cacciavite');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6806,'Articoli di ferramenta > Accessori per attrezzi > Accessori per trapani e cacciavite > Sega a tazza');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7019,'Articoli di ferramenta > Accessori per attrezzi > Accessori per verniciatura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7020,'Articoli di ferramenta > Accessori per attrezzi > Accessori per verniciatura > Accessori per rulli da verniciatura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6887,'Articoli di ferramenta > Accessori per attrezzi > Accessori per verniciatura > Accessori per spruzzatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(328062,'Articoli di ferramenta > Accessori per attrezzi > Accessori per verniciatura > Soluzioni per la pulizia dei pennelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3281,'Articoli di ferramenta > Accessori per attrezzi > Accessori saldatori a stilo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3609,'Articoli di ferramenta > Accessori per attrezzi > Accessori saldatori a stilo > Punte saldatori a stilo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3629,'Articoli di ferramenta > Accessori per attrezzi > Accessori saldatori a stilo > Supporti saldatori a stilo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5526,'Articoli di ferramenta > Accessori per attrezzi > Accessori strumenti/sensori misurazione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5556,'Articoli di ferramenta > Accessori per attrezzi > Accessori strumenti/sensori misurazione > Accessori gas detector');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7415,'Articoli di ferramenta > Accessori per attrezzi > Accessori strumenti/sensori misurazione > Accessori per misuratori di tensione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5557,'Articoli di ferramenta > Accessori per attrezzi > Accessori strumenti/sensori misurazione > Accessori per rilevatori di tensione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503007,'Articoli di ferramenta > Accessori per attrezzi > Accessori strumenti/sensori misurazione > Accessori per scale di misurazione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2447,'Articoli di ferramenta > Accessori per attrezzi > Accessori torce elettriche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6295,'Articoli di ferramenta > Accessori per attrezzi > Batterie per utensili elettrici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6292,'Articoli di ferramenta > Accessori per attrezzi > Caricabatterie per utensili elettrici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8258,'Articoli di ferramenta > Accessori per attrezzi > Cordini di sicurezza per attrezzi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505812,'Articoli di ferramenta > Accessori per attrezzi > Cunei');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505810,'Articoli di ferramenta > Accessori per attrezzi > Cunei per manici di utensili');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2380,'Articoli di ferramenta > Accessori per attrezzi > Graffette industriali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2174,'Articoli di ferramenta > Accessori per attrezzi > Lame per attrezzi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505831,'Articoli di ferramenta > Accessori per attrezzi > Lame per attrezzi > Lame a raschietto e frese');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2202,'Articoli di ferramenta > Accessori per attrezzi > Lame per attrezzi > Lame per seghe');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7472,'Articoli di ferramenta > Accessori per attrezzi > Magnetizzatori e demagnetizzatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6907,'Articoli di ferramenta > Accessori per attrezzi > Maschere di foratura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499886,'Articoli di ferramenta > Accessori per attrezzi > Pale per miscelatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5571,'Articoli di ferramenta > Accessori per attrezzi > Prese per strumenti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4658,'Articoli di ferramenta > Accessori per attrezzi > Supporti per attrezzi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4659,'Articoli di ferramenta > Accessori per attrezzi > Supporti per attrezzi > Supporti per seghe');
insert into GOOGLE_CATEGORY (codice,descrizione) values(128,'Articoli di ferramenta > Barriere e recinzioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(502983,'Articoli di ferramenta > Barriere e recinzioni > Accessori per cancelli e recinzioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499958,'Articoli di ferramenta > Barriere e recinzioni > Barriere di sicurezza e controllo delle folle');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1788,'Articoli di ferramenta > Barriere e recinzioni > Cancelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(502986,'Articoli di ferramenta > Barriere e recinzioni > Delimitazioni e recinzioni da giardino');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1919,'Articoli di ferramenta > Barriere e recinzioni > Pali e assi per recinzioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(502973,'Articoli di ferramenta > Barriere e recinzioni > Pannelli per recinzioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1352,'Articoli di ferramenta > Barriere e recinzioni > Picchetti per recinzioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(502984,'Articoli di ferramenta > Barriere e recinzioni > Reticolato');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1910,'Articoli di ferramenta > Cisterne');
insert into GOOGLE_CATEGORY (codice,descrizione) values(127,'Articoli di ferramenta > Forniture elettriche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4709,'Articoli di ferramenta > Forniture elettriche > Accessori generatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6375,'Articoli di ferramenta > Forniture elettriche > Accessori per prolunghe');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500049,'Articoli di ferramenta > Forniture elettriche > Armature, rotori e statori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503729,'Articoli di ferramenta > Forniture elettriche > Connettori e terminali cavo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2028,'Articoli di ferramenta > Forniture elettriche > Connettori telefono e dati');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6833,'Articoli di ferramenta > Forniture elettriche > Controlli e sensori per prese');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5533,'Articoli di ferramenta > Forniture elettriche > Convertitori di potenza');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5627,'Articoli di ferramenta > Forniture elettriche > Copriprese elettriche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2345,'Articoli di ferramenta > Forniture elettriche > Fili e cavi elettrici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1218,'Articoli di ferramenta > Forniture elettriche > Generatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6459,'Articoli di ferramenta > Forniture elettriche > Interruttori elettrici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1935,'Articoli di ferramenta > Forniture elettriche > Interruttori elettrici > Interruttori della luce');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499932,'Articoli di ferramenta > Forniture elettriche > Interruttori elettrici > Interruttori elettrici speciali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5142,'Articoli di ferramenta > Forniture elettriche > Invertitori di corrente');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4715,'Articoli di ferramenta > Forniture elettriche > Kit fotovoltaici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2413,'Articoli di ferramenta > Forniture elettriche > Kit per la domotica');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7275,'Articoli di ferramenta > Forniture elettriche > Motori elettrici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6807,'Articoli di ferramenta > Forniture elettriche > Pannelli per interruttori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4714,'Articoli di ferramenta > Forniture elettriche > Pannelli solari');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2377,'Articoli di ferramenta > Forniture elettriche > Placche a muro e coperture');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499966,'Articoli di ferramenta > Forniture elettriche > Prese di corrente');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1869,'Articoli di ferramenta > Forniture elettriche > Prese elettriche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4789,'Articoli di ferramenta > Forniture elettriche > Prolunghe');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505318,'Articoli di ferramenta > Forniture elettriche > Regolatori e trasformatori di tensione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7183,'Articoli di ferramenta > Forniture elettriche > Resistenze e starter');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2006,'Articoli di ferramenta > Forniture elettriche > Scatole di derivazione e staffe');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499893,'Articoli di ferramenta > Forniture elettriche > Spazzole di carbonio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2274,'Articoli di ferramenta > Forniture elettriche > Tappi e dadi per cavi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499768,'Articoli di ferramenta > Forniture elettriche > Tubi e alloggiamenti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499770,'Articoli di ferramenta > Forniture elettriche > Tubi e alloggiamenti > Condotti elettrici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3797,'Articoli di ferramenta > Forniture elettriche > Tubi e alloggiamenti > Guaine termorestringenti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(115,'Articoli di ferramenta > Materiali da costruzione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503777,'Articoli di ferramenta > Materiali da costruzione > Barre e reticolati di ferro');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503776,'Articoli di ferramenta > Materiali da costruzione > Cartongesso');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6343,'Articoli di ferramenta > Materiali da costruzione > Componenti per porte');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2795,'Articoli di ferramenta > Materiali da costruzione > Componenti per porte > Batacchi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(99338,'Articoli di ferramenta > Materiali da costruzione > Componenti per porte > Bocchette per serrature');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2972,'Articoli di ferramenta > Materiali da costruzione > Componenti per porte > Campanelli per porte');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6446,'Articoli di ferramenta > Materiali da costruzione > Componenti per porte > Chiudiporte');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2665,'Articoli di ferramenta > Materiali da costruzione > Componenti per porte > Fermaporta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1356,'Articoli di ferramenta > Materiali da costruzione > Componenti per porte > Maniglie per porte e maniglie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499970,'Articoli di ferramenta > Materiali da costruzione > Componenti per porte > Piastre per spinta porte');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6458,'Articoli di ferramenta > Materiali da costruzione > Componenti per porte > Serrature');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503727,'Articoli di ferramenta > Materiali da costruzione > Componenti per porte > Telai per porte');
insert into GOOGLE_CATEGORY (codice,descrizione) values(124,'Articoli di ferramenta > Materiali da costruzione > Finestre');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505300,'Articoli di ferramenta > Materiali da costruzione > Impermeabilizzanti e protezione dalle intemperie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(122,'Articoli di ferramenta > Materiali da costruzione > Isolamento');
insert into GOOGLE_CATEGORY (codice,descrizione) values(125,'Articoli di ferramenta > Materiali da costruzione > Legname');
insert into GOOGLE_CATEGORY (codice,descrizione) values(123,'Articoli di ferramenta > Materiali da costruzione > Materiali per coperture');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4544,'Articoli di ferramenta > Materiali da costruzione > Materiali per coperture > Accessori per grondaie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8270,'Articoli di ferramenta > Materiali da costruzione > Materiali per coperture > Coperture e tegole per tetti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(121,'Articoli di ferramenta > Materiali da costruzione > Materiali per coperture > Grondaie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2008,'Articoli di ferramenta > Materiali da costruzione > Materiali per coperture > Scossaline');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499772,'Articoli di ferramenta > Materiali da costruzione > Materiali per finestre');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499773,'Articoli di ferramenta > Materiali da costruzione > Materiali per finestre > Manovelle per finestre');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503728,'Articoli di ferramenta > Materiali da costruzione > Materiali per finestre > Telai per finestre');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7112,'Articoli di ferramenta > Materiali da costruzione > Modanature');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7053,'Articoli di ferramenta > Materiali da costruzione > Pannelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7439,'Articoli di ferramenta > Materiali da costruzione > Pannelli e schiume insonorizzanti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2826,'Articoli di ferramenta > Materiali da costruzione > Pavimenti e moquette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2729,'Articoli di ferramenta > Materiali da costruzione > Piani di lavoro');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7136,'Articoli di ferramenta > Materiali da costruzione > Piastrelle per pareti e soffitti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(119,'Articoli di ferramenta > Materiali da costruzione > Porte');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4634,'Articoli di ferramenta > Materiali da costruzione > Porte > Porte di casa');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4468,'Articoli di ferramenta > Materiali da costruzione > Porte > Porte per garage');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2030,'Articoli di ferramenta > Materiali da costruzione > Portelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503775,'Articoli di ferramenta > Materiali da costruzione > Rivestimenti laterali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7004,'Articoli di ferramenta > Materiali da costruzione > Scalinate');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6943,'Articoli di ferramenta > Materiali da costruzione > Serrande');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499949,'Articoli di ferramenta > Materiali da costruzione > Sistemi per corrimano e rotaie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(120,'Articoli di ferramenta > Materiali da costruzione > Vetro');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503739,'Articoli di ferramenta > Materiali di consumo per costruzioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503742,'Articoli di ferramenta > Materiali di consumo per costruzioni > Adesivi e colle per articoli di ferramenta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505802,'Articoli di ferramenta > Materiali di consumo per costruzioni > Intonaco e composti per riparare pareti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1995,'Articoli di ferramenta > Materiali di consumo per costruzioni > Lega per saldare e fondente');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1753,'Articoli di ferramenta > Materiali di consumo per costruzioni > Lubrificanti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503740,'Articoli di ferramenta > Materiali di consumo per costruzioni > Materiali di consumo per la pittura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2474,'Articoli di ferramenta > Materiali di consumo per costruzioni > Materiali di consumo per la pittura > Leganti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2058,'Articoli di ferramenta > Materiali di consumo per costruzioni > Materiali di consumo per la pittura > Mestica');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1648,'Articoli di ferramenta > Materiali di consumo per costruzioni > Materiali di consumo per la pittura > Mordente');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1361,'Articoli di ferramenta > Materiali di consumo per costruzioni > Materiali di consumo per la pittura > Pitture');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503738,'Articoli di ferramenta > Materiali di consumo per costruzioni > Materiali di consumo per la pittura > Vernici e finiture');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503743,'Articoli di ferramenta > Materiali di consumo per costruzioni > Materiali di consumo per opere di muratura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2282,'Articoli di ferramenta > Materiali di consumo per costruzioni > Materiali di consumo per opere di muratura > Cementi, malte e miscele di calcestruzzo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499876,'Articoli di ferramenta > Materiali di consumo per costruzioni > Materiali di consumo per opere di muratura > Malta liquida');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3031,'Articoli di ferramenta > Materiali di consumo per costruzioni > Materiali di consumo per opere di muratura > Mattoni e calcestruzzo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2212,'Articoli di ferramenta > Materiali di consumo per costruzioni > Nastro da pacchi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505305,'Articoli di ferramenta > Materiali di consumo per costruzioni > Primer per tubi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2277,'Articoli di ferramenta > Materiali di consumo per costruzioni > Prodotti chimici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6795,'Articoli di ferramenta > Materiali di consumo per costruzioni > Prodotti chimici > Ammoniaca');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1749,'Articoli di ferramenta > Materiali di consumo per costruzioni > Prodotti chimici > Liquidi disgorganti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500088,'Articoli di ferramenta > Materiali di consumo per costruzioni > Prodotti chimici > Liquido per accendini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1735,'Articoli di ferramenta > Materiali di consumo per costruzioni > Prodotti chimici > Neutralizzatori di acidi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6191,'Articoli di ferramenta > Materiali di consumo per costruzioni > Prodotti chimici > Prodotti antigelo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7504,'Articoli di ferramenta > Materiali di consumo per costruzioni > Prodotti chimici > Prodotti di pulizia per cemento e murature');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7470,'Articoli di ferramenta > Materiali di consumo per costruzioni > Prodotti chimici > Prodotti di pulizia per fosse settiche e pozzi neri');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7503,'Articoli di ferramenta > Materiali di consumo per costruzioni > Prodotti chimici > Prodotti di pulizia per ponti e recinti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1479,'Articoli di ferramenta > Materiali di consumo per costruzioni > Prodotti chimici > Pulizia canne fumarie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505319,'Articoli di ferramenta > Materiali di consumo per costruzioni > Prodotti chimici > Spray congelante per uso elettrico');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503744,'Articoli di ferramenta > Materiali di consumo per costruzioni > Sigillanti e rivestimenti protettivi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503741,'Articoli di ferramenta > Materiali di consumo per costruzioni > Solventi, sverniciatori e diluenti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499982,'Articoli di ferramenta > Piccoli motori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500096,'Articoli di ferramenta > Pompe da ferramenta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500100,'Articoli di ferramenta > Pompe da ferramenta > Pompe e sistemi per pozzi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500099,'Articoli di ferramenta > Pompe da ferramenta > Pompe per elettrodomestici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500097,'Articoli di ferramenta > Pompe da ferramenta > Pompe per irrigazione e irrigatori a pioggia e pompe ausiliarie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500098,'Articoli di ferramenta > Pompe da ferramenta > Pompe per piscine, fontane e laghetti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500102,'Articoli di ferramenta > Pompe da ferramenta > Pompe per pozzi neri, liquami e scarichi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500101,'Articoli di ferramenta > Pompe da ferramenta > Pompe per utenze');
insert into GOOGLE_CATEGORY (codice,descrizione) values(133,'Articoli di ferramenta > Prodotti idraulici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1673,'Articoli di ferramenta > Prodotti idraulici > Articoli idraulici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7244,'Articoli di ferramenta > Prodotti idraulici > Articoli idraulici > Cabine e kit per doccia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1687,'Articoli di ferramenta > Prodotti idraulici > Articoli idraulici > Lavandini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2886,'Articoli di ferramenta > Prodotti idraulici > Articoli idraulici > Lavandini > Lavandini bagno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2757,'Articoli di ferramenta > Prodotti idraulici > Articoli idraulici > Lavandini > Lavandini cucina');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2032,'Articoli di ferramenta > Prodotti idraulici > Articoli idraulici > Rubinetteria');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499999,'Articoli di ferramenta > Prodotti idraulici > Articoli idraulici > Set di sanitari per bagno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1636,'Articoli di ferramenta > Prodotti idraulici > Articoli idraulici > Vasche da bagno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2062,'Articoli di ferramenta > Prodotti idraulici > Articoli idraulici > WC e bidet');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2376,'Articoli di ferramenta > Prodotti idraulici > Articoli idraulici > WC e bidet > Bidet');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1746,'Articoli di ferramenta > Prodotti idraulici > Articoli idraulici > WC e bidet > Orinatoi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1921,'Articoli di ferramenta > Prodotti idraulici > Articoli idraulici > WC e bidet > WC');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1723,'Articoli di ferramenta > Prodotti idraulici > Articoli per pozzi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2273,'Articoli di ferramenta > Prodotti idraulici > Distribuzione/filtro acqua');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2171,'Articoli di ferramenta > Prodotti idraulici > Distribuzione/filtro acqua > Accessori per filtro acqua');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2063,'Articoli di ferramenta > Prodotti idraulici > Distribuzione/filtro acqua > Accessori per filtro acqua > Cartucce filtri acqua');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2406,'Articoli di ferramenta > Prodotti idraulici > Distribuzione/filtro acqua > Accessori per filtro acqua > Contenitori filtri acqua');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1952,'Articoli di ferramenta > Prodotti idraulici > Distribuzione/filtro acqua > Addolcitori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1390,'Articoli di ferramenta > Prodotti idraulici > Distribuzione/filtro acqua > Distillatori acqua');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2343,'Articoli di ferramenta > Prodotti idraulici > Distribuzione/filtro acqua > Distributori d \'acqua');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1821,'Articoli di ferramenta > Prodotti idraulici > Distribuzione/filtro acqua > Distributori d \'acqua > Fontanelle');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1354,'Articoli di ferramenta > Prodotti idraulici > Distribuzione/filtro acqua > Distributori d \'acqua > Refrigeratori ad acqua');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2055,'Articoli di ferramenta > Prodotti idraulici > Distribuzione/filtro acqua > Filtri acqua integrati');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5646,'Articoli di ferramenta > Prodotti idraulici > Distribuzione/filtro acqua > Sale anticalcare');
insert into GOOGLE_CATEGORY (codice,descrizione) values(504635,'Articoli di ferramenta > Prodotti idraulici > Ferramenta per la riparazione di impianti idraulici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2691,'Articoli di ferramenta > Prodotti idraulici > Ferramenta per la riparazione di impianti idraulici > Accessori WC e bidet');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5666,'Articoli di ferramenta > Prodotti idraulici > Ferramenta per la riparazione di impianti idraulici > Accessori WC e bidet > Coperchi di vaschette esterne per WC');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7358,'Articoli di ferramenta > Prodotti idraulici > Ferramenta per la riparazione di impianti idraulici > Accessori WC e bidet > Copriwater');
insert into GOOGLE_CATEGORY (codice,descrizione) values(504634,'Articoli di ferramenta > Prodotti idraulici > Ferramenta per la riparazione di impianti idraulici > Accessori WC e bidet > Doccette igieniche e rubinetti per bidet');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1425,'Articoli di ferramenta > Prodotti idraulici > Ferramenta per la riparazione di impianti idraulici > Accessori WC e bidet > Galleggianti/flapper');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2478,'Articoli di ferramenta > Prodotti idraulici > Ferramenta per la riparazione di impianti idraulici > Accessori WC e bidet > Guarnizione WC');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2817,'Articoli di ferramenta > Prodotti idraulici > Ferramenta per la riparazione di impianti idraulici > Accessori WC e bidet > Leve per vaschette di WC');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7446,'Articoli di ferramenta > Prodotti idraulici > Ferramenta per la riparazione di impianti idraulici > Accessori WC e bidet > Rivestimenti per coperchi di water');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1865,'Articoli di ferramenta > Prodotti idraulici > Ferramenta per la riparazione di impianti idraulici > Accessori WC e bidet > Tavolette WC e bidet');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5665,'Articoli di ferramenta > Prodotti idraulici > Ferramenta per la riparazione di impianti idraulici > Accessori WC e bidet > Vaschette per WC');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1963,'Articoli di ferramenta > Prodotti idraulici > Ferramenta per la riparazione di impianti idraulici > Accessori lavandini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2410,'Articoli di ferramenta > Prodotti idraulici > Ferramenta per la riparazione di impianti idraulici > Accessori lavandini > Gambe lavandini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1489,'Articoli di ferramenta > Prodotti idraulici > Ferramenta per la riparazione di impianti idraulici > Accessori rubinetti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8115,'Articoli di ferramenta > Prodotti idraulici > Ferramenta per la riparazione di impianti idraulici > Accessori rubinetti > Aeratori per rubinetti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8116,'Articoli di ferramenta > Prodotti idraulici > Ferramenta per la riparazione di impianti idraulici > Accessori rubinetti > Manopole per rubinetti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2996,'Articoli di ferramenta > Prodotti idraulici > Ferramenta per la riparazione di impianti idraulici > Accessori vasche da bagno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505368,'Articoli di ferramenta > Prodotti idraulici > Ferramenta per la riparazione di impianti idraulici > Accessori vasche da bagno > Piedini e basi per vasche da bagno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5508,'Articoli di ferramenta > Prodotti idraulici > Ferramenta per la riparazione di impianti idraulici > Accessori vasche da bagno > Rivestimenti vasche da bagno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2463,'Articoli di ferramenta > Prodotti idraulici > Ferramenta per la riparazione di impianti idraulici > Accessori vasche da bagno > Rubinetti vasche da bagno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(504636,'Articoli di ferramenta > Prodotti idraulici > Ferramenta per la riparazione di impianti idraulici > Articoli per idraulica');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2206,'Articoli di ferramenta > Prodotti idraulici > Ferramenta per la riparazione di impianti idraulici > Componenti doccia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(504638,'Articoli di ferramenta > Prodotti idraulici > Ferramenta per la riparazione di impianti idraulici > Componenti doccia > Connettori e bracci doccia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8277,'Articoli di ferramenta > Prodotti idraulici > Ferramenta per la riparazione di impianti idraulici > Componenti doccia > Docce elettriche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5048,'Articoli di ferramenta > Prodotti idraulici > Ferramenta per la riparazione di impianti idraulici > Componenti doccia > Filtri acqua doccia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8320,'Articoli di ferramenta > Prodotti idraulici > Ferramenta per la riparazione di impianti idraulici > Componenti doccia > Getti per vasca da bagno e doccia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2088,'Articoli di ferramenta > Prodotti idraulici > Ferramenta per la riparazione di impianti idraulici > Componenti doccia > Pannelli doccia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7130,'Articoli di ferramenta > Prodotti idraulici > Ferramenta per la riparazione di impianti idraulici > Componenti doccia > Pareti doccia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4728,'Articoli di ferramenta > Prodotti idraulici > Ferramenta per la riparazione di impianti idraulici > Componenti doccia > Piatti doccia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1779,'Articoli di ferramenta > Prodotti idraulici > Ferramenta per la riparazione di impianti idraulici > Componenti doccia > Porte doccia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(581,'Articoli di ferramenta > Prodotti idraulici > Ferramenta per la riparazione di impianti idraulici > Componenti doccia > Soffioni doccia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(504637,'Articoli di ferramenta > Prodotti idraulici > Ferramenta per la riparazione di impianti idraulici > Componenti idraulici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1514,'Articoli di ferramenta > Prodotti idraulici > Ferramenta per la riparazione di impianti idraulici > Componenti idraulici > Griglie di scarico');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2257,'Articoli di ferramenta > Prodotti idraulici > Ferramenta per la riparazione di impianti idraulici > Componenti idraulici > Liner di scarico');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2851,'Articoli di ferramenta > Prodotti idraulici > Ferramenta per la riparazione di impianti idraulici > Componenti idraulici > Rubinetti e filtri idraulici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2170,'Articoli di ferramenta > Prodotti idraulici > Ferramenta per la riparazione di impianti idraulici > Componenti idraulici > Scarichi idraulici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1932,'Articoli di ferramenta > Prodotti idraulici > Ferramenta per la riparazione di impianti idraulici > Componenti idraulici > Sgorgatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1319,'Articoli di ferramenta > Prodotti idraulici > Ferramenta per la riparazione di impianti idraulici > Componenti idraulici > Sifoni idraulici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1407,'Articoli di ferramenta > Prodotti idraulici > Ferramenta per la riparazione di impianti idraulici > Componenti idraulici > Sonde per spurgo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1458,'Articoli di ferramenta > Prodotti idraulici > Ferramenta per la riparazione di impianti idraulici > Piastre di fissaggio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2203,'Articoli di ferramenta > Prodotti idraulici > Kit per riparazioni idrauliche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2243,'Articoli di ferramenta > Prodotti idraulici > Livellatori acqua');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1810,'Articoli di ferramenta > Prodotti idraulici > Supporti e raccordi per tubi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2710,'Articoli di ferramenta > Prodotti idraulici > Supporti e raccordi per tubi > Adattatori e boccole tubi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2909,'Articoli di ferramenta > Prodotti idraulici > Supporti e raccordi per tubi > Cappucci e tappi per tubi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1694,'Articoli di ferramenta > Prodotti idraulici > Supporti e raccordi per tubi > Flange idrauliche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6732,'Articoli di ferramenta > Prodotti idraulici > Supporti e raccordi per tubi > Guarnizioni idrauliche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2634,'Articoli di ferramenta > Prodotti idraulici > Supporti e raccordi per tubi > Morsetti per tubi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2359,'Articoli di ferramenta > Prodotti idraulici > Supporti e raccordi per tubi > Raccordi tubi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2611,'Articoli di ferramenta > Prodotti idraulici > Supporti e raccordi per tubi > Regolatori idraulici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499697,'Articoli di ferramenta > Prodotti idraulici > Supporti e raccordi per tubi > Telai e supporti interni alle pareti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2068,'Articoli di ferramenta > Prodotti idraulici > Supporti e raccordi per tubi > Ugelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2466,'Articoli di ferramenta > Prodotti idraulici > Supporti e raccordi per tubi > Valvole idrauliche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6832,'Articoli di ferramenta > Prodotti idraulici > Timer per acqua');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2216,'Articoli di ferramenta > Prodotti idraulici > Tubature idrauliche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2570,'Articoli di ferramenta > Prodotti idraulici > Tubi e flessibili');
insert into GOOGLE_CATEGORY (codice,descrizione) values(502975,'Articoli di ferramenta > Serbatoi e contenitori per carburante');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1974,'Articoli di ferramenta > Serrature e chiavi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8067,'Articoli di ferramenta > Serrature e chiavi > Cappucci per chiavi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6488,'Articoli di ferramenta > Serrature e chiavi > Chiavi per duplicati');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503730,'Articoli di ferramenta > Serrature e chiavi > Lucchetti e chiavistelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1870,'Articoli di ferramenta > Serrature e chiavi > Sistemi ingresso con chiave magnetica');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1167,'Articoli di ferramenta > Utensili');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503774,'Articoli di ferramenta > Utensili > Accendini e fiammiferi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1171,'Articoli di ferramenta > Utensili > Accette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1644,'Articoli di ferramenta > Utensili > Affilatrici, temperamatite');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1819,'Articoli di ferramenta > Utensili > Alesatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2077,'Articoli di ferramenta > Utensili > Articoli per verniciatura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6556,'Articoli di ferramenta > Utensili > Articoli per verniciatura > Accessori per dipingere i bordi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2486,'Articoli di ferramenta > Utensili > Articoli per verniciatura > Aerografi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505325,'Articoli di ferramenta > Utensili > Articoli per verniciatura > Filtri per vernice');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499888,'Articoli di ferramenta > Utensili > Articoli per verniciatura > Miscelatori per vernice');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1300,'Articoli di ferramenta > Utensili > Articoli per verniciatura > Pennelli da pittura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1774,'Articoli di ferramenta > Utensili > Articoli per verniciatura > Rulli per vernici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2465,'Articoli di ferramenta > Utensili > Articoli per verniciatura > Spruzzatori vernici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1699,'Articoli di ferramenta > Utensili > Articoli per verniciatura > Spugne per vernici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6557,'Articoli di ferramenta > Utensili > Articoli per verniciatura > Vassoi per vernici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1215,'Articoli di ferramenta > Utensili > Attrezzi da calafato');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1832,'Articoli di ferramenta > Utensili > Attrezzi per marcatura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1193,'Articoli di ferramenta > Utensili > Attrezzi per muratura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1668,'Articoli di ferramenta > Utensili > Attrezzi per muratura > Attrezzi per murature');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2305,'Articoli di ferramenta > Utensili > Attrezzi per muratura > Betoniere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2181,'Articoli di ferramenta > Utensili > Attrezzi per muratura > Cazzuole');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1555,'Articoli di ferramenta > Utensili > Attrezzi per muratura > Corde da costruzione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4132,'Articoli di ferramenta > Utensili > Attrezzi per muratura > Frattazzatrici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2337,'Articoli di ferramenta > Utensili > Attrezzi per muratura > Frattazzi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1450,'Articoli di ferramenta > Utensili > Attrezzi per muratura > Jointer muratura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1799,'Articoli di ferramenta > Utensili > Attrezzi per muratura > Profilatori per bordi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7484,'Articoli di ferramenta > Utensili > Attrezzi per muratura > Spugne per intonaco');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1196,'Articoli di ferramenta > Utensili > Attrezzi per raccogliere oggetti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1180,'Articoli di ferramenta > Utensili > Attrezzi per taglio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1454,'Articoli di ferramenta > Utensili > Attrezzi per taglio > Cesoie e roditrici manuali per metalli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1824,'Articoli di ferramenta > Utensili > Attrezzi per taglio > Cesoie per tondini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2411,'Articoli di ferramenta > Utensili > Attrezzi per taglio > Coltelli multiuso');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7562,'Articoli di ferramenta > Utensili > Attrezzi per taglio > Pinze nipper');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1181,'Articoli di ferramenta > Utensili > Attrezzi per taglio > Tagliabulloni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2726,'Articoli di ferramenta > Utensili > Attrezzi per taglio > Tagliapiastrelle e scandole');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2080,'Articoli di ferramenta > Utensili > Attrezzi per taglio > Tagliatubi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1182,'Articoli di ferramenta > Utensili > Attrezzi per taglio > Tagliavetro');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1221,'Articoli di ferramenta > Utensili > Avvitatori a impulsi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1203,'Articoli di ferramenta > Utensili > Cacciaviti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1195,'Articoli di ferramenta > Utensili > Cacciaviti testa esagonale');
insert into GOOGLE_CATEGORY (codice,descrizione) values(126,'Articoli di ferramenta > Utensili > Carrelli merci');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1201,'Articoli di ferramenta > Utensili > Cavalletti (per legna)');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1174,'Articoli di ferramenta > Utensili > Ceselli e scalpellini per intaglio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1632,'Articoli di ferramenta > Utensili > Chiavi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2015,'Articoli di ferramenta > Utensili > Compattatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4325,'Articoli di ferramenta > Utensili > Compressori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5873,'Articoli di ferramenta > Utensili > Elettromagneti da sollevamento');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1584,'Articoli di ferramenta > Utensili > Filettatrici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6461,'Articoli di ferramenta > Utensili > Fish tape per elettricisti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3501,'Articoli di ferramenta > Utensili > Foratrici per pali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5077,'Articoli di ferramenta > Utensili > Fresatrici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1841,'Articoli di ferramenta > Utensili > Fresatrici verticali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1787,'Articoli di ferramenta > Utensili > Frese per rubinetti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7271,'Articoli di ferramenta > Utensili > Giunti per carpenteria');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1169,'Articoli di ferramenta > Utensili > Incudini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1194,'Articoli di ferramenta > Utensili > Levachiodi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1923,'Articoli di ferramenta > Utensili > Limatrici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5592,'Articoli di ferramenta > Utensili > Luci da lavoro');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1225,'Articoli di ferramenta > Utensili > Lucidatrici e pulitrici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1186,'Articoli di ferramenta > Utensili > Martelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505364,'Articoli di ferramenta > Utensili > Martelli > Martelli a batteria');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2208,'Articoli di ferramenta > Utensili > Martelli > Martelli manuali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1184,'Articoli di ferramenta > Utensili > Maschi filettatori e filiere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499887,'Articoli di ferramenta > Utensili > Miscelatori manuali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1219,'Articoli di ferramenta > Utensili > Molatrici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2835,'Articoli di ferramenta > Utensili > Morse e morsetti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1179,'Articoli di ferramenta > Utensili > Palanchini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6868,'Articoli di ferramenta > Utensili > Piallatrici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1187,'Articoli di ferramenta > Utensili > Pialle');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3932,'Articoli di ferramenta > Utensili > Picconi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1667,'Articoli di ferramenta > Utensili > Piegatubi e curvatubi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1958,'Articoli di ferramenta > Utensili > Pinze da ferramenta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1185,'Articoli di ferramenta > Utensili > Pinze manuali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7556,'Articoli di ferramenta > Utensili > Pistole lubrificanti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1220,'Articoli di ferramenta > Utensili > Pistole termiche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2053,'Articoli di ferramenta > Utensili > Pulizia tubi e condutture');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505315,'Articoli di ferramenta > Utensili > Punzoni e punteruoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7064,'Articoli di ferramenta > Utensili > Rivettatrici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7066,'Articoli di ferramenta > Utensili > Rivettatrici > Rivettatrici manuali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7065,'Articoli di ferramenta > Utensili > Rivettatrici > Rivettatrici pneumatiche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6938,'Articoli di ferramenta > Utensili > Sabbiatrici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1236,'Articoli di ferramenta > Utensili > Saldatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1238,'Articoli di ferramenta > Utensili > Saldatori a pistola e strumenti per taglio al plasma');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1391,'Articoli di ferramenta > Utensili > Sbavatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(130,'Articoli di ferramenta > Utensili > Scale e ponteggi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2416,'Articoli di ferramenta > Utensili > Scale e ponteggi > Carrelli con scale');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1809,'Articoli di ferramenta > Utensili > Scale e ponteggi > Piattaforme di lavoro');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1866,'Articoli di ferramenta > Utensili > Scale e ponteggi > Ponteggi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6928,'Articoli di ferramenta > Utensili > Scale e ponteggi > Scale');
insert into GOOGLE_CATEGORY (codice,descrizione) values(635,'Articoli di ferramenta > Utensili > Scale e ponteggi > Sgabelli a gradini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5828,'Articoli di ferramenta > Utensili > Scarichi per filtri dell \'olio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4672,'Articoli di ferramenta > Utensili > Scope calcestruzzo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1235,'Articoli di ferramenta > Utensili > Seghe, seghetti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499985,'Articoli di ferramenta > Utensili > Seghe, seghetti > Seghe a pannello');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3516,'Articoli di ferramenta > Utensili > Seghe, seghetti > Seghe circolari per metalli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3224,'Articoli di ferramenta > Utensili > Seghe, seghetti > Seghe circolari portatili');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3706,'Articoli di ferramenta > Utensili > Seghe, seghetti > Seghe da piano, banchi sega');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3582,'Articoli di ferramenta > Utensili > Seghe, seghetti > Seghe nastro');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3725,'Articoli di ferramenta > Utensili > Seghe, seghetti > Seghetti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3594,'Articoli di ferramenta > Utensili > Seghe, seghetti > Seghetti a lama libera');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3494,'Articoli di ferramenta > Utensili > Seghe, seghetti > Seghetti alternativi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4633,'Articoli di ferramenta > Utensili > Seghe, seghetti > Seghetti da traforo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7077,'Articoli di ferramenta > Utensili > Seghe, seghetti > Taglia mattoni e piastrelle');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3517,'Articoli di ferramenta > Utensili > Seghe, seghetti > Troncatrici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4919,'Articoli di ferramenta > Utensili > Set di attrezzi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4716,'Articoli di ferramenta > Utensili > Set di attrezzi > Set combinati utensili elettrici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6965,'Articoli di ferramenta > Utensili > Set di attrezzi > Set di utensili');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1188,'Articoli di ferramenta > Utensili > Smerigliatrici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7030,'Articoli di ferramenta > Utensili > Spaccalegna');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1206,'Articoli di ferramenta > Utensili > Sparachiodi e spillatrici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1202,'Articoli di ferramenta > Utensili > Spatole e raschietti per stucco');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2792,'Articoli di ferramenta > Utensili > Spazzole per camini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1862,'Articoli di ferramenta > Utensili > Spazzole per tubi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7416,'Articoli di ferramenta > Utensili > Specchi di ispezione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1603,'Articoli di ferramenta > Utensili > Strumenti cambio lampadine');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1305,'Articoli di ferramenta > Utensili > Strumenti/sensori misurazione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4022,'Articoli di ferramenta > Utensili > Strumenti/sensori misurazione > Altimetri');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500058,'Articoli di ferramenta > Utensili > Strumenti/sensori misurazione > Anemometri');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3602,'Articoli di ferramenta > Utensili > Strumenti/sensori misurazione > Barometri');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1698,'Articoli di ferramenta > Utensili > Strumenti/sensori misurazione > Bilance');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2192,'Articoli di ferramenta > Utensili > Strumenti/sensori misurazione > Calibri');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1533,'Articoli di ferramenta > Utensili > Strumenti/sensori misurazione > Calibri calcolo pezzi legno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1850,'Articoli di ferramenta > Utensili > Strumenti/sensori misurazione > Compassi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5371,'Articoli di ferramenta > Utensili > Strumenti/sensori misurazione > Contatori geiger');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4758,'Articoli di ferramenta > Utensili > Strumenti/sensori misurazione > Esposimetri UV');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2481,'Articoli di ferramenta > Utensili > Strumenti/sensori misurazione > Flessometri');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1640,'Articoli di ferramenta > Utensili > Strumenti/sensori misurazione > Flussimetri e controllori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4757,'Articoli di ferramenta > Utensili > Strumenti/sensori misurazione > Fonometri');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1198,'Articoli di ferramenta > Utensili > Strumenti/sensori misurazione > Goniometri');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2330,'Articoli di ferramenta > Utensili > Strumenti/sensori misurazione > Guide coltelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4754,'Articoli di ferramenta > Utensili > Strumenti/sensori misurazione > Igrometri');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1191,'Articoli di ferramenta > Utensili > Strumenti/sensori misurazione > Livelle');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4081,'Articoli di ferramenta > Utensili > Strumenti/sensori misurazione > Livelle > Livelle a bolla');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4931,'Articoli di ferramenta > Utensili > Strumenti/sensori misurazione > Livelle > Livelle laser');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4294,'Articoli di ferramenta > Utensili > Strumenti/sensori misurazione > Livelle > Livelli visivi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1539,'Articoli di ferramenta > Utensili > Strumenti/sensori misurazione > Localizzatori di tondini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1732,'Articoli di ferramenta > Utensili > Strumenti/sensori misurazione > Misuratori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5487,'Articoli di ferramenta > Utensili > Strumenti/sensori misurazione > Misuratori di distanza');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4755,'Articoli di ferramenta > Utensili > Strumenti/sensori misurazione > Misuratori di umidità');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4759,'Articoli di ferramenta > Utensili > Strumenti/sensori misurazione > Misuratori di vibrazioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4074,'Articoli di ferramenta > Utensili > Strumenti/sensori misurazione > Piaccametri');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1413,'Articoli di ferramenta > Utensili > Strumenti/sensori misurazione > Righe');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2021,'Articoli di ferramenta > Utensili > Strumenti/sensori misurazione > Righelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1991,'Articoli di ferramenta > Utensili > Strumenti/sensori misurazione > Rilevatori di gas');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5515,'Articoli di ferramenta > Utensili > Strumenti/sensori misurazione > Rilevatori qualità dell \'aria');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1459,'Articoli di ferramenta > Utensili > Strumenti/sensori misurazione > Ruote di misurazione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1207,'Articoli di ferramenta > Utensili > Strumenti/sensori misurazione > Sensori tubi e cavi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4756,'Articoli di ferramenta > Utensili > Strumenti/sensori misurazione > Sismografo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1785,'Articoli di ferramenta > Utensili > Strumenti/sensori misurazione > Sonde e rilevatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1205,'Articoli di ferramenta > Utensili > Strumenti/sensori misurazione > Squadre');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1374,'Articoli di ferramenta > Utensili > Strumenti/sensori misurazione > Stazioni meteorologiche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503737,'Articoli di ferramenta > Utensili > Strumenti/sensori misurazione > Strumenti per test elettrici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6799,'Articoli di ferramenta > Utensili > Strumenti/sensori misurazione > Telecamere termografiche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4340,'Articoli di ferramenta > Utensili > Strumenti/sensori misurazione > Teodoliti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2093,'Articoli di ferramenta > Utensili > Strumenti/sensori misurazione > Termocoppie e termopile');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4506,'Articoli di ferramenta > Utensili > Strumenti/sensori misurazione > Termometri a infrarossi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7394,'Articoli di ferramenta > Utensili > Strumenti/sensori misurazione > Trasduttori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1563,'Articoli di ferramenta > Utensili > Sturalavandini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4419,'Articoli di ferramenta > Utensili > Tamponi per carteggiatura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5927,'Articoli di ferramenta > Utensili > Torce');
insert into GOOGLE_CATEGORY (codice,descrizione) values(338,'Articoli di ferramenta > Utensili > Torce tascabili e da testa');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1663,'Articoli di ferramenta > Utensili > Torni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1217,'Articoli di ferramenta > Utensili > Trapani');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1465,'Articoli di ferramenta > Utensili > Trapani > Cavatrici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1216,'Articoli di ferramenta > Utensili > Trapani > Trapani a colonna');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1994,'Articoli di ferramenta > Utensili > Trapani > Trapani pneumatici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2629,'Articoli di ferramenta > Utensili > Trapani > Trapani portatili');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1367,'Articoli di ferramenta > Utensili > Trapani > Trivelle');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1439,'Articoli di ferramenta > Utensili > Utensile Chiavi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2198,'Articoli di ferramenta > Utensili > Utensile Spatole');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3745,'Articoli di ferramenta > Utensili > Utensile lime');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5587,'Articoli di ferramenta > Utensili > Utensili elettrici multifunzione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1469,'Articoli di ferramenta > Utensili > Utensili per fili e cavi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2456,'Articoli di ferramenta > Utensili > Vibratori per industria');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499873,'Articoli di ferramenta > Ventilazione, riscaldamento e condizionamento');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2766,'Articoli di ferramenta > Ventilazione, riscaldamento e condizionamento > Bocche e condotti aerazione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499874,'Articoli di ferramenta > Ventilazione, riscaldamento e condizionamento > Condotti d \'aria');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1519,'Articoli di ferramenta > Ventilazione, riscaldamento e condizionamento > Controlli HVAC');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2238,'Articoli di ferramenta > Ventilazione, riscaldamento e condizionamento > Controlli HVAC > Quadri di controllo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500043,'Articoli di ferramenta > Ventilazione, riscaldamento e condizionamento > Controlli HVAC > Strumenti per la misurazione dell \'umidità');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1897,'Articoli di ferramenta > Ventilazione, riscaldamento e condizionamento > Controlli HVAC > Termostati');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500090,'Articoli di ferramenta > Ventilazione, riscaldamento e condizionamento > Filtri/essiccatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(772,'Articoli per adulti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(780,'Articoli per adulti > Armi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2214,'Articoli per adulti > Armi > Accessori e pulizia armi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503026,'Articoli per adulti > Armi > Accessori e pulizia armi > Attrezzature e accessori per ricarica');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499857,'Articoli per adulti > Armi > Accessori e pulizia armi > Attrezzature e accessori per ricarica > Presse per ricarica di munizioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505762,'Articoli per adulti > Armi > Accessori e pulizia armi > Custodie e contenitori di munizioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500048,'Articoli per adulti > Armi > Accessori e pulizia armi > Custodie per pistole e borse da poligono');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1783,'Articoli per adulti > Armi > Accessori e pulizia armi > Fondine pistole');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1806,'Articoli per adulti > Armi > Accessori e pulizia armi > Impugnature pistole');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5067,'Articoli per adulti > Armi > Accessori e pulizia armi > Luci per pistole');
insert into GOOGLE_CATEGORY (codice,descrizione) values(781,'Articoli per adulti > Armi > Accessori e pulizia armi > Munizioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503021,'Articoli per adulti > Armi > Accessori e pulizia armi > Pulizia delle pistole');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499855,'Articoli per adulti > Armi > Accessori e pulizia armi > Pulizia delle pistole > Panni e scovoli per la pulizia delle armi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499856,'Articoli per adulti > Armi > Accessori e pulizia armi > Pulizia delle pistole > Pezzuole per la pulizia delle armi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499854,'Articoli per adulti > Armi > Accessori e pulizia armi > Pulizia delle pistole > Solventi per la pulizia delle armi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1822,'Articoli per adulti > Armi > Accessori e pulizia armi > Rastrelliere armi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499853,'Articoli per adulti > Armi > Accessori e pulizia armi > Tracolle per armi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3924,'Articoli per adulti > Armi > Bastoni e armi ad asta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7567,'Articoli per adulti > Armi > Bastoni e mazze');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6109,'Articoli per adulti > Armi > Coltelli da guerra');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3437,'Articoli per adulti > Armi > Fruste');
insert into GOOGLE_CATEGORY (codice,descrizione) values(726,'Articoli per adulti > Armi > Gas lacrimogeno e spray al pepe');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7175,'Articoli per adulti > Armi > Lance');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3092,'Articoli per adulti > Armi > Nunchuk');
insert into GOOGLE_CATEGORY (codice,descrizione) values(782,'Articoli per adulti > Armi > Pistole');
insert into GOOGLE_CATEGORY (codice,descrizione) values(727,'Articoli per adulti > Armi > Pistole stordenti e taser');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3694,'Articoli per adulti > Armi > Shuriken');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3666,'Articoli per adulti > Armi > Spade');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3833,'Articoli per adulti > Armi > Tirapugni ottone');
insert into GOOGLE_CATEGORY (codice,descrizione) values(773,'Articoli per adulti > Erotismo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(774,'Articoli per adulti > Erotismo > Abbigliamento erotico');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5055,'Articoli per adulti > Erotismo > Cibi afrodisiaci/commestibili');
insert into GOOGLE_CATEGORY (codice,descrizione) values(776,'Articoli per adulti > Erotismo > DVD e video erotici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(778,'Articoli per adulti > Erotismo > Giocattoli sessuali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6040,'Articoli per adulti > Erotismo > Giochi erotici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6536,'Articoli per adulti > Erotismo > Kit per pole dance');
insert into GOOGLE_CATEGORY (codice,descrizione) values(779,'Articoli per adulti > Erotismo > Libri erotici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4060,'Articoli per adulti > Erotismo > Riviste erotiche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1,'Articoli per animali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2,'Articoli per animali > Animali domestici - Articoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505811,'Articoli per animali > Animali domestici - Articoli > Accessori per gattaiole');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500084,'Articoli per animali > Animali domestici - Articoli > Accessori per lettini per animali domestici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500110,'Articoli per animali > Animali domestici - Articoli > Accessori per tappetini riscaldanti per animali domestici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500026,'Articoli per animali > Animali domestici - Articoli > Accessori per trasportini e gabbie per animali domestici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7,'Articoli per animali > Animali domestici - Articoli > Articoli anfibi e rettili');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5027,'Articoli per animali > Animali domestici - Articoli > Articoli anfibi e rettili > Accessori habitat rettili e anfibi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5026,'Articoli per animali > Animali domestici - Articoli > Articoli anfibi e rettili > Cibo per rettili e anfibi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5029,'Articoli per animali > Animali domestici - Articoli > Articoli anfibi e rettili > Habitat rettili e anfibi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5028,'Articoli per animali > Animali domestici - Articoli > Articoli anfibi e rettili > Riscaldamento/illuminazione habitat rettili e anfibi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5030,'Articoli per animali > Animali domestici - Articoli > Articoli anfibi e rettili > Substrati rettili e anfibi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5013,'Articoli per animali > Animali domestici - Articoli > Articoli animali piccola taglia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5016,'Articoli per animali > Animali domestici - Articoli > Articoli animali piccola taglia > Accessori habitat piccoli animali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5015,'Articoli per animali > Animali domestici - Articoli > Articoli animali piccola taglia > Cibo per piccoli animali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5014,'Articoli per animali > Animali domestici - Articoli > Articoli animali piccola taglia > Giacigli piccoli animali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5017,'Articoli per animali > Animali domestici - Articoli > Articoli animali piccola taglia > Habitat/gabbie piccoli animali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7517,'Articoli per animali > Animali domestici - Articoli > Articoli animali piccola taglia > Ricompense per animali di piccola taglia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5,'Articoli per animali > Animali domestici - Articoli > Articoli per cani');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5004,'Articoli per animali > Animali domestici - Articoli > Articoli per cani > Abbigliamento per cani');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7428,'Articoli per animali > Animali domestici - Articoli > Articoli per cani > Accessori per cucce e recinti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5094,'Articoli per animali > Animali domestici - Articoli > Articoli per cani > Casette per cani');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3530,'Articoli per animali > Animali domestici - Articoli > Articoli per cani > Cibo per cani');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7274,'Articoli per animali > Animali domestici - Articoli > Articoli per cani > Cucce e recinti per cani');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5010,'Articoli per animali > Animali domestici - Articoli > Articoli per cani > Giochi per cani');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4434,'Articoli per animali > Animali domestici - Articoli > Articoli per cani > Lettini per cani');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7372,'Articoli per animali > Animali domestici - Articoli > Articoli per cani > Mutandine e pannolini per cani');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499900,'Articoli per animali > Animali domestici - Articoli > Articoli per cani > Pannolini per cani');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5011,'Articoli per animali > Animali domestici - Articoli > Articoli per cani > Snack per cani');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8123,'Articoli per animali > Animali domestici - Articoli > Articoli per cani > Tapis roulant per cani');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4,'Articoli per animali > Animali domestici - Articoli > Articoli per gatti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5082,'Articoli per animali > Animali domestici - Articoli > Articoli per gatti > Abbigliamento per gatti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500059,'Articoli per animali > Animali domestici - Articoli > Articoli per gatti > Accessori per mobili per gatti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4997,'Articoli per animali > Animali domestici - Articoli > Articoli per gatti > Arredi per gatti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5000,'Articoli per animali > Animali domestici - Articoli > Articoli per gatti > Cassette lettiera per gatti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3367,'Articoli per animali > Animali domestici - Articoli > Articoli per gatti > Cibo per gatti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4433,'Articoli per animali > Animali domestici - Articoli > Articoli per gatti > Cucce per gatti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8069,'Articoli per animali > Animali domestici - Articoli > Articoli per gatti > Fodere per lettiere per gatti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5001,'Articoli per animali > Animali domestici - Articoli > Articoli per gatti > Giochi per gatti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4999,'Articoli per animali > Animali domestici - Articoli > Articoli per gatti > Lettiera per gatti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5002,'Articoli per animali > Animali domestici - Articoli > Articoli per gatti > Snack per gatti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7142,'Articoli per animali > Animali domestici - Articoli > Articoli per gatti > Tappetini per lettiera per gatti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6383,'Articoli per animali > Animali domestici - Articoli > Articoli per la cura dell \'aspetto degli animali domestici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8167,'Articoli per animali > Animali domestici - Articoli > Articoli per la cura dell \'aspetto degli animali domestici > Asciugatori per animali domestici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7319,'Articoli per animali > Animali domestici - Articoli > Articoli per la cura dell \'aspetto degli animali domestici > Attrezzi per unghie per animali domestici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503733,'Articoli per animali > Animali domestici - Articoli > Articoli per la cura dell \'aspetto degli animali domestici > Deodoranti e profumi per animali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6384,'Articoli per animali > Animali domestici - Articoli > Articoli per la cura dell \'aspetto degli animali domestici > Forbici e taglia peli per animali domestici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6385,'Articoli per animali > Animali domestici - Articoli > Articoli per la cura dell \'aspetto degli animali domestici > Pettini e spazzole per animali domestici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499917,'Articoli per animali > Animali domestici - Articoli > Articoli per la cura dell \'aspetto degli animali domestici > Salviettine per animali domestici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6406,'Articoli per animali > Animali domestici - Articoli > Articoli per la cura dell \'aspetto degli animali domestici > Shampoo e balsamo per animali domestici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7318,'Articoli per animali > Animali domestici - Articoli > Articoli per la cura dell \'aspetto degli animali domestici > Smalto per unghie per animali domestici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6,'Articoli per animali > Animali domestici - Articoli > Articoli per pesci');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3238,'Articoli per animali > Animali domestici - Articoli > Articoli per pesci > Acquari');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5019,'Articoli per animali > Animali domestici - Articoli > Articoli per pesci > Decorazioni per acquari');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505307,'Articoli per animali > Animali domestici - Articoli > Articoli per pesci > Diffusori d \'aria e pietre porose per acquari');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6403,'Articoli per animali > Animali domestici - Articoli > Articoli per pesci > Distributori cibo per pesci');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6085,'Articoli per animali > Animali domestici - Articoli > Articoli per pesci > Fertilizzanti per piante acquatiche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5020,'Articoli per animali > Animali domestici - Articoli > Articoli per pesci > Filtri per acquario');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5021,'Articoli per animali > Animali domestici - Articoli > Articoli per pesci > Ghiaietta/substrati acquario');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5079,'Articoli per animali > Animali domestici - Articoli > Articoli per pesci > Illuminazione per acquari');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5024,'Articoli per animali > Animali domestici - Articoli > Articoli per pesci > Mangime per pesci');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5161,'Articoli per animali > Animali domestici - Articoli > Articoli per pesci > Prodotti pulizia acqua acquari');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505306,'Articoli per animali > Animali domestici - Articoli > Articoli per pesci > Retini per acquari');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500038,'Articoli per animali > Animali domestici - Articoli > Articoli per pesci > Ricambi per la pulizia degli acquari');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500062,'Articoli per animali > Animali domestici - Articoli > Articoli per pesci > Sistemi di controllo della temperatura degli acquari');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6951,'Articoli per animali > Animali domestici - Articoli > Articoli per pesci > Stabilizzatori livello acquario');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5023,'Articoli per animali > Animali domestici - Articoli > Articoli per pesci > Supporti per acquari');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505303,'Articoli per animali > Animali domestici - Articoli > Articoli per pesci > Tubazioni per stagni e acquari');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3,'Articoli per animali > Animali domestici - Articoli > Articoli per uccelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7385,'Articoli per animali > Animali domestici - Articoli > Articoli per uccelli > Accessori per gabbie per uccelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7386,'Articoli per animali > Animali domestici - Articoli > Articoli per uccelli > Accessori per gabbie per uccelli > Contenitori per acqua e cibo per gabbie per uccelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499954,'Articoli per animali > Animali domestici - Articoli > Articoli per uccelli > Accessori per gabbie per uccelli > Vasche per uccelli per gabbie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4989,'Articoli per animali > Animali domestici - Articoli > Articoli per uccelli > Gabbie e trespoli uccelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4992,'Articoli per animali > Animali domestici - Articoli > Articoli per uccelli > Giochi per uccellini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4990,'Articoli per animali > Animali domestici - Articoli > Articoli per uccelli > Mangime per volatili');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4993,'Articoli per animali > Animali domestici - Articoli > Articoli per uccelli > Premi per volatili');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4991,'Articoli per animali > Animali domestici - Articoli > Articoli per uccelli > Scalette e trespoli uccelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7398,'Articoli per animali > Animali domestici - Articoli > Articoli per uccelli > Trespoli e palestre per uccelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6983,'Articoli per animali > Animali domestici - Articoli > Attrezzi per addestramento animali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8474,'Articoli per animali > Animali domestici - Articoli > Barriere per animali domestici sui veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5087,'Articoli per animali > Animali domestici - Articoli > Box per animali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5092,'Articoli per animali > Animali domestici - Articoli > Campanelli/ciondoli animali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6861,'Articoli per animali > Animali domestici - Articoli > Cerotti e bendaggi veterinari');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6252,'Articoli per animali > Animali domestici - Articoli > Ciotole, distributori di cibo, distributori di acqua per animali domestici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6250,'Articoli per animali > Animali domestici - Articoli > Collari e pettorine per animali domestici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5145,'Articoli per animali > Animali domestici - Articoli > Collari medici per animali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5162,'Articoli per animali > Animali domestici - Articoli > Contenitori cibo animali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6248,'Articoli per animali > Animali domestici - Articoli > Controllo delle pulci e delle zecche negli animali domestici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(502982,'Articoli per animali > Animali domestici - Articoli > Distributori e contenitori per sacchetti igienici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6253,'Articoli per animali > Animali domestici - Articoli > Estensioni guinzaglio per animali domestici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6251,'Articoli per animali > Animali domestici - Articoli > Gabbie e trasportini per animali domestici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8050,'Articoli per animali > Animali domestici - Articoli > Gocce e colliri per animali domestici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6811,'Articoli per animali > Animali domestici - Articoli > Grucce per abbigliamento per animali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6249,'Articoli per animali > Animali domestici - Articoli > Guinzagli per animali domestici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7144,'Articoli per animali > Animali domestici - Articoli > Igiene orale per animali domestici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8068,'Articoli per animali > Animali domestici - Articoli > Kit di emergenza e pronto soccorso per animali domestici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505314,'Articoli per animali > Animali domestici - Articoli > Materiali per l \'addestramento dei cani');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505313,'Articoli per animali > Animali domestici - Articoli > Materiali per l \'addestramento dei cani > Clicker e portasnack per l \'addestramento dei cani');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505304,'Articoli per animali > Animali domestici - Articoli > Materiali per l \'addestramento dei cani > Portatappetini per l \'addestramento dei cani');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505311,'Articoli per animali > Animali domestici - Articoli > Materiali per l \'addestramento dei cani > Spray e soluzioni per l \'addestramento dei cani');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6846,'Articoli per animali > Animali domestici - Articoli > Materiali per l \'addestramento dei cani > Tappetini igienici per cani');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5093,'Articoli per animali > Animali domestici - Articoli > Medagliette per animali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5086,'Articoli per animali > Animali domestici - Articoli > Medicinali per animali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6978,'Articoli per animali > Animali domestici - Articoli > Monitor biometrici per animali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6982,'Articoli per animali > Animali domestici - Articoli > Monitor biometrici per animali > Contapassi per animali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6980,'Articoli per animali > Animali domestici - Articoli > Monitor biometrici per animali > Misuratori di glicemia per animali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6981,'Articoli per animali > Animali domestici - Articoli > Monitor biometrici per animali > Termometri per animali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5144,'Articoli per animali > Animali domestici - Articoli > Museruole');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5163,'Articoli per animali > Animali domestici - Articoli > Palette cibo cani');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6276,'Articoli per animali > Animali domestici - Articoli > Passeggini per animali domestici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4497,'Articoli per animali > Animali domestici - Articoli > Porte basculanti per animali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7396,'Articoli per animali > Animali domestici - Articoli > Protezione solare per animali domestici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8070,'Articoli per animali > Animali domestici - Articoli > Sacchetti igienici per animali domestici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6973,'Articoli per animali > Animali domestici - Articoli > Scala per animali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6321,'Articoli per animali > Animali domestici - Articoli > Sistemi di contenimento per animali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505297,'Articoli per animali > Animali domestici - Articoli > Strumenti e sistemi per lo smaltimento delle deiezioni di animali domestici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8513,'Articoli per animali > Animali domestici - Articoli > Supporti per ciotole per animali domestici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7143,'Articoli per animali > Animali domestici - Articoli > Tappetini per ciotole per animali domestici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499743,'Articoli per animali > Animali domestici - Articoli > Tappetini riscaldati per animali domestici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5081,'Articoli per animali > Animali domestici - Articoli > Vitamine/integratori animali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3237,'Articoli per animali > Animali vivi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5605,'Articoli religiosi e per cerimonie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5455,'Articoli religiosi e per cerimonie > Articoli per cerimonia di nozze');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5456,'Articoli religiosi e per cerimonie > Articoli per cerimonia di nozze > Cestini per i fiori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5457,'Articoli religiosi e per cerimonie > Articoli per cerimonia di nozze > Custodie e cuscinetti per fedi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503723,'Articoli religiosi e per cerimonie > Articoli per cerimonia di nozze > Tappeto nuziale');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5606,'Articoli religiosi e per cerimonie > Articoli per cerimonie commemorative');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5607,'Articoli religiosi e per cerimonie > Articoli per cerimonie commemorative > Urne memoriali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(97,'Articoli religiosi e per cerimonie > Articoli religiosi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7120,'Articoli religiosi e per cerimonie > Articoli religiosi > Altari religiosi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3923,'Articoli religiosi e per cerimonie > Articoli religiosi > Grani per rosario');
insert into GOOGLE_CATEGORY (codice,descrizione) values(328060,'Articoli religiosi e per cerimonie > Articoli religiosi > Santini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499711,'Articoli religiosi e per cerimonie > Articoli religiosi > Tarocchi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1949,'Articoli religiosi e per cerimonie > Articoli religiosi > Veli religiosi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(988,'Articoli sportivi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(990,'Articoli sportivi > Esercizio e fitness');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6337,'Articoli sportivi > Esercizio e fitness > Accessori per rulli fitness');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6338,'Articoli sportivi > Esercizio e fitness > Accessori per rulli fitness > Sacche per rulli fitness');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499798,'Articoli sportivi > Esercizio e fitness > Attrezzi per allenamento in sospensione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499796,'Articoli sportivi > Esercizio e fitness > Attrezzi per l \'allenamento dell \'equilibrio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6867,'Articoli sportivi > Esercizio e fitness > Attrezzi per mani');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8215,'Articoli sportivi > Esercizio e fitness > Barre per flessioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499792,'Articoli sportivi > Esercizio e fitness > Cardio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4598,'Articoli sportivi > Esercizio e fitness > Cardio > Accessori cardio machine');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499702,'Articoli sportivi > Esercizio e fitness > Cardio > Accessori cardio machine > Accessori per cyclette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499703,'Articoli sportivi > Esercizio e fitness > Cardio > Accessori cardio machine > Accessori per ellittica');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499700,'Articoli sportivi > Esercizio e fitness > Cardio > Accessori cardio machine > Accessori per stepper');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499699,'Articoli sportivi > Esercizio e fitness > Cardio > Accessori cardio machine > Accessori per tapis roulant');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499701,'Articoli sportivi > Esercizio e fitness > Cardio > Accessori cardio machine > Accessori per vogatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4589,'Articoli sportivi > Esercizio e fitness > Cardio > Cardio machine');
insert into GOOGLE_CATEGORY (codice,descrizione) values(994,'Articoli sportivi > Esercizio e fitness > Cardio > Cardio machine > Cyclette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(992,'Articoli sportivi > Esercizio e fitness > Cardio > Cardio machine > Elliptical');
insert into GOOGLE_CATEGORY (codice,descrizione) values(996,'Articoli sportivi > Esercizio e fitness > Cardio > Cardio machine > Stepper');
insert into GOOGLE_CATEGORY (codice,descrizione) values(997,'Articoli sportivi > Esercizio e fitness > Cardio > Cardio machine > Tapis roulant');
insert into GOOGLE_CATEGORY (codice,descrizione) values(995,'Articoli sportivi > Esercizio e fitness > Cardio > Cardio machine > Vogatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2614,'Articoli sportivi > Esercizio e fitness > Cardio > Corde per saltare');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5319,'Articoli sportivi > Esercizio e fitness > Cilindri in gommapiuma');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5693,'Articoli sportivi > Esercizio e fitness > Cronometri');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8471,'Articoli sportivi > Esercizio e fitness > Cunei per esercizi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5869,'Articoli sportivi > Esercizio e fitness > Elastici da ginnastica');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6103,'Articoli sportivi > Esercizio e fitness > Indumenti pesanti per allenamento');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505302,'Articoli sportivi > Esercizio e fitness > Luci e catarifrangenti per la sicurezza sportiva');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8066,'Articoli sportivi > Esercizio e fitness > Macchine per esercizi con vibrazione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3938,'Articoli sportivi > Esercizio e fitness > Palle mediche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7174,'Articoli sportivi > Esercizio e fitness > Palline per i riflessi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(993,'Articoli sportivi > Esercizio e fitness > Palloni per esercizi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499795,'Articoli sportivi > Esercizio e fitness > Panche per esercizi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8062,'Articoli sportivi > Esercizio e fitness > Paracadute per velocità e resistenza');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499797,'Articoli sportivi > Esercizio e fitness > Ruote e rulli per addominali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499912,'Articoli sportivi > Esercizio e fitness > Sedie romane');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499978,'Articoli sportivi > Esercizio e fitness > Set di dispositivi e macchine per esercizio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(355576,'Articoli sportivi > Esercizio e fitness > Sistemi e panche a inversione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499793,'Articoli sportivi > Esercizio e fitness > Sollevamento pesi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6452,'Articoli sportivi > Esercizio e fitness > Sollevamento pesi > Accessori per massa muscolare');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3271,'Articoli sportivi > Esercizio e fitness > Sollevamento pesi > Accessori per massa muscolare > Barre per pesi liberi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499794,'Articoli sportivi > Esercizio e fitness > Sollevamento pesi > Accessori per massa muscolare > Bloccadischi per bilancieri');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8083,'Articoli sportivi > Esercizio e fitness > Sollevamento pesi > Accessori per massa muscolare > Rastrelliere per pesi liberi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3217,'Articoli sportivi > Esercizio e fitness > Sollevamento pesi > Accessori per panche e macchine per sollevamento pesi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3654,'Articoli sportivi > Esercizio e fitness > Sollevamento pesi > Cinture per sollevamento pesi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3858,'Articoli sportivi > Esercizio e fitness > Sollevamento pesi > Guanti e polsiere per sollevamento pesi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3542,'Articoli sportivi > Esercizio e fitness > Sollevamento pesi > Macchine e rastrelliere per sollevamento pesi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3164,'Articoli sportivi > Esercizio e fitness > Sollevamento pesi > Pesi liberi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(237166,'Articoli sportivi > Esercizio e fitness > Step per aerobica');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4669,'Articoli sportivi > Esercizio e fitness > Tappetini attrezzi esercizi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(999,'Articoli sportivi > Esercizio e fitness > Yoga e pilates');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6750,'Articoli sportivi > Esercizio e fitness > Yoga e pilates > Blocchi per yoga e pilates');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5107,'Articoli sportivi > Esercizio e fitness > Yoga e pilates > Borse per tappetini yoga');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3810,'Articoli sportivi > Esercizio e fitness > Yoga e pilates > Macchine pilates');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3640,'Articoli sportivi > Esercizio e fitness > Yoga e pilates > Tappetini yoga e pilates');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6743,'Articoli sportivi > Esercizio e fitness > Yoga e pilates > Teli per yoga e pilates');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1001,'Articoli sportivi > Giochi indoor');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1002,'Articoli sportivi > Giochi indoor > Air hockey');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505330,'Articoli sportivi > Giochi indoor > Air hockey > Attrezzature per air hockey');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3548,'Articoli sportivi > Giochi indoor > Air hockey > Parti tavolo air hockey');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3245,'Articoli sportivi > Giochi indoor > Air hockey > Tavoli air hockey');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1003,'Articoli sportivi > Giochi indoor > Biliardi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3222,'Articoli sportivi > Giochi indoor > Biliardi > Accessori stecche biliardo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499993,'Articoli sportivi > Giochi indoor > Biliardi > Accessori stecche biliardo > Custodie per stecche da biliardo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499994,'Articoli sportivi > Giochi indoor > Biliardi > Accessori stecche biliardo > Gessetti per stecche da biliardo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3720,'Articoli sportivi > Giochi indoor > Biliardi > Accessori stecche biliardo > Portastecche biliardo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3755,'Articoli sportivi > Giochi indoor > Biliardi > Guanti da biliardo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3469,'Articoli sportivi > Giochi indoor > Biliardi > Luci tavoli da biliardo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3135,'Articoli sportivi > Giochi indoor > Biliardi > Palle da biliardo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3183,'Articoli sportivi > Giochi indoor > Biliardi > Parti e accessori tavolo biliardo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3574,'Articoli sportivi > Giochi indoor > Biliardi > Parti e accessori tavolo biliardo > Buche da biliardo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8065,'Articoli sportivi > Giochi indoor > Biliardi > Parti e accessori tavolo biliardo > Coperture per tavoli da biliardo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3547,'Articoli sportivi > Giochi indoor > Biliardi > Parti e accessori tavolo biliardo > Panni per tavoli da biliardo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3754,'Articoli sportivi > Giochi indoor > Biliardi > Parti e accessori tavolo biliardo > Spazzole tavolo da biliardo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3910,'Articoli sportivi > Giochi indoor > Biliardi > Stecche e rastrelli biliardo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3139,'Articoli sportivi > Giochi indoor > Biliardi > Tavoli da biliardo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3059,'Articoli sportivi > Giochi indoor > Biliardi > Triangoli per biliardo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1004,'Articoli sportivi > Giochi indoor > Bowling');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3669,'Articoli sportivi > Giochi indoor > Bowling > Birilli da bowling');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3698,'Articoli sportivi > Giochi indoor > Bowling > Borse per palle da bowling');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3535,'Articoli sportivi > Giochi indoor > Bowling > Guanti da bowling');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3260,'Articoli sportivi > Giochi indoor > Bowling > Guantini per bowling');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3219,'Articoli sportivi > Giochi indoor > Bowling > Palle da bowling');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1007,'Articoli sportivi > Giochi indoor > Calcio balilla');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3524,'Articoli sportivi > Giochi indoor > Calcio balilla > Accessori e componenti per tavolo da biliardino');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3641,'Articoli sportivi > Giochi indoor > Calcio balilla > Palline per calcetto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3847,'Articoli sportivi > Giochi indoor > Calcio balilla > Tavoli da biliardino');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1005,'Articoli sportivi > Giochi indoor > Freccette da lancio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3957,'Articoli sportivi > Giochi indoor > Freccette da lancio > Armadietti e backboard per bersagli freccette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3559,'Articoli sportivi > Giochi indoor > Freccette da lancio > Bersagli freccette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3839,'Articoli sportivi > Giochi indoor > Freccette da lancio > Freccette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3327,'Articoli sportivi > Giochi indoor > Freccette da lancio > Parti per freccette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3766,'Articoli sportivi > Giochi indoor > Freccette da lancio > Parti per freccette > Alette per freccette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3109,'Articoli sportivi > Giochi indoor > Freccette da lancio > Parti per freccette > Aste per freccette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3250,'Articoli sportivi > Giochi indoor > Freccette da lancio > Parti per freccette > Punte per freccette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1008,'Articoli sportivi > Giochi indoor > Ping pong');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3900,'Articoli sportivi > Giochi indoor > Ping pong > Accessori racchette ping pong');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3132,'Articoli sportivi > Giochi indoor > Ping pong > Accessori robot ping pong');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3964,'Articoli sportivi > Giochi indoor > Ping pong > Palline da ping pong');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3788,'Articoli sportivi > Giochi indoor > Ping pong > Reti e supporti ping pong');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3546,'Articoli sportivi > Giochi indoor > Ping pong > Robot per ping pong');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3375,'Articoli sportivi > Giochi indoor > Ping pong > Set e racchette da ping pong');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3345,'Articoli sportivi > Giochi indoor > Ping pong > Tavoli da ping pong');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7010,'Articoli sportivi > Giochi indoor > Tavoli multi-gioco');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1009,'Articoli sportivi > Giochi indoor > Tavolo da shuffleboard');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4021,'Articoli sportivi > Giochi indoor > Tavolo da shuffleboard > Buche tavolo da shuffleboard');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3996,'Articoli sportivi > Giochi indoor > Tavolo da shuffleboard > Polvere tavolo da shuffleboard');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3148,'Articoli sportivi > Giochi indoor > Tavolo da shuffleboard > Tavoli da shuffleboard');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1011,'Articoli sportivi > Ricreazione outdoor');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5998,'Articoli sportivi > Ricreazione outdoor > Accessori per sistemi di idratazione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7059,'Articoli sportivi > Ricreazione outdoor > Arrampicata');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499815,'Articoli sportivi > Ricreazione outdoor > Arrampicata > Accessori e attrezzature per arrampicata');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3314,'Articoli sportivi > Ricreazione outdoor > Arrampicata > Accessori e attrezzature per arrampicata > Elmetti da arrampicata');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499816,'Articoli sportivi > Ricreazione outdoor > Arrampicata > Accessori e attrezzature per arrampicata > Guanti per arrampicata');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5394,'Articoli sportivi > Ricreazione outdoor > Arrampicata > Accessori e attrezzature per arrampicata > Ramponi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7060,'Articoli sportivi > Ricreazione outdoor > Arrampicata > Attrezzi per arrampicata su ghiaccio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3201,'Articoli sportivi > Ricreazione outdoor > Arrampicata > Borse funi da arrampicata');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3454,'Articoli sportivi > Ricreazione outdoor > Arrampicata > Discensori e autobloccanti per arrampicata');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3266,'Articoli sportivi > Ricreazione outdoor > Arrampicata > Dispositivi di protezione da arrampicata');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3363,'Articoli sportivi > Ricreazione outdoor > Arrampicata > Dispositivi per assicurazione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3369,'Articoli sportivi > Ricreazione outdoor > Arrampicata > Fettuccia da arrampicata');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3825,'Articoli sportivi > Ricreazione outdoor > Arrampicata > Fune da arrampicata');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3218,'Articoli sportivi > Ricreazione outdoor > Arrampicata > Imbracature');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3746,'Articoli sportivi > Ricreazione outdoor > Arrampicata > Moschettoni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3518,'Articoli sportivi > Ricreazione outdoor > Arrampicata > Prese per arrampicata indoor');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3322,'Articoli sportivi > Ricreazione outdoor > Arrampicata > Protezioni antiurto per arrampicata');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3849,'Articoli sportivi > Ricreazione outdoor > Arrampicata > Rinvii');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3211,'Articoli sportivi > Ricreazione outdoor > Arrampicata > Sacchetti magnesite da arrampicata');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7061,'Articoli sportivi > Ricreazione outdoor > Arrampicata > Viti da ghiaccio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499824,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499840,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Accessori per tiro a segno e poligono');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499841,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Accessori per tiro a segno e poligono > Aste e bipodi per tiro a segno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3170,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Accessori per tiro a segno e poligono > Bersagli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499842,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Accessori per tiro a segno e poligono > Supporti per tiro a segno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3136,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Caccia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7373,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Caccia > Amplificatori acustici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5917,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Caccia > Attrezzatura per cani da caccia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1034,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Caccia > Capanni e paravento da caccia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8011,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Caccia > Esche per animali selvatici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8081,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Caccia > Esche per animali selvatici > Esche, alimenti e minerali per animali selvatici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8080,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Caccia > Esche per animali selvatici > Odori attrattivi e neutralizzatori di odori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3756,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Caccia > Esche per animali selvatici > Richiami da caccia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3583,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Caccia > Esche per animali selvatici > Trappole da caccia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6992,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Caccia > Mangiatoie per animali selvatici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3748,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Caccia > Postazioni da albero');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3674,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Caccia > Trappole per animali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499834,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Paintball e airsoft');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2443,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Paintball e airsoft > Airsoft');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3925,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Paintball e airsoft > Airsoft > Pallini per aria compressa');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3116,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Paintball e airsoft > Airsoft > Parti di ricambio e accessori pistole aria compressa');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8005,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Paintball e airsoft > Airsoft > Parti di ricambio e accessori pistole aria compressa > Batterie per pistole ad aria compressa');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3093,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Paintball e airsoft > Airsoft > Pistole ad aria compressa');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1049,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Paintball e airsoft > Paintball');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3234,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Paintball e airsoft > Paintball > Armi da paintball');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3408,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Paintball e airsoft > Paintball > Granate per paintball');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6781,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Paintball e airsoft > Paintball > Imbracature e pacchetti per paintball');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6748,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Paintball e airsoft > Paintball > Lanciagranate per paintball');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3438,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Paintball e airsoft > Paintball > Palline da paintball');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3187,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Paintball e airsoft > Paintball > Parti e accessori per armi da paintball');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3244,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Paintball e airsoft > Paintball > Parti e accessori per armi da paintball > Bombole di CO2 per paintball');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3690,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Paintball e airsoft > Paintball > Parti e accessori per armi da paintball > Canne per armi da paintball');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3152,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Paintball e airsoft > Paintball > Parti e accessori per armi da paintball > Caricatori da paintball');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8514,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Paintball e airsoft > Paintball > Parti e accessori per armi da paintball > Raccordi per armi da paintball');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499835,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Paintball e airsoft > Protezioni per paintball e airsoft');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499837,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Paintball e airsoft > Protezioni per paintball e airsoft > Giubbotti per paintball e airsoft');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499836,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Paintball e airsoft > Protezioni per paintball e airsoft > Guanti per paintball e airsoft');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499839,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Paintball e airsoft > Protezioni per paintball e airsoft > Imbottiture per paintball e airsoft');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499838,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Paintball e airsoft > Protezioni per paintball e airsoft > Maschere e occhiali per paintball e airsoft');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7460,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Protezioni per caccia e tiro a segno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7518,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Protezioni per caccia e tiro a segno > Giacche per caccia e tiro a segno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7461,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Protezioni per caccia e tiro a segno > Guanti per caccia e tiro a segno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3125,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Tiro al piattello');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3305,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Tiro al piattello > Lancia piattelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3528,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Tiro al piattello > Piattelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1033,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Tiro con l \'arco');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499825,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Tiro con l \'arco > Archi e balestre');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3332,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Tiro con l \'arco > Archi e balestre > Archi compositi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3715,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Tiro con l \'arco > Archi e balestre > Archi lunghi e ricurvi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3505,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Tiro con l \'arco > Archi e balestre > Balestre');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3883,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Tiro con l \'arco > Bersagli tiro con l \'arco');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499826,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Tiro con l \'arco > Componenti e accessori per arco e balestra');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3757,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Tiro con l \'arco > Faretre');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3533,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Tiro con l \'arco > Frecce e dardi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499833,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Tiro con l \'arco > Guanti e sganci per tiro con l \'arco');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3773,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Tiro con l \'arco > Parabraccio tiro con l \'arco');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3291,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Tiro con l \'arco > Parti frecce e accessori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499831,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Tiro con l \'arco > Parti frecce e accessori > Alette per frecce');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499832,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Tiro con l \'arco > Parti frecce e accessori > Cocche per frecce');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499830,'Articoli sportivi > Ricreazione outdoor > Caccia e tiro a segno > Tiro con l \'arco > Parti frecce e accessori > Punte ampie o da campo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1013,'Articoli sportivi > Ricreazione outdoor > Campeggio e trekking');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7154,'Articoli sportivi > Ricreazione outdoor > Campeggio e trekking > Accessori per bastoncini trekking');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5655,'Articoli sportivi > Ricreazione outdoor > Campeggio e trekking > Accessori per tende');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5658,'Articoli sportivi > Ricreazione outdoor > Campeggio e trekking > Accessori per tende > Pali e paletti per tende');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5656,'Articoli sportivi > Ricreazione outdoor > Campeggio e trekking > Accessori per tende > Protezioni a terra per tende');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499680,'Articoli sportivi > Ricreazione outdoor > Campeggio e trekking > Accessori per tende > Tende interne');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5657,'Articoli sportivi > Ricreazione outdoor > Campeggio e trekking > Accessori per tende > Vestiboli per tende');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1014,'Articoli sportivi > Ricreazione outdoor > Campeggio e trekking > Attrezzatura da campeggio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4451,'Articoli sportivi > Ricreazione outdoor > Campeggio e trekking > Attrezzatura da campeggio > Accessori per materassi e materassini ad aria');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3089,'Articoli sportivi > Ricreazione outdoor > Campeggio e trekking > Attrezzatura da campeggio > Letti da campo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3695,'Articoli sportivi > Ricreazione outdoor > Campeggio e trekking > Attrezzatura da campeggio > Materassini ad aria');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3738,'Articoli sportivi > Ricreazione outdoor > Campeggio e trekking > Bastoni da trekking');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4785,'Articoli sportivi > Ricreazione outdoor > Campeggio e trekking > Bussole da navigazione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(502993,'Articoli sportivi > Ricreazione outdoor > Campeggio e trekking > Docce e toilette portatili');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503009,'Articoli sportivi > Ricreazione outdoor > Campeggio e trekking > Docce e toilette portatili > Bagni da campeggio e orinatoi portatili');
insert into GOOGLE_CATEGORY (codice,descrizione) values(502994,'Articoli sportivi > Ricreazione outdoor > Campeggio e trekking > Docce e toilette portatili > Docce portatili e tende spogliatoio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1023,'Articoli sportivi > Ricreazione outdoor > Campeggio e trekking > Filtri e purificatori portatili acqua');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5881,'Articoli sportivi > Ricreazione outdoor > Campeggio e trekking > Fodere per sacchi a pelo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1019,'Articoli sportivi > Ricreazione outdoor > Campeggio e trekking > Luci e lampade da campeggio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1021,'Articoli sportivi > Ricreazione outdoor > Campeggio e trekking > Materassini per dormire');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1016,'Articoli sportivi > Ricreazione outdoor > Campeggio e trekking > Pentole e stoviglie da campeggio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8079,'Articoli sportivi > Ricreazione outdoor > Campeggio e trekking > Protezioni contro il vento');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5636,'Articoli sportivi > Ricreazione outdoor > Campeggio e trekking > Sacche a compressione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1020,'Articoli sportivi > Ricreazione outdoor > Campeggio e trekking > Sacchi a pelo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3508,'Articoli sportivi > Ricreazione outdoor > Campeggio e trekking > Scaldamani chimici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3937,'Articoli sportivi > Ricreazione outdoor > Campeggio e trekking > Strumenti da campeggio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3495,'Articoli sportivi > Ricreazione outdoor > Campeggio e trekking > Strumenti da campeggio > Coltelli da caccia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4095,'Articoli sportivi > Ricreazione outdoor > Campeggio e trekking > Strumenti da campeggio > Strumenti e coltelli multifunzione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1022,'Articoli sportivi > Ricreazione outdoor > Campeggio e trekking > Tende');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3538,'Articoli sportivi > Ricreazione outdoor > Campeggio e trekking > Zanzariere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1025,'Articoli sportivi > Ricreazione outdoor > Ciclismo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3982,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Abbigliamento e accessori da ciclismo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7474,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Abbigliamento e accessori da ciclismo > Accessori per scarpe da ciclista');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7453,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Abbigliamento e accessori da ciclismo > Accessori per scarpe da ciclista > Coperture per scarpe da ciclista');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7475,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Abbigliamento e accessori da ciclismo > Accessori per scarpe da ciclista > Cunei e zeppe per scarpe da ciclista');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7476,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Abbigliamento e accessori da ciclismo > Accessori per scarpe da ciclista > Tacchette per scarpe da ciclista');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1029,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Abbigliamento e accessori da ciclismo > Caschi da bicicletta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500028,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Abbigliamento e accessori da ciclismo > Componenti e accessori per caschi per biciclette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3272,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Abbigliamento e accessori da ciclismo > Copriscarpe da ciclista');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8061,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Abbigliamento e accessori da ciclismo > Cuscinetti protettivi per ciclisti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3246,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Abbigliamento e accessori da ciclismo > Guanti da ciclista');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3118,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Abbigliamento e accessori da ciclismo > Tacchetti per scarpe da ciclismo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3070,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Accessori monocicli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3214,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Accessori per biciclette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5540,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Accessori per biciclette > Accessori computer per biciclette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500067,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Accessori per biciclette > Accessori per seggiolini per bambini per biciclette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3558,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Accessori per biciclette > Borse e scatole trasporto bici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3778,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Accessori per biciclette > Borse e zaini da bicicletta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3879,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Accessori per biciclette > Campanelli e trombette bicicletta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3341,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Accessori per biciclette > Cestini da bicicletta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3243,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Accessori per biciclette > Computer per biciclette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6445,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Accessori per biciclette > Coperture e imbottiture per sellini di biciclette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4145,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Accessori per biciclette > Gabbie portabiciclette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500109,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Accessori per biciclette > Kit di conversione bici elettriche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1027,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Accessori per biciclette > Lucchetti per bici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500092,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Accessori per biciclette > Maniglie ed elementi decorativi per manubri di biciclette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3719,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Accessori per biciclette > Parafanghi per biciclette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7448,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Accessori per biciclette > Perle per raggi di bicicletta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6506,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Accessori per biciclette > Pompe per ammortizzatori per biciclette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3827,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Accessori per biciclette > Pompe per bicicletta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1028,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Accessori per biciclette > Portapacchi anteriori/posteriori bici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6048,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Accessori per biciclette > Portatavola da sport acquatici per biciclette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3868,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Accessori per biciclette > Rimorchi bici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3811,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Accessori per biciclette > Rimorchi per bicicletta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3631,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Accessori per biciclette > Rotelle laterali bicicletta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5842,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Accessori per biciclette > Seggiolini da bicicletta per bambini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3368,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Accessori per biciclette > Specchietti per bicicletta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505668,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Accessori per biciclette > Strumenti per bicicletta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3428,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Accessori per biciclette > Supporti e portabiciclette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6442,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Accessori per biciclette > Teli per biciclette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499694,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Accessori per biciclette > Toppe e kit di riparazione per pneumatici di bicicletta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7223,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Accessori per biciclette > Velcro e mollette per pantaloni per ciclisti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3634,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Accessori per tricicli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1026,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Biciclette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1030,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Monocicli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3618,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Parti per bicicletta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499871,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Parti per bicicletta > Adattatori per valvole per pneumatici di bicicletta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499684,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Parti per bicicletta > Alloggiamenti per cavi per bicicletta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4194,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Parti per bicicletta > Aste sella per bicicletta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4572,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Parti per bicicletta > Camere d \'aria bicicletta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499869,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Parti per bicicletta > Cappucci per valvole per pneumatici di bicicletta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8239,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Parti per bicicletta > Cavalletti per biciclette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499685,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Parti per bicicletta > Cavi per bicicletta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7478,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Parti per bicicletta > Componenti per sterzo di biciclette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7480,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Parti per bicicletta > Componenti per sterzo di biciclette > Cuscinetti per sterzo di biciclette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7479,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Parti per bicicletta > Componenti per sterzo di biciclette > Distanziali per sterzo di biciclette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6960,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Parti per bicicletta > Estensioni per manubri da biciclette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4603,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Parti per bicicletta > Forcelle per bicicletta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4571,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Parti per bicicletta > Gomme per bicicletta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499868,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Parti per bicicletta > Kit per biciclette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4582,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Parti per bicicletta > Manubri per bicicletta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4595,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Parti per bicicletta > Morsetti asta sella bici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3740,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Parti per bicicletta > Parti freni per bicicletta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4576,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Parti per bicicletta > Parti freni per bicicletta > Dischi freni per bicicletta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4575,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Parti per bicicletta > Parti freni per bicicletta > Leve freni per bicicletta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4574,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Parti per bicicletta > Parti freni per bicicletta > Pinze freni per bicicletta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4577,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Parti per bicicletta > Parti freni per bicicletta > Set freni per bicicletta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4597,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Parti per bicicletta > Parti per ruote bicicletta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8528,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Parti per bicicletta > Parti per ruote bicicletta > Assi e raggi per ruote di bicicletta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4601,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Parti per bicicletta > Parti per ruote bicicletta > Cappucci valvola bicicletta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4602,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Parti per bicicletta > Parti per ruote bicicletta > Cerchi ruote bicicletta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4599,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Parti per bicicletta > Parti per ruote bicicletta > Mozzi per bicicletta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499875,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Parti per bicicletta > Parti per ruote bicicletta > Nastro per cerchioni di bicicletta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500053,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Parti per bicicletta > Parti per ruote bicicletta > Parti per mozzo di biciclette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7538,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Parti per bicicletta > Parti per ruote bicicletta > Pedali con dentatura per bicicletta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4600,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Parti per bicicletta > Parti per ruote bicicletta > Raggi per bicicletta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4585,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Parti per bicicletta > Parti trasmissione bicicletta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4588,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Parti per bicicletta > Parti trasmissione bicicletta > Cambio di velocità bici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4587,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Parti per bicicletta > Parti trasmissione bicicletta > Catene da bici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4591,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Parti per bicicletta > Parti trasmissione bicicletta > Corone per bicicletta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4594,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Parti per bicicletta > Parti trasmissione bicicletta > Leve cambio per bicicletta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4592,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Parti per bicicletta > Parti trasmissione bicicletta > Pedali da bici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4593,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Parti per bicicletta > Parti trasmissione bicicletta > Pedali per bicicletta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4586,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Parti per bicicletta > Parti trasmissione bicicletta > Pignoni e cassette per bicicletta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4590,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Parti per bicicletta > Parti trasmissione bicicletta > Staffe inferiori bicicletta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4596,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Parti per bicicletta > Piccole parti bicicletta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4583,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Parti per bicicletta > Reggimanubrio per bicicletta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3216,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Parti per bicicletta > Ruote per bicicletta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3292,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Parti per bicicletta > Selle bici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7477,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Parti per bicicletta > Sterzo per biciclette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3639,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Parti per bicicletta > Telai per bicicletta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499870,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Parti per bicicletta > Valvole per pneumatici di bicicletta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3531,'Articoli sportivi > Ricreazione outdoor > Ciclismo > Tricicli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1031,'Articoli sportivi > Ricreazione outdoor > Equitazione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7215,'Articoli sportivi > Ricreazione outdoor > Equitazione > Accessori per finimenti per cavalli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8107,'Articoli sportivi > Ricreazione outdoor > Equitazione > Accessori per finimenti per cavalli > Accessori per selle');
insert into GOOGLE_CATEGORY (codice,descrizione) values(326122,'Articoli sportivi > Ricreazione outdoor > Equitazione > Accessori per finimenti per cavalli > Accessori per selle > Borse e ceste per selle');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499959,'Articoli sportivi > Ricreazione outdoor > Equitazione > Accessori per finimenti per cavalli > Accessori per selle > Coperture e custodie per selle');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7216,'Articoli sportivi > Ricreazione outdoor > Equitazione > Accessori per finimenti per cavalli > Accessori per selle > Portasella');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8108,'Articoli sportivi > Ricreazione outdoor > Equitazione > Accessori per finimenti per cavalli > Accessori per selle > Sottosella');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499820,'Articoli sportivi > Ricreazione outdoor > Equitazione > Accessori per finimenti per cavalli > Scatole per finimenti per cavalli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5594,'Articoli sportivi > Ricreazione outdoor > Equitazione > Attrezzatura e accessori da equitazione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3821,'Articoli sportivi > Ricreazione outdoor > Equitazione > Attrezzatura e accessori da equitazione > Caschi da equitazione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3265,'Articoli sportivi > Ricreazione outdoor > Equitazione > Attrezzatura e accessori da equitazione > Frustini e fruste da equitazione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3084,'Articoli sportivi > Ricreazione outdoor > Equitazione > Attrezzatura e accessori da equitazione > Guanti da equitazione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6914,'Articoli sportivi > Ricreazione outdoor > Equitazione > Attrezzatura e accessori da equitazione > Pantaloni da equitazione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3257,'Articoli sportivi > Ricreazione outdoor > Equitazione > Cura dei cavalli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6898,'Articoli sportivi > Ricreazione outdoor > Equitazione > Cura dei cavalli > Coperte e lenzuola per cavalli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7482,'Articoli sportivi > Ricreazione outdoor > Equitazione > Cura dei cavalli > Mangime per cavalli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499817,'Articoli sportivi > Ricreazione outdoor > Equitazione > Cura dei cavalli > Maschere per mosche per cavalli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7481,'Articoli sportivi > Ricreazione outdoor > Equitazione > Cura dei cavalli > Ricompense per cavalli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5569,'Articoli sportivi > Ricreazione outdoor > Equitazione > Cura dei cavalli > Stivali e parastinchi da equitazione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5025,'Articoli sportivi > Ricreazione outdoor > Equitazione > Cura dei cavalli > Strigliatura cavalli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6386,'Articoli sportivi > Ricreazione outdoor > Equitazione > Cura dei cavalli > Strigliatura cavalli > Forbici e taglia peli per cavalli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499818,'Articoli sportivi > Ricreazione outdoor > Equitazione > Cura dei cavalli > Strigliatura cavalli > Pettini, spazzole e guanti per la strigliatura dei cavalli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499819,'Articoli sportivi > Ricreazione outdoor > Equitazione > Cura dei cavalli > Vermifughi per cavalli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7459,'Articoli sportivi > Ricreazione outdoor > Equitazione > Cura dei cavalli > Vitamine e supplementi per cavalli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5593,'Articoli sportivi > Ricreazione outdoor > Equitazione > Finimenti per cavalli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3426,'Articoli sportivi > Ricreazione outdoor > Equitazione > Finimenti per cavalli > Briglie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2756,'Articoli sportivi > Ricreazione outdoor > Equitazione > Finimenti per cavalli > Briglie da equitazione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499710,'Articoli sportivi > Ricreazione outdoor > Equitazione > Finimenti per cavalli > Cavezze per cavalli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1491,'Articoli sportivi > Ricreazione outdoor > Equitazione > Finimenti per cavalli > Cinghie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499709,'Articoli sportivi > Ricreazione outdoor > Equitazione > Finimenti per cavalli > Lunghine per cavalli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4018,'Articoli sportivi > Ricreazione outdoor > Equitazione > Finimenti per cavalli > Morsi da equitazione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1754,'Articoli sportivi > Ricreazione outdoor > Equitazione > Finimenti per cavalli > Redini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2210,'Articoli sportivi > Ricreazione outdoor > Equitazione > Finimenti per cavalli > Selle');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8109,'Articoli sportivi > Ricreazione outdoor > Equitazione > Finimenti per cavalli > Staffe');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499846,'Articoli sportivi > Ricreazione outdoor > Giochi all \'aperto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1062,'Articoli sportivi > Ricreazione outdoor > Giochi all \'aperto > Badminton');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3107,'Articoli sportivi > Ricreazione outdoor > Giochi all \'aperto > Badminton > Reti da badminton');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3950,'Articoli sportivi > Ricreazione outdoor > Giochi all \'aperto > Badminton > Set e racchette da badminton');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3907,'Articoli sportivi > Ricreazione outdoor > Giochi all \'aperto > Badminton > Volani');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3484,'Articoli sportivi > Ricreazione outdoor > Giochi all \'aperto > Disc golf');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3993,'Articoli sportivi > Ricreazione outdoor > Giochi all \'aperto > Disc golf > Borse per disc golf');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3227,'Articoli sportivi > Ricreazione outdoor > Giochi all \'aperto > Disc golf > Cestelli per disc golf');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3405,'Articoli sportivi > Ricreazione outdoor > Giochi all \'aperto > Giochi da prato');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3390,'Articoli sportivi > Ricreazione outdoor > Giochi all \'aperto > Pickleball');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499847,'Articoli sportivi > Ricreazione outdoor > Giochi all \'aperto > Pickleball > Palline da pickleball');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499848,'Articoli sportivi > Ricreazione outdoor > Giochi all \'aperto > Pickleball > Racchette da pickleball');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499904,'Articoli sportivi > Ricreazione outdoor > Giochi all \'aperto > Platform tennis e paddle tennis');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499849,'Articoli sportivi > Ricreazione outdoor > Giochi all \'aperto > Platform tennis e paddle tennis > Palline da platform tennis');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499850,'Articoli sportivi > Ricreazione outdoor > Giochi all \'aperto > Platform tennis e paddle tennis > Racchette per platform tennis e paddle tennis');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7430,'Articoli sportivi > Ricreazione outdoor > Giochi all \'aperto > Set paddleball');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3787,'Articoli sportivi > Ricreazione outdoor > Giochi all \'aperto > Shuffleboard da ponte');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3689,'Articoli sportivi > Ricreazione outdoor > Giochi all \'aperto > Shuffleboard da ponte > Aste shuffleboard da ponte');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3190,'Articoli sportivi > Ricreazione outdoor > Giochi all \'aperto > Shuffleboard da ponte > Dischi shuffleboard da ponte');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3126,'Articoli sportivi > Ricreazione outdoor > Giochi all \'aperto > Tetherball');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499882,'Articoli sportivi > Ricreazione outdoor > Giochi all \'aperto > Tetherball > Pali da tetherball');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499884,'Articoli sportivi > Ricreazione outdoor > Giochi all \'aperto > Tetherball > Palle da tetherball');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499883,'Articoli sportivi > Ricreazione outdoor > Giochi all \'aperto > Tetherball > Set da tetherball');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1043,'Articoli sportivi > Ricreazione outdoor > Golf');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4605,'Articoli sportivi > Ricreazione outdoor > Golf > Accessori sacche da golf');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4537,'Articoli sportivi > Ricreazione outdoor > Golf > Accessori sacche da golf > Carrelli per sacche da golf');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4525,'Articoli sportivi > Ricreazione outdoor > Golf > Accessori sacche da golf > Coperture e astucci sacche golf');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8044,'Articoli sportivi > Ricreazione outdoor > Golf > Alza pitch');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4467,'Articoli sportivi > Ricreazione outdoor > Golf > Asciugamani da golf');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3772,'Articoli sportivi > Ricreazione outdoor > Golf > Attrezzatura allenamento golf');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3578,'Articoli sportivi > Ricreazione outdoor > Golf > Bandierine da golf');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4466,'Articoli sportivi > Ricreazione outdoor > Golf > Guanti da golf');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1046,'Articoli sportivi > Ricreazione outdoor > Golf > Mazze da golf');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1045,'Articoli sportivi > Ricreazione outdoor > Golf > Palline da golf');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3642,'Articoli sportivi > Ricreazione outdoor > Golf > Parti e accessori mazze golf');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499780,'Articoli sportivi > Ricreazione outdoor > Golf > Parti e accessori mazze golf > Canne per mazze da golf');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4043,'Articoli sportivi > Ricreazione outdoor > Golf > Parti e accessori mazze golf > Coperture per mazze da golf');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4254,'Articoli sportivi > Ricreazione outdoor > Golf > Parti e accessori mazze golf > Impugnature mazze da golf');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6864,'Articoli sportivi > Ricreazione outdoor > Golf > Pennarelli per palline da golf');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1044,'Articoli sportivi > Ricreazione outdoor > Golf > Sacche da golf');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7314,'Articoli sportivi > Ricreazione outdoor > Golf > Set di accessori da golf');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3106,'Articoli sportivi > Ricreazione outdoor > Golf > Tee da golf');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7375,'Articoli sportivi > Ricreazione outdoor > Kite buggying');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7377,'Articoli sportivi > Ricreazione outdoor > Kite buggying > Accessori per kite buggying');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7376,'Articoli sportivi > Ricreazione outdoor > Kite buggying > Veicoli per kite buggying');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3789,'Articoli sportivi > Ricreazione outdoor > Paracadutismo e volo libero');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4327,'Articoli sportivi > Ricreazione outdoor > Paracadutismo e volo libero > Deltaplani');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4023,'Articoli sportivi > Ricreazione outdoor > Paracadutismo e volo libero > Paracaduti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5877,'Articoli sportivi > Ricreazione outdoor > Paracadutismo e volo libero > Tute da paracadutismo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499761,'Articoli sportivi > Ricreazione outdoor > Pattinaggio in linea e tradizionale');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499759,'Articoli sportivi > Ricreazione outdoor > Pattinaggio in linea e tradizionale > Componenti per pattini in linea');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499760,'Articoli sportivi > Ricreazione outdoor > Pattinaggio in linea e tradizionale > Componenti per pattini tradizionali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2837,'Articoli sportivi > Ricreazione outdoor > Pattinaggio in linea e tradizionale > Pattini classici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1058,'Articoli sportivi > Ricreazione outdoor > Pattinaggio in linea e tradizionale > Pattini in linea');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499771,'Articoli sportivi > Ricreazione outdoor > Pattinaggio in linea e tradizionale > Protezioni per pattinaggio in linea e tradizionale');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499775,'Articoli sportivi > Ricreazione outdoor > Pattinaggio in linea e tradizionale > Protezioni per pattinaggio in linea e tradizionale > Imbottiture per pattinaggio in linea e tradizionale');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500029,'Articoli sportivi > Ricreazione outdoor > Pattinaggio in linea e tradizionale > Sci a rotelle');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3334,'Articoli sportivi > Ricreazione outdoor > Pesca');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8093,'Articoli sportivi > Ricreazione outdoor > Pesca > Accessori per canne da pesca');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8272,'Articoli sportivi > Ricreazione outdoor > Pesca > Accessori per canne da pesca > Custodie e borse per canne da pesca');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499942,'Articoli sportivi > Ricreazione outdoor > Pesca > Accessori per canne da pesca > Sostegni e rastrelliere per canne da pesca');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8092,'Articoli sportivi > Ricreazione outdoor > Pesca > Accessori per mulinelli da pesca');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8208,'Articoli sportivi > Ricreazione outdoor > Pesca > Accessori per mulinelli da pesca > Bobina sostitutiva per mulinelli da pesca');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8273,'Articoli sportivi > Ricreazione outdoor > Pesca > Accessori per mulinelli da pesca > Borse e custodie per mulinelli da pesca');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8094,'Articoli sportivi > Ricreazione outdoor > Pesca > Accessori per mulinelli da pesca > Lubrificanti per mulinelli da pesca');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8064,'Articoli sportivi > Ricreazione outdoor > Pesca > Allarme per canne da pesca');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7342,'Articoli sportivi > Ricreazione outdoor > Pesca > Arpioni da pesca');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499823,'Articoli sportivi > Ricreazione outdoor > Pesca > Attrezzatura da pesca');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3359,'Articoli sportivi > Ricreazione outdoor > Pesca > Attrezzatura da pesca > Ami da pesca');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7222,'Articoli sportivi > Ricreazione outdoor > Pesca > Attrezzatura da pesca > Anelli e girelle da pesca');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3603,'Articoli sportivi > Ricreazione outdoor > Pesca > Attrezzatura da pesca > Esche e richiami da pesca');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3859,'Articoli sportivi > Ricreazione outdoor > Pesca > Attrezzatura da pesca > Galleggianti da pesca');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3651,'Articoli sportivi > Ricreazione outdoor > Pesca > Attrezzatura da pesca > Piombi da pesca');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1041,'Articoli sportivi > Ricreazione outdoor > Pesca > Borse e cassette per l \'attrezzatura da pesca');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4927,'Articoli sportivi > Ricreazione outdoor > Pesca > Canne da pesca');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6495,'Articoli sportivi > Ricreazione outdoor > Pesca > Contenitori per esche da pesca');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3096,'Articoli sportivi > Ricreazione outdoor > Pesca > Esche vive');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7343,'Articoli sportivi > Ricreazione outdoor > Pesca > Fiocine');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1037,'Articoli sportivi > Ricreazione outdoor > Pesca > Lenze e terminali da pesca');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7217,'Articoli sportivi > Ricreazione outdoor > Pesca > Materiali per pesca con la mosca');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6440,'Articoli sportivi > Ricreazione outdoor > Pesca > Materiali per pesca con la mosca > Filo da pesca');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7125,'Articoli sportivi > Ricreazione outdoor > Pesca > Materiali per pesca con la mosca > Perline da pesca');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4926,'Articoli sportivi > Ricreazione outdoor > Pesca > Mulinelli da pesca');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3614,'Articoli sportivi > Ricreazione outdoor > Pesca > Reti da pesca');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5406,'Articoli sportivi > Ricreazione outdoor > Pesca > Salopette per pesca e caccia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7344,'Articoli sportivi > Ricreazione outdoor > Pesca > Strumenti per rimuovere gli ami da pesca');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7221,'Articoli sportivi > Ricreazione outdoor > Pesca > Trappole da pesca');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5879,'Articoli sportivi > Ricreazione outdoor > Scooter');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3276,'Articoli sportivi > Ricreazione outdoor > Skateboarding');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3067,'Articoli sportivi > Ricreazione outdoor > Skateboarding > Attrezzatura protettiva per skateboard');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499776,'Articoli sportivi > Ricreazione outdoor > Skateboarding > Attrezzatura protettiva per skateboard > Caschi per pattinaggio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7789,'Articoli sportivi > Ricreazione outdoor > Skateboarding > Attrezzatura protettiva per skateboard > Guanti da skateboard');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3488,'Articoli sportivi > Ricreazione outdoor > Skateboarding > Attrezzatura protettiva per skateboard > Protezioni per skateboard');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3127,'Articoli sportivi > Ricreazione outdoor > Skateboarding > Corrimano per skateboard');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3670,'Articoli sportivi > Ricreazione outdoor > Skateboarding > Parti per skateboard');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3192,'Articoli sportivi > Ricreazione outdoor > Skateboarding > Parti per skateboard > Attacchi per skateboard');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505817,'Articoli sportivi > Ricreazione outdoor > Skateboarding > Parti per skateboard > Minuteria per skateboard');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3637,'Articoli sportivi > Ricreazione outdoor > Skateboarding > Parti per skateboard > Ruote per skateboard');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3869,'Articoli sportivi > Ricreazione outdoor > Skateboarding > Parti per skateboard > Tavole per skateboard');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3626,'Articoli sportivi > Ricreazione outdoor > Skateboarding > Rampe per skateboard');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1059,'Articoli sportivi > Ricreazione outdoor > Skateboarding > Skateboard');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499811,'Articoli sportivi > Ricreazione outdoor > Sport acquatici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499813,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Attrezzatura per sport acquatici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6496,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Attrezzatura per sport acquatici > Accessori per giubbotti salvataggio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499687,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Attrezzatura per sport acquatici > Caschi per sport acquatici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499814,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Attrezzatura per sport acquatici > Componenti di mute subacquee');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5399,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Attrezzatura per sport acquatici > Componenti di mute subacquee > Calzari, guanti e cappucci per mute subacquee');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5401,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Attrezzatura per sport acquatici > Componenti di mute subacquee > Maglie da sub');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5400,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Attrezzatura per sport acquatici > Componenti di mute subacquee > Pantaloni muta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1128,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Attrezzatura per sport acquatici > Giubbotti di salvataggio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3376,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Attrezzatura per sport acquatici > Magliette da nuoto e antiabrasione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1147,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Attrezzatura per sport acquatici > Mute');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1138,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Attrezzatura per sport acquatici > Mute stagne');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1135,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Immersioni e snorkeling');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1142,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Immersioni e snorkeling > Boccagli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6514,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Immersioni e snorkeling > Cinture per immersioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5312,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Immersioni e snorkeling > Coltelli e forbici da sub');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1137,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Immersioni e snorkeling > Computer subacquei');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1136,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Immersioni e snorkeling > Giubbotti assetto variabile');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1140,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Immersioni e snorkeling > Maschere snorkeling e subacquea');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1139,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Immersioni e snorkeling > Pinne snorkeling e subacquea');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1141,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Immersioni e snorkeling > Regolatori per immersioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499867,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Immersioni e snorkeling > Set di attrezzature per immersioni e snorkeling');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5579,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Kitesurf');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5582,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Kitesurf > Aquiloni kitesurf');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5584,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Kitesurf > Custodie per kitesurf');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5583,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Kitesurf > Imbragature per windsurf e kitesurf');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5580,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Kitesurf > Kiteboard');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5581,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Kitesurf > Parti di ricambio kitesurf');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1120,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Nautica e rafting');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6314,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Nautica e rafting > Accessori per canoa');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6312,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Nautica e rafting > Accessori per kayak');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6097,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Nautica e rafting > Barche a pedali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3406,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Nautica e rafting > Barche da canottaggio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1124,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Nautica e rafting > Canoe');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7449,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Nautica e rafting > Guanti da canottaggio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499964,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Nautica e rafting > Guinzagli per remi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1127,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Nautica e rafting > Kayak');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1129,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Nautica e rafting > Remi e pagaie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3476,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Nautica e rafting > Zattere per acque bianche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1144,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Nuoto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6330,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Nuoto > Accessori per occhialini e maschere da piscina');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7104,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Nuoto > Braccioli gonfiabili per bambini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6513,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Nuoto > Cinture da nuoto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6515,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Nuoto > Clip per naso per nuoto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3807,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Nuoto > Cuffie da piscina');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3304,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Nuoto > Guanti da nuoto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3596,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Nuoto > Macchine per il nuoto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3360,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Nuoto > Occhialini da nuoto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6550,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Nuoto > Pesi da nuoto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6511,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Nuoto > Pinne da nuoto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6512,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Nuoto > Pinne da nuoto > Mono-pinne');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2512,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Nuoto > Pinne da nuoto > Pinne da allenamento');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6473,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Nuoto > Pinne per mani');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3595,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Nuoto > Pull buoy');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2966,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Nuoto > Tavolette da nuoto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7178,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Scaffali per lo stoccaggio di natanti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8173,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Scaffali per lo stoccaggio di natanti > Rastrelliere per lo stoccaggio di tavole per sport acquatici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8172,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Scaffali per lo stoccaggio di natanti > Scaffali per stoccaggio barche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3195,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Sport nautici con traino');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3636,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Sport nautici con traino > Corde da traino per sport acquatici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7452,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Sport nautici con traino > Guanti per sport acquatici con traino');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3370,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Sport nautici con traino > Kneeboard');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3101,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Sport nautici con traino > Kneeboard > Tavole per sci nautico');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1146,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Sport nautici con traino > Sci nautico');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3289,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Sport nautici con traino > Sci nautico > Aliscafi a sedile');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6302,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Sport nautici con traino > Sci nautico > Attacchi per sci d \'acqua');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6296,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Sport nautici con traino > Sci nautico > Custodie e borse per sci d \'acqua');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3350,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Sport nautici con traino > Sci nautico > Sci nautici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3282,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Sport nautici con traino > Wakeboard');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505317,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Sport nautici con traino > Wakeboard > Attacchi per tavole da wakeboard e kiteboard');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505291,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Sport nautici con traino > Wakeboard > Parti per tavole da wakeboard');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3353,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Sport nautici con traino > Wakeboard > Tavole da wakeboard');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6301,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Sport nautici con traino > Zattere e tubi gonfiabili trainabili');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1143,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Surf (sport)');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3525,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Surf (sport) > Alette per tavole da surf');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6287,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Surf (sport) > Bodyboard');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3801,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Surf (sport) > Cera per tavole da surf');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3579,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Surf (sport) > Custodie per tavole da surf');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7451,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Surf (sport) > Guanti da surf');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3649,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Surf (sport) > Lacci per tavole da surf');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6288,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Surf (sport) > Paddleboard');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3762,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Surf (sport) > Protezione posteriore tavola da surf');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6286,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Surf (sport) > Skimboard');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3320,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Surf (sport) > Tavole da surf');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1148,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Windsurf');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3624,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Windsurf > Parti tavole da windsurf');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3908,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Windsurf > Parti tavole da windsurf > Alette tavole da windsurf');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3285,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Windsurf > Parti tavole da windsurf > Pali tavole da windsurf');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3894,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Windsurf > Tavole da windsurf');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3413,'Articoli sportivi > Ricreazione outdoor > Sport acquatici > Windsurf > Vele per windsurf');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499844,'Articoli sportivi > Ricreazione outdoor > Sport e attività invernali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499845,'Articoli sportivi > Ricreazione outdoor > Sport e attività invernali > Sci e snowboard');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8203,'Articoli sportivi > Ricreazione outdoor > Sport e attività invernali > Sci e snowboard > Accessori per occhiali da sci e snowboard');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5050,'Articoli sportivi > Ricreazione outdoor > Sport e attività invernali > Sci e snowboard > Accessori per occhiali da sci e snowboard > Maschere sci e snowboard');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6063,'Articoli sportivi > Ricreazione outdoor > Sport e attività invernali > Sci e snowboard > Attacchi da sci');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1162,'Articoli sportivi > Ricreazione outdoor > Sport e attività invernali > Sci e snowboard > Attacchi da snowboard');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5088,'Articoli sportivi > Ricreazione outdoor > Sport e attività invernali > Sci e snowboard > Attacchi snowboard');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1161,'Articoli sportivi > Ricreazione outdoor > Sport e attività invernali > Sci e snowboard > Caschi da sci e snowboard');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8074,'Articoli sportivi > Ricreazione outdoor > Sport e attività invernali > Sci e snowboard > Cera per sci e snowboard');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505296,'Articoli sportivi > Ricreazione outdoor > Sport e attività invernali > Sci e snowboard > Componenti per attacchi da sci');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499681,'Articoli sportivi > Ricreazione outdoor > Sport e attività invernali > Sci e snowboard > Lacci per sci e snowboard');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3550,'Articoli sportivi > Ricreazione outdoor > Sport e attività invernali > Sci e snowboard > Occhiali da sci e snowboard');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1157,'Articoli sportivi > Ricreazione outdoor > Sport e attività invernali > Sci e snowboard > Racchette da sci');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7558,'Articoli sportivi > Ricreazione outdoor > Sport e attività invernali > Sci e snowboard > Rastrelliere per sci e snowboard');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7224,'Articoli sportivi > Ricreazione outdoor > Sport e attività invernali > Sci e snowboard > Sacche per sci e snowboard');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6062,'Articoli sportivi > Ricreazione outdoor > Sport e attività invernali > Sci e snowboard > Scarponi da sci');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6064,'Articoli sportivi > Ricreazione outdoor > Sport e attività invernali > Sci e snowboard > Sci');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1158,'Articoli sportivi > Ricreazione outdoor > Sport e attività invernali > Sci e snowboard > Sci > Sci da discesa');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3331,'Articoli sportivi > Ricreazione outdoor > Sport e attività invernali > Sci e snowboard > Sci > Sci di fondo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1163,'Articoli sportivi > Ricreazione outdoor > Sport e attività invernali > Sci e snowboard > Stivali da snowboard');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505772,'Articoli sportivi > Ricreazione outdoor > Sport e attività invernali > Sci e snowboard > Strumenti per la preparazione di sci e snowboard');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1164,'Articoli sportivi > Ricreazione outdoor > Sport e attività invernali > Sci e snowboard > Tavole da snowboard');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499951,'Articoli sportivi > Ricreazione outdoor > Sport e attività invernali > Sistemi di sicurezza antivalanga');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499877,'Articoli sportivi > Ricreazione outdoor > Sport e attività invernali > Sistemi di sicurezza antivalanga > Airbag di sicurezza per valanghe');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499952,'Articoli sportivi > Ricreazione outdoor > Sport e attività invernali > Sistemi di sicurezza antivalanga > Sonde per valanghe');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7539,'Articoli sportivi > Ricreazione outdoor > Sport e attività invernali > Slitte');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1166,'Articoli sportivi > Ricreazione outdoor > Sport e attività invernali > Snowshoeing');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3073,'Articoli sportivi > Ricreazione outdoor > Sport e attività invernali > Snowshoeing > Attacchi racchette da neve');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3064,'Articoli sportivi > Ricreazione outdoor > Sport e attività invernali > Snowshoeing > Racchette da neve');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5635,'Articoli sportivi > Ricreazione outdoor > Zaini e borse portabevande');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499713,'Articoli sportivi > Sport');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6739,'Articoli sportivi > Sport > Arbitraggio e allenamento');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6731,'Articoli sportivi > Sport > Arbitraggio e allenamento > Bandierine da guardalinee');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6729,'Articoli sportivi > Sport > Arbitraggio e allenamento > Cartellini e bandierine');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499730,'Articoli sportivi > Sport > Arbitraggio e allenamento > Contastrike');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499731,'Articoli sportivi > Sport > Arbitraggio e allenamento > Contatori per lanci');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499729,'Articoli sportivi > Sport > Arbitraggio e allenamento > Fasce da capitano');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6730,'Articoli sportivi > Sport > Arbitraggio e allenamento > Fischietti per arbitri e allenatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499732,'Articoli sportivi > Sport > Arbitraggio e allenamento > Monete e dischi per arbitri');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499727,'Articoli sportivi > Sport > Arbitraggio e allenamento > Portafogli per arbitri');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499733,'Articoli sportivi > Sport > Arbitraggio e allenamento > Sedie per arbitri');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505813,'Articoli sportivi > Sport > Arbitraggio e allenamento > Strumenti segnacampo per sport');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8505,'Articoli sportivi > Sport > Arbitraggio e allenamento > Tabelloni segnapunti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6734,'Articoli sportivi > Sport > Attrezzature da broomball');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499861,'Articoli sportivi > Sport > Attrezzature da wallyball');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499799,'Articoli sportivi > Sport > Attrezzature sportive generiche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7433,'Articoli sportivi > Sport > Attrezzature sportive generiche > Accessori per pompe palle');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7435,'Articoli sportivi > Sport > Attrezzature sportive generiche > Accessori per pompe palle > Aghi per pompe palle');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7397,'Articoli sportivi > Sport > Attrezzature sportive generiche > Borse e carrelli per trasporto di palle');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499800,'Articoli sportivi > Sport > Attrezzature sportive generiche > Conchiglie protettive');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8319,'Articoli sportivi > Sport > Attrezzature sportive generiche > Coni per sport e agilità');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6344,'Articoli sportivi > Sport > Attrezzature sportive generiche > Cuscini per stadio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8222,'Articoli sportivi > Sport > Attrezzature sportive generiche > Maschere per l \'allenamento in altitudine');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499803,'Articoli sportivi > Sport > Attrezzature sportive generiche > Materassini da ginnastica');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3877,'Articoli sportivi > Sport > Attrezzature sportive generiche > Megafoni sportivi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499801,'Articoli sportivi > Sport > Attrezzature sportive generiche > Paradenti sportivi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7434,'Articoli sportivi > Sport > Attrezzature sportive generiche > Pompe per palle');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8077,'Articoli sportivi > Sport > Attrezzature sportive generiche > Reti e protezioni per allenamento');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499903,'Articoli sportivi > Sport > Attrezzature sportive generiche > Scaffali e carrelli per lo stoccaggio di materassini da ginnastica');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499802,'Articoli sportivi > Sport > Attrezzature sportive generiche > Scale e ostacoli per velocità e agilità');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3971,'Articoli sportivi > Sport > Attrezzature sportive generiche > Spray e magnesite da arrampicata');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1070,'Articoli sportivi > Sport > Baseball e softball');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1076,'Articoli sportivi > Sport > Baseball e softball > Guanti da baseball e softball');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3747,'Articoli sportivi > Sport > Baseball e softball > Guanti da battitore per baseball e softball');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1077,'Articoli sportivi > Sport > Baseball e softball > Macchine da lancio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3790,'Articoli sportivi > Sport > Baseball e softball > Mazze da baseball');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3679,'Articoli sportivi > Sport > Baseball e softball > Mazze da softball');
insert into GOOGLE_CATEGORY (codice,descrizione) values(234670,'Articoli sportivi > Sport > Baseball e softball > Monti di lancio per baseball e softball');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3783,'Articoli sportivi > Sport > Baseball e softball > Palle da baseball');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3671,'Articoli sportivi > Sport > Baseball e softball > Palle da softball');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3544,'Articoli sportivi > Sport > Baseball e softball > Piatti e basi per baseball e softball');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1078,'Articoli sportivi > Sport > Baseball e softball > Protezioni per baseball e softball');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3668,'Articoli sportivi > Sport > Baseball e softball > Protezioni per baseball e softball > Caschi da battitore per baseball e softball');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499717,'Articoli sportivi > Sport > Baseball e softball > Protezioni per baseball e softball > Caschi e maschere per catcher');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499715,'Articoli sportivi > Sport > Baseball e softball > Protezioni per baseball e softball > Protezioni per il petto per baseball e softball');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499718,'Articoli sportivi > Sport > Baseball e softball > Protezioni per baseball e softball > Protezioni per le gambe per baseball e softball');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499716,'Articoli sportivi > Sport > Baseball e softball > Protezioni per baseball e softball > Set di attrezzature per catcher');
insert into GOOGLE_CATEGORY (codice,descrizione) values(234671,'Articoli sportivi > Sport > Baseball e softball > Tappetini da lancio per baseball e softball');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1081,'Articoli sportivi > Sport > Basket');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1082,'Articoli sportivi > Sport > Basket > Canestri da basket');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1083,'Articoli sportivi > Sport > Basket > Palle da basket');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4676,'Articoli sportivi > Sport > Basket > Parti e accessori canestro basket');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4192,'Articoli sportivi > Sport > Basket > Parti e accessori canestro basket > Cerchi da basket');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7251,'Articoli sportivi > Sport > Basket > Parti e accessori canestro basket > Cuscinetti per anelli da basket');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4050,'Articoli sportivi > Sport > Basket > Parti e accessori canestro basket > Pali per canestri da basket');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3829,'Articoli sportivi > Sport > Basket > Parti e accessori canestro basket > Reti da basket');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4089,'Articoli sportivi > Sport > Basket > Parti e accessori canestro basket > Tabelloni da basket');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499751,'Articoli sportivi > Sport > Basket > Supporti di allenamento per il basket');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499719,'Articoli sportivi > Sport > Boxe e arti marziali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4282,'Articoli sportivi > Sport > Boxe e arti marziali > Armi per arti marziali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4008,'Articoli sportivi > Sport > Boxe e arti marziali > Attrezzatura protettiva pugilato');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499726,'Articoli sportivi > Sport > Boxe e arti marziali > Attrezzatura protettiva pugilato > Fasce per le mani per boxe e arti marziali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3235,'Articoli sportivi > Sport > Boxe e arti marziali > Attrezzatura protettiva pugilato > Guanti da pugilato e guantoni da baseball');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499724,'Articoli sportivi > Sport > Boxe e arti marziali > Attrezzatura protettiva pugilato > Parastinchi per arti marziali miste');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499723,'Articoli sportivi > Sport > Boxe e arti marziali > Attrezzatura protettiva pugilato > Protezioni per il corpo per boxe e arti marziali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499722,'Articoli sportivi > Sport > Boxe e arti marziali > Attrezzatura protettiva pugilato > Protezioni per la testa per boxe e arti marziali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499725,'Articoli sportivi > Sport > Boxe e arti marziali > Attrezzatura protettiva pugilato > Protezioni per le braccia per boxe e arti marziali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499720,'Articoli sportivi > Sport > Boxe e arti marziali > Attrezzature per l \'allenamento per boxe e arti marziali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7129,'Articoli sportivi > Sport > Boxe e arti marziali > Attrezzature per l \'allenamento per boxe e arti marziali > Accessori per sacchi e colpitori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499769,'Articoli sportivi > Sport > Boxe e arti marziali > Attrezzature per l \'allenamento per boxe e arti marziali > Guanti da passata per boxe e arti marziali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7116,'Articoli sportivi > Sport > Boxe e arti marziali > Attrezzature per l \'allenamento per boxe e arti marziali > Manichini da allenamento');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499721,'Articoli sportivi > Sport > Boxe e arti marziali > Attrezzature per l \'allenamento per boxe e arti marziali > Paracolpi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3297,'Articoli sportivi > Sport > Boxe e arti marziali > Attrezzature per l \'allenamento per boxe e arti marziali > Sacchi da pugilato');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3717,'Articoli sportivi > Sport > Boxe e arti marziali > Cinture per arti marziali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3411,'Articoli sportivi > Sport > Boxe e arti marziali > Parti per ring pugilato');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3652,'Articoli sportivi > Sport > Boxe e arti marziali > Ring per pugilato');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1111,'Articoli sportivi > Sport > Calcio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6055,'Articoli sportivi > Sport > Calcio > Accessori per porte per calcio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3973,'Articoli sportivi > Sport > Calcio > Bandierine per angoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3141,'Articoli sportivi > Sport > Calcio > Guantoni da portiere da calcio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1112,'Articoli sportivi > Sport > Calcio > Palloni da calcio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1113,'Articoli sportivi > Sport > Calcio > Porte e reti da calcio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499784,'Articoli sportivi > Sport > Calcio > Protezioni per calcio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1114,'Articoli sportivi > Sport > Calcio > Protezioni per calcio > Parastinchi da calcio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3354,'Articoli sportivi > Sport > Cheerleading');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3953,'Articoli sportivi > Sport > Cheerleading > Pon-pon da cheerleader');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1087,'Articoli sportivi > Sport > Cricket');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499737,'Articoli sportivi > Sport > Cricket > Accessori per mazze da cricket');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499738,'Articoli sportivi > Sport > Cricket > Accessori per mazze da cricket > Impugnature per mazze da cricket');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3815,'Articoli sportivi > Sport > Cricket > Mazze da cricket');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3870,'Articoli sportivi > Sport > Cricket > Palline da cricket');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499734,'Articoli sportivi > Sport > Cricket > Pioli per cricket');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499736,'Articoli sportivi > Sport > Cricket > Protezioni per cricket');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3543,'Articoli sportivi > Sport > Cricket > Protezioni per cricket > Caschi da cricket');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3339,'Articoli sportivi > Sport > Cricket > Protezioni per cricket > Guanti da cricket');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499739,'Articoli sportivi > Sport > Cricket > Protezioni per cricket > Protezioni per le gambe per cricket');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499735,'Articoli sportivi > Sport > Cricket > Set di attrezzi per cricket');
insert into GOOGLE_CATEGORY (codice,descrizione) values(989,'Articoli sportivi > Sport > Danza');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3269,'Articoli sportivi > Sport > Danza > Sbarre da danza');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1093,'Articoli sportivi > Sport > Football');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3998,'Articoli sportivi > Sport > Football > Attrezzatura allenamento football');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499779,'Articoli sportivi > Sport > Football > Attrezzatura allenamento football > Manichini e slitte per football');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1097,'Articoli sportivi > Sport > Football > Attrezzatura protettiva football');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3060,'Articoli sportivi > Sport > Football > Attrezzatura protettiva football > Accessori caschi football');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3247,'Articoli sportivi > Sport > Football > Attrezzatura protettiva football > Accessori caschi football > Cinghie football per mento');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3343,'Articoli sportivi > Sport > Football > Attrezzatura protettiva football > Accessori caschi football > Imbottiture casco football');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3090,'Articoli sportivi > Sport > Football > Attrezzatura protettiva football > Accessori caschi football > Maschere da football');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3063,'Articoli sportivi > Sport > Football > Attrezzatura protettiva football > Accessori caschi football > Visori caschi da football');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1098,'Articoli sportivi > Sport > Football > Attrezzatura protettiva football > Caschi da football');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3497,'Articoli sportivi > Sport > Football > Attrezzatura protettiva football > Imbottiture football per collo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3621,'Articoli sportivi > Sport > Football > Attrezzatura protettiva football > Imbottiture football per spalle');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3510,'Articoli sportivi > Sport > Football > Attrezzatura protettiva football > Imbottiture protettive football');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499778,'Articoli sportivi > Sport > Football > Attrezzatura protettiva football > Maglie con protezioni per le costole per football');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3442,'Articoli sportivi > Sport > Football > Guanti da football');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3492,'Articoli sportivi > Sport > Football > Pali mete da football');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1094,'Articoli sportivi > Sport > Football > Palloni da football');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3656,'Articoli sportivi > Sport > Football > Supporti e sostegni per palloni da rugby');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1000,'Articoli sportivi > Sport > Ginnastica');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3774,'Articoli sportivi > Sport > Ginnastica > Anelli da ginnastica');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3808,'Articoli sportivi > Sport > Ginnastica > Attrezzatura protettiva ginnastica');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499781,'Articoli sportivi > Sport > Ginnastica > Attrezzatura protettiva ginnastica > Paracalli da ginnastica');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3779,'Articoli sportivi > Sport > Ginnastica > Cavalli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3182,'Articoli sportivi > Sport > Ginnastica > Cavalli con maniglie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3123,'Articoli sportivi > Sport > Ginnastica > Pedane da salto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503763,'Articoli sportivi > Sport > Ginnastica > Sbarre da ginnastica e travi di equilibrio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499741,'Articoli sportivi > Sport > Hockey su prato e lacrosse');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3204,'Articoli sportivi > Sport > Hockey su prato e lacrosse > Attrezzatura di allenamento per lacrosse');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1092,'Articoli sportivi > Sport > Hockey su prato e lacrosse > Mazze da hockey su prato');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3817,'Articoli sportivi > Sport > Hockey su prato e lacrosse > Mazze da lacrosse');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1089,'Articoli sportivi > Sport > Hockey su prato e lacrosse > Palline da hockey su prato');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3536,'Articoli sportivi > Sport > Hockey su prato e lacrosse > Palline da lacrosse');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3336,'Articoli sportivi > Sport > Hockey su prato e lacrosse > Parti di mazze lacrosse');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3423,'Articoli sportivi > Sport > Hockey su prato e lacrosse > Parti di mazze lacrosse > Aste di mazze da lacrosse');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3785,'Articoli sportivi > Sport > Hockey su prato e lacrosse > Parti di mazze lacrosse > Tele da lacrosse');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3418,'Articoli sportivi > Sport > Hockey su prato e lacrosse > Parti di mazze lacrosse > Teste di mazze lacrosse');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3001,'Articoli sportivi > Sport > Hockey su prato e lacrosse > Porte da hockey su prato');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3970,'Articoli sportivi > Sport > Hockey su prato e lacrosse > Porte da lacrosse');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499744,'Articoli sportivi > Sport > Hockey su prato e lacrosse > Protezioni per hockey su prato e lacrosse');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499746,'Articoli sportivi > Sport > Hockey su prato e lacrosse > Protezioni per hockey su prato e lacrosse > Caschi per hockey su prato e lacrosse');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499745,'Articoli sportivi > Sport > Hockey su prato e lacrosse > Protezioni per hockey su prato e lacrosse > Guanti per hockey su prato e lacrosse');
insert into GOOGLE_CATEGORY (codice,descrizione) values(502970,'Articoli sportivi > Sport > Hockey su prato e lacrosse > Protezioni per hockey su prato e lacrosse > Imbottiture lacrosse per hockey su prato');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499747,'Articoli sportivi > Sport > Hockey su prato e lacrosse > Protezioni per hockey su prato e lacrosse > Maschere e occhiali per hockey su prato e lacrosse');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499742,'Articoli sportivi > Sport > Hockey su prato e lacrosse > Set di attrezzature per lacrosse');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1047,'Articoli sportivi > Sport > Pallamano in squadra');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499785,'Articoli sportivi > Sport > Pallamano in squadra > Palloni da pallamano');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1145,'Articoli sportivi > Sport > Pallanuoto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3575,'Articoli sportivi > Sport > Pallanuoto > Cuffie da pallanuoto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3794,'Articoli sportivi > Sport > Pallanuoto > Palloni da pallanuoto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3678,'Articoli sportivi > Sport > Pallanuoto > Porte da pallanuoto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1115,'Articoli sportivi > Sport > Pallavolo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1116,'Articoli sportivi > Sport > Pallavolo > Palle da pallavolo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499788,'Articoli sportivi > Sport > Pallavolo > Protezioni per pallavolo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499789,'Articoli sportivi > Sport > Pallavolo > Protezioni per pallavolo > Ginocchiere per pallavolo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1117,'Articoli sportivi > Sport > Pallavolo > Reti da pallavolo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499787,'Articoli sportivi > Sport > Pallavolo > Supporti per l \'allenamento a pallavolo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499915,'Articoli sportivi > Sport > Pattinaggio di figura e hockey');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1105,'Articoli sportivi > Sport > Pattinaggio di figura e hockey > Attrezzatura protettiva hockey');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6080,'Articoli sportivi > Sport > Pattinaggio di figura e hockey > Attrezzatura protettiva hockey > Caschi da hockey');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499975,'Articoli sportivi > Sport > Pattinaggio di figura e hockey > Attrezzatura protettiva hockey > Cinture e reggicalze per hockey');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499755,'Articoli sportivi > Sport > Pattinaggio di figura e hockey > Attrezzatura protettiva hockey > Ginocchiere e parastinchi da hockey');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499756,'Articoli sportivi > Sport > Pattinaggio di figura e hockey > Attrezzatura protettiva hockey > Gomitiere da hockey');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6078,'Articoli sportivi > Sport > Pattinaggio di figura e hockey > Attrezzatura protettiva hockey > Guanti da hockey');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3615,'Articoli sportivi > Sport > Pattinaggio di figura e hockey > Attrezzatura protettiva hockey > Pantaloncini da hockey');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499757,'Articoli sportivi > Sport > Pattinaggio di figura e hockey > Attrezzatura protettiva hockey > Protezioni per petto e spalle da hockey');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499890,'Articoli sportivi > Sport > Pattinaggio di figura e hockey > Attrezzatura protettiva hockey > Set di attrezzatura per portieri di hockey');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3791,'Articoli sportivi > Sport > Pattinaggio di figura e hockey > Componenti e accessori per pattinaggio su ghiaccio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3623,'Articoli sportivi > Sport > Pattinaggio di figura e hockey > Componenti e accessori per pattinaggio su ghiaccio > Affilatori pattini da ghiaccio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4019,'Articoli sportivi > Sport > Pattinaggio di figura e hockey > Componenti e accessori per pattinaggio su ghiaccio > Coprilama per pattini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7000,'Articoli sportivi > Sport > Pattinaggio di figura e hockey > Componenti e accessori per pattinaggio su ghiaccio > Lame per pattini da ghiaccio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6708,'Articoli sportivi > Sport > Pattinaggio di figura e hockey > Componenti e accessori per pattinaggio su ghiaccio > Pattini per pattinaggio artistico');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3241,'Articoli sportivi > Sport > Pattinaggio di figura e hockey > Componenti e accessori per pattinaggio su ghiaccio > Tiralacci per pattini da ghiaccio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7012,'Articoli sportivi > Sport > Pattinaggio di figura e hockey > Manutenzione mazze da hockey');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6076,'Articoli sportivi > Sport > Pattinaggio di figura e hockey > Mazze da hockey');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6077,'Articoli sportivi > Sport > Pattinaggio di figura e hockey > Palle e dischi da hockey');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1057,'Articoli sportivi > Sport > Pattinaggio di figura e hockey > Pattini da ghiaccio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6074,'Articoli sportivi > Sport > Pattinaggio di figura e hockey > Porte da hockey');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7011,'Articoli sportivi > Sport > Pattinaggio di figura e hockey > Ricambi per mazze da hockey');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6942,'Articoli sportivi > Sport > Pattinaggio di figura e hockey > Ricambi per mazze da hockey > Bastoni da hockey');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6852,'Articoli sportivi > Sport > Pattinaggio di figura e hockey > Ricambi per mazze da hockey > Lame per mazze da hockey');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6857,'Articoli sportivi > Sport > Pattinaggio di figura e hockey > Slittini da hockey');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503752,'Articoli sportivi > Sport > Racquetball e squash');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499783,'Articoli sportivi > Sport > Racquetball e squash > Guanti da squash e racquetball');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3119,'Articoli sportivi > Sport > Racquetball e squash > Occhiali protettivi per squash/racquetball');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503753,'Articoli sportivi > Sport > Racquetball e squash > Palle da racquetball e da squash');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4002,'Articoli sportivi > Sport > Racquetball e squash > Racchette da squash');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3714,'Articoli sportivi > Sport > Racquetball e squash > Racchette per racquetball');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7156,'Articoli sportivi > Sport > Rounders');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7157,'Articoli sportivi > Sport > Rounders > Guanti per rounders');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7158,'Articoli sportivi > Sport > Rounders > Mazze per rounders');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1110,'Articoli sportivi > Sport > Rugby');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3983,'Articoli sportivi > Sport > Rugby > Attrezzatura allenamento rugby');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3487,'Articoli sportivi > Sport > Rugby > Guanti da rugby');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3881,'Articoli sportivi > Sport > Rugby > Pali da rugby');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3761,'Articoli sportivi > Sport > Rugby > Palloni da rugby');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499782,'Articoli sportivi > Sport > Rugby > Protezioni per rugby');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3077,'Articoli sportivi > Sport > Rugby > Protezioni per rugby > Caschi da rugby');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1006,'Articoli sportivi > Sport > Scherma');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3622,'Articoli sportivi > Sport > Scherma > Armi da scherma');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3261,'Articoli sportivi > Sport > Scherma > Attrezzatura protettiva scherma');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499740,'Articoli sportivi > Sport > Scherma > Attrezzatura protettiva scherma > Giacche e giubbetti per scherma');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3366,'Articoli sportivi > Sport > Scherma > Attrezzatura protettiva scherma > Guanti e manichette da scherma');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3707,'Articoli sportivi > Sport > Scherma > Attrezzatura protettiva scherma > Maschere da scherma');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1065,'Articoli sportivi > Sport > Tennis');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3658,'Articoli sportivi > Sport > Tennis > Accessori per racchette da tennis');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3352,'Articoli sportivi > Sport > Tennis > Accessori per racchette da tennis > Antivibrazioni per racchette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3638,'Articoli sportivi > Sport > Tennis > Accessori per racchette da tennis > Borse per racchette da tennis');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3922,'Articoli sportivi > Sport > Tennis > Accessori per racchette da tennis > Corde per racchette da tennis');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3295,'Articoli sportivi > Sport > Tennis > Accessori per racchette da tennis > Gommini per racchette da tennis');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3403,'Articoli sportivi > Sport > Tennis > Accessori per racchette da tennis > Nastri e impugnature per racchette da tennis');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3565,'Articoli sportivi > Sport > Tennis > Barattolo palline da tennis');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3105,'Articoli sportivi > Sport > Tennis > Cestelli e carrelli per palline da tennis');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3985,'Articoli sportivi > Sport > Tennis > Lanciapalle da tennis');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3113,'Articoli sportivi > Sport > Tennis > Palline da tennis');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3906,'Articoli sportivi > Sport > Tennis > Racchette da tennis');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3961,'Articoli sportivi > Sport > Tennis > Reti da tennis');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1060,'Articoli sportivi > Sport > Tracciato e campo atletica');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4020,'Articoli sportivi > Sport > Tracciato e campo atletica > Aste per salto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3445,'Articoli sportivi > Sport > Tracciato e campo atletica > Aste per salto in alto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499786,'Articoli sportivi > Sport > Tracciato e campo atletica > Blocchi di partenza per atletica');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3987,'Articoli sportivi > Sport > Tracciato e campo atletica > Cassette imbucata per asta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3478,'Articoli sportivi > Sport > Tracciato e campo atletica > Dischi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3389,'Articoli sportivi > Sport > Tracciato e campo atletica > Giavellotti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3880,'Articoli sportivi > Sport > Tracciato e campo atletica > Martelli da lancio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3864,'Articoli sportivi > Sport > Tracciato e campo atletica > Materassini salto in alto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3149,'Articoli sportivi > Sport > Tracciato e campo atletica > Ostacoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3770,'Articoli sportivi > Sport > Tracciato e campo atletica > Pesi per getto del peso');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3997,'Articoli sportivi > Sport > Tracciato e campo atletica > Pistole starter');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3878,'Articoli sportivi > Sport > Tracciato e campo atletica > Testimoni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1068,'Articoli sportivi > Sport > Wrestling');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3057,'Articoli sportivi > Sport > Wrestling > Attrezzatura protettiva lotta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499791,'Articoli sportivi > Sport > Wrestling > Attrezzatura protettiva lotta > Caschi da wrestling');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499790,'Articoli sportivi > Sport > Wrestling > Attrezzatura protettiva lotta > Ginocchiere per wrestling');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5181,'Bagagli e borse');
insert into GOOGLE_CATEGORY (codice,descrizione) values(110,'Bagagli e borse > Accessori bagagli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5650,'Bagagli e borse > Accessori bagagli > Borse da viaggio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5652,'Bagagli e borse > Accessori bagagli > Cinghie per bagagli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6919,'Bagagli e borse > Accessori bagagli > Contenitori e bottiglie da viaggio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7521,'Bagagli e borse > Accessori bagagli > Coperture per bagagli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5651,'Bagagli e borse > Accessori bagagli > Etichette per bagagli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503014,'Bagagli e borse > Accessori bagagli > Inserti e rivestimenti per contenitori stagni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5620,'Bagagli e borse > Accessori bagagli > Organizer per bagagli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499691,'Bagagli e borse > Accessori bagagli > Portabagagli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5608,'Bagagli e borse > Borse da shopping');
insert into GOOGLE_CATEGORY (codice,descrizione) values(106,'Bagagli e borse > Borse messenger');
insert into GOOGLE_CATEGORY (codice,descrizione) values(108,'Bagagli e borse > Borse toilette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(103,'Bagagli e borse > Borsoni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(502974,'Bagagli e borse > Contenitori stagni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(105,'Bagagli e borse > Custodie per abiti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6553,'Bagagli e borse > Custodie per treno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(104,'Bagagli e borse > Marsupi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(549,'Bagagli e borse > Sacchetti pannolini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(107,'Bagagli e borse > Valigette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(101,'Bagagli e borse > Ventiquattrore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(100,'Bagagli e borse > Zaini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(537,'Bebè e bimbi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4386,'Bebè e bimbi > Accessori trasporto bebè');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4916,'Bebè e bimbi > Accessori trasporto bebè > Accessori marsupio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4387,'Bebè e bimbi > Accessori trasporto bebè > Accessori per passeggini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4486,'Bebè e bimbi > Accessori trasporto bebè > Accessori seggiolini auto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5845,'Bebè e bimbi > Accessori trasporto bebè > Rivestimenti per sedili dei carrelli della spesa e seggioloni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8537,'Bebè e bimbi > Accessori trasporto bebè > Sacche e fodere per il trasporto di bambini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6952,'Bebè e bimbi > Addestramento al vasino');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6953,'Bebè e bimbi > Addestramento al vasino > Kit di addestramento al vasino');
insert into GOOGLE_CATEGORY (codice,descrizione) values(552,'Bebè e bimbi > Addestramento al vasino > Tavolette WC per bambini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(561,'Bebè e bimbi > Allattamento e alimentazione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505366,'Bebè e bimbi > Allattamento e alimentazione > Accessori per tiralatte');
insert into GOOGLE_CATEGORY (codice,descrizione) values(562,'Bebè e bimbi > Allattamento e alimentazione > Alimenti per bebè e bambini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(563,'Bebè e bimbi > Allattamento e alimentazione > Alimenti per bebè e bambini > Alimenti per bambini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5719,'Bebè e bimbi > Allattamento e alimentazione > Alimenti per bebè e bambini > Alimenti per bebè');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8436,'Bebè e bimbi > Allattamento e alimentazione > Alimenti per bebè e bambini > Bevande e frullati nutritivi per bebè');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5718,'Bebè e bimbi > Allattamento e alimentazione > Alimenti per bebè e bambini > Bevande per bambini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5721,'Bebè e bimbi > Allattamento e alimentazione > Alimenti per bebè e bambini > Cereali per bambini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5720,'Bebè e bimbi > Allattamento e alimentazione > Alimenti per bebè e bambini > Snack per bebè');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2125,'Bebè e bimbi > Allattamento e alimentazione > Bavaglini bebè e bimbi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(564,'Bebè e bimbi > Allattamento e alimentazione > Biberon');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7234,'Bebè e bimbi > Allattamento e alimentazione > Contenitori per allattamento');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8075,'Bebè e bimbi > Allattamento e alimentazione > Coperture per cuscini da allattamento');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5298,'Bebè e bimbi > Allattamento e alimentazione > Cuscini per allattamento');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5843,'Bebè e bimbi > Allattamento e alimentazione > Foulard e teli copri-allattamento');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5629,'Bebè e bimbi > Allattamento e alimentazione > Panni antirigurgito');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503762,'Bebè e bimbi > Allattamento e alimentazione > Protezioni per capezzoli e cuscinetti per allattamento');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5296,'Bebè e bimbi > Allattamento e alimentazione > Scaldabiberon e sterilizzatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6950,'Bebè e bimbi > Allattamento e alimentazione > Tazze per bimbi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5630,'Bebè e bimbi > Allattamento e alimentazione > Tettarelle e sacche usa e getta per biberon');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4768,'Bebè e bimbi > Allattamento e alimentazione > Timer per cura bebè');
insert into GOOGLE_CATEGORY (codice,descrizione) values(565,'Bebè e bimbi > Allattamento e alimentazione > Tiralatte');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2847,'Bebè e bimbi > Attrezzature per attività e giochi per bebè');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7191,'Bebè e bimbi > Attrezzature per attività e giochi per bebè > Accessori per la mobilità del bebè');
insert into GOOGLE_CATEGORY (codice,descrizione) values(539,'Bebè e bimbi > Attrezzature per attività e giochi per bebè > Box');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7360,'Bebè e bimbi > Attrezzature per attività e giochi per bebè > Consolatori per bebè');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3459,'Bebè e bimbi > Attrezzature per attività e giochi per bebè > Giocattoli da spingere e tirare');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3661,'Bebè e bimbi > Attrezzature per attività e giochi per bebè > Giochi con l \'alfabeto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3860,'Bebè e bimbi > Attrezzature per attività e giochi per bebè > Giochi da ordinare e impilare');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7198,'Bebè e bimbi > Attrezzature per attività e giochi per bebè > Giochi multiattività per bebè');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1242,'Bebè e bimbi > Attrezzature per attività e giochi per bebè > Giostrine per lettino');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1241,'Bebè e bimbi > Attrezzature per attività e giochi per bebè > Girelli e palestrine');
insert into GOOGLE_CATEGORY (codice,descrizione) values(560,'Bebè e bimbi > Attrezzature per attività e giochi per bebè > Jumper e altalene per bebè');
insert into GOOGLE_CATEGORY (codice,descrizione) values(555,'Bebè e bimbi > Attrezzature per attività e giochi per bebè > Sdraiette e dondoli per neonati');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1244,'Bebè e bimbi > Attrezzature per attività e giochi per bebè > Sonagli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1243,'Bebè e bimbi > Attrezzature per attività e giochi per bebè > Tappeti e palestre gioco');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4678,'Bebè e bimbi > Bagnetto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7082,'Bebè e bimbi > Bagnetto > Cappellini doccia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4679,'Bebè e bimbi > Bagnetto > Vaschette da bagno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(548,'Bebè e bimbi > Cambio pannolini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7001,'Bebè e bimbi > Cambio pannolini > Accessori per secchi per pannolini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6971,'Bebè e bimbi > Cambio pannolini > Borse per pannolini bagnati');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6883,'Bebè e bimbi > Cambio pannolini > Contenitori per pannolini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(502999,'Bebè e bimbi > Cambio pannolini > Coprifasciatoio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7200,'Bebè e bimbi > Cambio pannolini > Distributori e riscaldatori di salviettine per bebè');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6949,'Bebè e bimbi > Cambio pannolini > Fodere per pannolini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7014,'Bebè e bimbi > Cambio pannolini > Kit per pannolini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5628,'Bebè e bimbi > Cambio pannolini > Materassini fasciatoio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(551,'Bebè e bimbi > Cambio pannolini > Pannolini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2949,'Bebè e bimbi > Cambio pannolini > Prodotti sfogo da pannolino');
insert into GOOGLE_CATEGORY (codice,descrizione) values(553,'Bebè e bimbi > Cambio pannolini > Salviettine');
insert into GOOGLE_CATEGORY (codice,descrizione) values(550,'Bebè e bimbi > Cambio pannolini > Secchi per pannolini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6899,'Bebè e bimbi > Coperte per fasciatura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5252,'Bebè e bimbi > Salute del bambino');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5253,'Bebè e bimbi > Salute del bambino > Aspiratori nasali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(566,'Bebè e bimbi > Salute del bambino > Ciucci e massaggiagengive');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7016,'Bebè e bimbi > Salute del bambino > Clip e pinze per ciuccio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6290,'Bebè e bimbi > Salute del bambino > Kit per la salute e la cura del bambino');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7309,'Bebè e bimbi > Salute del bambino > Salviettine per ciucci');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5859,'Bebè e bimbi > Set da regalo per neonato e primi passi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(540,'Bebè e bimbi > Sicurezza dei bebè');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6869,'Bebè e bimbi > Sicurezza dei bebè > Accessori per cancelletti di sicurezza');
insert into GOOGLE_CATEGORY (codice,descrizione) values(544,'Bebè e bimbi > Sicurezza dei bebè > Barriere letto per bambini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(543,'Bebè e bimbi > Sicurezza dei bebè > Blocchi di sicurezza per bambini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(542,'Bebè e bimbi > Sicurezza dei bebè > Cancelletti di sicurezza');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5049,'Bebè e bimbi > Sicurezza dei bebè > Imbracature/guinzagli sicurezza bebè');
insert into GOOGLE_CATEGORY (codice,descrizione) values(541,'Bebè e bimbi > Sicurezza dei bebè > Interfoni per interni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2764,'Bebè e bimbi > Trasporto bebè');
insert into GOOGLE_CATEGORY (codice,descrizione) values(538,'Bebè e bimbi > Trasporto bebè > Marsupi portabebè');
insert into GOOGLE_CATEGORY (codice,descrizione) values(568,'Bebè e bimbi > Trasporto bebè > Passeggini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(547,'Bebè e bimbi > Trasporto bebè > Seggiolini per auto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(536,'Casa e giardino');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2862,'Casa e giardino > Accessori caminetti e stufe a legna');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1530,'Casa e giardino > Accessori caminetti e stufe a legna > Accessori per caminetto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7029,'Casa e giardino > Accessori caminetti e stufe a legna > Accessori per porta legna');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7523,'Casa e giardino > Accessori caminetti e stufe a legna > Alari per camino');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7091,'Casa e giardino > Accessori caminetti e stufe a legna > Basamenti per focolare');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6563,'Casa e giardino > Accessori caminetti e stufe a legna > Grate per caminetti e stufe a legna');
insert into GOOGLE_CATEGORY (codice,descrizione) values(625,'Casa e giardino > Accessori caminetti e stufe a legna > Legna da ardere/combustibile');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2044,'Casa e giardino > Accessori caminetti e stufe a legna > Mantici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2365,'Casa e giardino > Accessori caminetti e stufe a legna > Parascintille');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7109,'Casa e giardino > Accessori caminetti e stufe a legna > Piastre riflettenti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(695,'Casa e giardino > Accessori caminetti e stufe a legna > Porta legna');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4918,'Casa e giardino > Accessori caminetti e stufe a legna > Ventole/sfiatatoi stufe a legna');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3348,'Casa e giardino > Accessori elettrodomestici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4548,'Casa e giardino > Accessori elettrodomestici > Accessori battitappeto e pulitori a vapore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4667,'Casa e giardino > Accessori elettrodomestici > Accessori deumidificatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3456,'Casa e giardino > Accessori elettrodomestici > Accessori lavatrici e asciugatrici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5158,'Casa e giardino > Accessori elettrodomestici > Accessori lavatrici e asciugatrici > Accessori ferri da stiro a vapore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5159,'Casa e giardino > Accessori elettrodomestici > Accessori lavatrici e asciugatrici > Accessori ferro da stiro');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500085,'Casa e giardino > Accessori elettrodomestici > Accessori lavatrici e asciugatrici > Accessori per lavatrici e asciugatrici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5160,'Casa e giardino > Accessori elettrodomestici > Accessori lavatrici e asciugatrici > Accessori presse a vapore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2367,'Casa e giardino > Accessori elettrodomestici > Accessori per condizionatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5826,'Casa e giardino > Accessori elettrodomestici > Accessori per condizionatori > Coperture per condizionatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3573,'Casa e giardino > Accessori elettrodomestici > Accessori per condizionatori > Filtri per condizionatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6773,'Casa e giardino > Accessori elettrodomestici > Accessori per fornaci e caldaie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7110,'Casa e giardino > Accessori elettrodomestici > Accessori per termosifoni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7111,'Casa e giardino > Accessori elettrodomestici > Accessori per termosifoni > Pannelli riflettenti per termosifoni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3410,'Casa e giardino > Accessori elettrodomestici > Accessori purificatori d \'aria');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3667,'Casa e giardino > Accessori elettrodomestici > Accessori purificatori d \'aria > Filtri purificatori d \'aria');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2751,'Casa e giardino > Accessori elettrodomestici > Accessori riscaldatori ad acqua');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2310,'Casa e giardino > Accessori elettrodomestici > Accessori riscaldatori ad acqua > Aste anodo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1744,'Casa e giardino > Accessori elettrodomestici > Accessori riscaldatori ad acqua > Elementi riscaldatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1835,'Casa e giardino > Accessori elettrodomestici > Accessori riscaldatori ad acqua > Pannelli riscaldatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2221,'Casa e giardino > Accessori elettrodomestici > Accessori riscaldatori ad acqua > Pile riscaldatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500063,'Casa e giardino > Accessori elettrodomestici > Accessori riscaldatori ad acqua > Serbatoi di espansione per riscaldatori d \'acqua');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2175,'Casa e giardino > Accessori elettrodomestici > Accessori riscaldatori ad acqua > Serbatoi per scaldabagno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1709,'Casa e giardino > Accessori elettrodomestici > Accessori riscaldatori ad acqua > Sfiati riscaldatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4650,'Casa e giardino > Accessori elettrodomestici > Accessori stufe a fungo da esterno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4651,'Casa e giardino > Accessori elettrodomestici > Accessori stufe a fungo da esterno > Copertura stufe a fungo da esterno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3862,'Casa e giardino > Accessori elettrodomestici > Accessori umidificatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3402,'Casa e giardino > Accessori elettrodomestici > Accessori umidificatori > Filtri per umidificatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5089,'Casa e giardino > Accessori elettrodomestici > Accessori ventola');
insert into GOOGLE_CATEGORY (codice,descrizione) values(618,'Casa e giardino > Accessori elettrodomestici > Articoli per aspirapolvere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2956,'Casa e giardino > Accessori illuminazione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7338,'Casa e giardino > Accessori illuminazione > Basi per lampioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505312,'Casa e giardino > Accessori illuminazione > Combustibile per lampade a petrolio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3185,'Casa e giardino > Accessori illuminazione > Paraluce per la casa');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7447,'Casa e giardino > Accessori illuminazione > Supporti per lampioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3522,'Casa e giardino > Accessori illuminazione > Timer per lampade');
insert into GOOGLE_CATEGORY (codice,descrizione) values(600,'Casa e giardino > Accessori per fumare');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6880,'Casa e giardino > Accessori per fumare > Accessori per umidificatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6881,'Casa e giardino > Accessori per fumare > Portasigarette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6882,'Casa e giardino > Accessori per fumare > Portasigari');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4082,'Casa e giardino > Accessori per fumare > Posacenere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500007,'Casa e giardino > Accessori per fumare > Sostegni per sigarette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6879,'Casa e giardino > Accessori per fumare > Tagliasigari e perforatrici per sigari');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6878,'Casa e giardino > Accessori per fumare > Umidificatori sigari');
insert into GOOGLE_CATEGORY (codice,descrizione) values(574,'Casa e giardino > Accessori per il bagno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8016,'Casa e giardino > Accessori per il bagno > Accessori per asciugamani');
insert into GOOGLE_CATEGORY (codice,descrizione) values(578,'Casa e giardino > Accessori per il bagno > Anelli per tenda doccia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2418,'Casa e giardino > Accessori per il bagno > Armadietti per medicinali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5141,'Casa e giardino > Accessori per il bagno > Asciugamani ad aria');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1962,'Casa e giardino > Accessori per il bagno > Bastoni doccia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4366,'Casa e giardino > Accessori per il bagno > Cuscini da bagno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(579,'Casa e giardino > Accessori per il bagno > Dispenser per salviettine');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4971,'Casa e giardino > Accessori per il bagno > Dispenser sapone e lozioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2034,'Casa e giardino > Accessori per il bagno > Ganci appendiabiti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7093,'Casa e giardino > Accessori per il bagno > Kit montaggio e fissaggio accessori bagno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8114,'Casa e giardino > Accessori per il bagno > Maniglie di sicurezza');
insert into GOOGLE_CATEGORY (codice,descrizione) values(584,'Casa e giardino > Accessori per il bagno > Porta carta igienica');
insert into GOOGLE_CATEGORY (codice,descrizione) values(586,'Casa e giardino > Accessori per il bagno > Porta salviette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(585,'Casa e giardino > Accessori per il bagno > Porta spazzolini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(582,'Casa e giardino > Accessori per il bagno > Portasapone');
insert into GOOGLE_CATEGORY (codice,descrizione) values(583,'Casa e giardino > Accessori per il bagno > Scopini e portascopini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6858,'Casa e giardino > Accessori per il bagno > Set di accessori per bagno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7509,'Casa e giardino > Accessori per il bagno > Spazzole sostitutive per scopini da WC');
insert into GOOGLE_CATEGORY (codice,descrizione) values(577,'Casa e giardino > Accessori per il bagno > Tappetini per bagno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(580,'Casa e giardino > Accessori per il bagno > Tende da doccia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(575,'Casa e giardino > Accessori per il bagno > Vassoi per vasca');
insert into GOOGLE_CATEGORY (codice,descrizione) values(696,'Casa e giardino > Arredo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(230911,'Casa e giardino > Arredo > Accessori casette per uccelli e piccoli animali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5521,'Casa e giardino > Arredo > Accessori mangiatoie per uccelli e piccoli animali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7419,'Casa e giardino > Arredo > Accessori per bandiere e maniche a vento');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7421,'Casa e giardino > Arredo > Accessori per bandiere e maniche a vento > Aste per bandiere e maniche a vento');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503010,'Casa e giardino > Arredo > Accessori per bandiere e maniche a vento > Kit e accessori per il montaggio di aste per bandiere e maniche a vento');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7420,'Casa e giardino > Arredo > Accessori per bandiere e maniche a vento > Luci per aste di bandiere e maniche a vento');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6333,'Casa e giardino > Arredo > Accessori per cassette postali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7176,'Casa e giardino > Arredo > Accessori per cassette postali > Bandierine per cassette delle lettere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7177,'Casa e giardino > Arredo > Accessori per cassette postali > Coperture per cassette delle lettere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6334,'Casa e giardino > Arredo > Accessori per cassette postali > Pali per cassette postali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7339,'Casa e giardino > Arredo > Accessori per cassette postali > Sportelli sostitutivi per cassette delle lettere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7052,'Casa e giardino > Arredo > Accessori per cassette postali > Strutture per cassette postali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6254,'Casa e giardino > Arredo > Accessori per il trattamento delle finestre');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6256,'Casa e giardino > Arredo > Accessori per il trattamento delle finestre > Anelli per tende e tendaggi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6257,'Casa e giardino > Arredo > Accessori per il trattamento delle finestre > Bastoni per tende e tendaggi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6255,'Casa e giardino > Arredo > Accessori per il trattamento delle finestre > Fermatende e fiocchi per tende');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8042,'Casa e giardino > Arredo > Accessori per il trattamento delle finestre > Ricambi di tende per finestre');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500121,'Casa e giardino > Arredo > Accessori per profumi per la casa');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4741,'Casa e giardino > Arredo > Accessori per profumi per la casa > Bruciaincenso');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2784,'Casa e giardino > Arredo > Accessori per profumi per la casa > Portacandele');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6336,'Casa e giardino > Arredo > Accessori per profumi per la casa > Scaldacandela e scaldaolio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500122,'Casa e giardino > Arredo > Accessori per profumi per la casa > Spegnitoio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7172,'Casa e giardino > Arredo > Acchiappasogni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7173,'Casa e giardino > Arredo > Acchiappasole');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6266,'Casa e giardino > Arredo > Alimenti artificiali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5708,'Casa e giardino > Arredo > Appendiabiti e appendicappelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(9,'Casa e giardino > Arredo > Arte');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500044,'Casa e giardino > Arredo > Arte > Poster, stampe e opere decorative');
insert into GOOGLE_CATEGORY (codice,descrizione) values(11,'Casa e giardino > Arredo > Arte > Statuine, sculture e statue');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500045,'Casa e giardino > Arredo > Arte > Tappezzerie decorative');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5922,'Casa e giardino > Arredo > Bacheche portaoggetti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(697,'Casa e giardino > Arredo > Bagni per uccelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(701,'Casa e giardino > Arredo > Bandiere e maniche a vento');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4233,'Casa e giardino > Arredo > Bauli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6317,'Casa e giardino > Arredo > Bottiglie decorative');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7436,'Casa e giardino > Arredo > Buche delle lettere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6530,'Casa e giardino > Arredo > Calamite per finestre');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7206,'Casa e giardino > Arredo > Campane decorative');
insert into GOOGLE_CATEGORY (codice,descrizione) values(714,'Casa e giardino > Arredo > Campane del vento');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4770,'Casa e giardino > Arredo > Candele senza fiamma');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7113,'Casa e giardino > Arredo > Caraffe decorative');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3473,'Casa e giardino > Arredo > Carillon');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2334,'Casa e giardino > Arredo > Carta da parati');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5885,'Casa e giardino > Arredo > Cartelli con messaggi divertenti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500078,'Casa e giardino > Arredo > Casette per uccelli e animali selvatici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500080,'Casa e giardino > Arredo > Casette per uccelli e animali selvatici > Casette per farfalle');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500079,'Casa e giardino > Arredo > Casette per uccelli e animali selvatici > Casette per pipistrelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(699,'Casa e giardino > Arredo > Casette per uccelli e animali selvatici > Casette per uccelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(706,'Casa e giardino > Arredo > Cassette postali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(709,'Casa e giardino > Arredo > Catene pluviali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(573,'Casa e giardino > Arredo > Cesti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6457,'Casa e giardino > Arredo > Ciotole decorative');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503000,'Casa e giardino > Arredo > Clessidra');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505827,'Casa e giardino > Arredo > Componenti di orologi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(599,'Casa e giardino > Arredo > Copridivani');
insert into GOOGLE_CATEGORY (codice,descrizione) values(597,'Casa e giardino > Arredo > Cornici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6267,'Casa e giardino > Arredo > Corone e ghirlande');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4456,'Casa e giardino > Arredo > Cuscini dorsali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4454,'Casa e giardino > Arredo > Cuscini foderati');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6927,'Casa e giardino > Arredo > Cuscini per ottomana');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4453,'Casa e giardino > Arredo > Cuscini per sedie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3221,'Casa e giardino > Arredo > Decalcomanie da parete');
insert into GOOGLE_CATEGORY (codice,descrizione) values(596,'Casa e giardino > Arredo > Decorazioni natalizie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505809,'Casa e giardino > Arredo > Decorazioni natalizie > Accessori e decorazioni per riproduzioni in miniatura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5990,'Casa e giardino > Arredo > Decorazioni natalizie > Appendini per calze natalizie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5930,'Casa e giardino > Arredo > Decorazioni natalizie > Bambole tradizionali giapponesi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5359,'Casa e giardino > Arredo > Decorazioni natalizie > Calendari dell \'Avvento');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5991,'Casa e giardino > Arredo > Decorazioni natalizie > Calze natalizie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5504,'Casa e giardino > Arredo > Decorazioni natalizie > Decorazioni in tessuto per alberi di Natale');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499804,'Casa e giardino > Arredo > Decorazioni natalizie > Ganci per decorazioni natalizie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499805,'Casa e giardino > Arredo > Decorazioni natalizie > Kit di decorazione per uova di pasqua');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3144,'Casa e giardino > Arredo > Decorazioni natalizie > Ornamenti natalizi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6531,'Casa e giardino > Arredo > Decorazioni natalizie > Presepi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6532,'Casa e giardino > Arredo > Decorazioni natalizie > Supporti ed espositori per decorazioni natalizie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6603,'Casa e giardino > Arredo > Decorazioni natalizie > Supporti per alberi di natale');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6935,'Casa e giardino > Arredo > Ecosfere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7422,'Casa e giardino > Arredo > Elementi ornamentali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(587,'Casa e giardino > Arredo > Fermalibri');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6936,'Casa e giardino > Arredo > Fiori secchi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6265,'Casa e giardino > Arredo > Flora artificiale');
insert into GOOGLE_CATEGORY (codice,descrizione) values(702,'Casa e giardino > Arredo > Fontane e laghetti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2921,'Casa e giardino > Arredo > Fontane e laghetti > Accessori fontane e laghetti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6763,'Casa e giardino > Arredo > Fontane e laghetti > Fontane e cascate ornamentali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2763,'Casa e giardino > Arredo > Fontane e laghetti > Laghetti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(592,'Casa e giardino > Arredo > Fragranze per la casa');
insert into GOOGLE_CATEGORY (codice,descrizione) values(588,'Casa e giardino > Arredo > Fragranze per la casa > Candele');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3898,'Casa e giardino > Arredo > Fragranze per la casa > Deodoranti per ambienti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3686,'Casa e giardino > Arredo > Fragranze per la casa > Incenso');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5847,'Casa e giardino > Arredo > Fragranze per la casa > Oli profumati');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4740,'Casa e giardino > Arredo > Fragranze per la casa > Potpourri');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6767,'Casa e giardino > Arredo > Fragranze per la casa > Torte di cera');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2839,'Casa e giardino > Arredo > Girandole e banderuole');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5876,'Casa e giardino > Arredo > Magneti da frigorifero');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6993,'Casa e giardino > Arredo > Mangiatoie per uccelli e piccoli animali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6995,'Casa e giardino > Arredo > Mangiatoie per uccelli e piccoli animali > Mangiatoie per farfalle');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6994,'Casa e giardino > Arredo > Mangiatoie per uccelli e piccoli animali > Mangiatoie per scoiattoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(698,'Casa e giardino > Arredo > Mangiatoie per uccelli e piccoli animali > Mangiatoie uccelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3262,'Casa e giardino > Arredo > Mappamondi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6424,'Casa e giardino > Arredo > Materiali di riempimento per vasi e decorazioni per tavoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(711,'Casa e giardino > Arredo > Meridiane');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499693,'Casa e giardino > Arredo > Misura altezza');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7382,'Casa e giardino > Arredo > Numeri e lettere per abitazioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6547,'Casa e giardino > Arredo > Ornamenti e sculture per il giardino');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3890,'Casa e giardino > Arredo > Orologi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3840,'Casa e giardino > Arredo > Orologi > Orologi da parete');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6912,'Casa e giardino > Arredo > Orologi > Orologi da scrivania e scaffale');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3696,'Casa e giardino > Arredo > Orologi > Pendole, orologi a pendolo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4546,'Casa e giardino > Arredo > Orologi > Sveglie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6535,'Casa e giardino > Arredo > Palle di neve');
insert into GOOGLE_CATEGORY (codice,descrizione) values(704,'Casa e giardino > Arredo > Pietre giardini e vialetti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(710,'Casa e giardino > Arredo > Pluviometri');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6324,'Casa e giardino > Arredo > Portatovaglioli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7380,'Casa e giardino > Arredo > Ritagliabili in cartone');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4295,'Casa e giardino > Arredo > Salvadanai');
insert into GOOGLE_CATEGORY (codice,descrizione) values(712,'Casa e giardino > Arredo > Segnavento e ornamenti tetti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(595,'Casa e giardino > Arredo > Specchi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5609,'Casa e giardino > Arredo > Statuine');
insert into GOOGLE_CATEGORY (codice,descrizione) values(598,'Casa e giardino > Arredo > Tappetini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(708,'Casa e giardino > Arredo > Targhe decorative');
insert into GOOGLE_CATEGORY (codice,descrizione) values(572,'Casa e giardino > Arredo > Targhe indirizzo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5875,'Casa e giardino > Arredo > Targhette e piatti decorativi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(603,'Casa e giardino > Arredo > Trattamenti per finestre');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2621,'Casa e giardino > Arredo > Trattamenti per finestre > Mantovane');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6492,'Casa e giardino > Arredo > Trattamenti per finestre > Pannelli in vetro colorato');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5989,'Casa e giardino > Arredo > Trattamenti per finestre > Pellicola per finestre');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4375,'Casa e giardino > Arredo > Trattamenti per finestre > Rete per zanzare');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2885,'Casa e giardino > Arredo > Trattamenti per finestre > Tende alla veneziana');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2882,'Casa e giardino > Arredo > Trattamenti per finestre > Tende e tendaggi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(602,'Casa e giardino > Arredo > Vasi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6456,'Casa e giardino > Arredo > Vassoi decorativi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2675,'Casa e giardino > Arredo > Zerbini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4171,'Casa e giardino > Biancheria');
insert into GOOGLE_CATEGORY (codice,descrizione) values(569,'Casa e giardino > Biancheria > Lenzuola e coperte');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1985,'Casa e giardino > Biancheria > Lenzuola e coperte > Coperte');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2541,'Casa e giardino > Biancheria > Lenzuola e coperte > Copripiumini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2700,'Casa e giardino > Biancheria > Lenzuola e coperte > Cuscini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2927,'Casa e giardino > Biancheria > Lenzuola e coperte > Federe e copricuscini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2314,'Casa e giardino > Biancheria > Lenzuola e coperte > Lenzuola');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2974,'Casa e giardino > Biancheria > Lenzuola e coperte > Mantovane per letto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1599,'Casa e giardino > Biancheria > Lenzuola e coperte > Materassini da campeggio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4452,'Casa e giardino > Biancheria > Lenzuola e coperte > Proteggi materasso');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4420,'Casa e giardino > Biancheria > Lenzuola e coperte > Proteggi materasso > Coprimaterassi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2991,'Casa e giardino > Biancheria > Lenzuola e coperte > Proteggi materasso > Sopramaterassi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505803,'Casa e giardino > Biancheria > Lenzuola e coperte > Tende per baldacchino');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505287,'Casa e giardino > Biancheria > Lenzuola e coperte > Trapunte e piumini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505832,'Casa e giardino > Biancheria > Set di biancheria da cucina');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4077,'Casa e giardino > Biancheria > Teli per bagno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(576,'Casa e giardino > Biancheria > Teli per bagno > Asciugamani');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4257,'Casa e giardino > Biancheria > Teli per bagno > Asciugamani da cucina');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4126,'Casa e giardino > Biancheria > Teli per bagno > Asciugamani da spiaggia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(601,'Casa e giardino > Biancheria > Teli per la tavola');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4343,'Casa e giardino > Biancheria > Teli per la tavola > Centrini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4203,'Casa e giardino > Biancheria > Teli per la tavola > Fazzoletti in tessuto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6322,'Casa e giardino > Biancheria > Teli per la tavola > Gonne per tavoli da buffet');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6325,'Casa e giardino > Biancheria > Teli per la tavola > Guide da tavolo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4143,'Casa e giardino > Biancheria > Teli per la tavola > Tovaglie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2547,'Casa e giardino > Biancheria > Teli per la tavola > Tovagliette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6792,'Casa e giardino > Caminetti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(638,'Casa e giardino > Cucina e pranzo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6478,'Casa e giardino > Cucina e pranzo > Accessori per la conservazione di alimenti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6479,'Casa e giardino > Cucina e pranzo > Accessori per la conservazione di alimenti > Assorbitori di ossigeno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8039,'Casa e giardino > Cucina e pranzo > Accessori per la conservazione di alimenti > Dispenser per pellicola alimentare');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499924,'Casa e giardino > Cucina e pranzo > Accessori per la conservazione di alimenti > Etichette per cibo e bevande');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5837,'Casa e giardino > Cucina e pranzo > Accessori per la conservazione di alimenti > Nastri metallici e mollette fermasacchetti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2901,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4653,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori essiccazione cibo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4655,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori essiccazione cibo > Buste essiccazione cibo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4654,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori essiccazione cibo > Vassoi essiccazione cibo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1334,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori forno a microonde');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3848,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori frigorifero');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3954,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori frittura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3684,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori grigliata esterni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5694,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori grigliata esterni > Bricchette di carbone');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7540,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori grigliata esterni > Camini a carbonella');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5670,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori grigliata esterni > Carrelli per grigliate all \'aperto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3855,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori grigliata esterni > Coperture griglia esterni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3382,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori grigliata esterni > Griglie e ripiani grigliata esterni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505667,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori grigliata esterni > Parti di ricambio per griglie da esterno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4560,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori grigliata esterni > Spiedi e cestelli grigliata esterni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5672,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori grigliata esterni > Tavole da griglia per esterni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5671,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori grigliata esterni > Trucioli e pellet per affumicare');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4674,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori macchina gelato');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4675,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori macchina gelato > Recipienti freezer macchina gelato');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2540,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori macchina pasta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3489,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori macchina per il pane');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5075,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori macchina popcorn');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5076,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori macchina zucchero filato');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3988,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori macchine da caffè e da espresso');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4786,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori macchine da caffè e da espresso > Accessori macinacaffè');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5066,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori macchine da caffè e da espresso > Bollilatte');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3239,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori macchine da caffè e da espresso > Caraffe caffè');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4500,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori macchine da caffè e da espresso > Cestini filtri caffè');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5065,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori macchine da caffè e da espresso > Filtri acqua macchine caffè');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3450,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori macchine da caffè e da espresso > Filtri caffè');
insert into GOOGLE_CATEGORY (codice,descrizione) values(734,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori macchine da caffè e da espresso > Macinacaffè');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503736,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori macchine da caffè e da espresso > Parti di ricambio per macchine da caffè espresso e caffettiere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3838,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori macchine da caffè e da espresso > Portafiltri');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6888,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori macchine da caffè e da espresso > Riscaldatori per caraffe di caffè');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8087,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori per cappe');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499996,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori per crepiere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500066,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori per cucine elettriche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7118,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori per dispenser d \'acqua fredda');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7119,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori per dispenser d \'acqua fredda > Bottiglie per raffreddare l \'acqua');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7006,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori per fornelli da campeggio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500004,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori per fornelli, forni e fuochi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7570,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori per freezer');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8106,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori per frigoriferi dei vini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(502989,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori per gasatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6747,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori per lo smaltimento della spazzatura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7187,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori per macchine del ghiaccio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505765,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori per mixer e frullatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8051,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori per scaldavivande a vapore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8052,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori per scaldavivande a vapore > Coperchi per vaschette per scaldavivande a vapore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8053,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori per scaldavivande a vapore > Vaschette per scaldavivande a vapore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6944,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori per set di fondue');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6945,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori per set di fondue > Forchette da fondue');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503725,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori per set di fondue > Pasta combustibile da fondue');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6946,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori per set di fondue > Supporti per scodelle da fondue');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7444,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori per tostapane');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5042,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori per tritaghiaccio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7355,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori per wok e padelle elettriche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5570,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori per yogurt');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3523,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori sacchetti sottovuoto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3124,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori sacchetti sottovuoto > Sacchetti sottovuoto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4519,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori spremiagrumi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4763,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Accessori tritatutto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3443,'Casa e giardino > Cucina e pranzo > Accessori strumenti cucina > Componenti e accessori per lavastoviglie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8161,'Casa e giardino > Cucina e pranzo > Cucine e cucinotti prefabbricati');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2626,'Casa e giardino > Cucina e pranzo > Dispenser per cibo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5134,'Casa e giardino > Cucina e pranzo > Dispenser per cibo > Barattoli di miele');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2644,'Casa e giardino > Cucina e pranzo > Dispenser per cibo > Biscottiere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3591,'Casa e giardino > Cucina e pranzo > Dispenser per cibo > Borse conservazione cibo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(667,'Casa e giardino > Cucina e pranzo > Dispenser per cibo > Contenitori per cibo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3337,'Casa e giardino > Cucina e pranzo > Dispenser per cibo > Contenitori per pane');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6481,'Casa e giardino > Cucina e pranzo > Dispenser per cibo > Coperchi per contenitori alimentari');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3110,'Casa e giardino > Cucina e pranzo > Dispenser per cibo > Imballaggi per alimenti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3956,'Casa e giardino > Cucina e pranzo > Dispenser per cibo > Imballaggi per alimenti > Carta cerata');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5642,'Casa e giardino > Cucina e pranzo > Dispenser per cibo > Imballaggi per alimenti > Carta pergamena');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3750,'Casa e giardino > Cucina e pranzo > Dispenser per cibo > Imballaggi per alimenti > Imballaggi in plastica');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1496,'Casa e giardino > Cucina e pranzo > Dispenser per cibo > Imballaggi per alimenti > Pellicola');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6534,'Casa e giardino > Cucina e pranzo > Dispenser per cibo > Secchielli per caramelle');
insert into GOOGLE_CATEGORY (codice,descrizione) values(730,'Casa e giardino > Cucina e pranzo > Elettrodomestici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3181,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Affettatrici per alimenti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(752,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Affilatrici coltelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(687,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Affumicatoi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(751,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Bollitori elettrici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4528,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Bollitori per il tè');
insert into GOOGLE_CATEGORY (codice,descrizione) values(684,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Cappe da cucina');
insert into GOOGLE_CATEGORY (codice,descrizione) values(688,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Compattatori rifiuti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(681,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Congelatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4532,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Cuocitori e dispositivi di cottura al vapore per cibi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(757,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Cuocitori e dispositivi di cottura al vapore per cibi > Dispositivi cottura riso');
insert into GOOGLE_CATEGORY (codice,descrizione) values(739,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Cuocitori e dispositivi di cottura al vapore per cibi > Dispositivi cottura uova');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6279,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Cuocitori e dispositivi di cottura al vapore per cibi > Forni sotto vuoto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(760,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Cuocitori e dispositivi di cottura al vapore per cibi > Pentole cottura al vapore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(737,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Cuocitori e dispositivi di cottura al vapore per cibi > Slow cooker');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6523,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Cuocitori e dispositivi di cottura al vapore per cibi > Termocucine');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3293,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Erogatori d \'acqua');
insert into GOOGLE_CATEGORY (codice,descrizione) values(743,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Essiccatori cibi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(765,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Filtri acqua');
insert into GOOGLE_CATEGORY (codice,descrizione) values(685,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Fornelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1015,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Fornellini da campeggio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(683,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Forni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(753,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Forni a microonde');
insert into GOOGLE_CATEGORY (codice,descrizione) values(738,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Friggitrici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(686,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Frigoriferi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2985,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Griglie per esterni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(680,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Lavastoviglie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(736,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Macchine caffè ed espresso');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1647,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Macchine caffè ed espresso > Caffettiera elettriche e da fornello');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2247,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Macchine caffè ed espresso > Caffettiere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1557,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Macchine caffè ed espresso > Caffettiere francesi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5286,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Macchine caffè ed espresso > Macchine da caffè a vuoto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1388,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Macchine caffè ed espresso > Macchine per caffè americano');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2422,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Macchine caffè ed espresso > Macchine per espresso');
insert into GOOGLE_CATEGORY (codice,descrizione) values(755,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Macchine pasta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6543,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Macchine per bevande calde');
insert into GOOGLE_CATEGORY (codice,descrizione) values(732,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Macchine per fare il pane');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5057,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Macchine per fare latte di soia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5156,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Macchine per granite');
insert into GOOGLE_CATEGORY (codice,descrizione) values(748,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Macchine per il gelato');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4482,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Macchine per mochi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(756,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Macchine popcorn');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4161,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Macchine produzione ghiaccio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5090,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Macchine temperatrici cioccolato');
insert into GOOGLE_CATEGORY (codice,descrizione) values(766,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Macchine yogurt');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3319,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Macchine zucchero filato');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505666,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Mixer e frullatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4421,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Padelle e wok elettrici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(679,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Piani cottura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6524,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Piastre a gas');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7165,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Piastre a griglie elettriche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(747,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Piastre elettriche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4539,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Refrigeratori per vini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5287,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Scaldabevande');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5103,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Scaldavivande');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4292,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Scaldavivande > Banchi a vapore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(504633,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Scaldavivande > Contenitori per riso');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5349,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Scaldavivande > Lampade riscaldanti per alimenti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6548,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Scaldavivande > Piatti scaldavivande');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3526,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Schiumatori e steamer per latte');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4720,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Set e pentole per fonduta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(763,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Sigillatori sotto vuoto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5577,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Soda maker');
insert into GOOGLE_CATEGORY (codice,descrizione) values(750,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Spremitori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4495,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Tegami arrosto/girarrosto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5289,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Tostapane e griglie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(761,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Tostapane e griglie > Fornetti e scaldavivande');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6819,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Tostapane e griglie > Macchine per donut');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6516,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Tostapane e griglie > Macchine per pretzel');
insert into GOOGLE_CATEGORY (codice,descrizione) values(759,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Tostapane e griglie > Macchine per sandwich');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5318,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Tostapane e griglie > Piastre per muffin e tortine');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5291,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Tostapane e griglie > Piastre per pizzelle');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5292,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Tostapane e griglie > Piastre per quesadilla e tortilla');
insert into GOOGLE_CATEGORY (codice,descrizione) values(764,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Tostapane e griglie > Piastre waffle');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6278,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Tostapane e griglie > Tegami per pizza');
insert into GOOGLE_CATEGORY (codice,descrizione) values(762,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Tostapane e griglie > Tostapane');
insert into GOOGLE_CATEGORY (codice,descrizione) values(749,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Tritaghiaccio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(610,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Tritarifiuti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(744,'Casa e giardino > Cucina e pranzo > Elettrodomestici > Tritatutto e passaverdure');
insert into GOOGLE_CATEGORY (codice,descrizione) values(649,'Casa e giardino > Cucina e pranzo > Materiale da bar');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4563,'Casa e giardino > Cucina e pranzo > Materiale da bar > Aeratori per vino');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499990,'Casa e giardino > Cucina e pranzo > Materiale da bar > Cappucci per bottiglie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(650,'Casa e giardino > Cucina e pranzo > Materiale da bar > Caraffe');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2976,'Casa e giardino > Cucina e pranzo > Materiale da bar > Cavatappi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7238,'Casa e giardino > Cucina e pranzo > Materiale da bar > Contenitori per sottobicchieri');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7569,'Casa e giardino > Cucina e pranzo > Materiale da bar > Cubetti di ghiaccio per whisky');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7008,'Casa e giardino > Cucina e pranzo > Materiale da bar > Decorazioni per bicchieri da vino');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7075,'Casa e giardino > Cucina e pranzo > Materiale da bar > Fontane per assenzio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8493,'Casa e giardino > Cucina e pranzo > Materiale da bar > Portabottiglie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505806,'Casa e giardino > Cucina e pranzo > Materiale da bar > Portabottiglie e secchielli per il ghiaccio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6957,'Casa e giardino > Cucina e pranzo > Materiale da bar > Set di strumenti per cocktail e bevande');
insert into GOOGLE_CATEGORY (codice,descrizione) values(651,'Casa e giardino > Cucina e pranzo > Materiale da bar > Shaker e strumenti da cocktail');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3427,'Casa e giardino > Cucina e pranzo > Materiale da bar > Shaker e strumenti da cocktail > Apribottiglie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505327,'Casa e giardino > Cucina e pranzo > Materiale da bar > Shaker e strumenti da cocktail > Colini da cocktail');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503757,'Casa e giardino > Cucina e pranzo > Materiale da bar > Shaker e strumenti da cocktail > Pestello da barman');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4222,'Casa e giardino > Cucina e pranzo > Materiale da bar > Shaker e strumenti da cocktail > Punteruoli da ghiaccio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6956,'Casa e giardino > Cucina e pranzo > Materiale da bar > Shaker e strumenti da cocktail > Shaker da cocktail');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2363,'Casa e giardino > Cucina e pranzo > Materiale da bar > Sottobicchieri');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1817,'Casa e giardino > Cucina e pranzo > Materiale da bar > Spine e dispenser per birra');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7139,'Casa e giardino > Cucina e pranzo > Materiale da bar > Taglia pellicola alluminio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4562,'Casa e giardino > Cucina e pranzo > Materiale da bar > Tappi per bottiglie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6070,'Casa e giardino > Cucina e pranzo > Pentolame e tegami da forno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4424,'Casa e giardino > Cucina e pranzo > Pentolame e tegami da forno > Accessori cucina');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4501,'Casa e giardino > Cucina e pranzo > Pentolame e tegami da forno > Accessori cucina > Accessori per pentole a pressione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4427,'Casa e giardino > Cucina e pranzo > Pentolame e tegami da forno > Accessori cucina > Accessori wok');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4662,'Casa e giardino > Cucina e pranzo > Pentolame e tegami da forno > Accessori cucina > Accessori wok > Anelli per wok');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4663,'Casa e giardino > Cucina e pranzo > Pentolame e tegami da forno > Accessori cucina > Accessori wok > Spazzole wok');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4529,'Casa e giardino > Cucina e pranzo > Pentolame e tegami da forno > Accessori cucina > Cestelli cottura a vapore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4660,'Casa e giardino > Cucina e pranzo > Pentolame e tegami da forno > Accessori cucina > Coperchi tegami e pentole');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4661,'Casa e giardino > Cucina e pranzo > Pentolame e tegami da forno > Accessori cucina > Manopole tegami e pentole');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4502,'Casa e giardino > Cucina e pranzo > Pentolame e tegami da forno > Articoli per forno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4726,'Casa e giardino > Cucina e pranzo > Pentolame e tegami da forno > Articoli per forno > Griglie tegami da arrosto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7131,'Casa e giardino > Cucina e pranzo > Pentolame e tegami da forno > Articoli per forno > Pesi per cottura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4503,'Casa e giardino > Cucina e pranzo > Pentolame e tegami da forno > Articoli per forno > Tappetini e carta da forno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(654,'Casa e giardino > Cucina e pranzo > Pentolame e tegami da forno > Pentole e tegami');
insert into GOOGLE_CATEGORY (codice,descrizione) values(656,'Casa e giardino > Cucina e pranzo > Pentolame e tegami da forno > Pentole e tegami > Bagnomaria');
insert into GOOGLE_CATEGORY (codice,descrizione) values(659,'Casa e giardino > Cucina e pranzo > Pentolame e tegami da forno > Pentole e tegami > Bollitori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(655,'Casa e giardino > Cucina e pranzo > Pentolame e tegami da forno > Pentole e tegami > Casseruole');
insert into GOOGLE_CATEGORY (codice,descrizione) values(657,'Casa e giardino > Cucina e pranzo > Pentolame e tegami da forno > Pentole e tegami > Casseruole di ghisa');
insert into GOOGLE_CATEGORY (codice,descrizione) values(662,'Casa e giardino > Cucina e pranzo > Pentolame e tegami da forno > Pentole e tegami > Casseruole e padelle');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4423,'Casa e giardino > Cucina e pranzo > Pentolame e tegami da forno > Pentole e tegami > Padelle');
insert into GOOGLE_CATEGORY (codice,descrizione) values(661,'Casa e giardino > Cucina e pranzo > Pentolame e tegami da forno > Pentole e tegami > Pentole');
insert into GOOGLE_CATEGORY (codice,descrizione) values(660,'Casa e giardino > Cucina e pranzo > Pentolame e tegami da forno > Pentole e tegami > Pentole a pressione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4459,'Casa e giardino > Cucina e pranzo > Pentolame e tegami da forno > Pentole e tegami > Pentole paella');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6838,'Casa e giardino > Cucina e pranzo > Pentolame e tegami da forno > Pentole e tegami > Pentole per crêpe');
insert into GOOGLE_CATEGORY (codice,descrizione) values(658,'Casa e giardino > Cucina e pranzo > Pentolame e tegami da forno > Pentole e tegami > Pentole piastre e griglie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5110,'Casa e giardino > Cucina e pranzo > Pentolame e tegami da forno > Pentole e tegami > Presse griglia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4721,'Casa e giardino > Cucina e pranzo > Pentolame e tegami da forno > Pentole e tegami > Set di pentole');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5340,'Casa e giardino > Cucina e pranzo > Pentolame e tegami da forno > Pentole e tegami > Tajine e pentole in argilla');
insert into GOOGLE_CATEGORY (codice,descrizione) values(663,'Casa e giardino > Cucina e pranzo > Pentolame e tegami da forno > Pentole e tegami > Tegami');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6518,'Casa e giardino > Cucina e pranzo > Pentolame e tegami da forno > Pentole e tegami > Vasi per fermentazione e conservazione sottaceto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(664,'Casa e giardino > Cucina e pranzo > Pentolame e tegami da forno > Pentole e tegami > Wok');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6071,'Casa e giardino > Cucina e pranzo > Pentolame e tegami da forno > Set combo di pentolame e tegami da forno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(640,'Casa e giardino > Cucina e pranzo > Pentolame e tegami da forno > Tegami da forno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(641,'Casa e giardino > Cucina e pranzo > Pentolame e tegami da forno > Tegami da forno > Carta da forno e per biscotti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6756,'Casa e giardino > Cucina e pranzo > Pentolame e tegami da forno > Tegami da forno > Pentole per griglia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(647,'Casa e giardino > Cucina e pranzo > Pentolame e tegami da forno > Tegami da forno > Piatti per soufflé e ramekin');
insert into GOOGLE_CATEGORY (codice,descrizione) values(646,'Casa e giardino > Cucina e pranzo > Pentolame e tegami da forno > Tegami da forno > Pietre per pizza');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4764,'Casa e giardino > Cucina e pranzo > Pentolame e tegami da forno > Tegami da forno > Set accessori da forno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(642,'Casa e giardino > Cucina e pranzo > Pentolame e tegami da forno > Tegami da forno > Teglie e stampi per pane');
insert into GOOGLE_CATEGORY (codice,descrizione) values(643,'Casa e giardino > Cucina e pranzo > Pentolame e tegami da forno > Tegami da forno > Teglie e stampi per torte');
insert into GOOGLE_CATEGORY (codice,descrizione) values(648,'Casa e giardino > Cucina e pranzo > Pentolame e tegami da forno > Tegami da forno > Teglie per arrosto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(644,'Casa e giardino > Cucina e pranzo > Pentolame e tegami da forno > Tegami da forno > Teglie per muffin e tortine');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2843,'Casa e giardino > Cucina e pranzo > Pentolame e tegami da forno > Tegami da forno > Teglie per pizza');
insert into GOOGLE_CATEGORY (codice,descrizione) values(645,'Casa e giardino > Cucina e pranzo > Pentolame e tegami da forno > Tegami da forno > Teglie per torte e quiche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2920,'Casa e giardino > Cucina e pranzo > Portavivande e portabevande');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3435,'Casa e giardino > Cucina e pranzo > Portavivande e portabevande > Borracce');
insert into GOOGLE_CATEGORY (codice,descrizione) values(669,'Casa e giardino > Cucina e pranzo > Portavivande e portabevande > Borse e contenitori porta pranzo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2507,'Casa e giardino > Cucina e pranzo > Portavivande e portabevande > Borse isolate');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6449,'Casa e giardino > Cucina e pranzo > Portavivande e portabevande > Borse per il trasporto di vino');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3809,'Casa e giardino > Cucina e pranzo > Portavivande e portabevande > Bottiglie d \'acqua');
insert into GOOGLE_CATEGORY (codice,descrizione) values(671,'Casa e giardino > Cucina e pranzo > Portavivande e portabevande > Cesti da picnic');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1444,'Casa e giardino > Cucina e pranzo > Portavivande e portabevande > Fiaschette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4520,'Casa e giardino > Cucina e pranzo > Portavivande e portabevande > Portabevande');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4521,'Casa e giardino > Cucina e pranzo > Portavivande e portabevande > Portabevande > Portalattine e portabottiglie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4522,'Casa e giardino > Cucina e pranzo > Portavivande e portabevande > Portabevande > Portatazze');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1017,'Casa e giardino > Cucina e pranzo > Portavivande e portabevande > Refrigeranti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5060,'Casa e giardino > Cucina e pranzo > Portavivande e portabevande > Tappi sostitutivi per bevande');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4722,'Casa e giardino > Cucina e pranzo > Portavivande e portabevande > Termos');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3800,'Casa e giardino > Cucina e pranzo > Portavivande e portabevande > Thermos');
insert into GOOGLE_CATEGORY (codice,descrizione) values(672,'Casa e giardino > Cucina e pranzo > Stoviglie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6425,'Casa e giardino > Cucina e pranzo > Stoviglie > Accessori per piatti da portata');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6427,'Casa e giardino > Cucina e pranzo > Stoviglie > Accessori per piatti da portata > Coperchi per zuppiere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6434,'Casa e giardino > Cucina e pranzo > Stoviglie > Accessori per piatti da portata > Supporti per scodelle da punch');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6426,'Casa e giardino > Cucina e pranzo > Stoviglie > Accessori per piatti da portata > Supporti per zuppiere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(674,'Casa e giardino > Cucina e pranzo > Stoviglie > Bicchieri');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2712,'Casa e giardino > Cucina e pranzo > Stoviglie > Bicchieri > Bicchieri con gambo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7568,'Casa e giardino > Cucina e pranzo > Stoviglie > Bicchieri > Bicchieri da birra');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2694,'Casa e giardino > Cucina e pranzo > Stoviglie > Bicchieri > Bicchieri da shot');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2951,'Casa e giardino > Cucina e pranzo > Stoviglie > Bicchieri > Bicchieri per liquori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6051,'Casa e giardino > Cucina e pranzo > Stoviglie > Bicchieri > Piattini da caffè e da tè');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6958,'Casa e giardino > Cucina e pranzo > Stoviglie > Bicchieri > Set di bicchieri');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2169,'Casa e giardino > Cucina e pranzo > Stoviglie > Bicchieri > Tazze');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6049,'Casa e giardino > Cucina e pranzo > Stoviglie > Bicchieri > Tazzine da caffè e tazze da tè');
insert into GOOGLE_CATEGORY (codice,descrizione) values(652,'Casa e giardino > Cucina e pranzo > Stoviglie > Caraffe da caffè e teiere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8046,'Casa e giardino > Cucina e pranzo > Stoviglie > Clip e fermi per tovaglie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4026,'Casa e giardino > Cucina e pranzo > Stoviglie > Piatti da portata');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3330,'Casa e giardino > Cucina e pranzo > Stoviglie > Piatti da portata > Brocche e caraffe da portata');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6086,'Casa e giardino > Cucina e pranzo > Stoviglie > Piatti da portata > Piatti burro');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3802,'Casa e giardino > Cucina e pranzo > Stoviglie > Piatti da portata > Piatti da servizio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7550,'Casa e giardino > Cucina e pranzo > Stoviglie > Piatti da portata > Portauova');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3373,'Casa e giardino > Cucina e pranzo > Stoviglie > Piatti da portata > Recipienti zucchero e creme');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4372,'Casa e giardino > Cucina e pranzo > Stoviglie > Piatti da portata > Ripiani per torte');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3703,'Casa e giardino > Cucina e pranzo > Stoviglie > Piatti da portata > Salsiere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5135,'Casa e giardino > Cucina e pranzo > Stoviglie > Piatti da portata > Sottotorte');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4009,'Casa e giardino > Cucina e pranzo > Stoviglie > Piatti da portata > Vassoi da portata');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3941,'Casa e giardino > Cucina e pranzo > Stoviglie > Piatti da portata > Zuppiere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4735,'Casa e giardino > Cucina e pranzo > Stoviglie > Piatti da portata > Zuppiere da punch');
insert into GOOGLE_CATEGORY (codice,descrizione) values(675,'Casa e giardino > Cucina e pranzo > Stoviglie > Posate');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6439,'Casa e giardino > Cucina e pranzo > Stoviglie > Posate > Accessori per bastoncini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3699,'Casa e giardino > Cucina e pranzo > Stoviglie > Posate > Bastoncini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3844,'Casa e giardino > Cucina e pranzo > Stoviglie > Posate > Coltelli da tavolo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3939,'Casa e giardino > Cucina e pranzo > Stoviglie > Posate > Cucchiai');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4015,'Casa e giardino > Cucina e pranzo > Stoviglie > Posate > Forchette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5647,'Casa e giardino > Cucina e pranzo > Stoviglie > Posate > Set di posate');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6740,'Casa e giardino > Cucina e pranzo > Stoviglie > Set per caffè e tè');
insert into GOOGLE_CATEGORY (codice,descrizione) values(676,'Casa e giardino > Cucina e pranzo > Stoviglie > Shaker e macine');
insert into GOOGLE_CATEGORY (codice,descrizione) values(677,'Casa e giardino > Cucina e pranzo > Stoviglie > Sottopentole');
insert into GOOGLE_CATEGORY (codice,descrizione) values(673,'Casa e giardino > Cucina e pranzo > Stoviglie > Stoviglie da cena');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3553,'Casa e giardino > Cucina e pranzo > Stoviglie > Stoviglie da cena > Piatti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3498,'Casa e giardino > Cucina e pranzo > Stoviglie > Stoviglie da cena > Recipienti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5537,'Casa e giardino > Cucina e pranzo > Stoviglie > Stoviglie da cena > Set di stoviglie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(668,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4788,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Accessori macina spezie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6411,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Accessori per coltelli elettrici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6412,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Accessori per coltelli elettrici > Lame di ricambio per coltelli elettrici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4705,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Accessori per mattarelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4707,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Accessori per mattarelli > Anelli per mattarelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4706,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Accessori per mattarelli > Panni e coperture mattarelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7365,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Accessori per tagliapizza');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7331,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Accessori per termometri da cucina');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3206,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Affettatrici da cucina');
insert into GOOGLE_CATEGORY (codice,descrizione) values(733,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Apri lattine');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2948,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Armadi da cucina');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5157,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Armadi da cucina > Blocchi e portacoltelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8012,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Armadi da cucina > Contenitori e supporti per utensili da cucina');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6415,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Armadi da cucina > Contenitori per bustine di zucchero');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3479,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Armadi da cucina > Espositori per bottiglie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3177,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Armadi da cucina > Organizer per cucina e angolo bar');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6487,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Armadi da cucina > Organizzatori per armadi da cucina');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6480,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Armadi da cucina > Organizzatori per lattine');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5059,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Armadi da cucina > Portacannucce e dispenser');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3845,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Armadi da cucina > Portapentole');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2344,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Armadi da cucina > Portaspezie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4322,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Armadi da cucina > Portastuzzicadenti ed erogatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3061,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Armadi da cucina > Portatovaglioli di carta e distributori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3072,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Armadi da cucina > Portatovaglioli e distributori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3831,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Armadi da cucina > Vassoi utensili e posate');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3914,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Centrifughe per insalata');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5251,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Cesoie da cucina');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3835,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Cestelli per raffreddamento');
insert into GOOGLE_CATEGORY (codice,descrizione) values(665,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Coltelli da cucina');
insert into GOOGLE_CATEGORY (codice,descrizione) values(741,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Coltelli elettrici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3175,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Cucchiai da servizio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3258,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Cucchiai da servizio > Cucchiai per melone');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3708,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Cucchiai da servizio > Palette ghiaccio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3202,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Cucchiai da servizio > Palette per gelato');
insert into GOOGLE_CATEGORY (codice,descrizione) values(502966,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Cucchiai da servizio > Schiumaiola per fritti e pop-corn');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6974,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Dispensatori di zucchero');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3723,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Dispenser per alimenti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4777,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Dosatori per condimenti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7149,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Erogatori di bevande');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4559,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Filtri per il tè');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5078,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Forchettoni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3850,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Formine per biscotti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4630,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Forniture decorazioni torte');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3597,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Fruste da cucina');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3156,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Grattugia e grattugialimoni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(639,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Grembiuli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(670,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Guanti da forno e presine');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503005,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Imbuti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3248,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Inteneritore per carne');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3347,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Lardatoi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4762,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Macina spezie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3467,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Mattarelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3620,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Mestoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6497,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Miscelatori per condimento insalata');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4332,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Mixer da pasticcere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3999,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Mortai e pestelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6526,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Oliere e acetiere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3768,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Pale da fornaio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6408,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Palette da torta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4708,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Panni per pasticceria');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5109,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Passapatate');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3521,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Pelatrici e snocciolatrici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4005,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Pinze da cucina');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7485,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Pistola per strisce di carne essiccata');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4334,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Portacucchiai');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6746,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Portaoggetti per lavandino');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3256,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Raschietti da cucina');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3633,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Raschietti da cucina > Spatole per griglie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3086,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Raschietti da cucina > Spatole per recipienti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3419,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Raschietti da cucina > Spatole per tagliere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4530,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Recipienti per miscelazione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4771,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Sacchetti da forno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7329,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Sacchetti per la cottura a vapore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6522,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Sbuccia arance');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4247,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Schiaccia lattine');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3294,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Schiacciapatate');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6388,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Schiumarole');
insert into GOOGLE_CATEGORY (codice,descrizione) values(653,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Scolapasta e colini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3268,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Scolapiatti e piani di scolo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4765,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Set utensili da cucina');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5370,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Setacci per farina');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3196,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Spatole');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3430,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Spazzole per grasso');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3385,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Spremiaglio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8006,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Stampi da cucina');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6342,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Stampi per biscotti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6787,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Stampi per gelatina');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6749,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Stampi per pasta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6554,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Stecchi e spiedi per alimenti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505316,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Stencil per alimenti e bevande');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7247,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Stuoie per sushi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6723,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Tagliapasta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3421,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Tagliapizza');
insert into GOOGLE_CATEGORY (codice,descrizione) values(666,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Taglieri');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5080,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Tappetini per lavello');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3475,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Tazzine e cucchiaini misurazione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3091,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Termometri per biscotti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3713,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Timer da cottura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5928,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Torce da cucina');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3381,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Tritatutto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3586,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Tritatutto > Pinze per aragoste e granchi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3685,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Tritatutto > Schiaccianoci');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4214,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Tritatutto > Schiaccianoci > Schiaccianoci decorativi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4746,'Casa e giardino > Cucina e pranzo > Strumenti e utensili cucina > Vaschette del ghiaccio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6173,'Casa e giardino > Custodie per ombrelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(604,'Casa e giardino > Dispositivi elettrodomestici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(609,'Casa e giardino > Dispositivi elettrodomestici > Aperture porte garage');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4483,'Casa e giardino > Dispositivi elettrodomestici > Asciugatori futon');
insert into GOOGLE_CATEGORY (codice,descrizione) values(235920,'Casa e giardino > Dispositivi elettrodomestici > Asciugatori per pavimenti e tappeti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(619,'Casa e giardino > Dispositivi elettrodomestici > Aspirapolvere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1626,'Casa e giardino > Dispositivi elettrodomestici > Controllo climatizzazione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3082,'Casa e giardino > Dispositivi elettrodomestici > Controllo climatizzazione > Caldaie e scaldabagno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(605,'Casa e giardino > Dispositivi elettrodomestici > Controllo climatizzazione > Condizionatori aria');
insert into GOOGLE_CATEGORY (codice,descrizione) values(607,'Casa e giardino > Dispositivi elettrodomestici > Controllo climatizzazione > Deumidificatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(606,'Casa e giardino > Dispositivi elettrodomestici > Controllo climatizzazione > Purificatori aria');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2060,'Casa e giardino > Dispositivi elettrodomestici > Controllo climatizzazione > Radiatori riscaldamento');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6727,'Casa e giardino > Dispositivi elettrodomestici > Controllo climatizzazione > Refrigeratori a evaporazione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2649,'Casa e giardino > Dispositivi elettrodomestici > Controllo climatizzazione > Riscaldatori terrazza');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6709,'Casa e giardino > Dispositivi elettrodomestici > Controllo climatizzazione > Sistemi per la nebulizzazione da esterno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(611,'Casa e giardino > Dispositivi elettrodomestici > Controllo climatizzazione > Stufe');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7328,'Casa e giardino > Dispositivi elettrodomestici > Controllo climatizzazione > Termoconvettori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(613,'Casa e giardino > Dispositivi elettrodomestici > Controllo climatizzazione > Umidificatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(608,'Casa e giardino > Dispositivi elettrodomestici > Controllo climatizzazione > Ventole');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7527,'Casa e giardino > Dispositivi elettrodomestici > Controllo climatizzazione > Ventole > Nebulizzatori e ventilatori personali portatili');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4485,'Casa e giardino > Dispositivi elettrodomestici > Controllo climatizzazione > Ventole > Ventilatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8090,'Casa e giardino > Dispositivi elettrodomestici > Controllo climatizzazione > Ventole > Ventilatori a parete');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1700,'Casa e giardino > Dispositivi elettrodomestici > Controllo climatizzazione > Ventole > Ventole da soffitto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2535,'Casa e giardino > Dispositivi elettrodomestici > Controllo climatizzazione > Ventole > Ventole da tavolo e piedistallo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2706,'Casa e giardino > Dispositivi elettrodomestici > Dispositivi lavanderia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2612,'Casa e giardino > Dispositivi elettrodomestici > Dispositivi lavanderia > Asciugatori indumenti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5139,'Casa e giardino > Dispositivi elettrodomestici > Dispositivi lavanderia > Ferri e sistemi da stiro');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2549,'Casa e giardino > Dispositivi elettrodomestici > Dispositivi lavanderia > Lavatrici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2849,'Casa e giardino > Dispositivi elettrodomestici > Dispositivi lavanderia > Lavatrici combo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5140,'Casa e giardino > Dispositivi elettrodomestici > Dispositivi lavanderia > Presse a vapore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5138,'Casa e giardino > Dispositivi elettrodomestici > Dispositivi lavanderia > Stiratrici a vapore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5294,'Casa e giardino > Dispositivi elettrodomestici > Lucidatrici e pulitrici pavimenti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(616,'Casa e giardino > Dispositivi elettrodomestici > Pulitrici a vapore e lavapavimenti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(621,'Casa e giardino > Dispositivi elettrodomestici > Riscaldatori acqua');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500081,'Casa e giardino > Dispositivi elettrodomestici > Strumenti di pulizia a ultrasuoni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7121,'Casa e giardino > Dispositivi elettrodomestici > Sverniciatore a vapore per carta da parati');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6741,'Casa e giardino > Dispositivi elettrodomestici > Telecomandi e tastierini per portoni da garage');
insert into GOOGLE_CATEGORY (codice,descrizione) values(630,'Casa e giardino > Forniture domestiche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5056,'Casa e giardino > Forniture domestiche > Accessori compattatori rifiuti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6757,'Casa e giardino > Forniture domestiche > Accessori per contenimento rifiuti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6765,'Casa e giardino > Forniture domestiche > Accessori per contenimento rifiuti > Carrelli per contenitori rifiuti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4717,'Casa e giardino > Forniture domestiche > Accessori per contenimento rifiuti > Coperchi per contenitori rifiuti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500115,'Casa e giardino > Forniture domestiche > Accessori per contenimento rifiuti > Etichette e contrassegni per contenitori rifiuti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6758,'Casa e giardino > Forniture domestiche > Accessori per contenimento rifiuti > Ruote per contenitori rifiuti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6726,'Casa e giardino > Forniture domestiche > Accessori per contenimento rifiuti > Strutture per contenitori rifiuti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499885,'Casa e giardino > Forniture domestiche > Antiscivolo per scale');
insert into GOOGLE_CATEGORY (codice,descrizione) values(623,'Casa e giardino > Forniture domestiche > Articoli pulizia casa');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8071,'Casa e giardino > Forniture domestiche > Articoli pulizia casa > Asciugamani lavabili o monouso');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5113,'Casa e giardino > Forniture domestiche > Articoli pulizia casa > Guanti per pulizie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2610,'Casa e giardino > Forniture domestiche > Articoli pulizia casa > Lavavetri');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4515,'Casa e giardino > Forniture domestiche > Articoli pulizia casa > Panni per la polvere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4973,'Casa e giardino > Forniture domestiche > Articoli pulizia casa > Prodotti pulizia casa');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7552,'Casa e giardino > Forniture domestiche > Articoli pulizia casa > Prodotti pulizia casa > Brillantanti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5825,'Casa e giardino > Forniture domestiche > Articoli pulizia casa > Prodotti pulizia casa > Detergenti e lucidi per mobili');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4974,'Casa e giardino > Forniture domestiche > Articoli pulizia casa > Prodotti pulizia casa > Detergenti tappeti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4976,'Casa e giardino > Forniture domestiche > Articoli pulizia casa > Prodotti pulizia casa > Detergenti vetri e superfici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7510,'Casa e giardino > Forniture domestiche > Articoli pulizia casa > Prodotti pulizia casa > Detersivi per lavastoviglie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4975,'Casa e giardino > Forniture domestiche > Articoli pulizia casa > Prodotti pulizia casa > Detersivo e sapone piatti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500065,'Casa e giardino > Forniture domestiche > Articoli pulizia casa > Prodotti pulizia casa > Disincrostatori e decalcificatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6474,'Casa e giardino > Forniture domestiche > Articoli pulizia casa > Prodotti pulizia casa > Disinfettanti domestici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4977,'Casa e giardino > Forniture domestiche > Articoli pulizia casa > Prodotti pulizia casa > Lavapavimenti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7330,'Casa e giardino > Forniture domestiche > Articoli pulizia casa > Prodotti pulizia casa > Prodotti di pulizia multiuso');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4979,'Casa e giardino > Forniture domestiche > Articoli pulizia casa > Prodotti pulizia casa > Prodotti elimina odori animali e smacchiatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7462,'Casa e giardino > Forniture domestiche > Articoli pulizia casa > Prodotti pulizia casa > Prodotti per la pulizia della lavastoviglie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8043,'Casa e giardino > Forniture domestiche > Articoli pulizia casa > Prodotti pulizia casa > Prodotti per la pulizia di tessuti e tappezzerie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7426,'Casa e giardino > Forniture domestiche > Articoli pulizia casa > Prodotti pulizia casa > Prodotti per pulizia e lucidatura di acciaio inossidabile');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4980,'Casa e giardino > Forniture domestiche > Articoli pulizia casa > Prodotti pulizia casa > Prodotti pulizia water');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4978,'Casa e giardino > Forniture domestiche > Articoli pulizia casa > Prodotti pulizia casa > Pulizia forno e grill');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4981,'Casa e giardino > Forniture domestiche > Articoli pulizia casa > Prodotti pulizia casa > Pulizia vasche e piastrelle');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6419,'Casa e giardino > Forniture domestiche > Articoli pulizia casa > Protettori per tessuti e tappezzerie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499767,'Casa e giardino > Forniture domestiche > Articoli pulizia casa > Ricambi per spazzole');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6264,'Casa e giardino > Forniture domestiche > Articoli pulizia casa > Ricariche e teste per mocio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6263,'Casa e giardino > Forniture domestiche > Articoli pulizia casa > Ricariche per piumini spolveratutto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2857,'Casa e giardino > Forniture domestiche > Articoli pulizia casa > Scope');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4671,'Casa e giardino > Forniture domestiche > Articoli pulizia casa > Scope e bastoni spazzoloni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6437,'Casa e giardino > Forniture domestiche > Articoli pulizia casa > Secchi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4677,'Casa e giardino > Forniture domestiche > Articoli pulizia casa > Spazzatrici tappeti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4670,'Casa e giardino > Forniture domestiche > Articoli pulizia casa > Spazzole');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499892,'Casa e giardino > Forniture domestiche > Articoli pulizia casa > Spazzole per scope');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2713,'Casa e giardino > Forniture domestiche > Articoli pulizia casa > Spazzoloni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2250,'Casa e giardino > Forniture domestiche > Articoli pulizia casa > Spolverini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2796,'Casa e giardino > Forniture domestiche > Articoli pulizia casa > Spugne e spugne abrasive');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7406,'Casa e giardino > Forniture domestiche > Assorbitori di umidità');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4516,'Casa e giardino > Forniture domestiche > Contenimento rifiuti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500039,'Casa e giardino > Forniture domestiche > Contenimento rifiuti > Cassoni per l \'immondizia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(637,'Casa e giardino > Forniture domestiche > Contenimento rifiuti > Cestini rifiuti/portaimmondizia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4517,'Casa e giardino > Forniture domestiche > Contenimento rifiuti > Contenitori riciclo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5143,'Casa e giardino > Forniture domestiche > Contenimento rifiuti > Contenitori rifiuti pericolosi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(728,'Casa e giardino > Forniture domestiche > Controllo infestanti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4220,'Casa e giardino > Forniture domestiche > Controllo infestanti > Palette per mosche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2869,'Casa e giardino > Forniture domestiche > Controllo infestanti > Pesticidi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2865,'Casa e giardino > Forniture domestiche > Controllo infestanti > Repellenti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(512,'Casa e giardino > Forniture domestiche > Controllo infestanti > Repellenti > Repellenti domestici per insetti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7137,'Casa e giardino > Forniture domestiche > Controllo infestanti > Repellenti > Repellenti per animali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2631,'Casa e giardino > Forniture domestiche > Controllo infestanti > Trappole controllo infestanti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(628,'Casa e giardino > Forniture domestiche > Cura delle scarpe');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2431,'Casa e giardino > Forniture domestiche > Cura delle scarpe > Allargascarpe');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2371,'Casa e giardino > Forniture domestiche > Cura delle scarpe > Asciugatori scarpe');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2301,'Casa e giardino > Forniture domestiche > Cura delle scarpe > Borse per scarpe');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5601,'Casa e giardino > Forniture domestiche > Cura delle scarpe > Calzascarpe e ausili per vestirsi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5600,'Casa e giardino > Forniture domestiche > Cura delle scarpe > Calzastivali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8033,'Casa e giardino > Forniture domestiche > Cura delle scarpe > Kit per la cura delle scarpe');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8032,'Casa e giardino > Forniture domestiche > Cura delle scarpe > Lucidascarpe');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1659,'Casa e giardino > Forniture domestiche > Cura delle scarpe > Lucidi e cere scarpe');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8031,'Casa e giardino > Forniture domestiche > Cura delle scarpe > Pulisciscarpe');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1874,'Casa e giardino > Forniture domestiche > Cura delle scarpe > Spazzole da scarpe');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5604,'Casa e giardino > Forniture domestiche > Cura delle scarpe > Trattamenti e tinture per scarpe');
insert into GOOGLE_CATEGORY (codice,descrizione) values(627,'Casa e giardino > Forniture domestiche > Forniture lavanderia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6387,'Casa e giardino > Forniture domestiche > Forniture lavanderia > Amido per tessuti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2794,'Casa e giardino > Forniture domestiche > Forniture lavanderia > Ammorbidenti e panni ammorbidenti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(633,'Casa e giardino > Forniture domestiche > Forniture lavanderia > Assi da stiro');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4982,'Casa e giardino > Forniture domestiche > Forniture lavanderia > Candeggina');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2677,'Casa e giardino > Forniture domestiche > Forniture lavanderia > Cestelli di asciugatura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(634,'Casa e giardino > Forniture domestiche > Forniture lavanderia > Cesti del bucato');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2754,'Casa e giardino > Forniture domestiche > Forniture lavanderia > Detergenti per lavanderia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4656,'Casa e giardino > Forniture domestiche > Forniture lavanderia > Imbottiture e coperture assi da stiro');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7320,'Casa e giardino > Forniture domestiche > Forniture lavanderia > Kit per pulizia a secco');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5704,'Casa e giardino > Forniture domestiche > Forniture lavanderia > Mollette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5084,'Casa e giardino > Forniture domestiche > Forniture lavanderia > Palline per lavatrice');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5705,'Casa e giardino > Forniture domestiche > Forniture lavanderia > Rasoi per pelucchi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5085,'Casa e giardino > Forniture domestiche > Forniture lavanderia > Retine lavaggio biancheria e portabiancheria');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499931,'Casa e giardino > Forniture domestiche > Forniture lavanderia > Ricambi per tavole da stiro');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6240,'Casa e giardino > Forniture domestiche > Forniture lavanderia > Rinfrescanti per tessuti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7457,'Casa e giardino > Forniture domestiche > Forniture lavanderia > Salva abiti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4657,'Casa e giardino > Forniture domestiche > Forniture lavanderia > Smacchiatori per tessuti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3080,'Casa e giardino > Forniture domestiche > Forniture lavanderia > Spazzole adesive');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7502,'Casa e giardino > Forniture domestiche > Forniture lavanderia > Spray antistatici e antipiega');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499937,'Casa e giardino > Forniture domestiche > Forniture lavanderia > Supporti per ferri');
insert into GOOGLE_CATEGORY (codice,descrizione) values(636,'Casa e giardino > Forniture domestiche > Immagazzinamento e organizzazione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5558,'Casa e giardino > Forniture domestiche > Immagazzinamento e organizzazione > Abbigliamento e sistemazione negli armadi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(631,'Casa e giardino > Forniture domestiche > Immagazzinamento e organizzazione > Abbigliamento e sistemazione negli armadi > Appendiabiti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5716,'Casa e giardino > Forniture domestiche > Immagazzinamento e organizzazione > Abbigliamento e sistemazione negli armadi > Omini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3722,'Casa e giardino > Forniture domestiche > Immagazzinamento e organizzazione > Abbigliamento e sistemazione negli armadi > Portatutto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5559,'Casa e giardino > Forniture domestiche > Immagazzinamento e organizzazione > Abbigliamento e sistemazione negli armadi > Scarpiere e organizer per scarpe');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7514,'Casa e giardino > Forniture domestiche > Immagazzinamento e organizzazione > Abbigliamento e sistemazione negli armadi > Scatole per cappelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5714,'Casa e giardino > Forniture domestiche > Immagazzinamento e organizzazione > Abbigliamento e sistemazione negli armadi > Stand appendiabiti e organizer per armadi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3561,'Casa e giardino > Forniture domestiche > Immagazzinamento e organizzazione > Borse per la casa');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5128,'Casa e giardino > Forniture domestiche > Immagazzinamento e organizzazione > Cassette portaposate');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7255,'Casa e giardino > Forniture domestiche > Immagazzinamento e organizzazione > Cassetti per organizzazione di oggetti domestici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6986,'Casa e giardino > Forniture domestiche > Immagazzinamento e organizzazione > Contenitori per oggetti domestici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5631,'Casa e giardino > Forniture domestiche > Immagazzinamento e organizzazione > Contenitori per uso domestico');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8058,'Casa e giardino > Forniture domestiche > Immagazzinamento e organizzazione > Divisori per cassetti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4360,'Casa e giardino > Forniture domestiche > Immagazzinamento e organizzazione > Espositori per fotografie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(40,'Casa e giardino > Forniture domestiche > Immagazzinamento e organizzazione > Espositori per fotografie > Album fotografici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4237,'Casa e giardino > Forniture domestiche > Immagazzinamento e organizzazione > Espositori per fotografie > Scatole per fotografie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2446,'Casa e giardino > Forniture domestiche > Immagazzinamento e organizzazione > Ganci e portaabiti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5707,'Casa e giardino > Forniture domestiche > Immagazzinamento e organizzazione > Ganci e portaabiti > Ganci');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499930,'Casa e giardino > Forniture domestiche > Immagazzinamento e organizzazione > Ganci e portaabiti > Ganci e rastrelliere per tavole da stiro');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5494,'Casa e giardino > Forniture domestiche > Immagazzinamento e organizzazione > Ganci e portaabiti > Portaombrelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499674,'Casa e giardino > Forniture domestiche > Pellicole e passatoie di protezione per pavimenti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2530,'Casa e giardino > Forniture domestiche > Prodotti per la casa');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2742,'Casa e giardino > Forniture domestiche > Prodotti per la casa > Carta assorbente');
insert into GOOGLE_CATEGORY (codice,descrizione) values(629,'Casa e giardino > Forniture domestiche > Prodotti per la casa > Carta igienica');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3846,'Casa e giardino > Forniture domestiche > Prodotti per la casa > Fazzoletti di carta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(624,'Casa e giardino > Forniture domestiche > Prodotti per la casa > Fazzoletti per il viso');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7214,'Casa e giardino > Forniture domestiche > Protezioni per mobili per pavimento');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7351,'Casa e giardino > Forniture domestiche > Rivestimenti per cassetti e scaffali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8522,'Casa e giardino > Forniture domestiche > Rivestimenti per pavimenti di garage');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2374,'Casa e giardino > Forniture domestiche > Sacchetti spazzatura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3307,'Casa e giardino > Forniture domestiche > Sottotappeto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3355,'Casa e giardino > Forniture domestiche > Termometri per la casa');
insert into GOOGLE_CATEGORY (codice,descrizione) values(594,'Casa e giardino > Illuminazione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6274,'Casa e giardino > Illuminazione > Illuminazione a binario');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6272,'Casa e giardino > Illuminazione > Illuminazione a binario > Accessori per illuminazione a binario');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6273,'Casa e giardino > Illuminazione > Illuminazione a binario > Guide per illuminazione a binario');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4932,'Casa e giardino > Illuminazione > Illuminazione a binario > Illuminazione file di faretti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1436,'Casa e giardino > Illuminazione > Illuminazione d \'emergenza');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3006,'Casa e giardino > Illuminazione > Impianti di illuminazione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6073,'Casa e giardino > Illuminazione > Impianti di illuminazione > Illuminazione a parete');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2809,'Casa e giardino > Illuminazione > Impianti di illuminazione > Illuminazioni per armadio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2524,'Casa e giardino > Illuminazione > Impianti di illuminazione > Impianti da soffitto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2249,'Casa e giardino > Illuminazione > Impianti di illuminazione > Lampadari');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4636,'Casa e giardino > Illuminazione > Lampade');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2370,'Casa e giardino > Illuminazione > Lampade per quadri');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2425,'Casa e giardino > Illuminazione > Lampadine');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2947,'Casa e giardino > Illuminazione > Lampadine > Lampade fluorescenti compatte');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3329,'Casa e giardino > Illuminazione > Lampadine > Lampadine LED');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2944,'Casa e giardino > Illuminazione > Lampadine > Lampadine a incandescenza');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2690,'Casa e giardino > Illuminazione > Lampadine > Tubi fluorescenti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7401,'Casa e giardino > Illuminazione > Luci da incasso al suolo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7400,'Casa e giardino > Illuminazione > Luci decorative per vialetti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500003,'Casa e giardino > Illuminazione > Luci galleggianti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505826,'Casa e giardino > Illuminazione > Luci notturne e soffuse');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1546,'Casa e giardino > Illuminazione > Luci per esterni ad alta intensità');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7399,'Casa e giardino > Illuminazione > Torce in bambù e lampade a olio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2608,'Casa e giardino > Illuminazione > Tubi luminosi e luminarie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4358,'Casa e giardino > Parasole e ombrelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(985,'Casa e giardino > Piante');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1684,'Casa e giardino > Piante > Alberi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(984,'Casa e giardino > Piante > Fiori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505285,'Casa e giardino > Piante > Kit per coltivare piante ed erbe aromatiche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5590,'Casa e giardino > Piante > Piante acquatiche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6762,'Casa e giardino > Piante > Piante da interno ed esterno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2802,'Casa e giardino > Piante > Semi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(729,'Casa e giardino > Piscine e spa');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2832,'Casa e giardino > Piscine e spa > Accessori piscina e spa');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500050,'Casa e giardino > Piscine e spa > Accessori piscina e spa > Accessori per copri-piscine');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2994,'Casa e giardino > Piscine e spa > Accessori piscina e spa > Coperture e teli per piscine');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3017,'Casa e giardino > Piscine e spa > Accessori piscina e spa > Detergenti e soluzioni piscine');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2755,'Casa e giardino > Piscine e spa > Accessori piscina e spa > Fermascorie piscine');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2981,'Casa e giardino > Piscine e spa > Accessori piscina e spa > Filtri piscine e spa');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500042,'Casa e giardino > Piscine e spa > Accessori piscina e spa > Generatori di cloro per piscine e spa');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2672,'Casa e giardino > Piscine e spa > Accessori piscina e spa > Giocattoli piscina');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7496,'Casa e giardino > Piscine e spa > Accessori piscina e spa > Kit per bordo piscina');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505815,'Casa e giardino > Piscine e spa > Accessori piscina e spa > Kit per la manutenzione di piscine e spa');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2860,'Casa e giardino > Piscine e spa > Accessori piscina e spa > Materassini/poltrone galleggianti piscina');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5654,'Casa e giardino > Piscine e spa > Accessori piscina e spa > Riscaldatori per piscine');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503751,'Casa e giardino > Piscine e spa > Accessori piscina e spa > Rivestimenti per piscine');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6766,'Casa e giardino > Piscine e spa > Accessori piscina e spa > Scalette e scivoli per piscine');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5546,'Casa e giardino > Piscine e spa > Accessori piscina e spa > Scivoli da piscina');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2997,'Casa e giardino > Piscine e spa > Accessori piscina e spa > Scope piscina');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6996,'Casa e giardino > Piscine e spa > Accessori piscina e spa > Spazzole e scope per piscine');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2939,'Casa e giardino > Piscine e spa > Accessori piscina e spa > Trampolini da piscina');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6771,'Casa e giardino > Piscine e spa > Accessori piscina e spa > Tubi per pulizia piscina');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2810,'Casa e giardino > Piscine e spa > Piscine');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3992,'Casa e giardino > Piscine e spa > Saune');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2982,'Casa e giardino > Piscine e spa > Spa');
insert into GOOGLE_CATEGORY (codice,descrizione) values(689,'Casa e giardino > Prato e giardino');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4564,'Casa e giardino > Prato e giardino > Accessori attrezzatura motorizzata per esterni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4565,'Casa e giardino > Prato e giardino > Accessori attrezzatura motorizzata per esterni > Accessori motoseghe');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4647,'Casa e giardino > Prato e giardino > Accessori attrezzatura motorizzata per esterni > Accessori motoseghe > Barre motoseghe');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4646,'Casa e giardino > Prato e giardino > Accessori attrezzatura motorizzata per esterni > Accessori motoseghe > Catene motoseghe');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7563,'Casa e giardino > Prato e giardino > Accessori attrezzatura motorizzata per esterni > Accessori per decespugliatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6328,'Casa e giardino > Prato e giardino > Accessori attrezzatura motorizzata per esterni > Accessori per idropulitrici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7168,'Casa e giardino > Prato e giardino > Accessori attrezzatura motorizzata per esterni > Accessori per soffiatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7171,'Casa e giardino > Prato e giardino > Accessori attrezzatura motorizzata per esterni > Accessori per soffiatori > Tubi di prolunga per soffiatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7169,'Casa e giardino > Prato e giardino > Accessori attrezzatura motorizzata per esterni > Accessori per tagliabordi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8034,'Casa e giardino > Prato e giardino > Accessori attrezzatura motorizzata per esterni > Accessori per tagliabordi > Coperture per bobine per tagliabordi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7170,'Casa e giardino > Prato e giardino > Accessori attrezzatura motorizzata per esterni > Accessori per tagliabordi > Lame e bobine per tagliabordi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7265,'Casa e giardino > Prato e giardino > Accessori attrezzatura motorizzata per esterni > Accessori per tosasiepi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4567,'Casa e giardino > Prato e giardino > Accessori attrezzatura motorizzata per esterni > Accessori soffiatori neve');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4566,'Casa e giardino > Prato e giardino > Accessori attrezzatura motorizzata per esterni > Accessori tagliaerba');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499872,'Casa e giardino > Prato e giardino > Accessori attrezzatura motorizzata per esterni > Accessori tagliaerba > Camere d \'aria per pneumatici di tagliaerba');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4643,'Casa e giardino > Prato e giardino > Accessori attrezzatura motorizzata per esterni > Accessori tagliaerba > Cinghie tagliaerba');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4642,'Casa e giardino > Prato e giardino > Accessori attrezzatura motorizzata per esterni > Accessori tagliaerba > Coperture tagliaerba');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499923,'Casa e giardino > Prato e giardino > Accessori attrezzatura motorizzata per esterni > Accessori tagliaerba > Kit di pacciame per tagliaerba');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499921,'Casa e giardino > Prato e giardino > Accessori attrezzatura motorizzata per esterni > Accessori tagliaerba > Kit per decorazione prati');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4641,'Casa e giardino > Prato e giardino > Accessori attrezzatura motorizzata per esterni > Accessori tagliaerba > Lame tagliaerba');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6095,'Casa e giardino > Prato e giardino > Accessori attrezzatura motorizzata per esterni > Accessori tagliaerba > Pneumatici per tagliaerba');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499960,'Casa e giardino > Prato e giardino > Accessori attrezzatura motorizzata per esterni > Accessori tagliaerba > Prese e piastre in pacciame per tagliaerba');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6542,'Casa e giardino > Prato e giardino > Accessori attrezzatura motorizzata per esterni > Accessori tagliaerba > Prolunghe per tosaerba');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4644,'Casa e giardino > Prato e giardino > Accessori attrezzatura motorizzata per esterni > Accessori tagliaerba > Pulegge e ruote di rinvio tagliaerba');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6094,'Casa e giardino > Prato e giardino > Accessori attrezzatura motorizzata per esterni > Accessori tagliaerba > Ruote per tagliaerba');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4645,'Casa e giardino > Prato e giardino > Accessori attrezzatura motorizzata per esterni > Accessori tagliaerba > Sacchetti tagliaerba');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6541,'Casa e giardino > Prato e giardino > Accessori attrezzatura motorizzata per esterni > Accessori tagliaerba > Spazzole per erba');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7333,'Casa e giardino > Prato e giardino > Accessori attrezzatura motorizzata per esterni > Batterie per attrezzature motorizzate per esterni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5867,'Casa e giardino > Prato e giardino > Accessori attrezzatura motorizzata per esterni > Componenti e accessori per trattori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499880,'Casa e giardino > Prato e giardino > Accessori attrezzatura motorizzata per esterni > Componenti e accessori per trattori > Pneumatici per trattori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499881,'Casa e giardino > Prato e giardino > Accessori attrezzatura motorizzata per esterni > Componenti e accessori per trattori > Ruote per trattori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8485,'Casa e giardino > Prato e giardino > Accessori attrezzatura motorizzata per esterni > Prolunghe per attrezzature motorizzate multifunzione per esterni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7564,'Casa e giardino > Prato e giardino > Accessori attrezzatura motorizzata per esterni > Prolunghe per attrezzature motorizzate multifunzione per esterni > Prolunghe per decespugliatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8488,'Casa e giardino > Prato e giardino > Accessori attrezzatura motorizzata per esterni > Prolunghe per attrezzature motorizzate multifunzione per esterni > Prolunghe per dissodatori e sarchiatrici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8487,'Casa e giardino > Prato e giardino > Accessori attrezzatura motorizzata per esterni > Prolunghe per attrezzature motorizzate multifunzione per esterni > Prolunghe per soffia-terra e soffia-foglie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8489,'Casa e giardino > Prato e giardino > Accessori attrezzatura motorizzata per esterni > Prolunghe per attrezzature motorizzate multifunzione per esterni > Prolunghe per svettatoi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7335,'Casa e giardino > Prato e giardino > Accessori attrezzatura motorizzata per esterni > Prolunghe per attrezzature motorizzate multifunzione per esterni > Prolunghe per tagliabordi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7334,'Casa e giardino > Prato e giardino > Accessori attrezzatura motorizzata per esterni > Prolunghe per attrezzature motorizzate multifunzione per esterni > Prolunghe per tosasiepi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3798,'Casa e giardino > Prato e giardino > Attrezzatura motorizzata per esterni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500034,'Casa e giardino > Prato e giardino > Attrezzatura motorizzata per esterni > Aeratori e depagliatori per prati');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6789,'Casa e giardino > Prato e giardino > Attrezzatura motorizzata per esterni > Aspiratori per erba');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2204,'Casa e giardino > Prato e giardino > Attrezzatura motorizzata per esterni > Fresatrici agricole');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1226,'Casa e giardino > Prato e giardino > Attrezzatura motorizzata per esterni > Getti a pressione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3610,'Casa e giardino > Prato e giardino > Attrezzatura motorizzata per esterni > Motoseghe');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7245,'Casa e giardino > Prato e giardino > Attrezzatura motorizzata per esterni > Set di attrezzature motorizzate per esterni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1541,'Casa e giardino > Prato e giardino > Attrezzatura motorizzata per esterni > Soffiatori da neve');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3340,'Casa e giardino > Prato e giardino > Attrezzatura motorizzata per esterni > Soffiatori per foglie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500016,'Casa e giardino > Prato e giardino > Attrezzatura motorizzata per esterni > Spazzatrice elettrica');
insert into GOOGLE_CATEGORY (codice,descrizione) values(694,'Casa e giardino > Prato e giardino > Attrezzatura motorizzata per esterni > Tagliaerba');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6258,'Casa e giardino > Prato e giardino > Attrezzatura motorizzata per esterni > Tagliaerba > Falciacondizionatrici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6788,'Casa e giardino > Prato e giardino > Attrezzatura motorizzata per esterni > Tagliaerba > Robot tagliaerba');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3730,'Casa e giardino > Prato e giardino > Attrezzatura motorizzata per esterni > Tagliaerba > Tagliaerba a spinta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3311,'Casa e giardino > Prato e giardino > Attrezzatura motorizzata per esterni > Tagliaerba > Veicoli tagliaerba');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3120,'Casa e giardino > Prato e giardino > Attrezzatura motorizzata per esterni > Tagliasiepi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2218,'Casa e giardino > Prato e giardino > Attrezzatura motorizzata per esterni > Tosaerba');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1223,'Casa e giardino > Prato e giardino > Attrezzatura motorizzata per esterni > Tosaerba a filo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5866,'Casa e giardino > Prato e giardino > Attrezzatura motorizzata per esterni > Trattori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7332,'Casa e giardino > Prato e giardino > Attrezzatura motorizzata per esterni > Unità base di attrezzature motorizzate per esterni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2962,'Casa e giardino > Prato e giardino > Giardinaggio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5632,'Casa e giardino > Prato e giardino > Giardinaggio > Accessori per il giardinaggio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7184,'Casa e giardino > Prato e giardino > Giardinaggio > Accessori per il giardinaggio > Banchi per invasatura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5633,'Casa e giardino > Prato e giardino > Giardinaggio > Accessori per il giardinaggio > Carrelli da giardinaggio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503756,'Casa e giardino > Prato e giardino > Giardinaggio > Accessori per il giardinaggio > Cuscini da lavoro, sedili e sgabelli con ruote da giardinaggio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505326,'Casa e giardino > Prato e giardino > Giardinaggio > Accessori per strumenti da giardinaggio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4972,'Casa e giardino > Prato e giardino > Giardinaggio > Accessori per strumenti da giardinaggio > Componenti carriole');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505322,'Casa e giardino > Prato e giardino > Giardinaggio > Accessori per strumenti da giardinaggio > Manici per strumenti da giardinaggio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505321,'Casa e giardino > Prato e giardino > Giardinaggio > Accessori per strumenti da giardinaggio > Utensili per strumenti da giardinaggio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6413,'Casa e giardino > Prato e giardino > Giardinaggio > Accessori per teli da pacciamatura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6422,'Casa e giardino > Prato e giardino > Giardinaggio > Accessori per teli da pacciamatura > Graffe e perni per tessuti per pacciamatura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6421,'Casa e giardino > Prato e giardino > Giardinaggio > Accessori per teli da pacciamatura > Nastro per tessuti per pacciamatura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3173,'Casa e giardino > Prato e giardino > Giardinaggio > Attrezzi da giardinaggio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4000,'Casa e giardino > Prato e giardino > Giardinaggio > Attrezzi da giardinaggio > Attrezzi per coltivazione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3616,'Casa e giardino > Prato e giardino > Giardinaggio > Attrezzi da giardinaggio > Carriole');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505292,'Casa e giardino > Prato e giardino > Giardinaggio > Attrezzi da giardinaggio > Falcetti e machete da giardinaggio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3841,'Casa e giardino > Prato e giardino > Giardinaggio > Attrezzi da giardinaggio > Forbici per potatura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3071,'Casa e giardino > Prato e giardino > Giardinaggio > Attrezzi da giardinaggio > Forconi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2147,'Casa e giardino > Prato e giardino > Giardinaggio > Attrezzi da giardinaggio > Pale e vanghe');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3388,'Casa e giardino > Prato e giardino > Giardinaggio > Attrezzi da giardinaggio > Rastrelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499922,'Casa e giardino > Prato e giardino > Giardinaggio > Attrezzi da giardinaggio > Rulli per prati');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6967,'Casa e giardino > Prato e giardino > Giardinaggio > Attrezzi da giardinaggio > Seghetti da potatura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3828,'Casa e giardino > Prato e giardino > Giardinaggio > Attrezzi da giardinaggio > Spandiconcime');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1967,'Casa e giardino > Prato e giardino > Giardinaggio > Attrezzi da giardinaggio > Spruzzatori da prato e giardino');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7537,'Casa e giardino > Prato e giardino > Giardinaggio > Attrezzi da giardinaggio > Strumenti per piantare bulbi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3644,'Casa e giardino > Prato e giardino > Giardinaggio > Attrezzi da giardinaggio > Trapiantatoi da giardinaggio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4085,'Casa e giardino > Prato e giardino > Giardinaggio > Composting');
insert into GOOGLE_CATEGORY (codice,descrizione) values(690,'Casa e giardino > Prato e giardino > Giardinaggio > Composting > Compost');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6436,'Casa e giardino > Prato e giardino > Giardinaggio > Composting > Compostiere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6840,'Casa e giardino > Prato e giardino > Giardinaggio > Composting > Ossigenatori per composting');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6834,'Casa e giardino > Prato e giardino > Giardinaggio > Contenitori per raccolta pioggia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(691,'Casa e giardino > Prato e giardino > Giardinaggio > Controllo malattie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3103,'Casa e giardino > Prato e giardino > Giardinaggio > Erbicidi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(113,'Casa e giardino > Prato e giardino > Giardinaggio > Fertilizzanti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499962,'Casa e giardino > Prato e giardino > Giardinaggio > Fodere per vasi per piante e fiori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2988,'Casa e giardino > Prato e giardino > Giardinaggio > Pacciame');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500033,'Casa e giardino > Prato e giardino > Giardinaggio > Piattini e vassoi per vasi da giardino');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1794,'Casa e giardino > Prato e giardino > Giardinaggio > Sabbie e suoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(693,'Casa e giardino > Prato e giardino > Giardinaggio > Serre');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499894,'Casa e giardino > Prato e giardino > Giardinaggio > Supporti e gabbie per piante');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6428,'Casa e giardino > Prato e giardino > Giardinaggio > Supporti per piante');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6381,'Casa e giardino > Prato e giardino > Giardinaggio > Tessuti per pacciamatura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(721,'Casa e giardino > Prato e giardino > Giardinaggio > Vasi e fioriere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3568,'Casa e giardino > Prato e giardino > Impianti di irrigazione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505814,'Casa e giardino > Prato e giardino > Impianti di irrigazione > Accessori per annaffiatoi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6318,'Casa e giardino > Prato e giardino > Impianti di irrigazione > Annaffiatoi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4718,'Casa e giardino > Prato e giardino > Impianti di irrigazione > Attrezzatura per strumenti da giardino e valvole');
insert into GOOGLE_CATEGORY (codice,descrizione) values(230912,'Casa e giardino > Prato e giardino > Impianti di irrigazione > Coni e palle per irrigazione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3780,'Casa e giardino > Prato e giardino > Impianti di irrigazione > Impianti irrigatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1302,'Casa e giardino > Prato e giardino > Impianti di irrigazione > Impianti irrigatori > Controlli irrigatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3491,'Casa e giardino > Prato e giardino > Impianti di irrigazione > Impianti irrigatori > Valvole irrigatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7561,'Casa e giardino > Prato e giardino > Impianti di irrigazione > Irrigatori e testine per irrigatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2313,'Casa e giardino > Prato e giardino > Impianti di irrigazione > Tubi da giardino');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4201,'Casa e giardino > Prato e giardino > Impianti di irrigazione > Ugelli spruzzatori tubi da giardino');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5362,'Casa e giardino > Prato e giardino > Rimozione della neve');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5363,'Casa e giardino > Prato e giardino > Rimozione della neve > Pale da neve');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5364,'Casa e giardino > Prato e giardino > Rimozione della neve > Raschietti per ghiaccio e spazzole da neve');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2918,'Casa e giardino > Prato e giardino > Vita all \'aperto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499955,'Casa e giardino > Prato e giardino > Vita all \'aperto > Accessori per altalene da patio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6751,'Casa e giardino > Prato e giardino > Vita all \'aperto > Accessori per ombrelloni e parasole da esterno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5493,'Casa e giardino > Prato e giardino > Vita all \'aperto > Accessori per ombrelloni e parasole da esterno > Basi per ombrelli da esterno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7107,'Casa e giardino > Prato e giardino > Vita all \'aperto > Accessori per ombrelloni e parasole da esterno > Copri ombrelloni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499948,'Casa e giardino > Prato e giardino > Vita all \'aperto > Accessori per ombrelloni e parasole da esterno > Kit di protezione per ombrelloni da esterni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8020,'Casa e giardino > Prato e giardino > Vita all \'aperto > Accessori per ombrelloni e parasole da esterno > Luci per ombrelloni per esterno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7108,'Casa e giardino > Prato e giardino > Vita all \'aperto > Accessori per ombrelloni e parasole da esterno > Tessuti per ombrelloni e parasoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499908,'Casa e giardino > Prato e giardino > Vita all \'aperto > Accessori per tende parasole');
insert into GOOGLE_CATEGORY (codice,descrizione) values(718,'Casa e giardino > Prato e giardino > Vita all \'aperto > Altalene da patio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(717,'Casa e giardino > Prato e giardino > Vita all \'aperto > Amache');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6737,'Casa e giardino > Prato e giardino > Vita all \'aperto > Componenti e accessori per amache');
insert into GOOGLE_CATEGORY (codice,descrizione) values(719,'Casa e giardino > Prato e giardino > Vita all \'aperto > Parasole');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5910,'Casa e giardino > Prato e giardino > Vita all \'aperto > Plaid da picnic');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5913,'Casa e giardino > Prato e giardino > Vita all \'aperto > Plaid da picnic > Coperte da picnic');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5912,'Casa e giardino > Prato e giardino > Vita all \'aperto > Plaid da picnic > Fodere per coperte');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5911,'Casa e giardino > Prato e giardino > Vita all \'aperto > Plaid da picnic > Stuoie da spiaggia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2613,'Casa e giardino > Prato e giardino > Vita all \'aperto > Strutture da esterno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6105,'Casa e giardino > Prato e giardino > Vita all \'aperto > Strutture da esterno > Accessori per baldacchini e gazebo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7424,'Casa e giardino > Prato e giardino > Vita all \'aperto > Strutture da esterno > Accessori per baldacchini e gazebo > Contrappesi per baldacchini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6107,'Casa e giardino > Prato e giardino > Vita all \'aperto > Strutture da esterno > Accessori per baldacchini e gazebo > Kit zanzariere per baldacchini e gazebo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7423,'Casa e giardino > Prato e giardino > Vita all \'aperto > Strutture da esterno > Accessori per baldacchini e gazebo > Pali per baldacchini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6106,'Casa e giardino > Prato e giardino > Vita all \'aperto > Strutture da esterno > Accessori per baldacchini e gazebo > Strutture per baldacchini e gazebo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6108,'Casa e giardino > Prato e giardino > Vita all \'aperto > Strutture da esterno > Accessori per baldacchini e gazebo > Tetti per baldacchini e gazebo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(703,'Casa e giardino > Prato e giardino > Vita all \'aperto > Strutture da esterno > Archi, tralicci, pergole e pergolati da giardino');
insert into GOOGLE_CATEGORY (codice,descrizione) values(716,'Casa e giardino > Prato e giardino > Vita all \'aperto > Strutture da esterno > Baldacchini e gazebi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(700,'Casa e giardino > Prato e giardino > Vita all \'aperto > Strutture da esterno > Ponti da giardino');
insert into GOOGLE_CATEGORY (codice,descrizione) values(720,'Casa e giardino > Prato e giardino > Vita all \'aperto > Strutture da esterno > Rimesse, tettoie e capanni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499907,'Casa e giardino > Prato e giardino > Vita all \'aperto > Tende parasole');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5835,'Casa e giardino > Preparazione alle emergenze');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7058,'Casa e giardino > Preparazione alle emergenze > Attrezzi e kit di emergenza');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6897,'Casa e giardino > Preparazione alle emergenze > Coperte termiche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4491,'Casa e giardino > Preparazione alle emergenze > Fissaggi per mobili');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5836,'Casa e giardino > Preparazione alle emergenze > Razioni alimentari di emergenza');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4490,'Casa e giardino > Preparazione alle emergenze > Sistemi allarme terremoto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(359,'Casa e giardino > Sicurezza in casa e sul lavoro');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499865,'Casa e giardino > Sicurezza in casa e sul lavoro > Accessori per casseforti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3819,'Casa e giardino > Sicurezza in casa e sul lavoro > Casseforti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(363,'Casa e giardino > Sicurezza in casa e sul lavoro > Luci di sicurezza');
insert into GOOGLE_CATEGORY (codice,descrizione) values(364,'Casa e giardino > Sicurezza in casa e sul lavoro > Monitor e sistemi di registrazione di sicurezza');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2161,'Casa e giardino > Sicurezza in casa e sul lavoro > Sensori di movimento');
insert into GOOGLE_CATEGORY (codice,descrizione) values(365,'Casa e giardino > Sicurezza in casa e sul lavoro > Sensori sistemi sicurezza');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3873,'Casa e giardino > Sicurezza in casa e sul lavoro > Sistemi d \'allarme domestici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500025,'Casa e giardino > Sicurezza in casa e sul lavoro > Specchi di sicurezza');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5491,'Casa e giardino > Sicurezza in casa e sul lavoro > Telecamere di sorveglianza finte');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1679,'Casa e giardino > Sistemi di sicurezza per inondazioni, incendi e gas');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1871,'Casa e giardino > Sistemi di sicurezza per inondazioni, incendi e gas > Allarmi antincendio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1639,'Casa e giardino > Sistemi di sicurezza per inondazioni, incendi e gas > Deposito di attrezzature ed estintori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1434,'Casa e giardino > Sistemi di sicurezza per inondazioni, incendi e gas > Estintori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1934,'Casa e giardino > Sistemi di sicurezza per inondazioni, incendi e gas > Impianti antincendio a pioggia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7226,'Casa e giardino > Sistemi di sicurezza per inondazioni, incendi e gas > Quadri di controllo per allarmi antincendio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7227,'Casa e giardino > Sistemi di sicurezza per inondazioni, incendi e gas > Rilevatori di calore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499673,'Casa e giardino > Sistemi di sicurezza per inondazioni, incendi e gas > Rilevatori di fumo e monossido di carbonio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1306,'Casa e giardino > Sistemi di sicurezza per inondazioni, incendi e gas > Rilevatori di perdite o del livello d \'acqua');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2639,'Casa e giardino > Stufe a legna');
insert into GOOGLE_CATEGORY (codice,descrizione) values(412,'Cibo, bevande e tabacco');
insert into GOOGLE_CATEGORY (codice,descrizione) values(422,'Cibo, bevande e tabacco > Alimenti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4608,'Cibo, bevande e tabacco > Alimenti > Aromi e spezie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1529,'Cibo, bevande e tabacco > Alimenti > Aromi e spezie > Erbe e spezie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4610,'Cibo, bevande e tabacco > Alimenti > Aromi e spezie > Glutammato monosodico');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6199,'Cibo, bevande e tabacco > Alimenti > Aromi e spezie > Pepe');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4611,'Cibo, bevande e tabacco > Alimenti > Aromi e spezie > Sale');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4748,'Cibo, bevande e tabacco > Alimenti > Caramelle e cioccolato');
insert into GOOGLE_CATEGORY (codice,descrizione) values(432,'Cibo, bevande e tabacco > Alimenti > Carne, pesce e uova');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4628,'Cibo, bevande e tabacco > Alimenti > Carne, pesce e uova > Carne');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5804,'Cibo, bevande e tabacco > Alimenti > Carne, pesce e uova > Carne > Carne fredda affettata');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5805,'Cibo, bevande e tabacco > Alimenti > Carne, pesce e uova > Carne > Carni fresche e congelate');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5811,'Cibo, bevande e tabacco > Alimenti > Carne, pesce e uova > Carne > Carni in scatola');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4629,'Cibo, bevande e tabacco > Alimenti > Carne, pesce e uova > Pesce');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5812,'Cibo, bevande e tabacco > Alimenti > Carne, pesce e uova > Pesce > Frutti di mare freschi e congelati');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5813,'Cibo, bevande e tabacco > Alimenti > Carne, pesce e uova > Pesce > Frutti di mare in scatola');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4627,'Cibo, bevande e tabacco > Alimenti > Carne, pesce e uova > Uova');
insert into GOOGLE_CATEGORY (codice,descrizione) values(136,'Cibo, bevande e tabacco > Alimenti > Cesti regalo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5814,'Cibo, bevande e tabacco > Alimenti > Cibi già pronti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499989,'Cibo, bevande e tabacco > Alimenti > Cibi già pronti > Aperitivi e contorni già pronti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499988,'Cibo, bevande e tabacco > Alimenti > Cibi già pronti > Primi e secondi piatti già pronti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(427,'Cibo, bevande e tabacco > Alimenti > Condimenti e salse');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1969,'Cibo, bevande e tabacco > Alimenti > Condimenti e salse > Condimenti per insalata');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5759,'Cibo, bevande e tabacco > Alimenti > Condimenti e salse > Condimenti per pasta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500076,'Cibo, bevande e tabacco > Alimenti > Condimenti e salse > Frutta e verdura sottaceto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6845,'Cibo, bevande e tabacco > Alimenti > Condimenti e salse > Guarnizioni per dessert');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6854,'Cibo, bevande e tabacco > Alimenti > Condimenti e salse > Guarnizioni per dessert > Guarnizioni in frutta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6844,'Cibo, bevande e tabacco > Alimenti > Condimenti e salse > Guarnizioni per dessert > Sciroppo per gelato');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2018,'Cibo, bevande e tabacco > Alimenti > Condimenti e salse > Ketchup');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1568,'Cibo, bevande e tabacco > Alimenti > Condimenti e salse > Maionese');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500074,'Cibo, bevande e tabacco > Alimenti > Condimenti e salse > Marinature e salse per griglia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4947,'Cibo, bevande e tabacco > Alimenti > Condimenti e salse > Miele');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5760,'Cibo, bevande e tabacco > Alimenti > Condimenti e salse > Olive e capperi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6246,'Cibo, bevande e tabacco > Alimenti > Condimenti e salse > Salsa Worcester');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6772,'Cibo, bevande e tabacco > Alimenti > Condimenti e salse > Salsa cocktail');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6905,'Cibo, bevande e tabacco > Alimenti > Condimenti e salse > Salsa di curry');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6782,'Cibo, bevande e tabacco > Alimenti > Condimenti e salse > Salsa di rafano');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4616,'Cibo, bevande e tabacco > Alimenti > Condimenti e salse > Salsa di soia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5763,'Cibo, bevande e tabacco > Alimenti > Condimenti e salse > Salsa per pesce');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6203,'Cibo, bevande e tabacco > Alimenti > Condimenti e salse > Salsa per pizza');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4614,'Cibo, bevande e tabacco > Alimenti > Condimenti e salse > Salsa piccante');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4615,'Cibo, bevande e tabacco > Alimenti > Condimenti e salse > Salsa satay');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6783,'Cibo, bevande e tabacco > Alimenti > Condimenti e salse > Salsa tartara');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500089,'Cibo, bevande e tabacco > Alimenti > Condimenti e salse > Salse agrodolci');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500105,'Cibo, bevande e tabacco > Alimenti > Condimenti e salse > Salse bianche e cremose');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500075,'Cibo, bevande e tabacco > Alimenti > Condimenti e salse > Salse e chutney');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4943,'Cibo, bevande e tabacco > Alimenti > Condimenti e salse > Sciroppo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1387,'Cibo, bevande e tabacco > Alimenti > Condimenti e salse > Senape');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5762,'Cibo, bevande e tabacco > Alimenti > Condimenti e salse > Sughi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4692,'Cibo, bevande e tabacco > Alimenti > Condimenti e salse > Tahini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6219,'Cibo, bevande e tabacco > Alimenti > Frutta candita o ricoperta di cioccolato');
insert into GOOGLE_CATEGORY (codice,descrizione) values(430,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5797,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Fagioli in scatola');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5796,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Fagioli secchi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1755,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta disidratata');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5795,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503759,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Agrumi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6658,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Agrumi > Arance');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6632,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Agrumi > Kumquat');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6642,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Agrumi > Lime');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6641,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Agrumi > Limequat');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6636,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Agrumi > Limoni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6621,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Agrumi > Pompelmi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6697,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Agrumi > Tangeli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6670,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Ananas');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6571,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Atemoya');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6572,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Avocado');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6573,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Babaco');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6582,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Bacche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6574,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Banane');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6672,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Cachi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6594,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Carambola');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6814,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Chirimoya');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6602,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Cirimoia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6624,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Conserve casalinghe di frutta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6813,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Corbezzolo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6812,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Datteri');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6614,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Feijoa');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6810,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Fichi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503760,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Frutta con nocciolo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6567,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Frutta con nocciolo > Albicocche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6601,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Frutta con nocciolo > Ciliegie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6646,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Frutta con nocciolo > Manghi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505301,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Frutta con nocciolo > Pesche e pesche noci');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6675,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Frutta con nocciolo > Pluot');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6674,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Frutta con nocciolo > Prugne');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6667,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Frutta della passione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6589,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Frutto dell \'albero del pane');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6691,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Guanàbana');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6625,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Guava');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6633,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Kiwi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6640,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Longan');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6638,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Lychee');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6647,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Mamey');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6645,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Mangostani');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6673,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Melagrani');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6566,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Mele');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6679,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Mele cotogne');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6649,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Meloni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499906,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Mix di frutta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6639,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Nespole');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6809,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Noci di cocco');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6593,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Opuntia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6661,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Papaya');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6665,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Pere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6671,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Physalis');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6676,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Pitahaya');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6678,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Rambutan');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6688,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Sapodilla');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6698,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Tamarindo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6626,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Uva');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6687,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta fresca e congelata > Zapote');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5799,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Frutta in scatola e in vasetto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5794,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Salse di frutta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5798,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdura in scatola e in vasetto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5793,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6620,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Aglio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6716,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Arracacha');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6568,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Asparagi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6580,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Barbabietole');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6587,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Borraggine');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6591,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Broccoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6617,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Broccoli cinesi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6694,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Canna da zucchero');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6570,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Carciofi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6596,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Cardi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6595,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Carote');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6701,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Castagne cinesi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6600,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Cavolfiore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6592,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Cavoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6590,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Cavolini di Bruxelles');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6628,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Cavolo rapa');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6608,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Cetrioli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6655,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Cipolle');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6700,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Crescione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7193,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Erba di grano');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6577,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Fagioli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6816,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Finocchi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6808,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Foglie di cactus');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6653,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Funghi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503761,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Germogli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6615,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Germogli di felce');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6657,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Gombo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6609,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Mais');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6643,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Malanga');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6613,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Melanzane');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499905,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Mix di verdure');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6663,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Pastinaca');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6586,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Patate');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6585,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Patate dolci');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6630,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Patate messicane');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6668,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Peperoni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6669,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Piselli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6703,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Pomodori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6627,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Porri');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6681,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Rabarbaro');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6704,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Radice di colocasia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6631,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Radice di rafano');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6705,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Radice di yucca');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6618,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Radici di arctium');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6644,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Radici di loto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6664,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Radici di prezzemolo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6598,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Radici di sedano');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6619,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Radici di zenzero');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505329,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Rape e cavoli navoni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6682,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Ravanelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6818,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Scalogno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6599,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Sedano');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6616,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Senape bruna');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6692,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Tamarillo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6693,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Topinambur');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6622,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Verdure a foglia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6581,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Verdure a foglia > Barbabietole verdi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6597,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Verdure a foglia > Bietole');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6584,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Verdure a foglia > Cavolo cinese');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6629,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Verdure a foglia > Cavolo riccio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6610,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Verdure a foglia > Choy Sum');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6717,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Verdure a foglia > Cicoria');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6706,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Verdure a foglia > Colza');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6637,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Verdure a foglia > Lattuga');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5792,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Verdure a foglia > Mix di insalate');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6569,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Verdure a foglia > Rucola');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6695,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Verdure a foglia > Spinaci');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6656,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Verdure a foglia > Spinaci d \'acqua');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8515,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Yam');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505354,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure fresche e congelate > Zucche e meloni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7387,'Cibo, bevande e tabacco > Alimenti > Frutta e verdura > Verdure liofilizzate');
insert into GOOGLE_CATEGORY (codice,descrizione) values(431,'Cibo, bevande e tabacco > Alimenti > Grano, riso e cereali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4683,'Cibo, bevande e tabacco > Alimenti > Grano, riso e cereali > Amaranto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4689,'Cibo, bevande e tabacco > Alimenti > Grano, riso e cereali > Cereali e muesli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7196,'Cibo, bevande e tabacco > Alimenti > Grano, riso e cereali > Cuscus');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4690,'Cibo, bevande e tabacco > Alimenti > Grano, riso e cereali > Fiocchi d \'avena e crusca');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4688,'Cibo, bevande e tabacco > Alimenti > Grano, riso e cereali > Grano');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4684,'Cibo, bevande e tabacco > Alimenti > Grano, riso e cereali > Grano saraceno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4686,'Cibo, bevande e tabacco > Alimenti > Grano, riso e cereali > Miglio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4687,'Cibo, bevande e tabacco > Alimenti > Grano, riso e cereali > Orzo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6259,'Cibo, bevande e tabacco > Alimenti > Grano, riso e cereali > Quinoa');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4682,'Cibo, bevande e tabacco > Alimenti > Grano, riso e cereali > Riso');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7374,'Cibo, bevande e tabacco > Alimenti > Grano, riso e cereali > Segale');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2660,'Cibo, bevande e tabacco > Alimenti > Ingredienti per cucinare e da forno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2140,'Cibo, bevande e tabacco > Alimenti > Ingredienti per cucinare e da forno > Aceto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5771,'Cibo, bevande e tabacco > Alimenti > Ingredienti per cucinare e da forno > Amido di mais');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5774,'Cibo, bevande e tabacco > Alimenti > Ingredienti per cucinare e da forno > Bicarbonato di sodio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5776,'Cibo, bevande e tabacco > Alimenti > Ingredienti per cucinare e da forno > Cioccolato amaro');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7127,'Cibo, bevande e tabacco > Alimenti > Ingredienti per cucinare e da forno > Coloranti alimentari');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6775,'Cibo, bevande e tabacco > Alimenti > Ingredienti per cucinare e da forno > Decorazioni da forno commestibili');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5775,'Cibo, bevande e tabacco > Alimenti > Ingredienti per cucinare e da forno > Essenze e aromi da cucina');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5800,'Cibo, bevande e tabacco > Alimenti > Ingredienti per cucinare e da forno > Farciture per torte');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2775,'Cibo, bevande e tabacco > Alimenti > Ingredienti per cucinare e da forno > Farina');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8076,'Cibo, bevande e tabacco > Alimenti > Ingredienti per cucinare e da forno > Farina grossa');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7354,'Cibo, bevande e tabacco > Alimenti > Ingredienti per cucinare e da forno > Fermenti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5768,'Cibo, bevande e tabacco > Alimenti > Ingredienti per cucinare e da forno > Gelatina stabilizzante');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5769,'Cibo, bevande e tabacco > Alimenti > Ingredienti per cucinare e da forno > Glassatura e glassa');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5765,'Cibo, bevande e tabacco > Alimenti > Ingredienti per cucinare e da forno > Grasso alimentare e strutto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5752,'Cibo, bevande e tabacco > Alimenti > Ingredienti per cucinare e da forno > Impasto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5753,'Cibo, bevande e tabacco > Alimenti > Ingredienti per cucinare e da forno > Impasto > Coperture e basi di pasta per torte');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5755,'Cibo, bevande e tabacco > Alimenti > Ingredienti per cucinare e da forno > Impasto > Impasto per pane e paste');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5756,'Cibo, bevande e tabacco > Alimenti > Ingredienti per cucinare e da forno > Impasto > Pasta per biscotti e brownie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7506,'Cibo, bevande e tabacco > Alimenti > Ingredienti per cucinare e da forno > Kit di decorazioni per dolci da forno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500093,'Cibo, bevande e tabacco > Alimenti > Ingredienti per cucinare e da forno > Latte in scatola e condensato');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2905,'Cibo, bevande e tabacco > Alimenti > Ingredienti per cucinare e da forno > Lievito');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2803,'Cibo, bevande e tabacco > Alimenti > Ingredienti per cucinare e da forno > Lievito in polvere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5767,'Cibo, bevande e tabacco > Alimenti > Ingredienti per cucinare e da forno > Marshmallow');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5766,'Cibo, bevande e tabacco > Alimenti > Ingredienti per cucinare e da forno > Melasse');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6774,'Cibo, bevande e tabacco > Alimenti > Ingredienti per cucinare e da forno > Miscele per pastella e rivestimento');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2126,'Cibo, bevande e tabacco > Alimenti > Ingredienti per cucinare e da forno > Oli da cucina');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5773,'Cibo, bevande e tabacco > Alimenti > Ingredienti per cucinare e da forno > Pangrattato');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6922,'Cibo, bevande e tabacco > Alimenti > Ingredienti per cucinare e da forno > Pasta di pomodoro');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4613,'Cibo, bevande e tabacco > Alimenti > Ingredienti per cucinare e da forno > Paste e salse di fagioli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6754,'Cibo, bevande e tabacco > Alimenti > Ingredienti per cucinare e da forno > Pastiglie fondenti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499707,'Cibo, bevande e tabacco > Alimenti > Ingredienti per cucinare e da forno > Perle di tapioca');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2572,'Cibo, bevande e tabacco > Alimenti > Ingredienti per cucinare e da forno > Preparati da forno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5778,'Cibo, bevande e tabacco > Alimenti > Ingredienti per cucinare e da forno > Preparati per cialde e pancake');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5770,'Cibo, bevande e tabacco > Alimenti > Ingredienti per cucinare e da forno > Sciroppo di mais');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499986,'Cibo, bevande e tabacco > Alimenti > Ingredienti per cucinare e da forno > Succo di limone e lime');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5777,'Cibo, bevande e tabacco > Alimenti > Ingredienti per cucinare e da forno > Vino da cucina');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503734,'Cibo, bevande e tabacco > Alimenti > Ingredienti per cucinare e da forno > Zucchero e dolcificanti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5105,'Cibo, bevande e tabacco > Alimenti > Ingredienti per cucinare e da forno > Zucchero filato');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5740,'Cibo, bevande e tabacco > Alimenti > Intingoli e spalmabili');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6204,'Cibo, bevande e tabacco > Alimenti > Intingoli e spalmabili > Burro di mele');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3965,'Cibo, bevande e tabacco > Alimenti > Intingoli e spalmabili > Burro di noci');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6830,'Cibo, bevande e tabacco > Alimenti > Intingoli e spalmabili > Crema vegetale');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5785,'Cibo, bevande e tabacco > Alimenti > Intingoli e spalmabili > Formaggi cremosi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5742,'Cibo, bevande e tabacco > Alimenti > Intingoli e spalmabili > Guacamole');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5741,'Cibo, bevande e tabacco > Alimenti > Intingoli e spalmabili > Hummus');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6831,'Cibo, bevande e tabacco > Alimenti > Intingoli e spalmabili > Intingoli e creme al formaggio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2188,'Cibo, bevande e tabacco > Alimenti > Intingoli e spalmabili > Marmellate e gelatine');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1702,'Cibo, bevande e tabacco > Alimenti > Intingoli e spalmabili > Salsa');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6784,'Cibo, bevande e tabacco > Alimenti > Intingoli e spalmabili > Tapenade');
insert into GOOGLE_CATEGORY (codice,descrizione) values(433,'Cibo, bevande e tabacco > Alimenti > Noci e semi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(434,'Cibo, bevande e tabacco > Alimenti > Pasta e tagliatelle');
insert into GOOGLE_CATEGORY (codice,descrizione) values(428,'Cibo, bevande e tabacco > Alimenti > Prodotti caseari');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5827,'Cibo, bevande e tabacco > Alimenti > Prodotti caseari > Burro e margarina');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5786,'Cibo, bevande e tabacco > Alimenti > Prodotti caseari > Crema');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4418,'Cibo, bevande e tabacco > Alimenti > Prodotti caseari > Cremina per caffè');
insert into GOOGLE_CATEGORY (codice,descrizione) values(429,'Cibo, bevande e tabacco > Alimenti > Prodotti caseari > Formaggio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5787,'Cibo, bevande e tabacco > Alimenti > Prodotti caseari > Panna acida');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6821,'Cibo, bevande e tabacco > Alimenti > Prodotti caseari > Panna montata');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1855,'Cibo, bevande e tabacco > Alimenti > Prodotti caseari > Ricotta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1954,'Cibo, bevande e tabacco > Alimenti > Prodotti caseari > Yogurt');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1876,'Cibo, bevande e tabacco > Alimenti > Prodotti da forno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1573,'Cibo, bevande e tabacco > Alimenti > Prodotti da forno > Bagel');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2229,'Cibo, bevande e tabacco > Alimenti > Prodotti da forno > Biscotti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5751,'Cibo, bevande e tabacco > Alimenti > Prodotti da forno > Ciambelle');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5790,'Cibo, bevande e tabacco > Alimenti > Prodotti da forno > Coni per gelati');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6195,'Cibo, bevande e tabacco > Alimenti > Prodotti da forno > Cupcake');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5054,'Cibo, bevande e tabacco > Alimenti > Prodotti da forno > Fudge');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1895,'Cibo, bevande e tabacco > Alimenti > Prodotti da forno > Muffin');
insert into GOOGLE_CATEGORY (codice,descrizione) values(424,'Cibo, bevande e tabacco > Alimenti > Prodotti da forno > Pane e focacce');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5750,'Cibo, bevande e tabacco > Alimenti > Prodotti da forno > Pasticcini e focaccine da tè');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5904,'Cibo, bevande e tabacco > Alimenti > Prodotti da forno > Prodotti da forno assortiti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6196,'Cibo, bevande e tabacco > Alimenti > Prodotti da forno > Torte al caffè');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5749,'Cibo, bevande e tabacco > Alimenti > Prodotti da forno > Torte e crostate');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2194,'Cibo, bevande e tabacco > Alimenti > Prodotti da forno > Torte e dessert');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5748,'Cibo, bevande e tabacco > Alimenti > Prodotti da forno > Tortilla e involti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6891,'Cibo, bevande e tabacco > Alimenti > Prodotti da forno > Tortillas per taco');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5788,'Cibo, bevande e tabacco > Alimenti > Semifreddi e gelati');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6873,'Cibo, bevande e tabacco > Alimenti > Semifreddi e gelati > Gelati confezionati');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499991,'Cibo, bevande e tabacco > Alimenti > Semifreddi e gelati > Gelato e yogurt gelato');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5789,'Cibo, bevande e tabacco > Alimenti > Semifreddi e gelati > Ghiaccioli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(423,'Cibo, bevande e tabacco > Alimenti > Stuzzichini e snack');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5747,'Cibo, bevande e tabacco > Alimenti > Stuzzichini e snack > Barrette di cereali e muesli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7427,'Cibo, bevande e tabacco > Alimenti > Stuzzichini e snack > Bastoncini di sesamo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6192,'Cibo, bevande e tabacco > Alimenti > Stuzzichini e snack > Bignè al formaggio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3284,'Cibo, bevande e tabacco > Alimenti > Stuzzichini e snack > Carne essiccata');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6194,'Cibo, bevande e tabacco > Alimenti > Stuzzichini e snack > Cotiche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1445,'Cibo, bevande e tabacco > Alimenti > Stuzzichini e snack > Cracker');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5746,'Cibo, bevande e tabacco > Alimenti > Stuzzichini e snack > Crostini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7327,'Cibo, bevande e tabacco > Alimenti > Stuzzichini e snack > Gallette di riso');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2432,'Cibo, bevande e tabacco > Alimenti > Stuzzichini e snack > Gallette di riso soffiato');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7159,'Cibo, bevande e tabacco > Alimenti > Stuzzichini e snack > Grissini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6847,'Cibo, bevande e tabacco > Alimenti > Stuzzichini e snack > Guarnizioni per insalata');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5745,'Cibo, bevande e tabacco > Alimenti > Stuzzichini e snack > Muesli e affini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2392,'Cibo, bevande e tabacco > Alimenti > Stuzzichini e snack > Patatine');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1534,'Cibo, bevande e tabacco > Alimenti > Stuzzichini e snack > Popcorn');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3446,'Cibo, bevande e tabacco > Alimenti > Stuzzichini e snack > Pretzel');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5744,'Cibo, bevande e tabacco > Alimenti > Stuzzichini e snack > Snack di frutta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5743,'Cibo, bevande e tabacco > Alimenti > Stuzzichini e snack > Snack di gelatina e budini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6785,'Cibo, bevande e tabacco > Alimenti > Stuzzichini e snack > Torte glassate');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5807,'Cibo, bevande e tabacco > Alimenti > Tofu e prodotti di soia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6839,'Cibo, bevande e tabacco > Alimenti > Tofu e prodotti di soia > Alternative al formaggio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6843,'Cibo, bevande e tabacco > Alimenti > Tofu e prodotti di soia > Alternative alla carne');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5808,'Cibo, bevande e tabacco > Alimenti > Tofu e prodotti di soia > Seitan');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5810,'Cibo, bevande e tabacco > Alimenti > Tofu e prodotti di soia > Tempeh');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5809,'Cibo, bevande e tabacco > Alimenti > Tofu e prodotti di soia > Tofu');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2423,'Cibo, bevande e tabacco > Alimenti > Zuppe e consommé');
insert into GOOGLE_CATEGORY (codice,descrizione) values(413,'Cibo, bevande e tabacco > Bevande');
insert into GOOGLE_CATEGORY (codice,descrizione) values(420,'Cibo, bevande e tabacco > Bevande > Acqua');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7528,'Cibo, bevande e tabacco > Bevande > Bevande a base di aceto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8036,'Cibo, bevande e tabacco > Bevande > Bevande al sapore di frutta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499676,'Cibo, bevande e tabacco > Bevande > Bevande alcoliche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7486,'Cibo, bevande e tabacco > Bevande > Bevande alcoliche > Amari');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5887,'Cibo, bevande e tabacco > Bevande > Bevande alcoliche > Bevande alcoliche aromatizzate');
insert into GOOGLE_CATEGORY (codice,descrizione) values(414,'Cibo, bevande e tabacco > Bevande > Bevande alcoliche > Birra');
insert into GOOGLE_CATEGORY (codice,descrizione) values(417,'Cibo, bevande e tabacco > Bevande > Bevande alcoliche > Liquidi e alcolici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505761,'Cibo, bevande e tabacco > Bevande > Bevande alcoliche > Liquidi e alcolici > Assenzio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2364,'Cibo, bevande e tabacco > Bevande > Bevande alcoliche > Liquidi e alcolici > Brandy');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1671,'Cibo, bevande e tabacco > Bevande > Bevande alcoliche > Liquidi e alcolici > Gin');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2933,'Cibo, bevande e tabacco > Bevande > Bevande alcoliche > Liquidi e alcolici > Liquori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2605,'Cibo, bevande e tabacco > Bevande > Bevande alcoliche > Liquidi e alcolici > Rum');
insert into GOOGLE_CATEGORY (codice,descrizione) values(502976,'Cibo, bevande e tabacco > Bevande > Bevande alcoliche > Liquidi e alcolici > Shochu e soju');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2220,'Cibo, bevande e tabacco > Bevande > Bevande alcoliche > Liquidi e alcolici > Tequila');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2107,'Cibo, bevande e tabacco > Bevande > Bevande alcoliche > Liquidi e alcolici > Vodka');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1926,'Cibo, bevande e tabacco > Bevande > Bevande alcoliche > Liquidi e alcolici > Whisky');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5725,'Cibo, bevande e tabacco > Bevande > Bevande alcoliche > Mix per cocktail');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6761,'Cibo, bevande e tabacco > Bevande > Bevande alcoliche > Sidro');
insert into GOOGLE_CATEGORY (codice,descrizione) values(421,'Cibo, bevande e tabacco > Bevande > Bevande alcoliche > Vino');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8030,'Cibo, bevande e tabacco > Bevande > Bevande allo zabaione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2628,'Cibo, bevande e tabacco > Bevande > Bibite gassate');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1868,'Cibo, bevande e tabacco > Bevande > Caffè');
insert into GOOGLE_CATEGORY (codice,descrizione) values(415,'Cibo, bevande e tabacco > Bevande > Cioccolata calda');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5723,'Cibo, bevande e tabacco > Bevande > Energy drink e bevande per lo sport');
insert into GOOGLE_CATEGORY (codice,descrizione) values(418,'Cibo, bevande e tabacco > Bevande > Latte');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5724,'Cibo, bevande e tabacco > Bevande > Latte vegetale');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6848,'Cibo, bevande e tabacco > Bevande > Miscele bevande');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6797,'Cibo, bevande e tabacco > Bevande > Siero del latte');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2887,'Cibo, bevande e tabacco > Bevande > Succo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2073,'Cibo, bevande e tabacco > Bevande > Tè e infusi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(435,'Cibo, bevande e tabacco > Tabacco');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499963,'Cibo, bevande e tabacco > Tabacco > Pipe da tabacco');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3151,'Cibo, bevande e tabacco > Tabacco > Sigarette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4091,'Cibo, bevande e tabacco > Tabacco > Sigarette elettroniche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3682,'Cibo, bevande e tabacco > Tabacco > Sigari');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3916,'Cibo, bevande e tabacco > Tabacco > Tabacco da masticare');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3741,'Cibo, bevande e tabacco > Tabacco > Tabacco sfuso');
insert into GOOGLE_CATEGORY (codice,descrizione) values(111,'Commercio e industria');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8025,'Commercio e industria > Accessori per lo stoccaggio industriale');
insert into GOOGLE_CATEGORY (codice,descrizione) values(112,'Commercio e industria > Agricoltura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6991,'Commercio e industria > Agricoltura > Zootecnia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499946,'Commercio e industria > Agricoltura > Zootecnia > Cavezze per bestiame');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499997,'Commercio e industria > Agricoltura > Zootecnia > Incubatrici di uova');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6990,'Commercio e industria > Agricoltura > Zootecnia > Mangiatoie e abbeveratoi per bestiame');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505821,'Commercio e industria > Agricoltura > Zootecnia > Mangime per bestiame');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1475,'Commercio e industria > Alberghi e ospitalità');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2047,'Commercio e industria > Attrezzature protettive');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8269,'Commercio e industria > Attrezzature protettive > Accessori per maschere antigas e respiratori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2723,'Commercio e industria > Attrezzature protettive > Caschi protettivi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7085,'Commercio e industria > Attrezzature protettive > Cinghie per la sicurezza sul lavoro');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499927,'Commercio e industria > Attrezzature protettive > Elmetti protettivi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499961,'Commercio e industria > Attrezzature protettive > Ginocchiere di sicurezza');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2389,'Commercio e industria > Attrezzature protettive > Giubbotti anti-proiettile');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6764,'Commercio e industria > Attrezzature protettive > Grembiuli protettivi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5591,'Commercio e industria > Attrezzature protettive > Guanti di protezione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499708,'Commercio e industria > Attrezzature protettive > Imbragature per la sicurezza sul lavoro');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503724,'Commercio e industria > Attrezzature protettive > Mascherine protettive');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2473,'Commercio e industria > Attrezzature protettive > Mascherine protettive > Maschere antigas e respiratori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7407,'Commercio e industria > Attrezzature protettive > Mascherine protettive > Maschere antipolvere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2349,'Commercio e industria > Attrezzature protettive > Mascherine protettive > Maschere per pompieri');
insert into GOOGLE_CATEGORY (codice,descrizione) values(513,'Commercio e industria > Attrezzature protettive > Mascherine protettive > Mascherine sanitarie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2227,'Commercio e industria > Attrezzature protettive > Occhiali protettivi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2808,'Commercio e industria > Attrezzature protettive > Tute materiali pericolosi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500086,'Commercio e industria > Carrelli e carretti per pulizie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2155,'Commercio e industria > Cinema e televisione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7261,'Commercio e industria > Componenti di controllo dell \'automazione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7263,'Commercio e industria > Componenti di controllo dell \'automazione > Controller logici programmabili');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7262,'Commercio e industria > Componenti di controllo dell \'automazione > Variatori di velocità regolabili e a frequenza variabile');
insert into GOOGLE_CATEGORY (codice,descrizione) values(114,'Commercio e industria > Costruzione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8278,'Commercio e industria > Costruzione > Coni stradali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(134,'Commercio e industria > Costruzione > Perizie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2187,'Commercio e industria > Estrazione e cave');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1813,'Commercio e industria > Finanza e assicurazione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7565,'Commercio e industria > Finanza e assicurazione > Lingotti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1556,'Commercio e industria > Imposizione della legge');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1906,'Commercio e industria > Imposizione della legge > Manette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(361,'Commercio e industria > Imposizione della legge > Metal detector');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1795,'Commercio e industria > Macchinari pesanti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2072,'Commercio e industria > Macchinari pesanti > Truciolatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2496,'Commercio e industria > Medicina');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6490,'Commercio e industria > Medicina > Apparecchiature formative per medici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6491,'Commercio e industria > Medicina > Apparecchiature formative per medici > Manichini di addestramento per rianimazione o salvataggio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3477,'Commercio e industria > Medicina > Apparecchiature mediche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6714,'Commercio e industria > Medicina > Apparecchiature mediche > Accessori per monitor di parametri vitali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503006,'Commercio e industria > Medicina > Apparecchiature mediche > Cinture per deambulazione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3230,'Commercio e industria > Medicina > Apparecchiature mediche > Defibrillatori esterni automatici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6972,'Commercio e industria > Medicina > Apparecchiature mediche > Diapason e martelletti per riflessi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499858,'Commercio e industria > Medicina > Apparecchiature mediche > Lettighe e barelle');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6280,'Commercio e industria > Medicina > Apparecchiature mediche > Monitor per i segni vitali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4245,'Commercio e industria > Medicina > Apparecchiature mediche > Otoscopi e oftalmoscopi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7522,'Commercio e industria > Medicina > Apparecchiature mediche > Sollevatori per pazienti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4364,'Commercio e industria > Medicina > Apparecchiature mediche > Stetoscopi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5167,'Commercio e industria > Medicina > Arredamento medico');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5171,'Commercio e industria > Medicina > Arredamento medico > Carrelli distribuzione farmaci');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5174,'Commercio e industria > Medicina > Arredamento medico > Carrelli distribuzione farmaci > Aste e carrelli portaflebo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5173,'Commercio e industria > Medicina > Arredamento medico > Carrelli distribuzione farmaci > Carrelli di emergenza');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4435,'Commercio e industria > Medicina > Arredamento medico > Letti per assistenza domiciliare e ospedaliera');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5168,'Commercio e industria > Medicina > Arredamento medico > Lettini da chiropratica');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5170,'Commercio e industria > Medicina > Arredamento medico > Mobiletti dei medicinali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5169,'Commercio e industria > Medicina > Arredamento medico > Poltrone e lettini per visite');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5172,'Commercio e industria > Medicina > Arredamento medico > Tavoli chirurgici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6303,'Commercio e industria > Medicina > Biancheria da letto medica');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1645,'Commercio e industria > Medicina > Camici chirurgici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1898,'Commercio e industria > Medicina > Camici da ospedale');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5602,'Commercio e industria > Medicina > Copricapo chirurgici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2907,'Commercio e industria > Medicina > Prodotti medici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7324,'Commercio e industria > Medicina > Prodotti medici > Abbassalingua');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499696,'Commercio e industria > Medicina > Prodotti medici > Aghi e siringhe');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7063,'Commercio e industria > Medicina > Prodotti medici > Ditali igienici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(511,'Commercio e industria > Medicina > Prodotti medici > Guanti monouso');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505828,'Commercio e industria > Medicina > Prodotti medici > Materiali per stomia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2928,'Commercio e industria > Medicina > Prodotti per lavaggio mani');
insert into GOOGLE_CATEGORY (codice,descrizione) values(230913,'Commercio e industria > Medicina > Strumenti medici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499935,'Commercio e industria > Medicina > Strumenti medici > Aghi e suture chirurgici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6281,'Commercio e industria > Medicina > Strumenti medici > Forcipi medici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(232166,'Commercio e industria > Medicina > Strumenti medici > Lame per scalpelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8026,'Commercio e industria > Medicina > Strumenti medici > Scalpelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6275,'Commercio e industria > Medicina > Tende ospedaliere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6987,'Commercio e industria > Movimentazione di materiali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(131,'Commercio e industria > Movimentazione di materiali > Elevatori e paranchi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503772,'Commercio e industria > Movimentazione di materiali > Elevatori e paranchi > Argani');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503771,'Commercio e industria > Movimentazione di materiali > Elevatori e paranchi > Cric e carrelli elevatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503767,'Commercio e industria > Movimentazione di materiali > Elevatori e paranchi > Elevatori per personale');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503768,'Commercio e industria > Movimentazione di materiali > Elevatori e paranchi > Paranchi, gru e carrelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503769,'Commercio e industria > Movimentazione di materiali > Elevatori e paranchi > Pulegge, bozzelli e dischi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6988,'Commercio e industria > Movimentazione di materiali > Nastri trasportatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503011,'Commercio e industria > Movimentazione di materiali > Pianali di carico e pallet');
insert into GOOGLE_CATEGORY (codice,descrizione) values(138,'Commercio e industria > Negozi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4181,'Commercio e industria > Negozi > Gestione del denaro');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505825,'Commercio e industria > Negozi > Gestione del denaro > Accessori per terminali POS e registratori di cassa');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4283,'Commercio e industria > Negozi > Gestione del denaro > Accessori per terminali POS e registratori di cassa > Cassetti per contanti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5310,'Commercio e industria > Negozi > Gestione del denaro > Accessori per terminali POS e registratori di cassa > Dispositivi di firma digitale');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505808,'Commercio e industria > Negozi > Gestione del denaro > Accessori per terminali POS e registratori di cassa > Terminali per carte di credito');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4329,'Commercio e industria > Negozi > Gestione del denaro > Borse per deposito denaro');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3273,'Commercio e industria > Negozi > Gestione del denaro > Cambiavalute');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4151,'Commercio e industria > Negozi > Gestione del denaro > Contamonete e contabanconote');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4055,'Commercio e industria > Negozi > Gestione del denaro > Involucri di carta per monete e fascette banconote');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505824,'Commercio e industria > Negozi > Gestione del denaro > Terminali POS e registratori di cassa');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4290,'Commercio e industria > Negozi > Gestione del denaro > Verificatori di banconote');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3803,'Commercio e industria > Negozi > Manichini da vetrina');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499897,'Commercio e industria > Negozi > Modelli ed espositori per vendita al dettaglio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7128,'Commercio e industria > Negozi > Parti di manichini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4127,'Commercio e industria > Negozi > Prezzatrici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4244,'Commercio e industria > Negozi > Rastrelliere appendiabiti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1837,'Commercio e industria > Negozi > Sacchetti di carta e plastica');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4160,'Commercio e industria > Negozi > Vetrine per esposizioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7497,'Commercio e industria > Odontoiatria');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7500,'Commercio e industria > Odontoiatria > Cemento dentale');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8130,'Commercio e industria > Odontoiatria > Pasta per profilassi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7499,'Commercio e industria > Odontoiatria > Strumenti da dentista');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8121,'Commercio e industria > Odontoiatria > Strumenti da dentista > Coppette per profilassi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8490,'Commercio e industria > Odontoiatria > Strumenti da dentista > Dappen');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7531,'Commercio e industria > Odontoiatria > Strumenti da dentista > Set di strumenti da dentista');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7498,'Commercio e industria > Odontoiatria > Strumenti da dentista > Specchi da dentista');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8120,'Commercio e industria > Odontoiatria > Strumenti da dentista > Testine per profilassi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7240,'Commercio e industria > Parruccheria e cosmetologia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505670,'Commercio e industria > Parruccheria e cosmetologia > Mantelle e copricollo da parrucchiera');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7241,'Commercio e industria > Parruccheria e cosmetologia > Poltrone per salone di bellezza');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7242,'Commercio e industria > Parruccheria e cosmetologia > Sedie per pedicure');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4285,'Commercio e industria > Piercing e tatuaggi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4350,'Commercio e industria > Piercing e tatuaggi > Prodotti per piercing');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4122,'Commercio e industria > Piercing e tatuaggi > Prodotti per piercing > Aghi per piercing');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4326,'Commercio e industria > Piercing e tatuaggi > Prodotti per tatuaggi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4072,'Commercio e industria > Piercing e tatuaggi > Prodotti per tatuaggi > Aghi per tatuaggi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5853,'Commercio e industria > Piercing e tatuaggi > Prodotti per tatuaggi > Coperture tatuaggi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4215,'Commercio e industria > Piercing e tatuaggi > Prodotti per tatuaggi > Inchiostri per tatuaggi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4379,'Commercio e industria > Piercing e tatuaggi > Prodotti per tatuaggi > Macchinette per tatuaggi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1470,'Commercio e industria > Produzione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5863,'Commercio e industria > Pubblicità e marketing');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5864,'Commercio e industria > Pubblicità e marketing > Banconi per fiere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5884,'Commercio e industria > Pubblicità e marketing > Brochure');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5865,'Commercio e industria > Pubblicità e marketing > Pannelli espositivi per fiere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(135,'Commercio e industria > Ristorazione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7553,'Commercio e industria > Ristorazione > Brasiere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4742,'Commercio e industria > Ristorazione > Carrelli per alimenti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4096,'Commercio e industria > Ristorazione > Cestini di plastica per alimenti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5097,'Commercio e industria > Ristorazione > Contenitori cibo da asporto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7353,'Commercio e industria > Ristorazione > Contenitori per il ghiaccio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5102,'Commercio e industria > Ristorazione > Contenitori ristorazione in concessione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8059,'Commercio e industria > Ristorazione > Coperchi usa e getta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7088,'Commercio e industria > Ristorazione > Coperti monouso');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7089,'Commercio e industria > Ristorazione > Coperti monouso > Vassoi monouso');
insert into GOOGLE_CATEGORY (codice,descrizione) values(137,'Commercio e industria > Ristorazione > Distributori automatici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6786,'Commercio e industria > Ristorazione > Lavatrici ed essicatori per alimenti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6517,'Commercio e industria > Ristorazione > Macchine per hot dog');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8533,'Commercio e industria > Ristorazione > Parafiato');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4632,'Commercio e industria > Ristorazione > Piatti e posate usa e getta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5101,'Commercio e industria > Ristorazione > Piatti e posate usa e getta > Piatti usa e getta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5100,'Commercio e industria > Ristorazione > Piatti e posate usa e getta > Posate usa e getta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5098,'Commercio e industria > Ristorazione > Piatti e posate usa e getta > Recipienti usa e getta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5099,'Commercio e industria > Ristorazione > Piatti e posate usa e getta > Tazze usa e getta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8532,'Commercio e industria > Ristorazione > Porta conto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5104,'Commercio e industria > Ristorazione > Scaldapiatti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7303,'Commercio e industria > Ristorazione > Scatole da panetteria');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4217,'Commercio e industria > Ristorazione > Vaschette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1624,'Commercio e industria > Scienza e laboratorio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4255,'Commercio e industria > Scienza e laboratorio > Articoli da laboratorio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4310,'Commercio e industria > Scienza e laboratorio > Articoli da laboratorio > Becher');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4036,'Commercio e industria > Scienza e laboratorio > Articoli da laboratorio > Beute da laboratorio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4061,'Commercio e industria > Scienza e laboratorio > Articoli da laboratorio > Cilindri graduati');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4276,'Commercio e industria > Scienza e laboratorio > Articoli da laboratorio > Piastre di Petri');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4075,'Commercio e industria > Scienza e laboratorio > Articoli da laboratorio > Pipette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4155,'Commercio e industria > Scienza e laboratorio > Articoli da laboratorio > Portaprovette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4306,'Commercio e industria > Scienza e laboratorio > Articoli da laboratorio > Provette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4140,'Commercio e industria > Scienza e laboratorio > Articoli da laboratorio > Spruzzette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8119,'Commercio e industria > Scienza e laboratorio > Campioni di laboratorio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7325,'Commercio e industria > Scienza e laboratorio > Kit di dissezione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6975,'Commercio e industria > Scienza e laboratorio > Prodotti biochimici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3002,'Commercio e industria > Scienza e laboratorio > Prodotti chimici laboratorio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4335,'Commercio e industria > Scienza e laboratorio > Strumenti da laboratorio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4555,'Commercio e industria > Scienza e laboratorio > Strumenti da laboratorio > Accessori per microscopio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4557,'Commercio e industria > Scienza e laboratorio > Strumenti da laboratorio > Accessori per microscopio > Fotocamere per microscopio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4664,'Commercio e industria > Scienza e laboratorio > Strumenti da laboratorio > Accessori per microscopio > Lampade per microscopio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4665,'Commercio e industria > Scienza e laboratorio > Strumenti da laboratorio > Accessori per microscopio > Obiettivi per microscopio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4556,'Commercio e industria > Scienza e laboratorio > Strumenti da laboratorio > Accessori per microscopio > Oculari e adattatori microscopio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4558,'Commercio e industria > Scienza e laboratorio > Strumenti da laboratorio > Accessori per microscopio > Vetrini per microscopio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7468,'Commercio e industria > Scienza e laboratorio > Strumenti da laboratorio > Accessori per spettrometro');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4474,'Commercio e industria > Scienza e laboratorio > Strumenti da laboratorio > Agitatori da laboratorio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4116,'Commercio e industria > Scienza e laboratorio > Strumenti da laboratorio > Autoclavi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4336,'Commercio e industria > Scienza e laboratorio > Strumenti da laboratorio > Centrifughe');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500114,'Commercio e industria > Scienza e laboratorio > Strumenti da laboratorio > Congelatori da laboratorio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4231,'Commercio e industria > Scienza e laboratorio > Strumenti da laboratorio > Forni da laboratorio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503722,'Commercio e industria > Scienza e laboratorio > Strumenti da laboratorio > Imbuti da laboratorio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7218,'Commercio e industria > Scienza e laboratorio > Strumenti da laboratorio > Macchine per ghiaccio secco');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500057,'Commercio e industria > Scienza e laboratorio > Strumenti da laboratorio > Macchine per il ghiaccio secco');
insert into GOOGLE_CATEGORY (codice,descrizione) values(158,'Commercio e industria > Scienza e laboratorio > Strumenti da laboratorio > Microscopi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7437,'Commercio e industria > Scienza e laboratorio > Strumenti da laboratorio > Microtomi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4133,'Commercio e industria > Scienza e laboratorio > Strumenti da laboratorio > Piastre da laboratorio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7393,'Commercio e industria > Scienza e laboratorio > Strumenti da laboratorio > Spettrometri');
insert into GOOGLE_CATEGORY (codice,descrizione) values(976,'Commercio e industria > Segnaletica');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7322,'Commercio e industria > Segnaletica > Cartelli con orario di apertura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7323,'Commercio e industria > Segnaletica > Cartelli di aperto/chiuso');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8155,'Commercio e industria > Segnaletica > Cartelli digitali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5898,'Commercio e industria > Segnaletica > Insegne di negozi e punti vendita al dettaglio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4297,'Commercio e industria > Segnaletica > Insegne elettriche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4131,'Commercio e industria > Segnaletica > Insegne elettriche > Insegne a LED');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4070,'Commercio e industria > Segnaletica > Insegne elettriche > Insegne al neon');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5894,'Commercio e industria > Segnaletica > Segnaletica di emergenza e di uscita');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5893,'Commercio e industria > Segnaletica > Segnaletica di sicurezza');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5899,'Commercio e industria > Segnaletica > Segnaletica per marciapiedi e cortili');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5895,'Commercio e industria > Segnaletica > Segnaletica stradale e del traffico');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5897,'Commercio e industria > Segnaletica > Segnali di identificazione luoghi di interesse');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5896,'Commercio e industria > Segnaletica > Segnali di parcheggio e permessi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5900,'Commercio e industria > Segnaletica > Segnali di regolamento');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5892,'Commercio e industria > Segnaletica > Segnali di sicurezza e avviso');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1827,'Commercio e industria > Selvicoltura e tagli alberi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5830,'Commercio e industria > Stoccaggio industriale');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5832,'Commercio e industria > Stoccaggio industriale > Armadi industriali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5831,'Commercio e industria > Stoccaggio industriale > Container per spedizioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8274,'Commercio e industria > Stoccaggio industriale > Porte, divisori e recinti in rete metallica');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5833,'Commercio e industria > Stoccaggio industriale > Scaffalature industriali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(222,'Dispositivi elettronici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1270,'Dispositivi elettronici > Accessori console videogiochi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1505,'Dispositivi elettronici > Accessori console videogiochi > Accessori console di gioco');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2070,'Dispositivi elettronici > Accessori console videogiochi > Accessori console portatili');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2082,'Dispositivi elettronici > Accessori dispositivi elettronici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5476,'Dispositivi elettronici > Accessori dispositivi elettronici > Accessori per antenna');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6016,'Dispositivi elettronici > Accessori dispositivi elettronici > Accessori per antenna > LNB satellitari');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5478,'Dispositivi elettronici > Accessori dispositivi elettronici > Accessori per antenna > Rotatori per antenna');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5477,'Dispositivi elettronici > Accessori dispositivi elettronici > Accessori per antenna > Supporti e staffe antenne');
insert into GOOGLE_CATEGORY (codice,descrizione) values(279,'Dispositivi elettronici > Accessori dispositivi elettronici > Accessori per computer');
insert into GOOGLE_CATEGORY (codice,descrizione) values(280,'Dispositivi elettronici > Accessori dispositivi elettronici > Accessori per computer > Accessori dispositivi portatili');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4736,'Dispositivi elettronici > Accessori dispositivi elettronici > Accessori per computer > Accessori dispositivi portatili > Accessori E-Book reader');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4738,'Dispositivi elettronici > Accessori dispositivi elettronici > Accessori per computer > Accessori dispositivi portatili > Accessori E-Book reader > Custodie E-Book reader');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4737,'Dispositivi elettronici > Accessori dispositivi elettronici > Accessori per computer > Accessori dispositivi portatili > Accessori PDA');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4739,'Dispositivi elettronici > Accessori dispositivi elettronici > Accessori per computer > Accessori dispositivi portatili > Accessori PDA > Custodie per PDA');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5489,'Dispositivi elettronici > Accessori dispositivi elettronici > Accessori per computer > Alzate e supporti per computer');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7530,'Dispositivi elettronici > Accessori dispositivi elettronici > Accessori per computer > Cover e protezioni per computer');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499956,'Dispositivi elettronici > Accessori dispositivi elettronici > Accessori per computer > Dock e supporti per tablet');
insert into GOOGLE_CATEGORY (codice,descrizione) values(300,'Dispositivi elettronici > Accessori dispositivi elettronici > Accessori per computer > Docking station laptop');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5308,'Dispositivi elettronici > Accessori dispositivi elettronici > Accessori per computer > Penne stylus');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6291,'Dispositivi elettronici > Accessori dispositivi elettronici > Accessori per computer > Poggiapolsi per tastiera e mouse');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500040,'Dispositivi elettronici > Accessori dispositivi elettronici > Accessori per computer > Set di accessori per computer');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6979,'Dispositivi elettronici > Accessori dispositivi elettronici > Accessori per computer > Supporti per tastiera');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1993,'Dispositivi elettronici > Accessori dispositivi elettronici > Accessori per computer > Tappetini per il mouse');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5669,'Dispositivi elettronici > Accessori dispositivi elettronici > Accessori per computer > pennini e ricariche per penne stilografiche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3422,'Dispositivi elettronici > Accessori dispositivi elettronici > Accessori per memoria');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3672,'Dispositivi elettronici > Accessori dispositivi elettronici > Accessori per memoria > Custodie memoria');
insert into GOOGLE_CATEGORY (codice,descrizione) values(258,'Dispositivi elettronici > Accessori dispositivi elettronici > Adattatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7182,'Dispositivi elettronici > Accessori dispositivi elettronici > Adattatori > Adattatori USB');
insert into GOOGLE_CATEGORY (codice,descrizione) values(146,'Dispositivi elettronici > Accessori dispositivi elettronici > Adattatori > Adattatori di schede di memoria');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4463,'Dispositivi elettronici > Accessori dispositivi elettronici > Adattatori > Adattatori e accoppiatori audio e video');
insert into GOOGLE_CATEGORY (codice,descrizione) values(275,'Dispositivi elettronici > Accessori dispositivi elettronici > Alimentatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1375,'Dispositivi elettronici > Accessori dispositivi elettronici > Alimentatori > Accessori UPS');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7166,'Dispositivi elettronici > Accessori dispositivi elettronici > Alimentatori > Accessori batteria');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7167,'Dispositivi elettronici > Accessori dispositivi elettronici > Alimentatori > Accessori batteria > Caricabatteria universali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3130,'Dispositivi elettronici > Accessori dispositivi elettronici > Alimentatori > Accessori batteria > Caricabatterie fotocamera');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8243,'Dispositivi elettronici > Accessori dispositivi elettronici > Alimentatori > Accessori batteria > Contenitori per batterie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6817,'Dispositivi elettronici > Accessori dispositivi elettronici > Alimentatori > Accessori batteria > Sistemi per controllare la carica delle batterie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499928,'Dispositivi elettronici > Accessori dispositivi elettronici > Alimentatori > Accessori batteria > Tester di batterie generici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6933,'Dispositivi elettronici > Accessori dispositivi elettronici > Alimentatori > Accessori per caricabatteria e adattatori di corrente');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7135,'Dispositivi elettronici > Accessori dispositivi elettronici > Alimentatori > Adattatori da viaggio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505295,'Dispositivi elettronici > Accessori dispositivi elettronici > Alimentatori > Caricabatteria e adattatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2978,'Dispositivi elettronici > Accessori dispositivi elettronici > Alimentatori > Celle a combustibile');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3160,'Dispositivi elettronici > Accessori dispositivi elettronici > Alimentatori > Ciabatte e soppressori di sovratensione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5274,'Dispositivi elettronici > Accessori dispositivi elettronici > Alimentatori > Contenitori per gruppi elettrogeni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5380,'Dispositivi elettronici > Accessori dispositivi elettronici > Alimentatori > Dispositivi di protezione contro le sovratensioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(276,'Dispositivi elettronici > Accessori dispositivi elettronici > Alimentatori > Pile');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5133,'Dispositivi elettronici > Accessori dispositivi elettronici > Alimentatori > Pile > Batterie PDA');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6289,'Dispositivi elettronici > Accessori dispositivi elettronici > Alimentatori > Pile > Batterie UPS');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1745,'Dispositivi elettronici > Accessori dispositivi elettronici > Alimentatori > Pile > Batterie cellulari');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4928,'Dispositivi elettronici > Accessori dispositivi elettronici > Alimentatori > Pile > Batterie multiuso');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500117,'Dispositivi elettronici > Accessori dispositivi elettronici > Alimentatori > Pile > Batterie per controller e console per videogiochi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1880,'Dispositivi elettronici > Accessori dispositivi elettronici > Alimentatori > Pile > Batterie per cordless');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499810,'Dispositivi elettronici > Accessori dispositivi elettronici > Alimentatori > Pile > Batterie per lettori MP3');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7551,'Dispositivi elettronici > Accessori dispositivi elettronici > Alimentatori > Pile > Batterie per lettori di e-book');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1564,'Dispositivi elettronici > Accessori dispositivi elettronici > Alimentatori > Pile > Batterie per portatili');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7438,'Dispositivi elettronici > Accessori dispositivi elettronici > Alimentatori > Pile > Batterie per tablet');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2222,'Dispositivi elettronici > Accessori dispositivi elettronici > Alimentatori > Pile > Batterie per telecamere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1722,'Dispositivi elettronici > Accessori dispositivi elettronici > Alimentatori > Pile > Pile per fotocamera');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1348,'Dispositivi elettronici > Accessori dispositivi elettronici > Alimentatori > Unità backup batteria');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6790,'Dispositivi elettronici > Accessori dispositivi elettronici > Alimentatori > Unità di controllo della potenza');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5473,'Dispositivi elettronici > Accessori dispositivi elettronici > Amplificatori di segnale');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1718,'Dispositivi elettronici > Accessori dispositivi elettronici > Antenne');
insert into GOOGLE_CATEGORY (codice,descrizione) values(259,'Dispositivi elettronici > Accessori dispositivi elettronici > Cavi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3461,'Dispositivi elettronici > Accessori dispositivi elettronici > Cavi > Cavi KVM');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1867,'Dispositivi elettronici > Accessori dispositivi elettronici > Cavi > Cavi audio e video');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1480,'Dispositivi elettronici > Accessori dispositivi elettronici > Cavi > Cavi di rete');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500035,'Dispositivi elettronici > Accessori dispositivi elettronici > Cavi > Cavi per archiviazione e trasferimento di dati');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1763,'Dispositivi elettronici > Accessori dispositivi elettronici > Cavi > Cavi sistemi e alimentazione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3541,'Dispositivi elettronici > Accessori dispositivi elettronici > Cavi > Cavi telefonici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(285,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6475,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Accessori per dispositivi di input');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8008,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Accessori per dispositivi di input > Accessori per controller per videogiochi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500052,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Accessori per dispositivi di input > Accessori per mouse e trackball');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503003,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Accessori per dispositivi di input > Copritasto e tasti per tastiera');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6476,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Accessori per dispositivi di input > Supporti per lettori di codici a barre');
insert into GOOGLE_CATEGORY (codice,descrizione) values(291,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Alimentazione per computer');
insert into GOOGLE_CATEGORY (codice,descrizione) values(292,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > CPU');
insert into GOOGLE_CATEGORY (codice,descrizione) values(296,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Case per server e PC');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6932,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Chassis per blade server');
insert into GOOGLE_CATEGORY (codice,descrizione) values(295,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Componenti di raffreddamento per PC');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8162,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Componenti per lettori di e-book');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8163,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Componenti per lettori di e-book > Schermi sostitutivi per lettori di e-book');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2414,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Dispositivi archiviazione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1623,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Dispositivi archiviazione > Accessori per dischi rigidi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(381,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Dispositivi archiviazione > Accessori per dischi rigidi > Custodie trasporto dischi rigidi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4417,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Dispositivi archiviazione > Accessori per dischi rigidi > Dock per disco rigido');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505767,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Dispositivi archiviazione > Accessori per dischi rigidi > Supporti e contenitori per dischi rigidi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(380,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Dispositivi archiviazione > Dischi rigidi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5268,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Dispositivi archiviazione > Duplicatori di dischi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5271,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Dispositivi archiviazione > Duplicatori di dischi > Duplicatori disco rigido');
insert into GOOGLE_CATEGORY (codice,descrizione) values(376,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Dispositivi archiviazione > Duplicatori di dischi > Duplicatori per CD/DVD');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5112,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Dispositivi archiviazione > Duplicatori di dischi > Duplicatori unità USB');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5272,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Dispositivi archiviazione > Matrici dischi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5269,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Dispositivi archiviazione > Sistemi di archiviazione di rete');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3712,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Dispositivi archiviazione > Unità flash USB');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1301,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Dispositivi archiviazione > Unità floppy');
insert into GOOGLE_CATEGORY (codice,descrizione) values(385,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Dispositivi archiviazione > Unità nastro');
insert into GOOGLE_CATEGORY (codice,descrizione) values(377,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Dispositivi archiviazione > Unità ottiche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1928,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Dispositivi di input');
insert into GOOGLE_CATEGORY (codice,descrizione) values(301,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Dispositivi di input > Controller per giochi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499950,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Dispositivi di input > Dispositivi di input gestuale');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505801,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Dispositivi di input > Lettore di schede');
insert into GOOGLE_CATEGORY (codice,descrizione) values(139,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Dispositivi di input > Lettori di codici a barre');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5366,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Dispositivi di input > Lettori di impronte digitali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3580,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Dispositivi di input > Lettori di schede di memoria');
insert into GOOGLE_CATEGORY (codice,descrizione) values(304,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Dispositivi di input > Mouse e trackball');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5309,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Dispositivi di input > Penne digitali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1562,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Dispositivi di input > Switch KVM');
insert into GOOGLE_CATEGORY (codice,descrizione) values(303,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Dispositivi di input > Tastiere per computer');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4512,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Dispositivi di input > Tastierini numerici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(302,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Dispositivi di input > Tavolette grafiche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(308,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Dispositivi di input > Touchpad');
insert into GOOGLE_CATEGORY (codice,descrizione) values(311,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Hub USB e FireWire');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8158,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Piastre e supporti I/O');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4224,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Ricambi per laptop');
insert into GOOGLE_CATEGORY (codice,descrizione) values(43617,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Ricambi per laptop > Altoparlanti di ricambio per computer portatile');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6416,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Ricambi per laptop > Cardini per laptop');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7501,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Ricambi per laptop > Cavi di ricambio per computer portatile');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4270,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Ricambi per laptop > Custodie e involucri per laptop');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8160,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Ricambi per laptop > Digitalizzatori per computer portatili');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4102,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Ricambi per laptop > Schermi sostitutivi per laptop');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4301,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Ricambi per laptop > Tastiere sostitutive per laptop');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7349,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Ricambi per tablet');
insert into GOOGLE_CATEGORY (codice,descrizione) values(45262,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Ricambi per tablet > Altoparlanti sostituitivi per tablet');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503002,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Ricambi per tablet > Custodie e rivestimenti per tablet');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500013,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Ricambi per tablet > Schermi e digitalizzatori per tablet');
insert into GOOGLE_CATEGORY (codice,descrizione) values(293,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Scaffali e supporti computer');
insert into GOOGLE_CATEGORY (codice,descrizione) values(287,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Schede di espansione per computer');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505299,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Schede di espansione per computer > Adattatori e schede di interfaccia per PC');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503755,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Schede di espansione per computer > Scheda Riser');
insert into GOOGLE_CATEGORY (codice,descrizione) values(286,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Schede di espansione per computer > Schede audio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1487,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Schede di espansione per computer > Schede sintonizzazione e adattatori TV');
insert into GOOGLE_CATEGORY (codice,descrizione) values(297,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Schede di espansione per computer > Schede video');
insert into GOOGLE_CATEGORY (codice,descrizione) values(294,'Dispositivi elettronici > Accessori dispositivi elettronici > Componenti per computer > Starter kit per computer');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5695,'Dispositivi elettronici > Accessori dispositivi elettronici > Disturbatori di segnale');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5612,'Dispositivi elettronici > Accessori dispositivi elettronici > Disturbatori di segnale > Disturbatori di segnale GPS');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5696,'Dispositivi elettronici > Accessori dispositivi elettronici > Disturbatori di segnale > Disturbatori di segnale per telefoni cellulari');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5589,'Dispositivi elettronici > Accessori dispositivi elettronici > Disturbatori di segnale > Radar jammer');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3328,'Dispositivi elettronici > Accessori dispositivi elettronici > Gestione dei cavi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499686,'Dispositivi elettronici > Accessori dispositivi elettronici > Gestione dei cavi > Contrassegni di identificazione per cavi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4016,'Dispositivi elettronici > Accessori dispositivi elettronici > Gestione dei cavi > Laccetti per fili e cavi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6780,'Dispositivi elettronici > Accessori dispositivi elettronici > Gestione dei cavi > Manicotti per cavi e fili');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3764,'Dispositivi elettronici > Accessori dispositivi elettronici > Gestione dei cavi > Morsetti per cavi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5273,'Dispositivi elettronici > Accessori dispositivi elettronici > Gestione dei cavi > Pannelli di permutazione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500036,'Dispositivi elettronici > Accessori dispositivi elettronici > Gestione dei cavi > Pistole per fissaggio cavi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6402,'Dispositivi elettronici > Accessori dispositivi elettronici > Gestione dei cavi > Vassoi per cavi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(288,'Dispositivi elettronici > Accessori dispositivi elettronici > Memoria');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1665,'Dispositivi elettronici > Accessori dispositivi elettronici > Memoria > Memoria cache');
insert into GOOGLE_CATEGORY (codice,descrizione) values(384,'Dispositivi elettronici > Accessori dispositivi elettronici > Memoria > Memoria flash');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3387,'Dispositivi elettronici > Accessori dispositivi elettronici > Memoria > Memoria flash > Schede di memoria flash');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1767,'Dispositivi elettronici > Accessori dispositivi elettronici > Memoria > Memoria video');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1733,'Dispositivi elettronici > Accessori dispositivi elettronici > Memoria > RAM');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2130,'Dispositivi elettronici > Accessori dispositivi elettronici > Memoria > ROM');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5466,'Dispositivi elettronici > Accessori dispositivi elettronici > Pellicole e schermi per dispositivi elettronici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5523,'Dispositivi elettronici > Accessori dispositivi elettronici > Pellicole e schermi per dispositivi elettronici > Adesivi e decalcomanie per dispositivi elettronici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5467,'Dispositivi elettronici > Accessori dispositivi elettronici > Pellicole e schermi per dispositivi elettronici > Filtri privacy');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5468,'Dispositivi elettronici > Accessori dispositivi elettronici > Pellicole e schermi per dispositivi elettronici > Protezioni per schermo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5469,'Dispositivi elettronici > Accessori dispositivi elettronici > Pellicole e schermi per dispositivi elettronici > Protezioni tastiera');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4617,'Dispositivi elettronici > Accessori dispositivi elettronici > Pulizia dispositivi elettronici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8156,'Dispositivi elettronici > Accessori dispositivi elettronici > Splitter e interruttori audio e video');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499944,'Dispositivi elettronici > Accessori dispositivi elettronici > Splitter e interruttori audio e video > Splitter e interruttori DVI');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8164,'Dispositivi elettronici > Accessori dispositivi elettronici > Splitter e interruttori audio e video > Splitter e interruttori HDMI');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499945,'Dispositivi elettronici > Accessori dispositivi elettronici > Splitter e interruttori audio e video > Splitter e interruttori VGA');
insert into GOOGLE_CATEGORY (codice,descrizione) values(367,'Dispositivi elettronici > Accessori dispositivi elettronici > Supporti vergini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(341,'Dispositivi elettronici > Accessori dispositivi elettronici > Telecomandi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499878,'Dispositivi elettronici > Accessori dispositivi elettronici > Treppiedi e monopiedi per telefoni cellulari e tablet');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3895,'Dispositivi elettronici > Accessori per GPS');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3781,'Dispositivi elettronici > Accessori per GPS > Custodie GPS');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3213,'Dispositivi elettronici > Accessori per GPS > Supporti GPS per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3356,'Dispositivi elettronici > Attrezzature giochi arcade');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3946,'Dispositivi elettronici > Attrezzature giochi arcade > Accessori per flipper');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3676,'Dispositivi elettronici > Attrezzature giochi arcade > Accessori strutture videogiochi arcade');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3140,'Dispositivi elettronici > Attrezzature giochi arcade > Flipper');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8085,'Dispositivi elettronici > Attrezzature giochi arcade > Giochi arcade basket');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3681,'Dispositivi elettronici > Attrezzature giochi arcade > Skee-ball');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3117,'Dispositivi elettronici > Attrezzature giochi arcade > Strutture videogiochi arcade');
insert into GOOGLE_CATEGORY (codice,descrizione) values(223,'Dispositivi elettronici > Audio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1420,'Dispositivi elettronici > Audio > Accessori audio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7163,'Dispositivi elettronici > Audio > Accessori audio > Accessori per altoparlante');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8047,'Dispositivi elettronici > Audio > Accessori audio > Accessori per altoparlante > Borse per supporti di altoparlanti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500112,'Dispositivi elettronici > Audio > Accessori audio > Accessori per altoparlante > Custodie e contenitori per altoparlanti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500120,'Dispositivi elettronici > Audio > Accessori audio > Accessori per altoparlante > Kit e componenti per altoparlanti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8049,'Dispositivi elettronici > Audio > Accessori audio > Accessori per altoparlante > Supporti per altoparlanti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500119,'Dispositivi elettronici > Audio > Accessori audio > Accessori per altoparlante > Trasduttori tattili');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505797,'Dispositivi elettronici > Audio > Accessori audio > Accessori per cuffie e auricolari');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503004,'Dispositivi elettronici > Audio > Accessori audio > Accessori per cuffie e auricolari > Gommini e copriauricolari');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2372,'Dispositivi elettronici > Audio > Accessori audio > Accessori per giradischi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(232,'Dispositivi elettronici > Audio > Accessori audio > Accessori per lettori MP3');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3055,'Dispositivi elettronici > Audio > Accessori audio > Accessori per lettori MP3 > Custodie lettori MP3');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7566,'Dispositivi elettronici > Audio > Accessori audio > Accessori per lettori MP3 > Set di accessori per telefoni cellulari e lettori MP3');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3306,'Dispositivi elettronici > Audio > Accessori audio > Accessori per microfoni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503008,'Dispositivi elettronici > Audio > Accessori audio > Accessori per ricevitori audio e video');
insert into GOOGLE_CATEGORY (codice,descrizione) values(239,'Dispositivi elettronici > Audio > Accessori audio > Accessori radio satellitari');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5395,'Dispositivi elettronici > Audio > Accessori audio > Accessori sistema karaoke');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5396,'Dispositivi elettronici > Audio > Accessori audio > Accessori sistema karaoke > Chip karaoke');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3912,'Dispositivi elettronici > Audio > Accessori audio > Aste per microfoni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3727,'Dispositivi elettronici > Audio > Attrezzature da palco');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3242,'Dispositivi elettronici > Audio > Attrezzature da palco > Trasmettitori wireless');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4921,'Dispositivi elettronici > Audio > Audio per DJ e specialisti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4922,'Dispositivi elettronici > Audio > Audio per DJ e specialisti > Lettori CD DJ');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4923,'Dispositivi elettronici > Audio > Audio per DJ e specialisti > Sistemi per DJ');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2165,'Dispositivi elettronici > Audio > Componenti audio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(249,'Dispositivi elettronici > Audio > Componenti audio > Altoparlanti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(224,'Dispositivi elettronici > Audio > Componenti audio > Amplificatori audio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4493,'Dispositivi elettronici > Audio > Componenti audio > Amplificatori audio > Amplificatori auricolari');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5381,'Dispositivi elettronici > Audio > Componenti audio > Amplificatori audio > Amplificatori stereo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505771,'Dispositivi elettronici > Audio > Componenti audio > Cuffie e auricolari');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6546,'Dispositivi elettronici > Audio > Componenti audio > DI box');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6545,'Dispositivi elettronici > Audio > Componenti audio > Fascette canali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505298,'Dispositivi elettronici > Audio > Componenti audio > Kit per studio di registrazione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(234,'Dispositivi elettronici > Audio > Componenti audio > Microfoni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(236,'Dispositivi elettronici > Audio > Componenti audio > Mixer audio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(246,'Dispositivi elettronici > Audio > Componenti audio > Processori di segnale');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5435,'Dispositivi elettronici > Audio > Componenti audio > Processori di segnale > Crossover');
insert into GOOGLE_CATEGORY (codice,descrizione) values(248,'Dispositivi elettronici > Audio > Componenti audio > Processori di segnale > Equalizzatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5596,'Dispositivi elettronici > Audio > Componenti audio > Processori di segnale > Noise gate e compressori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3945,'Dispositivi elettronici > Audio > Componenti audio > Processori di segnale > Preamplificatori microfonici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5369,'Dispositivi elettronici > Audio > Componenti audio > Processori di segnale > Preamplificatori phono');
insert into GOOGLE_CATEGORY (codice,descrizione) values(247,'Dispositivi elettronici > Audio > Componenti audio > Processori di segnale > Processori di effetti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5597,'Dispositivi elettronici > Audio > Componenti audio > Processori di segnale > Sistemi di gestione amplificatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(241,'Dispositivi elettronici > Audio > Componenti audio > Ricevitori audio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5129,'Dispositivi elettronici > Audio > Componenti audio > Trasmettitori audio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5130,'Dispositivi elettronici > Audio > Componenti audio > Trasmettitori audio > Trasmettitori Bluetooth');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4035,'Dispositivi elettronici > Audio > Componenti audio > Trasmettitori audio > Trasmettitori FM');
insert into GOOGLE_CATEGORY (codice,descrizione) values(242,'Dispositivi elettronici > Audio > Lettori e registratori audio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(225,'Dispositivi elettronici > Audio > Lettori e registratori audio > Boombox');
insert into GOOGLE_CATEGORY (codice,descrizione) values(256,'Dispositivi elettronici > Audio > Lettori e registratori audio > Giradischi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(230,'Dispositivi elettronici > Audio > Lettori e registratori audio > Impianti karaoke');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4652,'Dispositivi elettronici > Audio > Lettori e registratori audio > Jukebox');
insert into GOOGLE_CATEGORY (codice,descrizione) values(226,'Dispositivi elettronici > Audio > Lettori e registratori audio > Lettori CD');
insert into GOOGLE_CATEGORY (codice,descrizione) values(233,'Dispositivi elettronici > Audio > Lettori e registratori audio > Lettori MP3');
insert into GOOGLE_CATEGORY (codice,descrizione) values(235,'Dispositivi elettronici > Audio > Lettori e registratori audio > Lettori MiniDisc');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6886,'Dispositivi elettronici > Audio > Lettori e registratori audio > Radio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5434,'Dispositivi elettronici > Audio > Lettori e registratori audio > Registratori multitraccia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(244,'Dispositivi elettronici > Audio > Lettori e registratori audio > Registratori vocali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(243,'Dispositivi elettronici > Audio > Lettori e registratori audio > Registratori/lettori di musicassette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8271,'Dispositivi elettronici > Audio > Lettori e registratori audio > Riproduttori e registratori con nastro a bobina');
insert into GOOGLE_CATEGORY (codice,descrizione) values(252,'Dispositivi elettronici > Audio > Lettori e registratori audio > Sistemi Home Theater');
insert into GOOGLE_CATEGORY (codice,descrizione) values(251,'Dispositivi elettronici > Audio > Lettori e registratori audio > Sistemi stereo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8159,'Dispositivi elettronici > Audio > Megafoni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2154,'Dispositivi elettronici > Audio > Sistemi di altoparlanti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3702,'Dispositivi elettronici > Circuiti stampati e componenti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500027,'Dispositivi elettronici > Circuiti stampati e componenti > Accessori per circuiti stampati');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7259,'Dispositivi elettronici > Circuiti stampati e componenti > Codificatori e decodificatori per circuiti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3635,'Dispositivi elettronici > Circuiti stampati e componenti > Componenti passivi circuiti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3220,'Dispositivi elettronici > Circuiti stampati e componenti > Componenti passivi circuiti > Condensatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3121,'Dispositivi elettronici > Circuiti stampati e componenti > Componenti passivi circuiti > Induttori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7260,'Dispositivi elettronici > Circuiti stampati e componenti > Componenti passivi circuiti > Oscillatori elettronici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3424,'Dispositivi elettronici > Circuiti stampati e componenti > Componenti passivi circuiti > Resistori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7258,'Dispositivi elettronici > Circuiti stampati e componenti > Filtri elettronici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3889,'Dispositivi elettronici > Circuiti stampati e componenti > Prototipazione circuiti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4010,'Dispositivi elettronici > Circuiti stampati e componenti > Prototipazione circuiti > Breadboard');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7264,'Dispositivi elettronici > Circuiti stampati e componenti > Schede per circuiti stampati');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499898,'Dispositivi elettronici > Circuiti stampati e componenti > Schede per circuiti stampati > Circuiti stampati per computer');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8546,'Dispositivi elettronici > Circuiti stampati e componenti > Schede per circuiti stampati > Circuiti stampati per computer > Circuiti stampati per hard disk');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499899,'Dispositivi elettronici > Circuiti stampati e componenti > Schede per circuiti stampati > Circuiti stampati per computer > Schede inverter per computer');
insert into GOOGLE_CATEGORY (codice,descrizione) values(289,'Dispositivi elettronici > Circuiti stampati e componenti > Schede per circuiti stampati > Circuiti stampati per computer > Schede madre');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8545,'Dispositivi elettronici > Circuiti stampati e componenti > Schede per circuiti stampati > Circuiti stampati per elettrodomestici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(298419,'Dispositivi elettronici > Circuiti stampati e componenti > Schede per circuiti stampati > Circuiti stampati per fotocamere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499889,'Dispositivi elettronici > Circuiti stampati e componenti > Schede per circuiti stampati > Circuiti stampati per macchine per l \'esercizio fisico');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8549,'Dispositivi elettronici > Circuiti stampati e componenti > Schede per circuiti stampati > Circuiti stampati per piscine e spa');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499675,'Dispositivi elettronici > Circuiti stampati e componenti > Schede per circuiti stampati > Circuiti stampati per scanner');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8544,'Dispositivi elettronici > Circuiti stampati e componenti > Schede per circuiti stampati > Circuiti stampati per stampanti, fotocopiatrici e fax');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8516,'Dispositivi elettronici > Circuiti stampati e componenti > Schede per circuiti stampati > Circuiti stampati per televisori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3416,'Dispositivi elettronici > Circuiti stampati e componenti > Schede per circuiti stampati > Schede di sviluppo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3991,'Dispositivi elettronici > Circuiti stampati e componenti > Semiconduttori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7257,'Dispositivi elettronici > Circuiti stampati e componenti > Semiconduttori > Chip e circuiti integrati');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3632,'Dispositivi elettronici > Circuiti stampati e componenti > Semiconduttori > Diodi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3949,'Dispositivi elettronici > Circuiti stampati e componenti > Semiconduttori > Microcontroller');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3094,'Dispositivi elettronici > Circuiti stampati e componenti > Semiconduttori > Transistor');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1801,'Dispositivi elettronici > Componenti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7395,'Dispositivi elettronici > Componenti > Accelerometri');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1977,'Dispositivi elettronici > Componenti > Connettori per componenti elettronici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2182,'Dispositivi elettronici > Componenti > Convertitori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503001,'Dispositivi elettronici > Componenti > Convertitori > Convertitori audio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2205,'Dispositivi elettronici > Componenti > Convertitori > Scan converter');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1544,'Dispositivi elettronici > Componenti > Divisori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1337,'Dispositivi elettronici > Componenti > Modulatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(278,'Dispositivi elettronici > Computer');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5255,'Dispositivi elettronici > Computer > Chioschi interattivi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5254,'Dispositivi elettronici > Computer > Computer Barebone');
insert into GOOGLE_CATEGORY (codice,descrizione) values(325,'Dispositivi elettronici > Computer > Computer desktop');
insert into GOOGLE_CATEGORY (codice,descrizione) values(328,'Dispositivi elettronici > Computer > Computer portatili');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4745,'Dispositivi elettronici > Computer > Computer tablet');
insert into GOOGLE_CATEGORY (codice,descrizione) values(298,'Dispositivi elettronici > Computer > Dispositivi portatili');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3539,'Dispositivi elettronici > Computer > Dispositivi portatili > E-Book reader');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3769,'Dispositivi elettronici > Computer > Dispositivi portatili > PDA');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5256,'Dispositivi elettronici > Computer > Dispositivi portatili > Terminali di raccolta dati');
insert into GOOGLE_CATEGORY (codice,descrizione) values(331,'Dispositivi elettronici > Computer > Server');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500002,'Dispositivi elettronici > Computer > Smart Glass');
insert into GOOGLE_CATEGORY (codice,descrizione) values(502995,'Dispositivi elettronici > Computer > Tavoli touchscreen');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8539,'Dispositivi elettronici > Computer > Thin client e zero client');
insert into GOOGLE_CATEGORY (codice,descrizione) values(262,'Dispositivi elettronici > Comunicazioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(263,'Dispositivi elettronici > Comunicazioni > Accessori comunicazioni radio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5404,'Dispositivi elettronici > Comunicazioni > Accessori per intercomunicazione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(268,'Dispositivi elettronici > Comunicazioni > Cercapersone');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5275,'Dispositivi elettronici > Comunicazioni > Identificazione chiamante');
insert into GOOGLE_CATEGORY (codice,descrizione) values(360,'Dispositivi elettronici > Comunicazioni > Interfoni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2471,'Dispositivi elettronici > Comunicazioni > Radio di comunicazione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2106,'Dispositivi elettronici > Comunicazioni > Radio di comunicazione > Radio CB');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4415,'Dispositivi elettronici > Comunicazioni > Radio di comunicazione > Radioscanner');
insert into GOOGLE_CATEGORY (codice,descrizione) values(273,'Dispositivi elettronici > Comunicazioni > Radio di comunicazione > Ricetrasmittenti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(266,'Dispositivi elettronici > Comunicazioni > Segreterie telefoniche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(270,'Dispositivi elettronici > Comunicazioni > Telefonia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(265,'Dispositivi elettronici > Comunicazioni > Telefonia > Accessori per telefoni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(269,'Dispositivi elettronici > Comunicazioni > Telefonia > Accessori per telefoni > Schede telefoniche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(264,'Dispositivi elettronici > Comunicazioni > Telefonia > Accessori telefoni cellulari');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8111,'Dispositivi elettronici > Comunicazioni > Telefonia > Accessori telefoni cellulari > Accessori per fotocamere di telefoni cellulari');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4550,'Dispositivi elettronici > Comunicazioni > Telefonia > Accessori telefoni cellulari > Ciondoli/cinghiette per cellulari');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2353,'Dispositivi elettronici > Comunicazioni > Telefonia > Accessori telefoni cellulari > Custodie cellulari');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7347,'Dispositivi elettronici > Comunicazioni > Telefonia > Accessori telefoni cellulari > Parti di ricambio per telefoni cellulari');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6030,'Dispositivi elettronici > Comunicazioni > Telefonia > Accessori telefoni cellulari > Schede SIM e prepagate per cellulari');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499916,'Dispositivi elettronici > Comunicazioni > Telefonia > Accessori telefoni cellulari > Strumenti per l \'espulsione di schede SIM');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5566,'Dispositivi elettronici > Comunicazioni > Telefonia > Accessori telefoni cellulari > Supporti da auto per cellulari');
insert into GOOGLE_CATEGORY (codice,descrizione) values(267,'Dispositivi elettronici > Comunicazioni > Telefonia > Telefoni cellulari');
insert into GOOGLE_CATEGORY (codice,descrizione) values(271,'Dispositivi elettronici > Comunicazioni > Telefonia > Telefoni con filo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(272,'Dispositivi elettronici > Comunicazioni > Telefonia > Telefoni cordless');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4666,'Dispositivi elettronici > Comunicazioni > Telefonia > Telefoni da conferenza');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1924,'Dispositivi elettronici > Comunicazioni > Telefonia > Telefoni satellitari');
insert into GOOGLE_CATEGORY (codice,descrizione) values(274,'Dispositivi elettronici > Comunicazioni > Videoconferenze');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1294,'Dispositivi elettronici > Console videogiochi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(340,'Dispositivi elettronici > Dispositivi elettronici nautici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8473,'Dispositivi elettronici > Dispositivi elettronici nautici > Altoparlanti nautici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2178,'Dispositivi elettronici > Dispositivi elettronici nautici > Chartplotter e GPS nautici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1550,'Dispositivi elettronici > Dispositivi elettronici nautici > Ecoscandagli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1552,'Dispositivi elettronici > Dispositivi elettronici nautici > Radar nautico');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4450,'Dispositivi elettronici > Dispositivi elettronici nautici > Radio marine');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8134,'Dispositivi elettronici > Dispositivi elettronici nautici > Ricevitori audio e video nautici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4488,'Dispositivi elettronici > Dispositivi pagamento pedaggio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6544,'Dispositivi elettronici > Localizzatori GPS');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500091,'Dispositivi elettronici > Radar di velocità');
insert into GOOGLE_CATEGORY (codice,descrizione) values(342,'Dispositivi elettronici > Rete');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5576,'Dispositivi elettronici > Rete > Accessori modem');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6508,'Dispositivi elettronici > Rete > Adattatori PoE');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1350,'Dispositivi elettronici > Rete > Bridge e router');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5659,'Dispositivi elettronici > Rete > Bridge e router > Bridge di rete');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2358,'Dispositivi elettronici > Rete > Bridge e router > Gateway e router VoIP');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5497,'Dispositivi elettronici > Rete > Bridge e router > Router wireless');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5496,'Dispositivi elettronici > Rete > Bridge e router > WAP (Wireless Access Point)');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2479,'Dispositivi elettronici > Rete > Concentratori e multiplexer');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3742,'Dispositivi elettronici > Rete > Dispositivi protezione rete e firewall');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2455,'Dispositivi elettronici > Rete > Hub e switch');
insert into GOOGLE_CATEGORY (codice,descrizione) values(343,'Dispositivi elettronici > Rete > Modem');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2121,'Dispositivi elettronici > Rete > Ripetitori e ricetrasmettitori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(290,'Dispositivi elettronici > Rete > Schede e adattatori di rete');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3425,'Dispositivi elettronici > Rete > Server di stampa');
insert into GOOGLE_CATEGORY (codice,descrizione) values(912,'Dispositivi elettronici > Rilevatori di radar e autovelox');
insert into GOOGLE_CATEGORY (codice,descrizione) values(339,'Dispositivi elettronici > Sistemi GPS');
insert into GOOGLE_CATEGORY (codice,descrizione) values(345,'Dispositivi elettronici > Stampa, copia, scansione e fax');
insert into GOOGLE_CATEGORY (codice,descrizione) values(284,'Dispositivi elettronici > Stampa, copia, scansione e fax > Accessori per scanner');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499682,'Dispositivi elettronici > Stampa, copia, scansione e fax > Accessori per stampanti 3D');
insert into GOOGLE_CATEGORY (codice,descrizione) values(502990,'Dispositivi elettronici > Stampa, copia, scansione e fax > Accessori per stampanti, fotocopiatrici e fax');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5265,'Dispositivi elettronici > Stampa, copia, scansione e fax > Accessori per stampanti, fotocopiatrici e fax > Duplexer stampante');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5258,'Dispositivi elettronici > Stampa, copia, scansione e fax > Accessori per stampanti, fotocopiatrici e fax > Materiali di consumo stampante');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5266,'Dispositivi elettronici > Stampa, copia, scansione e fax > Accessori per stampanti, fotocopiatrici e fax > Materiali di consumo stampante > Filtri per stampante');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5262,'Dispositivi elettronici > Stampa, copia, scansione e fax > Accessori per stampanti, fotocopiatrici e fax > Materiali di consumo stampante > Kit di manutenzione stampanti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5259,'Dispositivi elettronici > Stampa, copia, scansione e fax > Accessori per stampanti, fotocopiatrici e fax > Materiali di consumo stampante > Kit e tamburi per stampanti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5260,'Dispositivi elettronici > Stampa, copia, scansione e fax > Accessori per stampanti, fotocopiatrici e fax > Materiali di consumo stampante > Nastri per stampante');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7362,'Dispositivi elettronici > Stampa, copia, scansione e fax > Accessori per stampanti, fotocopiatrici e fax > Materiali di consumo stampante > Ricambi per cartucce a getto di inchiostro e toner');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5261,'Dispositivi elettronici > Stampa, copia, scansione e fax > Accessori per stampanti, fotocopiatrici e fax > Materiali di consumo stampante > Testine di stampa');
insert into GOOGLE_CATEGORY (codice,descrizione) values(356,'Dispositivi elettronici > Stampa, copia, scansione e fax > Accessori per stampanti, fotocopiatrici e fax > Materiali di consumo stampante > Toner e cartucce a getto d \'inchiostro');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1683,'Dispositivi elettronici > Stampa, copia, scansione e fax > Accessori per stampanti, fotocopiatrici e fax > Memoria stampanti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(502991,'Dispositivi elettronici > Stampa, copia, scansione e fax > Accessori per stampanti, fotocopiatrici e fax > Parti di ricambio per stampanti, fotocopiatrici e fax');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5459,'Dispositivi elettronici > Stampa, copia, scansione e fax > Accessori per stampanti, fotocopiatrici e fax > Supporti per stampante');
insert into GOOGLE_CATEGORY (codice,descrizione) values(306,'Dispositivi elettronici > Stampa, copia, scansione e fax > Scanner');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6865,'Dispositivi elettronici > Stampa, copia, scansione e fax > Stampanti 3D');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500106,'Dispositivi elettronici > Stampa, copia, scansione e fax > Stampanti, fotocopiatrici e fax');
insert into GOOGLE_CATEGORY (codice,descrizione) values(386,'Dispositivi elettronici > Video');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2027,'Dispositivi elettronici > Video > Accessori video');
insert into GOOGLE_CATEGORY (codice,descrizione) values(403,'Dispositivi elettronici > Video > Accessori video > Accessori e componenti per TV');
insert into GOOGLE_CATEGORY (codice,descrizione) values(43616,'Dispositivi elettronici > Video > Accessori video > Accessori e componenti per TV > Altoparlanti sostitutivi per televisori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5503,'Dispositivi elettronici > Video > Accessori video > Accessori e componenti per TV > Decoder TV');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5471,'Dispositivi elettronici > Video > Accessori video > Accessori e componenti per TV > Lampade ricambio televisori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4458,'Dispositivi elettronici > Video > Accessori video > Accessori e componenti per TV > Supporti TV');
insert into GOOGLE_CATEGORY (codice,descrizione) values(283,'Dispositivi elettronici > Video > Accessori video > Accessori monitor computer');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5516,'Dispositivi elettronici > Video > Accessori video > Accessori monitor computer > Calibratori colore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(393,'Dispositivi elettronici > Video > Accessori video > Accessori per proiettori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(394,'Dispositivi elettronici > Video > Accessori video > Accessori per proiettori > Lampade ricambio proiettori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(395,'Dispositivi elettronici > Video > Accessori video > Accessori per proiettori > Schermi di proiezione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5257,'Dispositivi elettronici > Video > Accessori video > Accessori per proiettori > Supporti per proiettore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4570,'Dispositivi elettronici > Video > Accessori video > Accessori per proiettori > Supporti schermi proiezione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5599,'Dispositivi elettronici > Video > Accessori video > Accessori per proiettori > Teli per proiezioni e treppiedi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4760,'Dispositivi elettronici > Video > Accessori video > Occhiali 3D');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2145,'Dispositivi elettronici > Video > Accessori video > Riavvolgitori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1368,'Dispositivi elettronici > Video > Apparecchi montaggio video e produzione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(305,'Dispositivi elettronici > Video > Monitor per computer');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1634,'Dispositivi elettronici > Video > Multiplexer video');
insert into GOOGLE_CATEGORY (codice,descrizione) values(396,'Dispositivi elettronici > Video > Proiettori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(399,'Dispositivi elettronici > Video > Proiettori > Proiettori di diapositive');
insert into GOOGLE_CATEGORY (codice,descrizione) values(397,'Dispositivi elettronici > Video > Proiettori > Proiettori multimediali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(398,'Dispositivi elettronici > Video > Proiettori > Proiettori per lucidi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5278,'Dispositivi elettronici > Video > Server video');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5561,'Dispositivi elettronici > Video > TV satellitare e via cavo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5562,'Dispositivi elettronici > Video > TV satellitare e via cavo > Ricevitori TV via cavo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(401,'Dispositivi elettronici > Video > TV satellitare e via cavo > Ricevitori satellitari');
insert into GOOGLE_CATEGORY (codice,descrizione) values(404,'Dispositivi elettronici > Video > Televisori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(387,'Dispositivi elettronici > Video > Videoriproduttori/registratori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(388,'Dispositivi elettronici > Video > Videoriproduttori/registratori > Lettori DVD e Blu-ray');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5276,'Dispositivi elettronici > Video > Videoriproduttori/registratori > Lettori multimediali e di streaming');
insert into GOOGLE_CATEGORY (codice,descrizione) values(389,'Dispositivi elettronici > Video > Videoriproduttori/registratori > Registratori DVD');
insert into GOOGLE_CATEGORY (codice,descrizione) values(390,'Dispositivi elettronici > Video > Videoriproduttori/registratori > Registratori video digitali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(391,'Dispositivi elettronici > Video > Videoriproduttori/registratori > VCR');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5450,'Dispositivi elettronici > Video > Videotrasmettitori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(922,'Forniture per ufficio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6174,'Forniture per ufficio > Accessori per libri');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6176,'Forniture per ufficio > Accessori per libri > Copertine per libri');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4941,'Forniture per ufficio > Accessori per libri > Lampade da lettura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6175,'Forniture per ufficio > Accessori per libri > Leggii per libri');
insert into GOOGLE_CATEGORY (codice,descrizione) values(93,'Forniture per ufficio > Accessori per libri > Segnalibri');
insert into GOOGLE_CATEGORY (codice,descrizione) values(923,'Forniture per ufficio > Archiviazione e organizzazione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(927,'Forniture per ufficio > Archiviazione e organizzazione > Calendari, portaoggetti e agende');
insert into GOOGLE_CATEGORY (codice,descrizione) values(930,'Forniture per ufficio > Archiviazione e organizzazione > Cartellette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6884,'Forniture per ufficio > Archiviazione e organizzazione > Cartellette e copertine per documenti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(928,'Forniture per ufficio > Archiviazione e organizzazione > Cassette portavalori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6177,'Forniture per ufficio > Archiviazione e organizzazione > Custodie per schede');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6171,'Forniture per ufficio > Archiviazione e organizzazione > Espositori per biglietti da visita');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4312,'Forniture per ufficio > Archiviazione e organizzazione > Forniture per rilegature');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4086,'Forniture per ufficio > Archiviazione e organizzazione > Forniture per rilegature > Accessori rilegatura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4212,'Forniture per ufficio > Archiviazione e organizzazione > Forniture per rilegature > Accessori rilegatura > Anelli per rilegatura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4183,'Forniture per ufficio > Archiviazione e organizzazione > Forniture per rilegature > Accessori rilegatura > Divisori indici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2139,'Forniture per ufficio > Archiviazione e organizzazione > Forniture per rilegature > Accessori rilegatura > Protezioni fogli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4182,'Forniture per ufficio > Archiviazione e organizzazione > Forniture per rilegature > Legature e dorsi per rilegatura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4303,'Forniture per ufficio > Archiviazione e organizzazione > Forniture per rilegature > Raccoglitori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7080,'Forniture per ufficio > Archiviazione e organizzazione > Forniture per rilegature > Rilegatrici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5070,'Forniture per ufficio > Archiviazione e organizzazione > Organizer biglietti auguri');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6962,'Forniture per ufficio > Archiviazione e organizzazione > Organizzatori per posta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(926,'Forniture per ufficio > Archiviazione e organizzazione > Porta CD/DVD');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6885,'Forniture per ufficio > Archiviazione e organizzazione > Portafogli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(939,'Forniture per ufficio > Archiviazione e organizzazione > Portaoggetti da scrivania');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3062,'Forniture per ufficio > Archiviazione e organizzazione > Portapenne e portamatite');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6190,'Forniture per ufficio > Archiviazione e organizzazione > Raccoglitori di biglietti da visita');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5997,'Forniture per ufficio > Archiviazione e organizzazione > Rubriche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(925,'Forniture per ufficio > Archiviazione e organizzazione > Scatole archivio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6779,'Forniture per ufficio > Archiviazione e organizzazione > Scatole per ricette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5531,'Forniture per ufficio > Archiviazione e organizzazione > Schedari');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6373,'Forniture per ufficio > Carrelli per uffici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1996,'Forniture per ufficio > Carrelli per uffici > Carrelli audio e video');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6180,'Forniture per ufficio > Carrelli per uffici > Carrelli per archivi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6181,'Forniture per ufficio > Carrelli per uffici > Carrelli per la posta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6182,'Forniture per ufficio > Carrelli per uffici > Carrelli per libri');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6179,'Forniture per ufficio > Carrelli per uffici > Carrelli portatutto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8078,'Forniture per ufficio > Cuscinetti e tamponi assorbenti per scrivanie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(950,'Forniture per ufficio > Dotazione per l \'ufficio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499864,'Forniture per ufficio > Dotazione per l \'ufficio > Accessori per calcolatrici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1708,'Forniture per ufficio > Dotazione per l \'ufficio > Affrancatrici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(333,'Forniture per ufficio > Dotazione per l \'ufficio > Calcolatrici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(953,'Forniture per ufficio > Dotazione per l \'ufficio > Distruggidocumenti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(337,'Forniture per ufficio > Dotazione per l \'ufficio > Dizionari e traduttori elettronici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(952,'Forniture per ufficio > Dotazione per l \'ufficio > Etichettatrici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1625,'Forniture per ufficio > Dotazione per l \'ufficio > Laminatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(955,'Forniture per ufficio > Dotazione per l \'ufficio > Macchine da scrivere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6404,'Forniture per ufficio > Dotazione per l \'ufficio > Macchine timbracartellini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(954,'Forniture per ufficio > Dotazione per l \'ufficio > Trascrittori e sistemi di dettatura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(932,'Forniture per ufficio > Forniture generiche per ufficio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8015,'Forniture per ufficio > Forniture generiche per ufficio > Buste e pellicole per laminatura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(944,'Forniture per ufficio > Forniture generiche per ufficio > Elastici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(960,'Forniture per ufficio > Forniture generiche per ufficio > Etichette e schede');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4137,'Forniture per ufficio > Forniture generiche per ufficio > Etichette e schede > Clip adesive');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4377,'Forniture per ufficio > Forniture generiche per ufficio > Etichette e schede > Etichette indirizzo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4200,'Forniture per ufficio > Forniture generiche per ufficio > Etichette e schede > Etichette per spedizioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5502,'Forniture per ufficio > Forniture generiche per ufficio > Etichette e schede > Nastro e bobine di ricambio per etichette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4154,'Forniture per ufficio > Forniture generiche per ufficio > Etichette e schede > Schede per cartellette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4117,'Forniture per ufficio > Forniture generiche per ufficio > Etichette e schede > Schede per spedizioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6319,'Forniture per ufficio > Forniture generiche per ufficio > Fissaggi in ottone');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2591,'Forniture per ufficio > Forniture generiche per ufficio > Fluidi correttori, penne e nastri');
insert into GOOGLE_CATEGORY (codice,descrizione) values(938,'Forniture per ufficio > Forniture generiche per ufficio > Gomme');
insert into GOOGLE_CATEGORY (codice,descrizione) values(948,'Forniture per ufficio > Forniture generiche per ufficio > Graffette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(936,'Forniture per ufficio > Forniture generiche per ufficio > Graffette e fermacarte');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505805,'Forniture per ufficio > Forniture generiche per ufficio > Mastice per fissaggio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(934,'Forniture per ufficio > Forniture generiche per ufficio > Nastro adesivo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(956,'Forniture per ufficio > Forniture generiche per ufficio > Prodotti di carta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(959,'Forniture per ufficio > Forniture generiche per ufficio > Prodotti di carta > Archiviatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6930,'Forniture per ufficio > Forniture generiche per ufficio > Prodotti di carta > Assegni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2689,'Forniture per ufficio > Forniture generiche per ufficio > Prodotti di carta > Biglietti adesivi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(957,'Forniture per ufficio > Forniture generiche per ufficio > Prodotti di carta > Biglietti da visita');
insert into GOOGLE_CATEGORY (codice,descrizione) values(958,'Forniture per ufficio > Forniture generiche per ufficio > Prodotti di carta > Buste');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3457,'Forniture per ufficio > Forniture generiche per ufficio > Prodotti di carta > Carta da lettere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1513,'Forniture per ufficio > Forniture generiche per ufficio > Prodotti di carta > Carta per copertine');
insert into GOOGLE_CATEGORY (codice,descrizione) values(962,'Forniture per ufficio > Forniture generiche per ufficio > Prodotti di carta > Carta stampanti e fotocopiatrici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3871,'Forniture per ufficio > Forniture generiche per ufficio > Prodotti di carta > Cartoline');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2658,'Forniture per ufficio > Forniture generiche per ufficio > Prodotti di carta > Fogli da raccoglitore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5918,'Forniture per ufficio > Forniture generiche per ufficio > Prodotti di carta > Moduli e ricevute aziendali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5919,'Forniture per ufficio > Forniture generiche per ufficio > Prodotti di carta > Rulli di carta per registratori di cassa e calcolatrici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5264,'Forniture per ufficio > Forniture generiche per ufficio > Prodotti di carta > Schede ID vuote');
insert into GOOGLE_CATEGORY (codice,descrizione) values(961,'Forniture per ufficio > Forniture generiche per ufficio > Prodotti di carta > Taccuini e block-notes');
insert into GOOGLE_CATEGORY (codice,descrizione) values(949,'Forniture per ufficio > Forniture generiche per ufficio > Puntine da disegno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(964,'Forniture per ufficio > Forniture per presentazioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(968,'Forniture per ufficio > Forniture per presentazioni > Cavalletti da presentazione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(965,'Forniture per ufficio > Forniture per presentazioni > Lavagne');
insert into GOOGLE_CATEGORY (codice,descrizione) values(967,'Forniture per ufficio > Forniture per presentazioni > Lavagne a fogli mobili');
insert into GOOGLE_CATEGORY (codice,descrizione) values(971,'Forniture per ufficio > Forniture per presentazioni > Lavagne bianche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(963,'Forniture per ufficio > Forniture per presentazioni > Lucidi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(966,'Forniture per ufficio > Forniture per presentazioni > Pannelli di visualizzazione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7525,'Forniture per ufficio > Forniture per presentazioni > Pannelli di visualizzazione > Accessori per bacheche informative');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7526,'Forniture per ufficio > Forniture per presentazioni > Pannelli di visualizzazione > Accessori per bacheche informative > Decorazioni per bacheche informative');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2401,'Forniture per ufficio > Forniture per presentazioni > Pannelli di visualizzazione > Bacheche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2263,'Forniture per ufficio > Forniture per presentazioni > Pannelli di visualizzazione > Pannelli di gommapiuma');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1627,'Forniture per ufficio > Forniture per presentazioni > Pannelli di visualizzazione > Pannelli di montaggio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2674,'Forniture per ufficio > Forniture per presentazioni > Pannelli di visualizzazione > Pannelli per poster');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4465,'Forniture per ufficio > Forniture per presentazioni > Presentatori wireless');
insert into GOOGLE_CATEGORY (codice,descrizione) values(969,'Forniture per ufficio > Forniture per presentazioni > Puntatori laser');
insert into GOOGLE_CATEGORY (codice,descrizione) values(970,'Forniture per ufficio > Forniture per presentazioni > Supporti per lettura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4492,'Forniture per ufficio > Forniture per presentazioni > Visualizzatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2636,'Forniture per ufficio > Forniture per spedizioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(974,'Forniture per ufficio > Forniture per spedizioni > Materiali per imballaggi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(975,'Forniture per ufficio > Forniture per spedizioni > Nastro per imballaggi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(973,'Forniture per ufficio > Forniture per spedizioni > Scatole per spedizioni e traslochi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8499,'Forniture per ufficio > Scrittoio da tavolo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5829,'Forniture per ufficio > Sigillatrici a impulsi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2014,'Forniture per ufficio > Soluzioni per la carta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1803,'Forniture per ufficio > Soluzioni per la carta > Fermacarte');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6486,'Forniture per ufficio > Soluzioni per la carta > Fingertip grip');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1836,'Forniture per ufficio > Soluzioni per la carta > Pareggiatrici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6467,'Forniture per ufficio > Soluzioni per la carta > Perforatrici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2207,'Forniture per ufficio > Soluzioni per la carta > Piegatrici da ufficio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6178,'Forniture per ufficio > Soluzioni per la carta > Plastica protettiva per scrivere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2986,'Forniture per ufficio > Strumenti per ufficio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4470,'Forniture per ufficio > Strumenti per ufficio > Accessori strumenti per scrivere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4471,'Forniture per ufficio > Strumenti per ufficio > Accessori strumenti per scrivere > Inchiostro penna e ricariche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4472,'Forniture per ufficio > Strumenti per ufficio > Accessori strumenti per scrivere > Portamine e mine');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7117,'Forniture per ufficio > Strumenti per ufficio > Accessori strumenti per scrivere > Ricariche d \'inchiostro per evidenziatori e pennarelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505830,'Forniture per ufficio > Strumenti per ufficio > Aprilettere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2883,'Forniture per ufficio > Strumenti per ufficio > Campanelli di chiamata');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503746,'Forniture per ufficio > Strumenti per ufficio > Dispenser per nastro adesivo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(947,'Forniture per ufficio > Strumenti per ufficio > Graffettatrici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(941,'Forniture per ufficio > Strumenti per ufficio > Lenti di ingrandimento');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4499,'Forniture per ufficio > Strumenti per ufficio > Pinze rimuovigraffette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(935,'Forniture per ufficio > Strumenti per ufficio > Portablocco');
insert into GOOGLE_CATEGORY (codice,descrizione) values(977,'Forniture per ufficio > Strumenti per ufficio > Strumenti per scrivere e disegnare');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2623,'Forniture per ufficio > Strumenti per ufficio > Strumenti per scrivere e disegnare > Carboncino');
insert into GOOGLE_CATEGORY (codice,descrizione) values(978,'Forniture per ufficio > Strumenti per ufficio > Strumenti per scrivere e disegnare > Gesso per scrivere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4752,'Forniture per ufficio > Strumenti per ufficio > Strumenti per scrivere e disegnare > Pastelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(979,'Forniture per ufficio > Strumenti per ufficio > Strumenti per scrivere e disegnare > Pastelli colorati');
insert into GOOGLE_CATEGORY (codice,descrizione) values(980,'Forniture per ufficio > Strumenti per ufficio > Strumenti per scrivere e disegnare > Pennarelli ed evidenziatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6065,'Forniture per ufficio > Strumenti per ufficio > Strumenti per scrivere e disegnare > Penne e matite');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6068,'Forniture per ufficio > Strumenti per ufficio > Strumenti per scrivere e disegnare > Penne e matite > Matite');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3026,'Forniture per ufficio > Strumenti per ufficio > Strumenti per scrivere e disegnare > Penne e matite > Matite > Matite da disegno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(981,'Forniture per ufficio > Strumenti per ufficio > Strumenti per scrivere e disegnare > Penne e matite > Matite > Matite da scrittura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(982,'Forniture per ufficio > Strumenti per ufficio > Strumenti per scrivere e disegnare > Penne e matite > Penne');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6066,'Forniture per ufficio > Strumenti per ufficio > Strumenti per scrivere e disegnare > Penne e matite > Set di penne e matite');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6067,'Forniture per ufficio > Strumenti per ufficio > Strumenti per scrivere e disegnare > Strumenti di scrittura multifunzione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(943,'Forniture per ufficio > Strumenti per ufficio > Temperamatite');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4341,'Forniture per ufficio > Strumenti per ufficio > Timbri in gomma per ufficio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6519,'Forniture per ufficio > Tappetini per uffici e sedie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6462,'Forniture per ufficio > Tappetini per uffici e sedie > Tappetini antifatica');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6521,'Forniture per ufficio > Tappetini per uffici e sedie > Tappetini per sedie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6520,'Forniture per ufficio > Tappetini per uffici e sedie > Tappetini per uffici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2435,'Forniture per ufficio > Targhette portanome');
insert into GOOGLE_CATEGORY (codice,descrizione) values(141,'Fotocamere/dispositivi ottici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2096,'Fotocamere/dispositivi ottici > Accessori ottici/fotocamere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(160,'Fotocamere/dispositivi ottici > Accessori ottici/fotocamere > Accessori ottici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5282,'Fotocamere/dispositivi ottici > Accessori ottici/fotocamere > Accessori ottici > Accessori binocoli e monocoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5542,'Fotocamere/dispositivi ottici > Accessori ottici/fotocamere > Accessori ottici > Accessori da mira');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4274,'Fotocamere/dispositivi ottici > Accessori ottici/fotocamere > Accessori ottici > Accessori ottici termici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5543,'Fotocamere/dispositivi ottici > Accessori ottici/fotocamere > Accessori ottici > Accessori per mirini di armi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5283,'Fotocamere/dispositivi ottici > Accessori ottici/fotocamere > Accessori ottici > Accessori per telemetri');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5284,'Fotocamere/dispositivi ottici > Accessori ottici/fotocamere > Accessori ottici > Accessori per telescopio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5545,'Fotocamere/dispositivi ottici > Accessori ottici/fotocamere > Accessori ottici > Borse e custodie dispositivi ottici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2911,'Fotocamere/dispositivi ottici > Accessori ottici/fotocamere > Accessori per obiettivi di fotocamere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5588,'Fotocamere/dispositivi ottici > Accessori ottici/fotocamere > Accessori per obiettivi di fotocamere > Adattatori lenti e filtri');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2829,'Fotocamere/dispositivi ottici > Accessori ottici/fotocamere > Accessori per obiettivi di fotocamere > Copriobiettivi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(147,'Fotocamere/dispositivi ottici > Accessori ottici/fotocamere > Accessori per obiettivi di fotocamere > Filtri per obiettivo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2627,'Fotocamere/dispositivi ottici > Accessori ottici/fotocamere > Accessori per obiettivi di fotocamere > Paraluce');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4441,'Fotocamere/dispositivi ottici > Accessori ottici/fotocamere > Accessori per obiettivi di fotocamere > Porta obiettivo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4416,'Fotocamere/dispositivi ottici > Accessori ottici/fotocamere > Accessori per obiettivi di fotocamere > Teleconverter ed extender');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4638,'Fotocamere/dispositivi ottici > Accessori ottici/fotocamere > Accessori treppiedi/monopiedi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3035,'Fotocamere/dispositivi ottici > Accessori ottici/fotocamere > Accessori treppiedi/monopiedi > Collari e pezzi treppiedi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4640,'Fotocamere/dispositivi ottici > Accessori ottici/fotocamere > Accessori treppiedi/monopiedi > Custodie treppiedi/monopiedi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503726,'Fotocamere/dispositivi ottici > Accessori ottici/fotocamere > Accessori treppiedi/monopiedi > Impugnature per treppiedi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503016,'Fotocamere/dispositivi ottici > Accessori ottici/fotocamere > Accessori treppiedi/monopiedi > Supporto per treppiede');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4639,'Fotocamere/dispositivi ottici > Accessori ottici/fotocamere > Accessori treppiedi/monopiedi > Teste treppiedi/monopiedi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(463625,'Fotocamere/dispositivi ottici > Accessori ottici/fotocamere > Cavi sostitutivi ottici e per fotocamere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(143,'Fotocamere/dispositivi ottici > Accessori ottici/fotocamere > Componenti e accessori per fotocamere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5479,'Fotocamere/dispositivi ottici > Accessori ottici/fotocamere > Componenti e accessori per fotocamere > Accessori flash fotocamere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8535,'Fotocamere/dispositivi ottici > Accessori ottici/fotocamere > Componenti e accessori per fotocamere > Accessori per custodie subacquee per fotocamere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5937,'Fotocamere/dispositivi ottici > Accessori ottici/fotocamere > Componenti e accessori per fotocamere > Accessori per videosorveglianza');
insert into GOOGLE_CATEGORY (codice,descrizione) values(461567,'Fotocamere/dispositivi ottici > Accessori ottici/fotocamere > Componenti e accessori per fotocamere > Attrezzature per fotocamere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6308,'Fotocamere/dispositivi ottici > Accessori ottici/fotocamere > Componenti e accessori per fotocamere > Borse per fotocamere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5429,'Fotocamere/dispositivi ottici > Accessori ottici/fotocamere > Componenti e accessori per fotocamere > Cinghe per fotocamera');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6307,'Fotocamere/dispositivi ottici > Accessori ottici/fotocamere > Componenti e accessori per fotocamere > Custodie subacquee per fotocamere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(296249,'Fotocamere/dispositivi ottici > Accessori ottici/fotocamere > Componenti e accessori per fotocamere > Display e schermi sostitutivi per fotocamere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500104,'Fotocamere/dispositivi ottici > Accessori ottici/fotocamere > Componenti e accessori per fotocamere > Dispositivi di messa a fuoco per fotocamere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(148,'Fotocamere/dispositivi ottici > Accessori ottici/fotocamere > Componenti e accessori per fotocamere > Flash per fotocamera');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500037,'Fotocamere/dispositivi ottici > Accessori ottici/fotocamere > Componenti e accessori per fotocamere > Impugnature per fotocamere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2394,'Fotocamere/dispositivi ottici > Accessori ottici/fotocamere > Componenti e accessori per fotocamere > Luci per telecamere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503019,'Fotocamere/dispositivi ottici > Accessori ottici/fotocamere > Componenti e accessori per fotocamere > Mirini esterni e paraluce per fotocamere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500107,'Fotocamere/dispositivi ottici > Accessori ottici/fotocamere > Componenti e accessori per fotocamere > Monitor da fotocamera');
insert into GOOGLE_CATEGORY (codice,descrizione) values(296246,'Fotocamere/dispositivi ottici > Accessori ottici/fotocamere > Componenti e accessori per fotocamere > Pannelli e portelli sostitutivi per corpi di fotocamere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(298420,'Fotocamere/dispositivi ottici > Accessori ottici/fotocamere > Componenti e accessori per fotocamere > Parti posteriori digitali per macchine fotografiche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(296247,'Fotocamere/dispositivi ottici > Accessori ottici/fotocamere > Componenti e accessori per fotocamere > Pulsanti e interruttori sostitutivi per fotocamere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(153,'Fotocamere/dispositivi ottici > Accessori ottici/fotocamere > Componenti e accessori per fotocamere > Rullino fotocamera');
insert into GOOGLE_CATEGORY (codice,descrizione) values(296248,'Fotocamere/dispositivi ottici > Accessori ottici/fotocamere > Componenti e accessori per fotocamere > Sensori di immagine per fotocamere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8174,'Fotocamere/dispositivi ottici > Accessori ottici/fotocamere > Componenti e accessori per fotocamere > Set di accessori per fotocamere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503020,'Fotocamere/dispositivi ottici > Accessori ottici/fotocamere > Componenti e accessori per fotocamere > Silenziatori e involucri fonoisolanti per fotocamere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499998,'Fotocamere/dispositivi ottici > Accessori ottici/fotocamere > Componenti e accessori per fotocamere > Stabilizzatori e supporti per fotocamere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2987,'Fotocamere/dispositivi ottici > Accessori ottici/fotocamere > Componenti e accessori per fotocamere > Staffe per flash');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5532,'Fotocamere/dispositivi ottici > Accessori ottici/fotocamere > Componenti e accessori per fotocamere > Telecomandi fotocamere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(461568,'Fotocamere/dispositivi ottici > Accessori ottici/fotocamere > Componenti e accessori per fotocamere > Unità con obiettivi zoom per fotocamere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(149,'Fotocamere/dispositivi ottici > Accessori ottici/fotocamere > Obiettivi ottici per fotocamere e videocamere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5280,'Fotocamere/dispositivi ottici > Accessori ottici/fotocamere > Obiettivi ottici per fotocamere e videocamere > Lenti per videocamere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5346,'Fotocamere/dispositivi ottici > Accessori ottici/fotocamere > Obiettivi ottici per fotocamere e videocamere > Lenti telecamere di controllo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4432,'Fotocamere/dispositivi ottici > Accessori ottici/fotocamere > Obiettivi ottici per fotocamere e videocamere > Obiettivi per fotocamera');
insert into GOOGLE_CATEGORY (codice,descrizione) values(150,'Fotocamere/dispositivi ottici > Accessori ottici/fotocamere > Treppiedi e monopiedi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(156,'Fotocamere/dispositivi ottici > Dispositivi ottici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(157,'Fotocamere/dispositivi ottici > Dispositivi ottici > Binocoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4040,'Fotocamere/dispositivi ottici > Dispositivi ottici > Cannocchiali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1695,'Fotocamere/dispositivi ottici > Dispositivi ottici > Cannocchiali > Cannocchiali da tiro e congegni di mira');
insert into GOOGLE_CATEGORY (codice,descrizione) values(165,'Fotocamere/dispositivi ottici > Dispositivi ottici > Cannocchiali > Telescopi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4136,'Fotocamere/dispositivi ottici > Dispositivi ottici > Cannocchiali > Telescopi di avvistamento');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4164,'Fotocamere/dispositivi ottici > Dispositivi ottici > Monocoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(161,'Fotocamere/dispositivi ottici > Dispositivi ottici > Telemetri');
insert into GOOGLE_CATEGORY (codice,descrizione) values(142,'Fotocamere/dispositivi ottici > Foto/videocamere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499976,'Fotocamere/dispositivi ottici > Foto/videocamere > Boroscopi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(152,'Fotocamere/dispositivi ottici > Foto/videocamere > Fotocamere digitali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4024,'Fotocamere/dispositivi ottici > Foto/videocamere > Fotocamere monouso');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5402,'Fotocamere/dispositivi ottici > Foto/videocamere > Fototrappole');
insert into GOOGLE_CATEGORY (codice,descrizione) values(154,'Fotocamere/dispositivi ottici > Foto/videocamere > Macchine fotografiche a rullino');
insert into GOOGLE_CATEGORY (codice,descrizione) values(155,'Fotocamere/dispositivi ottici > Foto/videocamere > Telecamere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(362,'Fotocamere/dispositivi ottici > Foto/videocamere > Telecamere di sorveglianza');
insert into GOOGLE_CATEGORY (codice,descrizione) values(312,'Fotocamere/dispositivi ottici > Foto/videocamere > Webcam');
insert into GOOGLE_CATEGORY (codice,descrizione) values(39,'Fotocamere/dispositivi ottici > Fotografia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503735,'Fotocamere/dispositivi ottici > Fotografia > Articoli per esporre foto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(41,'Fotocamere/dispositivi ottici > Fotografia > Camera oscura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2804,'Fotocamere/dispositivi ottici > Fotografia > Camera oscura > Carta fotografica');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2600,'Fotocamere/dispositivi ottici > Fotografia > Camera oscura > Illuminazione di sicurezza');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1622,'Fotocamere/dispositivi ottici > Fotografia > Camera oscura > Prodotti chimici per foto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2520,'Fotocamere/dispositivi ottici > Fotografia > Camera oscura > Strumenti di ingrandimento');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2815,'Fotocamere/dispositivi ottici > Fotografia > Camera oscura > Strumenti di ingrandimento > Analizzatori ed esposimetri');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2698,'Fotocamere/dispositivi ottici > Fotografia > Camera oscura > Strumenti di ingrandimento > Ingranditori di foto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2969,'Fotocamere/dispositivi ottici > Fotografia > Camera oscura > Strumenti di ingrandimento > Marginatori camera oscura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3029,'Fotocamere/dispositivi ottici > Fotografia > Camera oscura > Strumenti di ingrandimento > Supporti messa a fuoco');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2543,'Fotocamere/dispositivi ottici > Fotografia > Camera oscura > Strumenti di ingrandimento > Timer per camera oscura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2234,'Fotocamere/dispositivi ottici > Fotografia > Camera oscura > Strumenti per sviluppo e trattamento');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2999,'Fotocamere/dispositivi ottici > Fotografia > Camera oscura > Strumenti per sviluppo e trattamento > Lavelli per camera oscura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2625,'Fotocamere/dispositivi ottici > Fotografia > Camera oscura > Strumenti per sviluppo e trattamento > Stativi per riproduzioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2516,'Fotocamere/dispositivi ottici > Fotografia > Camera oscura > Strumenti per sviluppo e trattamento > Strumenti e prodotti per ritocchi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2650,'Fotocamere/dispositivi ottici > Fotografia > Camera oscura > Strumenti per sviluppo e trattamento > Vasche e bobine per sviluppo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2728,'Fotocamere/dispositivi ottici > Fotografia > Camera oscura > Strumenti per sviluppo e trattamento > Vassoi/vasche lavaggio stampe/essiccatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4368,'Fotocamere/dispositivi ottici > Fotografia > Conservazione di negativi e lastre');
insert into GOOGLE_CATEGORY (codice,descrizione) values(42,'Fotocamere/dispositivi ottici > Fotografia > Illuminazione e studio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5499,'Fotocamere/dispositivi ottici > Fotografia > Illuminazione e studio > Accessori esposimetri');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503018,'Fotocamere/dispositivi ottici > Fotografia > Illuminazione e studio > Accessori per luci e flash da studio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503017,'Fotocamere/dispositivi ottici > Fotografia > Illuminazione e studio > Accessori per supporti e basi da studio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2475,'Fotocamere/dispositivi ottici > Fotografia > Illuminazione e studio > Controlli per luci da studio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3056,'Fotocamere/dispositivi ottici > Fotografia > Illuminazione e studio > Controlli per luci da studio > Diffusori per flash');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2490,'Fotocamere/dispositivi ottici > Fotografia > Illuminazione e studio > Controlli per luci da studio > Filtri e altri effetti per la luce');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5431,'Fotocamere/dispositivi ottici > Fotografia > Illuminazione e studio > Controlli per luci da studio > Riflettori flash');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5432,'Fotocamere/dispositivi ottici > Fotografia > Illuminazione e studio > Controlli per luci da studio > Softbox');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1548,'Fotocamere/dispositivi ottici > Fotografia > Illuminazione e studio > Esposimetri');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2926,'Fotocamere/dispositivi ottici > Fotografia > Illuminazione e studio > Luci e flash da studio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1611,'Fotocamere/dispositivi ottici > Fotografia > Illuminazione e studio > Sfondi da studio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2007,'Fotocamere/dispositivi ottici > Fotografia > Illuminazione e studio > Supporti e sostegni da studio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1239,'Giochi e giocattoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1249,'Giochi e giocattoli > Attrezzatura gioco outdoor');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7219,'Giochi e giocattoli > Attrezzatura gioco outdoor > Accessori per strutture gonfiabili da salto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5524,'Giochi e giocattoli > Attrezzatura gioco outdoor > Accessori trampolini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6450,'Giochi e giocattoli > Attrezzatura gioco outdoor > Altalene basculanti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6270,'Giochi e giocattoli > Attrezzatura gioco outdoor > Altalene e dondoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6464,'Giochi e giocattoli > Attrezzatura gioco outdoor > Attrezzature per gioco in acqua');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500095,'Giochi e giocattoli > Attrezzatura gioco outdoor > Attrezzature per gioco in acqua > Parchi e scivoli acquatici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6465,'Giochi e giocattoli > Attrezzatura gioco outdoor > Attrezzature per gioco in acqua > Spruzzatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3556,'Giochi e giocattoli > Attrezzatura gioco outdoor > Attrezzature per gioco in acqua > Tavoli ad acqua');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1251,'Giochi e giocattoli > Attrezzatura gioco outdoor > Playhouse');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2743,'Giochi e giocattoli > Attrezzatura gioco outdoor > Sabbionaie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2867,'Giochi e giocattoli > Attrezzatura gioco outdoor > Scivoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6269,'Giochi e giocattoli > Attrezzatura gioco outdoor > Set altalena e accessori per set di gioco');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6271,'Giochi e giocattoli > Attrezzatura gioco outdoor > Set altalena e set di gioco');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6396,'Giochi e giocattoli > Attrezzatura gioco outdoor > Strutture gonfiabili da salto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6397,'Giochi e giocattoli > Attrezzatura gioco outdoor > Tende e tunnel giocattolo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1863,'Giochi e giocattoli > Attrezzatura gioco outdoor > Trampoli con molla');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3948,'Giochi e giocattoli > Attrezzatura gioco outdoor > Trampoli da salto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1738,'Giochi e giocattoli > Attrezzatura gioco outdoor > Trampolini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1253,'Giochi e giocattoli > Giocattoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500005,'Giochi e giocattoli > Giocattoli > Accessori per armi giocattolo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7202,'Giochi e giocattoli > Giocattoli > Accessori per giocattoli da cavalcare');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8127,'Giochi e giocattoli > Giocattoli > Accessori per giocattoli sportivi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8129,'Giochi e giocattoli > Giocattoli > Accessori per giocattoli sportivi > Accessori per giocattoli fitness');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8128,'Giochi e giocattoli > Giocattoli > Accessori per giocattoli sportivi > Accessori per giocattoli fitness > Accessori per hula-hoop');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7366,'Giochi e giocattoli > Giocattoli > Accessori per giocattoli volanti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7368,'Giochi e giocattoli > Giocattoli > Accessori per giocattoli volanti > Accessori per aquiloni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7371,'Giochi e giocattoli > Giocattoli > Accessori per giocattoli volanti > Accessori per aquiloni > Bobine e spolette per fili per aquiloni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7311,'Giochi e giocattoli > Giocattoli > Accessori per piscine di palline');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7312,'Giochi e giocattoli > Giocattoli > Accessori per piscine di palline > Palline per piscine di palline');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5970,'Giochi e giocattoli > Giocattoli > Accessori per veicoli giocattolo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5971,'Giochi e giocattoli > Giocattoli > Accessori per veicoli giocattolo > Accessori per auto da corsa giocattolo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5153,'Giochi e giocattoli > Giocattoli > Accessori per veicoli giocattolo > Accessori trenini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2778,'Giochi e giocattoli > Giocattoli > Accessori veicoli radiocomandati');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1255,'Giochi e giocattoli > Giocattoli > Bambole, playset e giocattoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3584,'Giochi e giocattoli > Giocattoli > Bambole, playset e giocattoli > Accessori bambole e action figure');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2497,'Giochi e giocattoli > Giocattoli > Bambole, playset e giocattoli > Accessori case bambole');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6056,'Giochi e giocattoli > Giocattoli > Bambole, playset e giocattoli > Accessori per burattini e teatro dei burattini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6058,'Giochi e giocattoli > Giocattoli > Bambole, playset e giocattoli > Action figure');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1257,'Giochi e giocattoli > Giocattoli > Bambole, playset e giocattoli > Bambole');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8021,'Giochi e giocattoli > Giocattoli > Bambole, playset e giocattoli > Bambole di carta e magnetiche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2499,'Giochi e giocattoli > Giocattoli > Bambole, playset e giocattoli > Case delle bambole');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7114,'Giochi e giocattoli > Giocattoli > Bambole, playset e giocattoli > Figurine bobblehead');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1259,'Giochi e giocattoli > Giocattoli > Bambole, playset e giocattoli > Orsacchiotti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3166,'Giochi e giocattoli > Giocattoli > Bambole, playset e giocattoli > Playset');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1258,'Giochi e giocattoli > Giocattoli > Bambole, playset e giocattoli > Pupazzetti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6057,'Giochi e giocattoli > Giocattoli > Bambole, playset e giocattoli > Teatri dei burattini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499712,'Giochi e giocattoli > Giocattoli > Ceste dono con giocattoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3627,'Giochi e giocattoli > Giocattoli > Gadget e armi giocattolo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2799,'Giochi e giocattoli > Giocattoli > Giocattoli a cavalcioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6379,'Giochi e giocattoli > Giocattoli > Giocattoli a cavalcioni > Carrettini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6407,'Giochi e giocattoli > Giocattoli > Giocattoli a cavalcioni > Cavalli a dondolo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3441,'Giochi e giocattoli > Giocattoli > Giocattoli a cavalcioni > Giochi a dondolo e a cavalcioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2724,'Giochi e giocattoli > Giocattoli > Giocattoli a cavalcioni > Veicoli a spinta e a pedali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2753,'Giochi e giocattoli > Giocattoli > Giocattoli a cavalcioni > Veicoli elettrici per bambini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2953,'Giochi e giocattoli > Giocattoli > Giocattoli a molla');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3731,'Giochi e giocattoli > Giocattoli > Giocattoli artistici e da disegno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505818,'Giochi e giocattoli > Giocattoli > Giocattoli artistici e da disegno > Paste modellabili');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3079,'Giochi e giocattoli > Giocattoli > Giocattoli artistici e da disegno > Tavolette disegno giocattolo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1262,'Giochi e giocattoli > Giocattoli > Giocattoli educativi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6466,'Giochi e giocattoli > Giocattoli > Giocattoli educativi > Abachi giocattolo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500015,'Giochi e giocattoli > Giocattoli > Giocattoli educativi > Carte educative');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3088,'Giochi e giocattoli > Giocattoli > Giocattoli educativi > Formicai');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499938,'Giochi e giocattoli > Giocattoli > Giocattoli educativi > Giocattoli e modelli astronomici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5529,'Giochi e giocattoli > Giocattoli > Giocattoli educativi > Giocattoli per la lettura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3928,'Giochi e giocattoli > Giocattoli > Giocattoli educativi > Kit collezione insetti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3500,'Giochi e giocattoli > Giocattoli > Giocattoli educativi > Kit scientifici e di esplorazione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1264,'Giochi e giocattoli > Giocattoli > Giocattoli musicali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3252,'Giochi e giocattoli > Giocattoli > Giocattoli musicali > Strumenti giocattolo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1254,'Giochi e giocattoli > Giocattoli > Giocattoli per costruzioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3287,'Giochi e giocattoli > Giocattoli > Giocattoli per costruzioni > Blocchi a incastro');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3172,'Giochi e giocattoli > Giocattoli > Giocattoli per costruzioni > Blocchi di gommapiuma');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3617,'Giochi e giocattoli > Giocattoli > Giocattoli per costruzioni > Blocchi di legno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3805,'Giochi e giocattoli > Giocattoli > Giocattoli per costruzioni > Costruzioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3163,'Giochi e giocattoli > Giocattoli > Giocattoli per costruzioni > Set piste di biglie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1268,'Giochi e giocattoli > Giocattoli > Giocattoli spiaggia e sabbia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1266,'Giochi e giocattoli > Giocattoli > Giocattoli sportivi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3675,'Giochi e giocattoli > Giocattoli > Giocattoli sportivi > Boomerang');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500113,'Giochi e giocattoli > Giocattoli > Giocattoli sportivi > Fingerboard e set appositi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3909,'Giochi e giocattoli > Giocattoli > Giocattoli sportivi > Footbag');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4167,'Giochi e giocattoli > Giocattoli > Giocattoli sportivi > Frisbee');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3776,'Giochi e giocattoli > Giocattoli > Giocattoli sportivi > Giocattoli baseball');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3552,'Giochi e giocattoli > Giocattoli > Giocattoli sportivi > Giocattoli basket');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3665,'Giochi e giocattoli > Giocattoli > Giocattoli sportivi > Giocattoli bowling');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3371,'Giochi e giocattoli > Giocattoli > Giocattoli sportivi > Giocattoli da calcio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8529,'Giochi e giocattoli > Giocattoli > Giocattoli sportivi > Giocattoli da pesca');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3199,'Giochi e giocattoli > Giocattoli > Giocattoli sportivi > Giocattoli fitness');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3215,'Giochi e giocattoli > Giocattoli > Giocattoli sportivi > Giocattoli fitness > Hula hoop');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3226,'Giochi e giocattoli > Giocattoli > Giocattoli sportivi > Giocattoli golf');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3943,'Giochi e giocattoli > Giocattoli > Giocattoli sportivi > Giocattoli hockey');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505284,'Giochi e giocattoli > Giocattoli > Giocattoli sportivi > Giochi di racchetta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499965,'Giochi e giocattoli > Giocattoli > Giocattoli sportivi > Palle per parco giochi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2546,'Giochi e giocattoli > Giocattoli > Giocattoli telecomandati');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3677,'Giochi e giocattoli > Giocattoli > Giocattoli telecomandati > Aerei radiocomandati');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3601,'Giochi e giocattoli > Giocattoli > Giocattoli telecomandati > Auto radiocomandate');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3532,'Giochi e giocattoli > Giocattoli > Giocattoli telecomandati > Barche radiocomandate');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5969,'Giochi e giocattoli > Giocattoli > Giocattoli telecomandati > Carri armati telecomandati');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7090,'Giochi e giocattoli > Giocattoli > Giocattoli telecomandati > Dirigibili e palloni radiocomandati');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3554,'Giochi e giocattoli > Giocattoli > Giocattoli telecomandati > Elicotteri radiocomandati');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5968,'Giochi e giocattoli > Giocattoli > Giocattoli telecomandati > Moto telecomandate');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6059,'Giochi e giocattoli > Giocattoli > Giocattoli telecomandati > Robot telecomandati');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3562,'Giochi e giocattoli > Giocattoli > Giocattoli visivi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3301,'Giochi e giocattoli > Giocattoli > Giocattoli visivi > Caleidoscopi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3782,'Giochi e giocattoli > Giocattoli > Giocattoli visivi > Prismi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1261,'Giochi e giocattoli > Giocattoli > Giocattoli volanti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3460,'Giochi e giocattoli > Giocattoli > Giocattoli volanti > Acquiloni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3378,'Giochi e giocattoli > Giocattoli > Giocattoli volanti > Alianti giocattolo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3263,'Giochi e giocattoli > Giocattoli > Giocattoli volanti > Giocattoli da lancio con paracadute');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3966,'Giochi e giocattoli > Giocattoli > Giocattoli volanti > Razzi ad aria e acqua');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4352,'Giochi e giocattoli > Giocattoli > Giochi di attività');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7148,'Giochi e giocattoli > Giocattoli > Giochi di attività > Accessori e parti di yo-yo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3534,'Giochi e giocattoli > Giocattoli > Giochi di attività > Biglie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7519,'Giochi e giocattoli > Giocattoli > Giochi di attività > Giocattoli con palla e coppa');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7425,'Giochi e giocattoli > Giocattoli > Giochi di attività > Giocattoli con palla e racchetta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4177,'Giochi e giocattoli > Giocattoli > Giochi di attività > Giochi a molla');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7473,'Giochi e giocattoli > Giocattoli > Giochi di attività > Giochi con nastri e fettucce');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3874,'Giochi e giocattoli > Giocattoli > Giochi di attività > Giochi per bolle di sapone');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3733,'Giochi e giocattoli > Giocattoli > Giochi di attività > Palle rimbalzanti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3212,'Giochi e giocattoli > Giocattoli > Giochi di attività > Soluzioni per bolle');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4216,'Giochi e giocattoli > Giocattoli > Giochi di attività > Toy jack');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3466,'Giochi e giocattoli > Giocattoli > Giochi di attività > Trottole');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3929,'Giochi e giocattoli > Giocattoli > Giochi di attività > Yo-yo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3229,'Giochi e giocattoli > Giocattoli > Giochi di simulazione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3751,'Giochi e giocattoli > Giocattoli > Giochi di simulazione > Attrezzi giocattolo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3298,'Giochi e giocattoli > Giocattoli > Giochi di simulazione > Cucine e cibi giocattolo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3680,'Giochi e giocattoli > Giocattoli > Giochi di simulazione > Denaro e banche giocattolo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3659,'Giochi e giocattoli > Giocattoli > Giochi di simulazione > Dispositivi elettronici giocattolo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4004,'Giochi e giocattoli > Giocattoli > Giochi di simulazione > Elettrodomestici giocattolo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3288,'Giochi e giocattoli > Giocattoli > Giochi di simulazione > Prati e giardini giocattolo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3129,'Giochi e giocattoli > Giocattoli > Giochi di simulazione > Professioni e ruoli per giocare');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8295,'Giochi e giocattoli > Giocattoli > Giochi di simulazione > Supermarket giocattolo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3911,'Giochi e giocattoli > Giocattoli > Giochi per il bagnetto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3074,'Giochi e giocattoli > Giocattoli > Giochi/passatempo da scrivania');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5872,'Giochi e giocattoli > Giocattoli > Giochi/passatempo da scrivania > Giocattoli magnetici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3207,'Giochi e giocattoli > Giocattoli > Piscine di palline');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3625,'Giochi e giocattoli > Giocattoli > Robot giocattolo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2505,'Giochi e giocattoli > Giocattoli > Veicoli giocattolo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3444,'Giochi e giocattoli > Giocattoli > Veicoli giocattolo > Aerei giocattolo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3551,'Giochi e giocattoli > Giocattoli > Veicoli giocattolo > Automobili giocattolo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3792,'Giochi e giocattoli > Giocattoli > Veicoli giocattolo > Barche giocattolo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3296,'Giochi e giocattoli > Giocattoli > Veicoli giocattolo > Camion e veicoli da costruzione giocattolo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3506,'Giochi e giocattoli > Giocattoli > Veicoli giocattolo > Elicotteri giocattolo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3590,'Giochi e giocattoli > Giocattoli > Veicoli giocattolo > Moto giocattolo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3589,'Giochi e giocattoli > Giocattoli > Veicoli giocattolo > Navi spaziali giocattolo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3474,'Giochi e giocattoli > Giocattoli > Veicoli giocattolo > Set auto da corsa giocattolo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5152,'Giochi e giocattoli > Giocattoli > Veicoli giocattolo > Treni e set di treni giocattolo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3793,'Giochi e giocattoli > Giochi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6794,'Giochi e giocattoli > Giochi > Accessori per Battle top');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7383,'Giochi e giocattoli > Giochi > Accessori per fiche da poker');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7384,'Giochi e giocattoli > Giochi > Accessori per fiche da poker > Vassoi e contenitori per fiche da poker');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6853,'Giochi e giocattoli > Giochi > Accessori per giochi di carte');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6329,'Giochi e giocattoli > Giochi > Battle top');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5403,'Giochi e giocattoli > Giochi > Fiche e set da poker');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6054,'Giochi e giocattoli > Giochi > Giochi di abilità');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1247,'Giochi e giocattoli > Giochi > Giochi di carte');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6038,'Giochi e giocattoli > Giochi > Giochi di società');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4554,'Giochi e giocattoli > Giochi > Giochi elettronici portatili');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1246,'Giochi e giocattoli > Giochi > Giochi in scatola');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3749,'Giochi e giocattoli > Giochi > Set da bingo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6037,'Giochi e giocattoli > Giochi > Set di dadi e giochi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7412,'Giochi e giocattoli > Giochi > Set e ruote per roulette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7411,'Giochi e giocattoli > Giochi > Set per blackjack e dadi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8472,'Giochi e giocattoli > Giochi > Slot machine');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3867,'Giochi e giocattoli > Puzzle');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7081,'Giochi e giocattoli > Puzzle > Accessori per puzzle');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2618,'Giochi e giocattoli > Puzzle > Puzzle in legno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6725,'Giochi e giocattoli > Puzzle > Puzzle in legno e con pioli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4011,'Giochi e giocattoli > Puzzle > Puzzle meccanici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4648,'Giochi e giocattoli > Timer per giochi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(783,'Media');
insert into GOOGLE_CATEGORY (codice,descrizione) values(839,'Media > DVD e video');
insert into GOOGLE_CATEGORY (codice,descrizione) values(784,'Media > Libri');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5037,'Media > Manuali prodotti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5861,'Media > Manuali prodotti > Manuali di attrezzature sportive e fitness');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499821,'Media > Manuali prodotti > Manuali di fotocamere e ottica');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5860,'Media > Manuali prodotti > Manuali di modelli e giocattoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499866,'Media > Manuali prodotti > Manuali di prodotti per ufficio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5038,'Media > Manuali prodotti > Manuali dispositivi elettronici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5039,'Media > Manuali prodotti > Manuali elettrodomestici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5041,'Media > Manuali prodotti > Manuali manutenzione veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7516,'Media > Manuali prodotti > Manuali per apparecchi e strumenti elettrici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5040,'Media > Manuali prodotti > Manuali strumenti cucina');
insert into GOOGLE_CATEGORY (codice,descrizione) values(887,'Media > Musica su partitura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499995,'Media > Piani per progetti di carpenteria e lavorazione del legno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(855,'Media > Registrazioni di musica e suoni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(886,'Media > Riviste e giornali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(469,'Salute e bellezza');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2915,'Salute e bellezza > Cura della persona');
insert into GOOGLE_CATEGORY (codice,descrizione) values(485,'Salute e bellezza > Cura della persona > Accessori sanitari femminili');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2387,'Salute e bellezza > Cura della persona > Accessori sanitari femminili > Assorbenti e proteggi slip');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8122,'Salute e bellezza > Cura della persona > Accessori sanitari femminili > Coppe mestruali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5821,'Salute e bellezza > Cura della persona > Accessori sanitari femminili > Creme e lavande vaginali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6862,'Salute e bellezza > Cura della persona > Accessori sanitari femminili > Deodoranti femminili');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2564,'Salute e bellezza > Cura della persona > Accessori sanitari femminili > Tamponi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4076,'Salute e bellezza > Cura della persona > Ausili per il sonno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4211,'Salute e bellezza > Cura della persona > Ausili per il sonno > Cuscini da viaggio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4056,'Salute e bellezza > Cura della persona > Ausili per il sonno > Generatori di rumore bianco');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4313,'Salute e bellezza > Cura della persona > Ausili per il sonno > Mascherine per dormire');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6017,'Salute e bellezza > Cura della persona > Ausili per il sonno > Rimedi contro russamento e apnea nel sonno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4929,'Salute e bellezza > Cura della persona > Batuffoli di cotone');
insert into GOOGLE_CATEGORY (codice,descrizione) values(473,'Salute e bellezza > Cura della persona > Cosmetici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(474,'Salute e bellezza > Cura della persona > Cosmetici > Bagno e corpo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2747,'Salute e bellezza > Cura della persona > Cosmetici > Bagno e corpo > Bagni schiuma');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2522,'Salute e bellezza > Cura della persona > Cosmetici > Bagno e corpo > Bagnoschiuma e sali da bagno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4049,'Salute e bellezza > Cura della persona > Cosmetici > Bagno e corpo > Cuffie da doccia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3691,'Salute e bellezza > Cura della persona > Cosmetici > Bagno e corpo > Igienizzanti per mani');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499913,'Salute e bellezza > Cura della persona > Cosmetici > Bagno e corpo > Salviettine igieniche per adulti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7417,'Salute e bellezza > Cura della persona > Cosmetici > Bagno e corpo > Sapone in polvere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3208,'Salute e bellezza > Cura della persona > Cosmetici > Bagno e corpo > Sapone liquido per mani');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2503,'Salute e bellezza > Cura della persona > Cosmetici > Bagno e corpo > Saponetta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2876,'Salute e bellezza > Cura della persona > Cosmetici > Bagno e corpo > Spazzole da bagno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2875,'Salute e bellezza > Cura della persona > Cosmetici > Bagno e corpo > Spugne esfolianti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(475,'Salute e bellezza > Cura della persona > Cosmetici > Cesti con prodotti bagno e corpo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(567,'Salute e bellezza > Cura della persona > Cosmetici > Cura della pelle');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5980,'Salute e bellezza > Cura della persona > Cosmetici > Cura della pelle > Cipria per il corpo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(482,'Salute e bellezza > Cura della persona > Cosmetici > Cura della pelle > Cura delle labbra');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2526,'Salute e bellezza > Cura della persona > Cosmetici > Cura della pelle > Detergenti viso');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2844,'Salute e bellezza > Cura della persona > Cosmetici > Cura della pelle > Filtri solari');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7429,'Salute e bellezza > Cura della persona > Cosmetici > Cura della pelle > Kit anti-età per la cura della pelle');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7467,'Salute e bellezza > Cura della persona > Cosmetici > Cura della pelle > Kit per la pulizia del viso');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2592,'Salute e bellezza > Cura della persona > Cosmetici > Cura della pelle > Lozione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6262,'Salute e bellezza > Cura della persona > Cosmetici > Cura della pelle > Maschere e peeling per la cura della pelle');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6104,'Salute e bellezza > Cura della persona > Cosmetici > Cura della pelle > Oli per il corpo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8029,'Salute e bellezza > Cura della persona > Cosmetici > Cura della pelle > Pellicole per maschere per la cura della pelle');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2740,'Salute e bellezza > Cura della persona > Cosmetici > Cura della pelle > Prodotti abbronzanti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5338,'Salute e bellezza > Cura della persona > Cosmetici > Cura della pelle > Prodotti abbronzanti > Autoabbronzante');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5339,'Salute e bellezza > Cura della persona > Cosmetici > Cura della pelle > Prodotti abbronzanti > Olio abbronzante');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5820,'Salute e bellezza > Cura della persona > Cosmetici > Cura della pelle > Repellente per insetti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6791,'Salute e bellezza > Cura della persona > Cosmetici > Cura della pelle > Strisce per pori viso');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6034,'Salute e bellezza > Cura della persona > Cosmetici > Cura della pelle > Struccanti per trucco');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5976,'Salute e bellezza > Cura della persona > Cosmetici > Cura della pelle > Tonici e astringenti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(481,'Salute e bellezza > Cura della persona > Cosmetici > Cura della pelle > Trattamenti per l \'acne');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6863,'Salute e bellezza > Cura della persona > Cosmetici > Cura della pelle > Trattamenti per verruche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6753,'Salute e bellezza > Cura della persona > Cosmetici > Cura della pelle > Vaselina');
insert into GOOGLE_CATEGORY (codice,descrizione) values(478,'Salute e bellezza > Cura della persona > Cosmetici > Cura delle unghie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6893,'Salute e bellezza > Cura della persona > Cosmetici > Cura delle unghie > Colla per unghie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5975,'Salute e bellezza > Cura della persona > Cosmetici > Cura delle unghie > Kit artistici per unghie e accessori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3009,'Salute e bellezza > Cura della persona > Cosmetici > Cura delle unghie > Oli e creme per cuticole');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2683,'Salute e bellezza > Cura della persona > Cosmetici > Cura delle unghie > Smalti per unghie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7445,'Salute e bellezza > Cura della persona > Cosmetici > Cura delle unghie > Solventi per unghie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2946,'Salute e bellezza > Cura della persona > Cosmetici > Cura delle unghie > Solventi unghie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(233419,'Salute e bellezza > Cura della persona > Cosmetici > Cura delle unghie > Spray e gocce asciugasmalto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4218,'Salute e bellezza > Cura della persona > Cosmetici > Cura delle unghie > Unghie finte');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6069,'Salute e bellezza > Cura della persona > Cosmetici > Kit per il trucco');
insert into GOOGLE_CATEGORY (codice,descrizione) values(479,'Salute e bellezza > Cura della persona > Cosmetici > Profumi e colonie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6331,'Salute e bellezza > Cura della persona > Cosmetici > Pulitori per utensili cosmetici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(477,'Salute e bellezza > Cura della persona > Cosmetici > Trucco');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4779,'Salute e bellezza > Cura della persona > Cosmetici > Trucco > Costumi e trucco teatrale');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6072,'Salute e bellezza > Cura della persona > Cosmetici > Trucco > Spray di finitura trucco');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3509,'Salute e bellezza > Cura della persona > Cosmetici > Trucco > Tatuaggi temporanei');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2779,'Salute e bellezza > Cura della persona > Cosmetici > Trucco > Trucco degli occhi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2761,'Salute e bellezza > Cura della persona > Cosmetici > Trucco > Trucco degli occhi > Ciglia finte');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2807,'Salute e bellezza > Cura della persona > Cosmetici > Trucco > Trucco degli occhi > Eyeliner');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2834,'Salute e bellezza > Cura della persona > Cosmetici > Trucco > Trucco degli occhi > Mascara');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2686,'Salute e bellezza > Cura della persona > Cosmetici > Trucco > Trucco degli occhi > Matite per sopracciglia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2904,'Salute e bellezza > Cura della persona > Cosmetici > Trucco > Trucco degli occhi > Ombretto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8219,'Salute e bellezza > Cura della persona > Cosmetici > Trucco > Trucco degli occhi > Primer per mascara');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8220,'Salute e bellezza > Cura della persona > Cosmetici > Trucco > Trucco degli occhi > Primer per ombretto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6340,'Salute e bellezza > Cura della persona > Cosmetici > Trucco > Trucco degli occhi > Trattamenti per la crescita di ciglia e sopracciglia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2645,'Salute e bellezza > Cura della persona > Cosmetici > Trucco > Trucco labbra');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2858,'Salute e bellezza > Cura della persona > Cosmetici > Trucco > Trucco labbra > Lucidalabbra');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2589,'Salute e bellezza > Cura della persona > Cosmetici > Trucco > Trucco labbra > Matite per labbra');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8217,'Salute e bellezza > Cura della persona > Cosmetici > Trucco > Trucco labbra > Primer per le labbra');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3021,'Salute e bellezza > Cura della persona > Cosmetici > Trucco > Trucco labbra > Rossetto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6306,'Salute e bellezza > Cura della persona > Cosmetici > Trucco > Trucco labbra > Tinte per labbra e guance');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5978,'Salute e bellezza > Cura della persona > Cosmetici > Trucco > Trucco per il corpo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5979,'Salute e bellezza > Cura della persona > Cosmetici > Trucco > Trucco per il corpo > Colori per body painting e fondotinta');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5981,'Salute e bellezza > Cura della persona > Cosmetici > Trucco > Trucco per il corpo > Glitter corpo e capelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2571,'Salute e bellezza > Cura della persona > Cosmetici > Trucco > Trucco viso e guance');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6305,'Salute e bellezza > Cura della persona > Cosmetici > Trucco > Trucco viso e guance > Blush e terre');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2980,'Salute e bellezza > Cura della persona > Cosmetici > Trucco > Trucco viso e guance > Ciprie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2765,'Salute e bellezza > Cura della persona > Cosmetici > Trucco > Trucco viso e guance > Fondotinta e correttori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6304,'Salute e bellezza > Cura della persona > Cosmetici > Trucco > Trucco viso e guance > Highlighter e illuminanti per il viso');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8218,'Salute e bellezza > Cura della persona > Cosmetici > Trucco > Trucco viso e guance > Primer per il viso');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2619,'Salute e bellezza > Cura della persona > Cosmetici > Utensili cosmetici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2958,'Salute e bellezza > Cura della persona > Cosmetici > Utensili cosmetici > Accessori cura della pelle');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499926,'Salute e bellezza > Cura della persona > Cosmetici > Utensili cosmetici > Accessori cura della pelle > Applicatori di lozioni e creme solari');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6261,'Salute e bellezza > Cura della persona > Cosmetici > Utensili cosmetici > Accessori cura della pelle > Estrattori per la cura della pelle');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7190,'Salute e bellezza > Cura della persona > Cosmetici > Utensili cosmetici > Accessori cura della pelle > Lime per i piedi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2511,'Salute e bellezza > Cura della persona > Cosmetici > Utensili cosmetici > Accessori cura della pelle > Pietre pomice');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7018,'Salute e bellezza > Cura della persona > Cosmetici > Utensili cosmetici > Accessori cura della pelle > Rulli per la cura della pelle');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6760,'Salute e bellezza > Cura della persona > Cosmetici > Utensili cosmetici > Accessori cura della pelle > Saune viso');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6260,'Salute e bellezza > Cura della persona > Cosmetici > Utensili cosmetici > Accessori cura della pelle > Spazzole e sistemi di pulizia della pelle');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8132,'Salute e bellezza > Cura della persona > Cosmetici > Utensili cosmetici > Accessori cura della pelle > Teste per spazzole per la pulizia della pelle');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2975,'Salute e bellezza > Cura della persona > Cosmetici > Utensili cosmetici > Accessori cura delle unghie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499698,'Salute e bellezza > Cura della persona > Cosmetici > Utensili cosmetici > Accessori cura delle unghie > Accessori fresa per unghie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5880,'Salute e bellezza > Cura della persona > Cosmetici > Utensili cosmetici > Accessori cura delle unghie > Asciugaunghie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7490,'Salute e bellezza > Cura della persona > Cosmetici > Utensili cosmetici > Accessori cura delle unghie > Frese per unghie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2734,'Salute e bellezza > Cura della persona > Cosmetici > Utensili cosmetici > Accessori cura delle unghie > Limette per unghie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6341,'Salute e bellezza > Cura della persona > Cosmetici > Utensili cosmetici > Accessori cura delle unghie > Lucida unghie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7494,'Salute e bellezza > Cura della persona > Cosmetici > Utensili cosmetici > Accessori cura delle unghie > Separatori di dita per manicure e pedicure');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6300,'Salute e bellezza > Cura della persona > Cosmetici > Utensili cosmetici > Accessori cura delle unghie > Set per manicure');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3037,'Salute e bellezza > Cura della persona > Cosmetici > Utensili cosmetici > Accessori cura delle unghie > Spingicuticole');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2739,'Salute e bellezza > Cura della persona > Cosmetici > Utensili cosmetici > Accessori cura delle unghie > Tagliacuticole');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2828,'Salute e bellezza > Cura della persona > Cosmetici > Utensili cosmetici > Accessori cura delle unghie > Tronchesini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2548,'Salute e bellezza > Cura della persona > Cosmetici > Utensili cosmetici > Accessori per il trucco');
insert into GOOGLE_CATEGORY (codice,descrizione) values(502996,'Salute e bellezza > Cura della persona > Cosmetici > Utensili cosmetici > Accessori per il trucco > Accessori per ciglia finte');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7256,'Salute e bellezza > Cura della persona > Cosmetici > Utensili cosmetici > Accessori per il trucco > Accessori per ciglia finte > Adesivo per ciglia finte');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7493,'Salute e bellezza > Cura della persona > Cosmetici > Utensili cosmetici > Accessori per il trucco > Accessori per ciglia finte > Applicatori per ciglia finte');
insert into GOOGLE_CATEGORY (codice,descrizione) values(502997,'Salute e bellezza > Cura della persona > Cosmetici > Utensili cosmetici > Accessori per il trucco > Accessori per ciglia finte > Prodotto per rimuovere ciglia finte');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499822,'Salute e bellezza > Cura della persona > Cosmetici > Utensili cosmetici > Accessori per il trucco > Astucci e custodie ricaricabili per il trucco');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7356,'Salute e bellezza > Cura della persona > Cosmetici > Utensili cosmetici > Accessori per il trucco > Colla e nastro per doppia palpebra');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2780,'Salute e bellezza > Cura della persona > Cosmetici > Utensili cosmetici > Accessori per il trucco > Curva ciglia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4121,'Salute e bellezza > Cura della persona > Cosmetici > Utensili cosmetici > Accessori per il trucco > Foglietti opacizzanti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3025,'Salute e bellezza > Cura della persona > Cosmetici > Utensili cosmetici > Accessori per il trucco > Pennelli per il trucco');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6282,'Salute e bellezza > Cura della persona > Cosmetici > Utensili cosmetici > Accessori per il trucco > Ricariche per arricciaciglia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(476,'Salute e bellezza > Cura della persona > Cosmetici > Utensili cosmetici > Accessori per il trucco > Specchi per il trucco');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4106,'Salute e bellezza > Cura della persona > Cosmetici > Utensili cosmetici > Accessori per il trucco > Spugnette per il trucco');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6555,'Salute e bellezza > Cura della persona > Cosmetici > Utensili cosmetici > Accessori per il trucco > Stampi per sopracciglia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2934,'Salute e bellezza > Cura della persona > Cotton fioc');
insert into GOOGLE_CATEGORY (codice,descrizione) values(486,'Salute e bellezza > Cura della persona > Cura dei capelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5977,'Salute e bellezza > Cura della persona > Cura dei capelli > Accessori per la colorazione dei capelli da colorare');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6018,'Salute e bellezza > Cura della persona > Cura dei capelli > Accessori per utensili per parrucchieri');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4569,'Salute e bellezza > Cura della persona > Cura dei capelli > Accessori per utensili per parrucchieri > Accessori arricciacapelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4475,'Salute e bellezza > Cura della persona > Cura dei capelli > Accessori per utensili per parrucchieri > Accessori asciugacapelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5317,'Salute e bellezza > Cura della persona > Cura dei capelli > Accessori per utensili per parrucchieri > Fermagli e spilloni per bigodini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6429,'Salute e bellezza > Cura della persona > Cura dei capelli > Caschi da parrucchiere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6099,'Salute e bellezza > Cura della persona > Cura dei capelli > Correttori per la perdita di capelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1901,'Salute e bellezza > Cura della persona > Cura dei capelli > Fissatore in gel, spray e schiuma');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3013,'Salute e bellezza > Cura della persona > Cura dei capelli > Forbici per capelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8452,'Salute e bellezza > Cura della persona > Cura dei capelli > Kit per la cura dei capelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6052,'Salute e bellezza > Cura della persona > Cura dei capelli > Permanenti e prodotti raddrizzare capelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2441,'Salute e bellezza > Cura della persona > Cura dei capelli > Shampoo e balsamo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6053,'Salute e bellezza > Cura della persona > Cura dei capelli > Solventi per tinte per capelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2814,'Salute e bellezza > Cura della persona > Cura dei capelli > Tintura per capelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4766,'Salute e bellezza > Cura della persona > Cura dei capelli > Trattamenti caduta capelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6019,'Salute e bellezza > Cura della persona > Cura dei capelli > Utensili per parrucchieri');
insert into GOOGLE_CATEGORY (codice,descrizione) values(489,'Salute e bellezza > Cura della persona > Cura dei capelli > Utensili per parrucchieri > Arricciacapelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(490,'Salute e bellezza > Cura della persona > Cura dei capelli > Utensili per parrucchieri > Asciugacapelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(488,'Salute e bellezza > Cura della persona > Cura dei capelli > Utensili per parrucchieri > Bigodini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(487,'Salute e bellezza > Cura della persona > Cura dei capelli > Utensili per parrucchieri > Pettini e spazzole');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499992,'Salute e bellezza > Cura della persona > Cura dei capelli > Utensili per parrucchieri > Set di strumenti di parruccheria');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3407,'Salute e bellezza > Cura della persona > Cura dei capelli > Utensili per parrucchieri > Stiracapelli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(515,'Salute e bellezza > Cura della persona > Cura dei piedi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3049,'Salute e bellezza > Cura della persona > Cura dei piedi > Deodoranti per piedi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7495,'Salute e bellezza > Cura della persona > Cura dei piedi > Distanziatori di alluci');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2801,'Salute e bellezza > Cura della persona > Cura dei piedi > Solette e sottopiedi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2992,'Salute e bellezza > Cura della persona > Cura dei piedi > Trattamento borsite dell \'alluce');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3022,'Salute e bellezza > Cura della persona > Cura dei piedi > Trattamento calli e duroni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1380,'Salute e bellezza > Cura della persona > Cura della vista');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2521,'Salute e bellezza > Cura della persona > Cura della vista > Accessori per occhiali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8204,'Salute e bellezza > Cura della persona > Cura della vista > Accessori per occhiali > Cordini e catenine per occhiali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5507,'Salute e bellezza > Cura della persona > Cura della vista > Accessori per occhiali > Custodie per occhiali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(352853,'Salute e bellezza > Cura della persona > Cura della vista > Accessori per occhiali > Soluzioni per la pulizia delle lenti a contatto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2922,'Salute e bellezza > Cura della persona > Cura della vista > Colliri');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3011,'Salute e bellezza > Cura della persona > Cura della vista > Cura delle lenti a contatto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6510,'Salute e bellezza > Cura della persona > Cura della vista > Cura delle lenti a contatto > Custodie per lenti a contatto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7363,'Salute e bellezza > Cura della persona > Cura della vista > Cura delle lenti a contatto > Kit per la cura delle lenti a contatto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6509,'Salute e bellezza > Cura della persona > Cura della vista > Cura delle lenti a contatto > Soluzioni per lenti a contatto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(524,'Salute e bellezza > Cura della persona > Cura della vista > Lenti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2923,'Salute e bellezza > Cura della persona > Cura della vista > Lenti a contatto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2733,'Salute e bellezza > Cura della persona > Cura della vista > Lenti per occhiali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6977,'Salute e bellezza > Cura della persona > Cura della vista > Lenti per occhiali da sole');
insert into GOOGLE_CATEGORY (codice,descrizione) values(506,'Salute e bellezza > Cura della persona > Cura delle orecchie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6560,'Salute e bellezza > Cura della persona > Cura delle orecchie > Asciuga orecchie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500024,'Salute e bellezza > Cura della persona > Cura delle orecchie > Bastoncini e cucchiai per orecchie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5706,'Salute e bellezza > Cura della persona > Cura delle orecchie > Candele per orecchie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7542,'Salute e bellezza > Cura della persona > Cura delle orecchie > Dispenser di bastoncini per le orecchie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6559,'Salute e bellezza > Cura della persona > Cura delle orecchie > Gocce per le orecchie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6562,'Salute e bellezza > Cura della persona > Cura delle orecchie > Kit per la pulizia delle orecchie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6561,'Salute e bellezza > Cura della persona > Cura delle orecchie > Siringhe per orecchie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2596,'Salute e bellezza > Cura della persona > Cura delle orecchie > Tappi per le orecchie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(484,'Salute e bellezza > Cura della persona > Deodoranti e antitraspiranti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(526,'Salute e bellezza > Cura della persona > Igiene orale');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4775,'Salute e bellezza > Cura della persona > Igiene orale > Accessori per spazzolini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4942,'Salute e bellezza > Cura della persona > Igiene orale > Accessori per spazzolini > Igienizzanti spazzolini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6920,'Salute e bellezza > Cura della persona > Igiene orale > Accessori per spazzolini > Protezioni per spazzolini da denti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4776,'Salute e bellezza > Cura della persona > Igiene orale > Accessori per spazzolini > Testine ricambio spazzolini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5155,'Salute e bellezza > Cura della persona > Igiene orale > Adesivi dentiera');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5823,'Salute e bellezza > Cura della persona > Igiene orale > Bite antibruxismo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3040,'Salute e bellezza > Cura della persona > Igiene orale > Collutorio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505367,'Salute e bellezza > Cura della persona > Igiene orale > Custodie per dentiere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2527,'Salute e bellezza > Cura della persona > Igiene orale > Dentiere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1360,'Salute e bellezza > Cura della persona > Igiene orale > Dentifricio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5824,'Salute e bellezza > Cura della persona > Igiene orale > Detergenti per dentiere');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2620,'Salute e bellezza > Cura della persona > Igiene orale > Filo interdentale');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5295,'Salute e bellezza > Cura della persona > Igiene orale > Idropulsori dentali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8543,'Salute e bellezza > Cura della persona > Igiene orale > Kit per la riparazione dei denti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6715,'Salute e bellezza > Cura della persona > Igiene orale > Power flosser');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6455,'Salute e bellezza > Cura della persona > Igiene orale > Punte sostitutive per idropulsori dentali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3019,'Salute e bellezza > Cura della persona > Igiene orale > Sbiancante per denti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(527,'Salute e bellezza > Cura della persona > Igiene orale > Spazzolini');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6441,'Salute e bellezza > Cura della persona > Igiene orale > Spazzolini per la lingua');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6189,'Salute e bellezza > Cura della persona > Igiene orale > Spray alito fresco');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5154,'Salute e bellezza > Cura della persona > Igiene orale > Spremidentifricio e dispenser');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2769,'Salute e bellezza > Cura della persona > Igiene orale > Stimolatori gengivali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4316,'Salute e bellezza > Cura della persona > Igiene orale > Stuzzicadenti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(528,'Salute e bellezza > Cura della persona > Insaponatura e rasatura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6842,'Salute e bellezza > Cura della persona > Insaponatura e rasatura > Accessori per tagliacapelli e tagliabasette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(531,'Salute e bellezza > Cura della persona > Insaponatura e rasatura > Accessori rasoi elettrici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8531,'Salute e bellezza > Cura della persona > Insaponatura e rasatura > Ciotole e tazze per rasatura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2971,'Salute e bellezza > Cura della persona > Insaponatura e rasatura > Crema da barba');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8214,'Salute e bellezza > Cura della persona > Insaponatura e rasatura > Decolorante per peli di corpo e viso');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4507,'Salute e bellezza > Cura della persona > Insaponatura e rasatura > Depilazione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4508,'Salute e bellezza > Cura della persona > Insaponatura e rasatura > Depilazione > Depilatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4509,'Salute e bellezza > Cura della persona > Insaponatura e rasatura > Depilazione > Dispositivi per elettrolisi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7199,'Salute e bellezza > Cura della persona > Insaponatura e rasatura > Depilazione > Dispositivi per la depilazione laser e a luce pulsata');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4510,'Salute e bellezza > Cura della persona > Insaponatura e rasatura > Depilazione > Epilatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4511,'Salute e bellezza > Cura della persona > Insaponatura e rasatura > Depilazione > Prodotti e kit per depilazione con cera');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8136,'Salute e bellezza > Cura della persona > Insaponatura e rasatura > Depilazione > Scaldacera per depilazione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(529,'Salute e bellezza > Cura della persona > Insaponatura e rasatura > Dopobarba');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5111,'Salute e bellezza > Cura della persona > Insaponatura e rasatura > Kit da barba');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2508,'Salute e bellezza > Cura della persona > Insaponatura e rasatura > Matite emostatiche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2681,'Salute e bellezza > Cura della persona > Insaponatura e rasatura > Pennelli da barba');
insert into GOOGLE_CATEGORY (codice,descrizione) values(534,'Salute e bellezza > Cura della persona > Insaponatura e rasatura > Rasoi e lame per rasoi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(532,'Salute e bellezza > Cura della persona > Insaponatura e rasatura > Rasoi elettrici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(533,'Salute e bellezza > Cura della persona > Insaponatura e rasatura > Tagliacapelli e tagliabasette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7134,'Salute e bellezza > Cura della persona > Kit e articoli per clisteri');
insert into GOOGLE_CATEGORY (codice,descrizione) values(472,'Salute e bellezza > Cura della persona > Lettini abbronzanti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(777,'Salute e bellezza > Cura della persona > Lubrificanti personali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(493,'Salute e bellezza > Cura della persona > Mal di schiena');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7404,'Salute e bellezza > Cura della persona > Mal di schiena > Cuscini di supporto lombari e per schiena');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5663,'Salute e bellezza > Cura della persona > Massaggi e relax');
insert into GOOGLE_CATEGORY (codice,descrizione) values(233420,'Salute e bellezza > Cura della persona > Massaggi e relax > Cuscini per gli occhi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500060,'Salute e bellezza > Cura della persona > Massaggi e relax > Grattaschiena');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2074,'Salute e bellezza > Cura della persona > Massaggi e relax > Lettini da massaggio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(471,'Salute e bellezza > Cura della persona > Massaggi e relax > Massaggiatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5664,'Salute e bellezza > Cura della persona > Massaggi e relax > Oli da massaggio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8135,'Salute e bellezza > Cura della persona > Massaggi e relax > Pietre per massaggi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1442,'Salute e bellezza > Cura della persona > Massaggi e relax > Poltrone da massaggio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8530,'Salute e bellezza > Cura della persona > Massaggi e relax > Riscaldatori per pietre per massaggi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2656,'Salute e bellezza > Cura della persona > Pinzette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6921,'Salute e bellezza > Cura della persona > Tende per l \'applicazione di abbrozzanti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5573,'Salute e bellezza > Pulizia e cura dei gioielli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500083,'Salute e bellezza > Pulizia e cura dei gioielli > Detergenti a vapore per gioielli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499919,'Salute e bellezza > Pulizia e cura dei gioielli > Detergenti e soluzioni per la pulizia di gioielli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5124,'Salute e bellezza > Pulizia e cura dei gioielli > Kit riparazione orologi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5974,'Salute e bellezza > Pulizia e cura dei gioielli > Portagioie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500082,'Salute e bellezza > Pulizia e cura dei gioielli > Strumenti per la pulizia di gioielli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(491,'Salute e bellezza > Salute');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5071,'Salute e bellezza > Salute > Accessori lettori biometrici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6284,'Salute e bellezza > Salute > Accessori lettori biometrici > Accessori per misuratori di pressione sanguigna');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6285,'Salute e bellezza > Salute > Accessori lettori biometrici > Accessori per misuratori di pressione sanguigna > Polsini per misuratori di pressione sanguigna');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3688,'Salute e bellezza > Salute > Accessori lettori biometrici > Accessori per misurazione glicemia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3111,'Salute e bellezza > Salute > Accessori lettori biometrici > Accessori per misurazione glicemia > Pungidito');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6323,'Salute e bellezza > Salute > Accessori lettori biometrici > Accessori per misurazione glicemia > Soluzioni per il controllo della glicemia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3905,'Salute e bellezza > Salute > Accessori lettori biometrici > Accessori per misurazione glicemia > Strisce reattive per glicemia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505819,'Salute e bellezza > Salute > Accessori lettori biometrici > Accessori per monitorare l \'attività fisica');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5072,'Salute e bellezza > Salute > Accessori lettori biometrici > Accessori pesapersone');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5849,'Salute e bellezza > Salute > Agopuntura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5851,'Salute e bellezza > Salute > Agopuntura > Aghi per agopuntura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5850,'Salute e bellezza > Salute > Agopuntura > Modelli agopuntura');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4551,'Salute e bellezza > Salute > Apparato respiratorio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499692,'Salute e bellezza > Salute > Apparato respiratorio > Bombole di ossigeno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505669,'Salute e bellezza > Salute > Apparato respiratorio > Inalatori di vapore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7317,'Salute e bellezza > Salute > Apparato respiratorio > Macchine a pressione positiva');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7316,'Salute e bellezza > Salute > Apparato respiratorio > Maschere a pressione positiva');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4552,'Salute e bellezza > Salute > Apparato respiratorio > Nebulizzatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5690,'Salute e bellezza > Salute > Apparecchi acustici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5870,'Salute e bellezza > Salute > Apparecchiature per fisioterapia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505352,'Salute e bellezza > Salute > Apparecchiature per fisioterapia > Amache terapeutiche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8541,'Salute e bellezza > Salute > Apparecchiature per fisioterapia > Elettrostimolatori muscolari');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8105,'Salute e bellezza > Salute > Bende per arti amputati');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8082,'Salute e bellezza > Salute > Contenitori per urine');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7002,'Salute e bellezza > Salute > Custodie per contraccettivi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2890,'Salute e bellezza > Salute > Fitness e alimentazione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2984,'Salute e bellezza > Salute > Fitness e alimentazione > Barrette nutrizionali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5702,'Salute e bellezza > Salute > Fitness e alimentazione > Drink sostitutivi del pasto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6242,'Salute e bellezza > Salute > Fitness e alimentazione > Gel e caramelle gommose nutritive');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6871,'Salute e bellezza > Salute > Fitness e alimentazione > Purè alimentari');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7413,'Salute e bellezza > Salute > Fitness e alimentazione > Supplementi per alimentazione con sondino');
insert into GOOGLE_CATEGORY (codice,descrizione) values(525,'Salute e bellezza > Salute > Fitness e alimentazione > Vitamine e integratori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500087,'Salute e bellezza > Salute > Lampade per terapia luminosa');
insert into GOOGLE_CATEGORY (codice,descrizione) values(494,'Salute e bellezza > Salute > Lettori biometrici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2633,'Salute e bellezza > Salute > Lettori biometrici > Analizzatori alito');
insert into GOOGLE_CATEGORY (codice,descrizione) values(497,'Salute e bellezza > Salute > Lettori biometrici > Analizzatori del colesterolo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(496,'Salute e bellezza > Salute > Lettori biometrici > Analizzatori grasso corporeo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500,'Salute e bellezza > Salute > Lettori biometrici > Bilance pesapersone');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2246,'Salute e bellezza > Salute > Lettori biometrici > Misuratori glucosio nel sangue');
insert into GOOGLE_CATEGORY (codice,descrizione) values(495,'Salute e bellezza > Salute > Lettori biometrici > Misuratori pressione sanguigna');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500009,'Salute e bellezza > Salute > Lettori biometrici > Monitor di attività');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5551,'Salute e bellezza > Salute > Lettori biometrici > Pulsossimetri');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4767,'Salute e bellezza > Salute > Lettori biometrici > Rilevatori del battito cardiaco fetale');
insert into GOOGLE_CATEGORY (codice,descrizione) values(501,'Salute e bellezza > Salute > Lettori biometrici > Termometri medici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505822,'Salute e bellezza > Salute > Lettori biometrici > Test di ovulazione e monitoraggio della fertilità');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505820,'Salute e bellezza > Salute > Lozioni e gel conduttivi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5923,'Salute e bellezza > Salute > Lubrificanti chirurgici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(518,'Salute e bellezza > Salute > Medicina e farmaci');
insert into GOOGLE_CATEGORY (codice,descrizione) values(519,'Salute e bellezza > Salute > Mobilità e accessibilità');
insert into GOOGLE_CATEGORY (codice,descrizione) values(521,'Salute e bellezza > Salute > Mobilità e accessibilità > Accessori ausili accessibilità');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6929,'Salute e bellezza > Salute > Mobilità e accessibilità > Accessori di ausilio alla deambulazione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(520,'Salute e bellezza > Salute > Mobilità e accessibilità > Ausili accessibilità');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7138,'Salute e bellezza > Salute > Mobilità e accessibilità > Ausili accessibilità > Montascale');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3512,'Salute e bellezza > Salute > Mobilità e accessibilità > Ausili accessibilità > Scooter per anziani e disabili');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3364,'Salute e bellezza > Salute > Mobilità e accessibilità > Ausili accessibilità > Sedie a rotelle');
insert into GOOGLE_CATEGORY (codice,descrizione) values(502969,'Salute e bellezza > Salute > Mobilità e accessibilità > Ausili accessibilità > Tavole e teli di trasferimento');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5164,'Salute e bellezza > Salute > Mobilità e accessibilità > Ausili per la deambulazione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5165,'Salute e bellezza > Salute > Mobilità e accessibilità > Ausili per la deambulazione > Bastoni da passeggio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5166,'Salute e bellezza > Salute > Mobilità e accessibilità > Ausili per la deambulazione > Deambulatori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4248,'Salute e bellezza > Salute > Mobilità e accessibilità > Ausili per la deambulazione > Stampelle');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5488,'Salute e bellezza > Salute > Mobilità e accessibilità > Mobili e impianti per accessibilità');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7243,'Salute e bellezza > Salute > Mobilità e accessibilità > Mobili e impianti per accessibilità > Sedie e panche per doccia');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7220,'Salute e bellezza > Salute > Padelle da letto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3777,'Salute e bellezza > Salute > Portapillole');
insert into GOOGLE_CATEGORY (codice,descrizione) values(517,'Salute e bellezza > Salute > Presidi per l \'incontinenza');
insert into GOOGLE_CATEGORY (codice,descrizione) values(508,'Salute e bellezza > Salute > Primo soccorso');
insert into GOOGLE_CATEGORY (codice,descrizione) values(509,'Salute e bellezza > Salute > Primo soccorso > Bendaggi e nastri');
insert into GOOGLE_CATEGORY (codice,descrizione) values(510,'Salute e bellezza > Salute > Primo soccorso > Kit di primo soccorso');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4527,'Salute e bellezza > Salute > Primo soccorso > Prodotti lavaggio oculare');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2954,'Salute e bellezza > Salute > Primo soccorso > Prodotti pulizia e antisettici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6206,'Salute e bellezza > Salute > Primo soccorso > Protezioni per gesso e fasciature');
insert into GOOGLE_CATEGORY (codice,descrizione) values(516,'Salute e bellezza > Salute > Primo soccorso > Terapie freddo e caldo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4753,'Salute e bellezza > Salute > Primo soccorso > Terapie freddo e caldo > Borse del ghiaccio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5848,'Salute e bellezza > Salute > Primo soccorso > Terapie freddo e caldo > Creme antinfiammatorie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6205,'Salute e bellezza > Salute > Primo soccorso > Terapie freddo e caldo > Cuscini per impacco caldo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(775,'Salute e bellezza > Salute > Profilattici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5966,'Salute e bellezza > Salute > Sistemi di allarme medici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(523,'Salute e bellezza > Salute > Sostegni e tutori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7186,'Salute e bellezza > Salute > Spermicidi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5965,'Salute e bellezza > Salute > Targhette o braccialetti di identificazione per uso medico');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505293,'Salute e bellezza > Salute > Test medici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499934,'Salute e bellezza > Salute > Test medici > Kit di test allergenici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7337,'Salute e bellezza > Salute > Test medici > Kit per test del gruppo sanguigno');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7336,'Salute e bellezza > Salute > Test medici > Test HIV');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2552,'Salute e bellezza > Salute > Test medici > Test antidroga');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1680,'Salute e bellezza > Salute > Test medici > Test di gravidanza');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505294,'Salute e bellezza > Salute > Test medici > Test per infezioni delle vie urinarie');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2092,'Software');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5032,'Software > Software contenuti digitali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5036,'Software > Software contenuti digitali > Font');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2065,'Software > Software contenuti digitali > Foto e filmati stock');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5034,'Software > Software contenuti digitali > Icone computer');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8022,'Software > Software contenuti digitali > Modelli di documenti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500046,'Software > Software contenuti digitali > Opere d \'arte digitali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5035,'Software > Software contenuti digitali > Sfondo desktop');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5935,'Software > Software contenuti digitali > Valuta virtuale');
insert into GOOGLE_CATEGORY (codice,descrizione) values(313,'Software > Software per computer');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3283,'Software > Software per computer > Dati e software per mappe GPS');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7225,'Software > Software per computer > Dischi di ripristino');
insert into GOOGLE_CATEGORY (codice,descrizione) values(321,'Software > Software per computer > Sistemi operativi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5299,'Software > Software per computer > Software antivirus e sicurezza');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5303,'Software > Software per computer > Software applicativo per ufficio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(319,'Software > Software per computer > Software contenuti multimediali e progettazione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5096,'Software > Software per computer > Software contenuti multimediali e progettazione > Software composizione musicale');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4950,'Software > Software per computer > Software contenuti multimediali e progettazione > Software di animazione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6027,'Software > Software per computer > Software contenuti multimediali e progettazione > Software di modellazione 3D');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4949,'Software > Software per computer > Software contenuti multimediali e progettazione > Software home publishing');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4953,'Software > Software per computer > Software contenuti multimediali e progettazione > Software montaggio video');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4954,'Software > Software per computer > Software contenuti multimediali e progettazione > Software per grafica web');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6029,'Software > Software per computer > Software contenuti multimediali e progettazione > Software per home e interior design');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4952,'Software > Software per computer > Software contenuti multimediali e progettazione > Software per montaggio audio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4951,'Software > Software per computer > Software contenuti multimediali e progettazione > Software progettazione grafica');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6028,'Software > Software per computer > Software contenuti multimediali e progettazione > Software visualizzazione multimediale');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5301,'Software > Software per computer > Software di manutenzione e utility PC');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5302,'Software > Software per computer > Software di rete');
insert into GOOGLE_CATEGORY (codice,descrizione) values(317,'Software > Software per computer > Software educativo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(318,'Software > Software per computer > Software palmari e PDA');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5300,'Software > Software per computer > Software per le aziende e la produttività');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5304,'Software > Software per computer > Software per tasse');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5127,'Software > Software per computer > Software traduzione e dizionari');
insert into GOOGLE_CATEGORY (codice,descrizione) values(315,'Software > Software per computer > Strumenti compilazione/programmazione');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1279,'Software > Software video game');
insert into GOOGLE_CATEGORY (codice,descrizione) values(888,'Veicoli e parti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5613,'Veicoli e parti > Componenti e accessori per auto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3977,'Veicoli e parti > Componenti e accessori per auto > Componenti e accessori per velivoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(899,'Veicoli e parti > Componenti e accessori per auto > Componenti per veicoli a motore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8233,'Veicoli e parti > Componenti e accessori per auto > Componenti per veicoli a motore > Accessori interni per veicoli a motore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2550,'Veicoli e parti > Componenti e accessori per auto > Componenti per veicoli a motore > Circolazione olio per veicoli a motore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2805,'Veicoli e parti > Componenti e accessori per auto > Componenti per veicoli a motore > Climatizzatori per veicoli a motore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2534,'Veicoli e parti > Componenti e accessori per auto > Componenti per veicoli a motore > Componenti e accessori di finestrini per veicoli a motore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2820,'Veicoli e parti > Componenti e accessori per auto > Componenti per veicoli a motore > Componenti motore per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8235,'Veicoli e parti > Componenti e accessori per auto > Componenti per veicoli a motore > Controlli per veicoli a motore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2977,'Veicoli e parti > Componenti e accessori per auto > Componenti per veicoli a motore > Freni per veicoli a motore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3318,'Veicoli e parti > Componenti e accessori per auto > Componenti per veicoli a motore > Illuminazione per veicoli a motore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3020,'Veicoli e parti > Componenti e accessori per auto > Componenti per veicoli a motore > Impianti ruote per veicoli a motore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2989,'Veicoli e parti > Componenti e accessori per auto > Componenti per veicoli a motore > Impianti ruote per veicoli a motore > Accessori di pneumatici per veicoli a motore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2932,'Veicoli e parti > Componenti e accessori per auto > Componenti per veicoli a motore > Impianti ruote per veicoli a motore > Cerchi e ruote automotive');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6090,'Veicoli e parti > Componenti e accessori per auto > Componenti per veicoli a motore > Impianti ruote per veicoli a motore > Cerchi e ruote automotive > Cerchi e ruote per auto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6088,'Veicoli e parti > Componenti e accessori per auto > Componenti per veicoli a motore > Impianti ruote per veicoli a motore > Cerchi e ruote automotive > Cerchi e ruote per moto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7253,'Veicoli e parti > Componenti e accessori per auto > Componenti per veicoli a motore > Impianti ruote per veicoli a motore > Cerchi e ruote automotive > Veicoli ATV e fuoristrada');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2556,'Veicoli e parti > Componenti e accessori per auto > Componenti per veicoli a motore > Impianti ruote per veicoli a motore > Componenti ruote per veicoli a motore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(911,'Veicoli e parti > Componenti e accessori per auto > Componenti per veicoli a motore > Impianti ruote per veicoli a motore > Pneumatici per veicoli a motore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6091,'Veicoli e parti > Componenti e accessori per auto > Componenti per veicoli a motore > Impianti ruote per veicoli a motore > Pneumatici per veicoli a motore > Pneumatici da moto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7252,'Veicoli e parti > Componenti e accessori per auto > Componenti per veicoli a motore > Impianti ruote per veicoli a motore > Pneumatici per veicoli a motore > Pneumatici per ATV e fuoristrada');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6093,'Veicoli e parti > Componenti e accessori per auto > Componenti per veicoli a motore > Impianti ruote per veicoli a motore > Pneumatici per veicoli a motore > Pneumatici per auto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8137,'Veicoli e parti > Componenti e accessori per auto > Componenti per veicoli a motore > Motori per veicoli a motore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2935,'Veicoli e parti > Componenti e accessori per auto > Componenti per veicoli a motore > Parti di sospensioni per veicoli a motore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2641,'Veicoli e parti > Componenti e accessori per auto > Componenti per veicoli a motore > Parti di trasmissione per veicoli a motore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(908,'Veicoli e parti > Componenti e accessori per auto > Componenti per veicoli a motore > Scarichi per veicoli a motore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8238,'Veicoli e parti > Componenti e accessori per auto > Componenti per veicoli a motore > Sedili per veicoli a motore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8234,'Veicoli e parti > Componenti e accessori per auto > Componenti per veicoli a motore > Sensori e indicatori per veicoli a motore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2727,'Veicoli e parti > Componenti e accessori per auto > Componenti per veicoli a motore > Sistemi di alimentazione per veicoli a motore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8231,'Veicoli e parti > Componenti e accessori per auto > Componenti per veicoli a motore > Sistemi elettrici e di alimentazione per veicoli a motore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2642,'Veicoli e parti > Componenti e accessori per auto > Componenti per veicoli a motore > Specchietti per veicoli a motore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8232,'Veicoli e parti > Componenti e accessori per auto > Componenti per veicoli a motore > Tappetini e rivestimenti per veicoli a motore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8227,'Veicoli e parti > Componenti e accessori per auto > Componenti per veicoli a motore > Telaio e parti della carrozzeria di veicoli a motore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8228,'Veicoli e parti > Componenti e accessori per auto > Componenti per veicoli a motore > Traino per veicoli a motore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(913,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3436,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Coperture veicolo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7031,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Coperture veicolo > Capote in tela per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2494,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Coperture veicolo > Capote rigide per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8308,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Coperture veicolo > Coperture per cassoni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8316,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Coperture veicolo > Coperture per parabrezza per veicoli a motore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8306,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Coperture veicolo > Coperture per veicoli da golf');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8309,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Coperture veicolo > Teli per lo stoccaggio di veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8311,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Coperture veicolo > Teli per lo stoccaggio di veicoli > Coperture per lo stoccaggio di camper');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8312,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Coperture veicolo > Teli per lo stoccaggio di veicoli > Coperture per lo stoccaggio di natanti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8314,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Coperture veicolo > Teli per lo stoccaggio di veicoli > Coperture per lo stoccaggio di veicoli da golf');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8310,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Coperture veicolo > Teli per lo stoccaggio di veicoli > Teli copriauto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8313,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Coperture veicolo > Teli per lo stoccaggio di veicoli > Teli coprimoto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2495,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Decorazioni per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2582,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Decorazioni per veicoli > Accessori cruscotto per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2667,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Decorazioni per veicoli > Adesivi per paraurti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2652,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Decorazioni per veicoli > Bandierine da esposizione per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8145,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Decorazioni per veicoli > Coperture per ganci traino per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8464,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Decorazioni per veicoli > Coperture per volanti di veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7022,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Decorazioni per veicoli > Copritarga per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8463,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Decorazioni per veicoli > Cuffie per leva del cambio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8478,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Decorazioni per veicoli > Decorazioni per specchietti retrovisori');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2789,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Decorazioni per veicoli > Deodoranti per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7532,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Decorazioni per veicoli > Magneti per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2588,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Decorazioni per veicoli > Palline per antenne per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8142,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Decorazioni per veicoli > Pomelli per leva del cambio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8202,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Decorazioni per veicoli > Rivestimenti per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8469,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Decorazioni per veicoli > Set di accessori per la decorazione di veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5995,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Decorazioni per veicoli > Stemmi e ornamenti da cofano per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2722,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Decorazioni per veicoli > Strisce adesive');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8298,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Decorazioni per veicoli > Supporti e cornici per targhe per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2248,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Decorazioni per veicoli > Targhe per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5994,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Decorazioni per veicoli > Telai per targhe veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2788,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Liquidi per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2517,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Liquidi per veicoli > Additivi per l \'impianto raffreddamento dei veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2770,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Liquidi per veicoli > Additivi prestazioni per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2635,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Liquidi per veicoli > Antigelo per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2719,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Liquidi per veicoli > Detergenti per il sistema di alimentazione dei veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2513,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Liquidi per veicoli > Liquido del servosterzo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2688,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Liquidi per veicoli > Liquido di trasmissione per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3051,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Liquidi per veicoli > Liquido freni per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2916,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Liquidi per veicoli > Liquido per frizione idraulica per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2943,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Liquidi per veicoli > Liquido per tergicristalli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2735,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Liquidi per veicoli > Olio del cambio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3044,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Liquidi per veicoli > Olio motore per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2881,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Liquidi per veicoli > Sgrassatori del motore per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2895,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Pulizia del veicolo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2643,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Pulizia del veicolo > Cere, lucidanti e protettivi veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2704,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Pulizia del veicolo > Detergenti per tappetini e fodere per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2846,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Pulizia del veicolo > Detergenti vetri veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499766,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Pulizia del veicolo > Kit di pulizia per l \'iniezione di carburante dei veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2590,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Pulizia del veicolo > Soluzioni lavaggio auto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2894,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Pulizia del veicolo > Spazzole lavaggio auto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8236,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Strumenti speciali e di riparazione per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5068,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Strumenti speciali e di riparazione per veicoli > Avviatori per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7414,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Strumenti speciali e di riparazione per veicoli > Caricabatteria per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3326,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Strumenti speciali e di riparazione per veicoli > Cavi di avviamento per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8260,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Strumenti speciali e di riparazione per veicoli > Kit di manutenzione per freni di veicoli a motore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2647,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Strumenti speciali e di riparazione per veicoli > Kit riparazione parabrezza');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6482,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Strumenti speciali e di riparazione per veicoli > Scanner per diagnosi veicolo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8259,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Strumenti speciali e di riparazione per veicoli > Strumenti di allineamento e rimozione della frizione per veicoli a motore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8261,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Strumenti speciali e di riparazione per veicoli > Strumenti per la riparazione e sostituzione dei pneumatici');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499774,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Strumenti speciali e di riparazione per veicoli > Stucco per carrozzeria');
insert into GOOGLE_CATEGORY (codice,descrizione) values(499929,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Strumenti speciali e di riparazione per veicoli > Tester per batterie di veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8534,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Taniche per carburante portatili');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3812,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Verniciatura di veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8450,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Verniciatura di veicoli > Vernice per carrozzeria di veicoli a motore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8144,'Veicoli e parti > Componenti e accessori per auto > Cura, manutenzione e decorazione dei veicoli > Verniciatura di veicoli > Vernice per pinze di freni di veicoli a motore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8526,'Veicoli e parti > Componenti e accessori per auto > Elettronica per veicoli a motore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5525,'Veicoli e parti > Componenti e accessori per auto > Elettronica per veicoli a motore > Adattatori a cassetta per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(895,'Veicoli e parti > Componenti e accessori per auto > Elettronica per veicoli a motore > Altoparlanti per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(891,'Veicoli e parti > Componenti e accessori per auto > Elettronica per veicoli a motore > Amplificatori per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(894,'Veicoli e parti > Componenti e accessori per auto > Elettronica per veicoli a motore > Equalizzatori e crossover per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5438,'Veicoli e parti > Componenti e accessori per auto > Elettronica per veicoli a motore > Mangianastri per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(505766,'Veicoli e parti > Componenti e accessori per auto > Elettronica per veicoli a motore > Sistemi da cruscotto e lettori audio/video per auto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8483,'Veicoli e parti > Componenti e accessori per auto > Elettronica per veicoli a motore > Staffe per monitor video per veicoli a motore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2833,'Veicoli e parti > Componenti e accessori per auto > Elettronica per veicoli a motore > Subwoofer per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6968,'Veicoli e parti > Componenti e accessori per auto > Elettronica per veicoli a motore > Telecamere di parcheggio per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5572,'Veicoli e parti > Componenti e accessori per auto > Elettronica per veicoli a motore > Vivavoce per auto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3391,'Veicoli e parti > Componenti e accessori per auto > Parti e accessori imbarcazioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1122,'Veicoli e parti > Componenti e accessori per auto > Parti e accessori imbarcazioni > Cura imbarcazioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3866,'Veicoli e parti > Componenti e accessori per auto > Parti e accessori imbarcazioni > Cura imbarcazioni > Detergenti imbarcazioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3955,'Veicoli e parti > Componenti e accessori per auto > Parti e accessori imbarcazioni > Cura imbarcazioni > Lucidanti imbarcazioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6293,'Veicoli e parti > Componenti e accessori per auto > Parti e accessori imbarcazioni > Illuminazione per natanti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3400,'Veicoli e parti > Componenti e accessori per auto > Parti e accessori imbarcazioni > Impianti carburante imbarcazioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3968,'Veicoli e parti > Componenti e accessori per auto > Parti e accessori imbarcazioni > Impianti carburante imbarcazioni > Indicatori livello carburante imbarcazioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3415,'Veicoli e parti > Componenti e accessori per auto > Parti e accessori imbarcazioni > Impianti carburante imbarcazioni > Linee carburante e parti imbarcazioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3892,'Veicoli e parti > Componenti e accessori per auto > Parti e accessori imbarcazioni > Impianti carburante imbarcazioni > Pompe carburante e parti imbarcazioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3648,'Veicoli e parti > Componenti e accessori per auto > Parti e accessori imbarcazioni > Impianti carburante imbarcazioni > Serbatoi carburante e parti imbarcazioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1125,'Veicoli e parti > Componenti e accessori per auto > Parti e accessori imbarcazioni > Motori imbarcazioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1132,'Veicoli e parti > Componenti e accessori per auto > Parti e accessori imbarcazioni > Parti barche a vela');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3619,'Veicoli e parti > Componenti e accessori per auto > Parti e accessori imbarcazioni > Parti di scarico imbarcazioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3232,'Veicoli e parti > Componenti e accessori per auto > Parti e accessori imbarcazioni > Parti di scarico imbarcazioni > Collettori imbarcazioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3309,'Veicoli e parti > Componenti e accessori per auto > Parti e accessori imbarcazioni > Parti di scarico imbarcazioni > Silenziatori e parti imbarcazioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3606,'Veicoli e parti > Componenti e accessori per auto > Parti e accessori imbarcazioni > Parti motore imbarcazioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3143,'Veicoli e parti > Componenti e accessori per auto > Parti e accessori imbarcazioni > Parti motore imbarcazioni > Alternatori imbarcazioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3507,'Veicoli e parti > Componenti e accessori per auto > Parti e accessori imbarcazioni > Parti motore imbarcazioni > Bloccaggi motore imbarcazioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3463,'Veicoli e parti > Componenti e accessori per auto > Parti e accessori imbarcazioni > Parti motore imbarcazioni > Carburatori e parti imbarcazioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3321,'Veicoli e parti > Componenti e accessori per auto > Parti e accessori imbarcazioni > Parti motore imbarcazioni > Comandi motore imbarcazioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3806,'Veicoli e parti > Componenti e accessori per auto > Parti e accessori imbarcazioni > Parti motore imbarcazioni > Eliche imbarcazioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3097,'Veicoli e parti > Componenti e accessori per auto > Parti e accessori imbarcazioni > Parti motore imbarcazioni > Giranti imbarcazioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3743,'Veicoli e parti > Componenti e accessori per auto > Parti e accessori imbarcazioni > Parti motore imbarcazioni > Parti ignizione imbarcazioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3277,'Veicoli e parti > Componenti e accessori per auto > Parti e accessori imbarcazioni > Parti motore imbarcazioni > Pistoni e parti imbarcazioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3566,'Veicoli e parti > Componenti e accessori per auto > Parti e accessori imbarcazioni > Parti motore imbarcazioni > Supporti motore imbarcazioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3995,'Veicoli e parti > Componenti e accessori per auto > Parti e accessori imbarcazioni > Parti timoni imbarcazioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3308,'Veicoli e parti > Componenti e accessori per auto > Parti e accessori imbarcazioni > Parti timoni imbarcazioni > Cavi timone imbarcazioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3663,'Veicoli e parti > Componenti e accessori per auto > Parti e accessori imbarcazioni > Parti timoni imbarcazioni > Timoni imbarcazioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3315,'Veicoli e parti > Componenti e accessori per auto > Parti e accessori imbarcazioni > Ponti e ancoraggi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3189,'Veicoli e parti > Componenti e accessori per auto > Parti e accessori imbarcazioni > Ponti e ancoraggi > Ancore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3452,'Veicoli e parti > Componenti e accessori per auto > Parti e accessori imbarcazioni > Ponti e ancoraggi > Catene per ancore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3362,'Veicoli e parti > Componenti e accessori per auto > Parti e accessori imbarcazioni > Ponti e ancoraggi > Funi e corde per ancore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3572,'Veicoli e parti > Componenti e accessori per auto > Parti e accessori imbarcazioni > Ponti e ancoraggi > Gallocce per pontili');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3655,'Veicoli e parti > Componenti e accessori per auto > Parti e accessori imbarcazioni > Ponti e ancoraggi > Mezzomarinaio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3718,'Veicoli e parti > Componenti e accessori per auto > Parti e accessori imbarcazioni > Ponti e ancoraggi > Scalette per imbarcazioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3899,'Veicoli e parti > Componenti e accessori per auto > Parti e accessori imbarcazioni > Ponti e ancoraggi > Scalini per pontili');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3480,'Veicoli e parti > Componenti e accessori per auto > Parti e accessori imbarcazioni > Ponti e ancoraggi > Verricelli per ancore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8301,'Veicoli e parti > Componenti e accessori per auto > Sicurezza e protezioni per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5547,'Veicoli e parti > Componenti e accessori per auto > Sicurezza e protezioni per veicoli > Abbigliamento protettivo da moto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6493,'Veicoli e parti > Componenti e accessori per auto > Sicurezza e protezioni per veicoli > Abbigliamento protettivo da moto > Accessori per caschi per moto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5961,'Veicoli e parti > Componenti e accessori per auto > Sicurezza e protezioni per veicoli > Abbigliamento protettivo da moto > Bretelle per moto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2110,'Veicoli e parti > Componenti e accessori per auto > Sicurezza e protezioni per veicoli > Abbigliamento protettivo da moto > Caschi da moto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5960,'Veicoli e parti > Componenti e accessori per auto > Sicurezza e protezioni per veicoli > Abbigliamento protettivo da moto > Cintura lombare per moto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5962,'Veicoli e parti > Componenti e accessori per auto > Sicurezza e protezioni per veicoli > Abbigliamento protettivo da moto > Ginocchiere e parastinchi per moto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5963,'Veicoli e parti > Componenti e accessori per auto > Sicurezza e protezioni per veicoli > Abbigliamento protettivo da moto > Gomitiere e polsiere per moto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5908,'Veicoli e parti > Componenti e accessori per auto > Sicurezza e protezioni per veicoli > Abbigliamento protettivo da moto > Guanti da moto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5106,'Veicoli e parti > Componenti e accessori per auto > Sicurezza e protezioni per veicoli > Abbigliamento protettivo da moto > Occhiali da moto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5959,'Veicoli e parti > Componenti e accessori per auto > Sicurezza e protezioni per veicoli > Abbigliamento protettivo da moto > Paraschiena e paracostole per moto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8507,'Veicoli e parti > Componenti e accessori per auto > Sicurezza e protezioni per veicoli > Abbigliamento protettivo da moto > Protezioni per le mani per moto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2879,'Veicoli e parti > Componenti e accessori per auto > Sicurezza e protezioni per veicoli > Equipaggiamento di sicurezza per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6966,'Veicoli e parti > Componenti e accessori per auto > Sicurezza e protezioni per veicoli > Equipaggiamento di sicurezza per veicoli > Accessori per la segnalazione di veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8476,'Veicoli e parti > Componenti e accessori per auto > Sicurezza e protezioni per veicoli > Equipaggiamento di sicurezza per veicoli > Cinghie per cinture di sicurezza per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8449,'Veicoli e parti > Componenti e accessori per auto > Sicurezza e protezioni per veicoli > Equipaggiamento di sicurezza per veicoli > Cinture di sicurezza per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8448,'Veicoli e parti > Componenti e accessori per auto > Sicurezza e protezioni per veicoli > Equipaggiamento di sicurezza per veicoli > Componenti di airbag per veicoli a motore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(326120,'Veicoli e parti > Componenti e accessori per auto > Sicurezza e protezioni per veicoli > Equipaggiamento di sicurezza per veicoli > Coperture per cinture di sicurezza per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8506,'Veicoli e parti > Componenti e accessori per auto > Sicurezza e protezioni per veicoli > Equipaggiamento di sicurezza per veicoli > Cunei per ruote per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8477,'Veicoli e parti > Componenti e accessori per auto > Sicurezza e protezioni per veicoli > Equipaggiamento di sicurezza per veicoli > Fibbie per cinture di sicurezza per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8446,'Veicoli e parti > Componenti e accessori per auto > Sicurezza e protezioni per veicoli > Equipaggiamento di sicurezza per veicoli > Gabbie e barre per veicoli a motore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8447,'Veicoli e parti > Componenti e accessori per auto > Sicurezza e protezioni per veicoli > Equipaggiamento di sicurezza per veicoli > Reti per finestre per auto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8445,'Veicoli e parti > Componenti e accessori per auto > Sicurezza e protezioni per veicoli > Equipaggiamento di sicurezza per veicoli > Segnali luminosi di emergenza');
insert into GOOGLE_CATEGORY (codice,descrizione) values(362737,'Veicoli e parti > Componenti e accessori per auto > Sicurezza e protezioni per veicoli > Protezioni per ATV e fuoristrada');
insert into GOOGLE_CATEGORY (codice,descrizione) values(362738,'Veicoli e parti > Componenti e accessori per auto > Sicurezza e protezioni per veicoli > Protezioni per ATV e fuoristrada > Cuscinetti per barre per ATV e UTV');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2768,'Veicoli e parti > Componenti e accessori per auto > Sicurezza e protezioni per veicoli > Sistemi di blocco per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6084,'Veicoli e parti > Componenti e accessori per auto > Sicurezza e protezioni per veicoli > Sistemi di blocco per veicoli > Accessori per allarmi auto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6083,'Veicoli e parti > Componenti e accessori per auto > Sicurezza e protezioni per veicoli > Sistemi di blocco per veicoli > Allarmi e lucchetti per moto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2750,'Veicoli e parti > Componenti e accessori per auto > Sicurezza e protezioni per veicoli > Sistemi di blocco per veicoli > Bloccasterzo');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3024,'Veicoli e parti > Componenti e accessori per auto > Sicurezza e protezioni per veicoli > Sistemi di blocco per veicoli > Immobilizzatori per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2699,'Veicoli e parti > Componenti e accessori per auto > Sicurezza e protezioni per veicoli > Sistemi di blocco per veicoli > Impianti telecomandati senza chiave');
insert into GOOGLE_CATEGORY (codice,descrizione) values(500077,'Veicoli e parti > Componenti e accessori per auto > Sicurezza e protezioni per veicoli > Sistemi di blocco per veicoli > Morsetti per ruote di veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8302,'Veicoli e parti > Componenti e accessori per auto > Sicurezza e protezioni per veicoli > Sistemi di blocco per veicoli > Serrature e parti per portiere di veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8305,'Veicoli e parti > Componenti e accessori per auto > Sicurezza e protezioni per veicoli > Sistemi di blocco per veicoli > Serrature e parti per portiere di veicoli > Attuatori per serrature di veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8304,'Veicoli e parti > Componenti e accessori per auto > Sicurezza e protezioni per veicoli > Sistemi di blocco per veicoli > Serrature e parti per portiere di veicoli > Levette bloccaportiere per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8303,'Veicoli e parti > Componenti e accessori per auto > Sicurezza e protezioni per veicoli > Sistemi di blocco per veicoli > Serrature e parti per portiere di veicoli > Serrature e sistemi di chiusura delle portiere di veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(235921,'Veicoli e parti > Componenti e accessori per auto > Sicurezza e protezioni per veicoli > Sistemi di blocco per veicoli > Sicure per ganci traino per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1802,'Veicoli e parti > Componenti e accessori per auto > Sicurezza e protezioni per veicoli > Sistemi di blocco per veicoli > Sistemi antifurto per auto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8237,'Veicoli e parti > Componenti e accessori per auto > Stoccaggio e carico per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6454,'Veicoli e parti > Componenti e accessori per auto > Stoccaggio e carico per veicoli > Accessori per rastrelliere per veicoli a motore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8086,'Veicoli e parti > Componenti e accessori per auto > Stoccaggio e carico per veicoli > Accessori per rastrelliere per veicoli a motore > Accessori per porta-sci e porta-snowboard per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7122,'Veicoli e parti > Componenti e accessori per auto > Stoccaggio e carico per veicoli > Accessori per rastrelliere per veicoli a motore > Accessori per portabiciclette');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8475,'Veicoli e parti > Componenti e accessori per auto > Stoccaggio e carico per veicoli > Appendiabiti e ganci per poggiatesta per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5512,'Veicoli e parti > Componenti e accessori per auto > Stoccaggio e carico per veicoli > Borse e zaini da moto');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8378,'Veicoli e parti > Componenti e accessori per auto > Stoccaggio e carico per veicoli > Divisori e contenitori per cassoni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2290,'Veicoli e parti > Componenti e accessori per auto > Stoccaggio e carico per veicoli > Organizzazione degli spazi dei veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3472,'Veicoli e parti > Componenti e accessori per auto > Stoccaggio e carico per veicoli > Portapacchi per veicoli a motore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6047,'Veicoli e parti > Componenti e accessori per auto > Stoccaggio e carico per veicoli > Portapacchi per veicoli a motore > Barre portatutto per natanti');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4240,'Veicoli e parti > Componenti e accessori per auto > Stoccaggio e carico per veicoli > Portapacchi per veicoli a motore > Box portatutto per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6046,'Veicoli e parti > Componenti e accessori per auto > Stoccaggio e carico per veicoli > Portapacchi per veicoli a motore > Porta canne da pesca per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2836,'Veicoli e parti > Componenti e accessori per auto > Stoccaggio e carico per veicoli > Portapacchi per veicoli a motore > Portabiciclette per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6044,'Veicoli e parti > Componenti e accessori per auto > Stoccaggio e carico per veicoli > Portapacchi per veicoli a motore > Portamoto e portascooter per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6043,'Veicoli e parti > Componenti e accessori per auto > Stoccaggio e carico per veicoli > Portapacchi per veicoli a motore > Portasci e portasnowboard per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6042,'Veicoli e parti > Componenti e accessori per auto > Stoccaggio e carico per veicoli > Portapacchi per veicoli a motore > Portatavola da surf per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(7115,'Veicoli e parti > Componenti e accessori per auto > Stoccaggio e carico per veicoli > Portapacchi per veicoli a motore > Rastrelliera per armi da fuoco per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6041,'Veicoli e parti > Componenti e accessori per auto > Stoccaggio e carico per veicoli > Portapacchi per veicoli a motore > Sistemi rack base per veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(8147,'Veicoli e parti > Componenti e accessori per auto > Stoccaggio e carico per veicoli > Rampe di carico per veicoli a motore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(6744,'Veicoli e parti > Componenti e accessori per auto > Stoccaggio e carico per veicoli > Reti carico per veicoli a motore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4027,'Veicoli e parti > Componenti e accessori per auto > Stoccaggio e carico per veicoli > Rimorchi per veicoli a motore');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4044,'Veicoli e parti > Componenti e accessori per auto > Stoccaggio e carico per veicoli > Rimorchi per veicoli a motore > Carrelli attrezzi e da carico');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1133,'Veicoli e parti > Componenti e accessori per auto > Stoccaggio e carico per veicoli > Rimorchi per veicoli a motore > Carrelli barche');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4243,'Veicoli e parti > Componenti e accessori per auto > Stoccaggio e carico per veicoli > Rimorchi per veicoli a motore > Carrelli da viaggio');
insert into GOOGLE_CATEGORY (codice,descrizione) values(4037,'Veicoli e parti > Componenti e accessori per auto > Stoccaggio e carico per veicoli > Rimorchi per veicoli a motore > Rimorchi per il trasporto di cavalli e animali');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5614,'Veicoli e parti > Veicoli');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3395,'Veicoli e parti > Veicoli > Aerei');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3540,'Veicoli e parti > Veicoli > Imbarcazioni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1130,'Veicoli e parti > Veicoli > Imbarcazioni > Acqua scooter');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3087,'Veicoli e parti > Veicoli > Imbarcazioni > Barche a vela');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3095,'Veicoli e parti > Veicoli > Imbarcazioni > Motoscafi');
insert into GOOGLE_CATEGORY (codice,descrizione) values(5644,'Veicoli e parti > Veicoli > Imbarcazioni > Yacht');
insert into GOOGLE_CATEGORY (codice,descrizione) values(1267,'Veicoli e parti > Veicoli > Veicoli per terraferma');
insert into GOOGLE_CATEGORY (codice,descrizione) values(916,'Veicoli e parti > Veicoli > Veicoli per terraferma > Auto, autocarri e furgoni');
insert into GOOGLE_CATEGORY (codice,descrizione) values(920,'Veicoli e parti > Veicoli > Veicoli per terraferma > Camper');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3931,'Veicoli e parti > Veicoli > Veicoli per terraferma > Cart da golf');
insert into GOOGLE_CATEGORY (codice,descrizione) values(919,'Veicoli e parti > Veicoli > Veicoli per terraferma > Motocicli e scooter');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3549,'Veicoli e parti > Veicoli > Veicoli per terraferma > Motoslitte');
insert into GOOGLE_CATEGORY (codice,descrizione) values(503031,'Veicoli e parti > Veicoli > Veicoli per terraferma > Veicoli fuoristrada');
insert into GOOGLE_CATEGORY (codice,descrizione) values(3018,'Veicoli e parti > Veicoli > Veicoli per terraferma > Veicoli fuoristrada > ATV e UTV');
insert into GOOGLE_CATEGORY (codice,descrizione) values(2528,'Veicoli e parti > Veicoli > Veicoli per terraferma > Veicoli fuoristrada > Go-kart e dune buggy');

###################################################################
#insert into PARM (codice) values ('DB_VERSION');
UPDATE PARM SET testo='277' where codice='DB_VERSION';
######################################################################


# ---------------------------------------------------------------------- #
# Alter table "ATTIVITA"                                                 #
# ---------------------------------------------------------------------- #

ALTER TABLE `ATTIVITA` ADD COLUMN `flgIcecat` INTEGER;

ALTER TABLE `ATTIVITA` ADD COLUMN `icecatUsername` VARCHAR(40);

ALTER TABLE `ATTIVITA` ADD COLUMN `icecatPassword` VARCHAR(40);

###################################################################
#insert into PARM (codice) values ('DB_VERSION');
UPDATE PARM SET testo='278' where codice='DB_VERSION';
######################################################################


# ---------------------------------------------------------------------- #
# Alter table "CARATTERISTICA"                                           #
# ---------------------------------------------------------------------- #

ALTER TABLE `CARATTERISTICA` ADD COLUMN `icecatDescs` VARCHAR(250);

CREATE INDEX `IDX_CARATTERISTICA_2` ON `CARATTERISTICA` (`icecatDescs`);

# ---------------------------------------------------------------------- #
# Alter table "LISTA"                                                    #
# ---------------------------------------------------------------------- #

ALTER TABLE `LISTA` ADD COLUMN `icecatValues` VARCHAR(250);

CREATE INDEX `IDX_LISTA_2` ON `LISTA` (`icecatValues`);


###################################################################
#insert into PARM (codice) values ('DB_VERSION');
UPDATE PARM SET testo='279' where codice='DB_VERSION';
######################################################################



# ---------------------------------------------------------------------- #

# Alter table "ARTICOLO"                                                 #

# ---------------------------------------------------------------------- #



ALTER TABLE `ARTICOLO` DROP COLUMN `costoSpedizione`;



ALTER TABLE `ARTICOLO` ADD COLUMN `flgPreventivoWwwArt` INTEGER;



# ---------------------------------------------------------------------- #

# Add table "ARTICOLO_NAZIONE"                                           #

# ---------------------------------------------------------------------- #



CREATE TABLE `ARTICOLO_NAZIONE` (

    `id_articoloNazione` INTEGER NOT NULL AUTO_INCREMENT,

    `id_nazione` CHAR(4),

    `id_articolo` INTEGER,

    `flgPreventivoWwwAN` INTEGER,

    `costoSpedizioneAN` DECIMAL(18,4),

    CONSTRAINT `PK_ARTICOLO_NAZIONE` PRIMARY KEY (`id_articoloNazione`)

);

ALTER TABLE `ARTICOLO_NAZIONE` ADD CONSTRAINT `NAZIONE_ARTICOLO_NAZIONE` 

    FOREIGN KEY (`id_nazione`) REFERENCES `NAZIONE` (`id_nazione`);



ALTER TABLE `ARTICOLO_NAZIONE` ADD CONSTRAINT `ARTICOLO_ARTICOLO_NAZIONE` 

    FOREIGN KEY (`id_articolo`) REFERENCES `ARTICOLO` (`id_articolo`);
	
	

# ---------------------------------------------------------------------- #

# Alter table "ARTICOLO"                                                 #

# ---------------------------------------------------------------------- #



ALTER TABLE `ARTICOLO` ADD COLUMN `percCostoSpedizione` INTEGER;



# ---------------------------------------------------------------------- #

# Alter table "ATTIVITA"                                                 #

# ---------------------------------------------------------------------- #



ALTER TABLE `ATTIVITA` ADD COLUMN `flgPercSpedizioneSuperato` INTEGER;


ALTER TABLE `ATTIVITA` CHANGE `flgPercSpedizioneSuperato` `percentileMaxPerPreventivo` INTEGER;

	
	###################################################################
#insert into PARM (codice) values ('DB_VERSION');
UPDATE PARM SET testo='281' where codice='DB_VERSION';
######################################################################



ALTER TABLE `ARTICOLO_VARIANTE` ADD COLUMN `codiceEanAv` VARCHAR(40);
	
	
	
# ---------------------------------------------------------------------- #
# Alter table "TIPO"                                                     #
# ---------------------------------------------------------------------- #

ALTER TABLE `TIPO` ADD COLUMN `percCostoSpedizioneDefault` INTEGER;

update ARTICOLO SET percCostoSpedizione=0  where percCostoSpedizione<=10;


	###################################################################
#insert into PARM (codice) values ('DB_VERSION');
UPDATE PARM SET testo='282' where codice='DB_VERSION';
######################################################################

# ---------------------------------------------------------------------- #
# Alter table "LISTINO_ARTICOLO"                                         #
# ---------------------------------------------------------------------- #

ALTER TABLE `LISTINO_ARTICOLO` ADD COLUMN `percScontoOffertaLA` DECIMAL(5,2);



# ---------------------------------------------------------------------- #
# Alter table "IVA"                                                      #
# ---------------------------------------------------------------------- #

ALTER TABLE `IVA` ADD COLUMN `flgOss` INTEGER;

# ---------------------------------------------------------------------- #
# Alter table "NAZIONE"                                                  #
# ---------------------------------------------------------------------- #

ALTER TABLE `NAZIONE` ADD COLUMN `id_iva` INTEGER;



ALTER TABLE `NAZIONE` ADD CONSTRAINT `IVA_NAZIONE` 
    FOREIGN KEY (`id_iva`) REFERENCES `IVA` (`id_iva`);
	
	
	###################################################################
#insert into PARM (codice) values ('DB_VERSION');
UPDATE PARM SET testo='283' where codice='DB_VERSION';
######################################################################


# ---------------------------------------------------------------------- #
# Alter table "IVA"                                                      #
# ---------------------------------------------------------------------- #

ALTER TABLE `IVA` ADD COLUMN `id_ivaStdRM` INTEGER;

# ---------------------------------------------------------------------- #
# Add foreign key constraints                                            #
# ---------------------------------------------------------------------- #

ALTER TABLE `IVA` ADD CONSTRAINT `IVA_IVA_std_regime_margine` 
    FOREIGN KEY (`id_ivaStdRM`) REFERENCES `IVA` (`id_iva`);
	
	
	###################################################################
#insert into PARM (codice) values ('DB_VERSION');
UPDATE PARM SET testo='284' where codice='DB_VERSION';
######################################################################

# ---------------------------------------------------------------------- #
# Alter table "CLIFOR"                                                   #
# ---------------------------------------------------------------------- #

ALTER TABLE `CLIFOR` ADD COLUMN `flgAbilitaAF` INTEGER;


	
	###################################################################
#insert into PARM (codice) values ('DB_VERSION');
UPDATE PARM SET testo='285' where codice='DB_VERSION';
######################################################################
