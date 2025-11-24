## DA ESEGUIRE SU DB pg_log ###
CREATE TABLE IF NOT EXISTS `LOG_MAIL` (
    `id_logMail` INTEGER NOT NULL AUTO_INCREMENT,
    `id_users` INTEGER,
 `oggetto` VARCHAR(254),
       `tsInvio` DATETIME,
    `lmTo` VARCHAR(254),
    `lmCc` VARCHAR(254),
    `lmBcc` VARCHAR(254),
    `testoMessaggio` TEXT,
    `result` VARCHAR(1000),
      `lastUpdTmst` TIMESTAMP,
    `lastUpdId_user` INTEGER,
    CONSTRAINT `PK_LOG_MAIL` PRIMARY KEY (`id_logMail`)
);
#
CREATE TABLE IF NOT EXISTS `LOG_MAIL_ATTACH` (
    `id_logMailAttach` INTEGER NOT NULL AUTO_INCREMENT,
    `nomeFile` VARCHAR(254),
    `id_logMail` INTEGER,
      `lastUpdTmst` TIMESTAMP,
    `lastUpdId_user` INTEGER,
    CONSTRAINT `PK_LOG_MAIL_ATTACH` PRIMARY KEY (`id_logMailAttach`),
	CONSTRAINT `LOG_MAIL_LOG_MAIL_ATTACH` 
    FOREIGN KEY (`id_logMail`) REFERENCES `LOG_MAIL` (`id_logMail`)
);
#
CREATE TABLE IF NOT EXISTS `LOG` (
    `id_log` INTEGER NOT NULL AUTO_INCREMENT,
    `id_users` INTEGER,
    `id_blacklist` INTEGER,
    `dataLog` DATE,
    `descrizione` text,
    `ipAddress` CHAR(60),
    `flgMovimento` INTEGER,
     `tabella` VARCHAR(60),
    `oraLog` TIME,
    `pk` VARCHAR(40),
    `pkValue` VARCHAR(40),
     `lastUpdTmst` TIMESTAMP,
    `lastUpdId_user` INTEGER,
    CONSTRAINT `PK_LOG` PRIMARY KEY (`id_log`)
);

#
CREATE INDEX `IDX_LOG_1` ON `LOG` (`pk`);
#
CREATE INDEX `IDX_LOG_2` ON `LOG` (`dataLog`);
#
CREATE INDEX `IDX_LOG_3` ON `LOG` (`tabella`);
#
CREATE INDEX `IDX_LOG_4` ON `LOG` (`flgMovimento`);
#
CREATE INDEX `IDX_LOG_5` ON `LOG` (`pkValue`);
#
CREATE INDEX `IDX_LOG_6` ON `LOG` (`id_users`);
#
CREATE INDEX `IDX_LOG_7` ON `LOG` (`id_blacklist`);


