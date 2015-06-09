
DROP TABLE IF EXISTS `cm_members_history`;
CREATE TABLE `cm_members_history` (
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,  
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,  
  `mobile_number` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,  
  `service_depot` int(11) DEFAULT NULL,
  `rf_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `metrobank_paycard_number` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `group_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,  
  `is_email_verified` tinyint(1) NOT NULL DEFAULT '0',
  `is_paycard_verified` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_rf_id_verified` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_mobile_verified` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_auto_payout` tinyint(1) NOT NULL DEFAULT '0',
  `is_paycard_corpo` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '1',
  `is_on_hold` tinyint(1) NOT NULL DEFAULT '0',
  `funds` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `gift_cheques` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `gcep` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',  
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`history_id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `tr_cron_logs` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,  
  `module_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `table_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `action` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,  
  `details` text COLLATE utf8_unicode_ci,  
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`),  
  KEY `module_name` (`module_name`),
  KEY `action` (`action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

