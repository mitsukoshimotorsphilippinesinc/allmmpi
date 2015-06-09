CREATE TABLE `cm_auto_crediting` (
	`crediting_id` int(11) NOT NULL AUTO_INCREMENT,
	`payout_type` varchar(10) DEFAULT 'IGPSM',
	`start_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
	`end_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
	`hash` varchar(40) NOT NULL DEFAULT '',
	`status` varchar(10) DEFAULT 'PENDING',
	`user_id` int(11) DEFAULT NULL,
	`insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`crediting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `tr_auto_crediting_logs` (
	`log_id` int(11) NOT NULL AUTO_INCREMENT,
	`crediting_id` int(11) NULL,
	`user_id` int(11) DEFAULT NULL,
	`insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- 20140219 ADD is_gcep_exempted
ALTER TABLE cm_member_payouts_backups ADD COLUMN `is_gcep_exempted` tinyint(1) DEFAULT 0 AFTER `is_on_hold`;
ALTER TABLE cm_member_payouts ADD COLUMN `is_gcep_exempted` tinyint(1) DEFAULT 0 AFTER `is_on_hold`;

-- drop column since no computation is needed
ALTER TABLE cm_member_payouts_backups DROP COLUMN `is_gcep_exempted`;
ALTER TABLE cm_member_payouts DROP COLUMN `is_gcep_exempted`;


-- gcep backup table
CREATE TABLE `ph_member_gcep_commissions_backups` (
  `gcep_commission_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `total_gcep` decimal(10,2) DEFAULT '0.00',
  `gcep_variance` decimal(10,2) DEFAULT '0.00',
  `net_gcep` decimal(10,2) DEFAULT '0.00',
  `cash_card` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_on_hold` tinyint(1) DEFAULT '0',
  `remarks` text COLLATE utf8_unicode_ci,
  `status` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `gcep_before` decimal(10,2) DEFAULT '0.00',
  `gcep_after` decimal(10,2) DEFAULT '0.00',
  `gcep_variance_before` decimal(10,2) DEFAULT '0.00',
  `gcep_variance_after` decimal(10,2) DEFAULT '0.00',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `insert_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `backup_insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`gcep_commission_id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- gc backup table
CREATE TABLE `ph_member_gc_commissions_backups` (
  `gc_commission_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ibsp_gc` decimal(10,2) DEFAULT '0.00',
  `irs_gc` decimal(10,2) DEFAULT '0.00',
  `ivp_gc` decimal(10,2) DEFAULT '0.00',
  `total_gc` decimal(10,2) DEFAULT '0.00',
  `gc_variance` decimal(10,2) DEFAULT '0.00',
  `net_gc` decimal(10,2) DEFAULT '0.00',
  `is_on_hold` tinyint(1) DEFAULT '0',
  `remarks` text COLLATE utf8_unicode_ci,
  `status` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `gc_before` decimal(10,2) DEFAULT '0.00',
  `gc_after` decimal(10,2) DEFAULT '0.00',
  `gc_variance_before` decimal(10,2) DEFAULT '0.00',
  `gc_variance_after` decimal(10,2) DEFAULT '0.00',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `insert_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `backup_insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`gc_commission_id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


