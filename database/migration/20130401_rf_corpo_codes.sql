CREATE TABLE `rf_corpo_codes` (
  `corpo_code` int(11) NOT NULL DEFAULT '0',
  `corpo_description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`corpo_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `rf_corpo_codes` (`corpo_code`, `corpo_description`) VALUES
(0, 'REGULAR'),
(1, 'CORPO'),
(2, 'CORPO-ALLOW ONLINE PURCHASING');

