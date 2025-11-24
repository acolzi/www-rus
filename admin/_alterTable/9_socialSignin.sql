
ALTER TABLE `USERS` ADD COLUMN `costoOrario` DECIMAL(18,4);

ALTER TABLE `USERS` ADD COLUMN `percServizi` DECIMAL(5,2);



ALTER TABLE `USERS` CHANGE `costoOrario` `tariffaProfessionista` DECIMAL(18,4);

ALTER TABLE `USERS` CHANGE `percServizi` `percProfessinista` DECIMAL(5,2);


ALTER TABLE `USERS` ADD COLUMN `socialId` VARCHAR(60);

ALTER TABLE `USERS` ADD COLUMN `flgSocialIdType` INTEGER;






# ---------------------------------------------------------------------- #
# Add tables                                                             #
# ---------------------------------------------------------------------- #

# ---------------------------------------------------------------------- #
# Add table "ATTIVITA"                                                   #
# ---------------------------------------------------------------------- #

CREATE TABLE `ATTIVITA` (
    `id_attivita` INTEGER NOT NULL AUTO_INCREMENT,
    `id_tipoAttivita` INTEGER,
    `nomeAttivita` VARCHAR(60),
    `indirizzoAttivita` VARCHAR(60),
    `numeroCivicoAttivita` VARCHAR(30),
    `id_comuneAttivita` INTEGER,
    `descrizioneComuneAttivita` VARCHAR(60),
    `descrizioneProvinciaAttivita` CHAR(2),
    `capComuneAttivita` CHAR(5),
    `capZonaAttivita` VARCHAR(10),
    `telefonoAttivita` VARCHAR(40),
    `emailAttivita` VARCHAR(60),
    `flgGusti` INTEGER,
    `dataIscrizione` DATE,
    `codiceAttivita` VARCHAR(40),
    `imgTmst` VARCHAR(24),
    `fglMainSxCategorie` INTEGER,
    `flgMainSxVetrinaBestseller` INTEGER,
    `flgMainSxVetrinaOfferte` INTEGER,
    `flgMainSxUltimiVisualizzati` INTEGER,
    `flgMainBanner` INTEGER,
    `flgMainVetrina` INTEGER,
    `flgMainVetrinaCategorie` INTEGER,
    `flgTopTelefono` INTEGER,
    `flgTopLingue` INTEGER,
    `topLingueAttivita` VARCHAR(40),
    `flgTopMail` INTEGER,
    `topColoreHex` VARCHAR(7),
    `flgHeadCategorie` INTEGER,
    `flgHeadMarche` INTEGER,
    `flgHeadNewsType` INTEGER,
    `headColoreHex` VARCHAR(7),
    `flgDetailReviews` INTEGER,
    `flgDetailRelatedProducts` INTEGER,
    `flgDetailDxVetrinaBestseller` INTEGER,
    `flgDetailDxVetrinaOfferte` INTEGER,
    `flgCoupon` INTEGER,
    `flgCheckoutGuest` INTEGER,
    `accountFacebook` VARCHAR(60),
    `accountTwitter` VARCHAR(60),
    `accountInstagram` VARCHAR(60),
    `flgSocialSide` INTEGER,
    `flgFooterSocial` INTEGER,
    `flgDefault` INTEGER,
    `mailFrom` VARCHAR(40),
    `mailTitolarePrivacy` TEXT,
    `mailFooter` TEXT,
    `mailTitle` VARCHAR(40),
    `flgCartProcediPagamento` INTEGER,
    `id_vettore` INTEGER,
    `mailCoordinateBancarie` VARCHAR(254),
    `wwwAddress` VARCHAR(40),
    `topFontColorHex` VARCHAR(7),
    `backgroundColorHex` VARCHAR(7),
    `backgroundColorFooterHex` VARCHAR(7),
    `backgroundColorNavHoverHex` VARCHAR(7),
    `backgroundCustomFeatureBox` VARCHAR(7),
    `headCategorieBorderColorHex` VARCHAR(7),
    `mainTextColorHex` VARCHAR(7),
    `leftMenuTextColorHex` VARCHAR(7),
    `leftMenuSubTextColorHex` VARCHAR(7),
    `subtitleHex` VARCHAR(7),
    `bodyBackgroundHex` VARCHAR(7),
    `footerTextH5Hex` VARCHAR(7),
    `footerTextliHex` VARCHAR(7),
    `footerTextliAHex` VARCHAR(7),
    `costoContrassegno` DECIMAL(18,4),
    `paypalClientId` VARCHAR(254),
    `paypalClientSecret` VARCHAR(254),
    `flgDetailCompara` INTEGER,
    `flgDetailWishlist` INTEGER,
    `flgDetailShareAddThis` INTEGER,
    `flgNewsletterType` INTEGER,
    `mailchimpSubscribeForm` TEXT,
    `tagManagerHead` TEXT,
    `tagManagerBody` TEXT,
    `flgMainMiniBanner` INTEGER,
    `flgMainSxCategorie` INTEGER,
    `mainSubtitleBottomBorderHex` VARCHAR(7),
    `indirizzoSede` VARCHAR(60),
    `numeroCivicoSede` VARCHAR(30),
    `id_comuneSede` INTEGER,
    `descrizioneComuneSede` VARCHAR(60),
    `descrizioneProvinciaSede` CHAR(2),
    `capComuneSede` CHAR(5),
    `capZonaSede` VARCHAR(10),
    `telefonoSede` VARCHAR(40),
    `codFisc` VARCHAR(16),
    `pIva` VARCHAR(16),
    `pec` VARCHAR(40),
    `codiceIdentificativoFE` VARCHAR(7),
    `contatto` VARCHAR(60),
    `flgAcquistaSoloDisponibile` INTEGER,
    `qtaDisponibilitaBassa` INTEGER,
    `googleFtpUser` VARCHAR(60),
    `googleFtpPassword` VARCHAR(60),
    `flgGoogleMerchant` INTEGER,
    `googleNomiFileFeed` VARCHAR(1000),
    `deliveryFreeAbove` DECIMAL(18,4),
    `cellulareAttivita` VARCHAR(40),
    `flgTopChatWhatsapp` INTEGER,
    `flgTopChatTelegram` INTEGER,
    `chatTelegramUsername` VARCHAR(40),
    `flgFooterChatWhatsapp` INTEGER,
    `flgFooterChatTelegram` INTEGER,
    `flgSubito` INTEGER,
    `flgQuotazione` INTEGER,
    `mainUltimiNum` INTEGER,
    `flgMainUltimi` INTEGER,
    `flgMainUltimaNews` INTEGER,
    `deliveryCost` DECIMAL(18,4),
    `recaptchaV2Key` VARCHAR(60),
    `id_listinoEbay` INTEGER,
    `flgEbay` INTEGER,
    `cciaa` VARCHAR(10),
    `faxAttivita` VARCHAR(40),
    `ebayFulfillmentPolicyId` VARCHAR(40),
    `ebayPaymentPolicyId` VARCHAR(40),
    `ebayReturnPolicyId` VARCHAR(40),
    `ebayMerchantLocationKey` VARCHAR(40),
    `ebayOAuthRefreshToken` TEXT,
    `ebayOAuthRefreshTokenExpire` DATETIME,
    `ebayOAuthUserToken` TEXT,
    `ebayOAuthUserTokenExpire` DATETIME,
    `flgIcecat` INTEGER,
    `icecatUsername` VARCHAR(40),
    `icecatPassword` VARCHAR(40),
    `percentileMaxPerPreventivo` INTEGER,
    `googleMerchantRecensioniScript` VARCHAR(2000),
    `googleMerchantRecensioniScriptBadge` VARCHAR(2000),
    `flgGoogleMerchantRecensioni` INTEGER,
    `flgGoogleMerchantRecensioniBadge` INTEGER,
    `googleSiteId` VARCHAR(40),
    `googleApiKey` VARCHAR(250),
    `amzAccessKeyId` VARCHAR(40),
    `amzSecretKey` VARCHAR(40),
    `amzRoleArn` VARCHAR(40),
    `amzRoleSessionName` VARCHAR(40),
    `amzClientId` VARCHAR(40),
    `amzClientSecret` VARCHAR(40),
    `amzRefreshToken` VARCHAR(254),
    `flgAmz` INTEGER,
    `id_listinoAmz` INTEGER,
    `flgTrovaprezzi` INTEGER,
    `trovaprezziTrustedProgramScript` VARCHAR(2000),
    `trovaprezziTrustedProgramScriptItem` VARCHAR(200),
    `checkCartPercScontoMax` DECIMAL(5,2),
    `cookiePolicyTheme` VARCHAR(60),
    `flgIdealo` INTEGER,
    `idealoTag` VARCHAR(40),
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





CREATE TABLE `CLIFOR_TIPO_PAGAMENTO` (
    `id_cliforTipoPagamento` INTEGER NOT NULL AUTO_INCREMENT,
    `id_clifor` INTEGER NOT NULL,
    `id_tipoPagamento` INTEGER NOT NULL,
    CONSTRAINT `PK_CLIFOR_TIPO_PAGAMENTO` PRIMARY KEY (`id_cliforTipoPagamento`)
);

CREATE UNIQUE INDEX `IDX_CLIFOR_TIPO_PAGAMENTO_1` ON `CLIFOR_TIPO_PAGAMENTO` (`id_clifor`,`id_tipoPagamento`);


###################################################################
#insert into PARM (codice) values ('DB_VERSION');
UPDATE PARM SET testo='Abl.308 Rus.9' where codice='DB_VERSION';

insert into PARM (codice) values ('DB_VERSION_RUS'); 
UPDATE PARM SET testo='Rus 9.1', tipoParm='VERSIONE' where codice='DB_VERSION_RUS';
######################################################################