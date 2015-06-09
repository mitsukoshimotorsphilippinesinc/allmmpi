CREATE TABLE `rf_card_type_series` (
  `card_series_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `card_type_id` int(11) NOT NULL,
  `card_series_id` int(11) NOT NULL,
  `starting_index` varchar(64) NOT NULL DEFAULT '0',
  `ending_index` varchar(64) NOT NULL DEFAULT '0',
  `qty` int(11) NOT NULL DEFAULT 0,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`card_series_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE  `rf_card_series` ADD `is_package` tinyint(1) NOT NULL DEFAULT 1 AFTER `series_number`;
ALTER TABLE  `rf_card_series` ADD `status` varchar(10) NOT NULL DEFAULT 'ACTIVE' AFTER `is_package`;
ALTER TABLE  `rf_card_series` ADD `is_locked` tinyint(1) NOT NULL DEFAULT 0 AFTER  `status`;

CREATE TABLE `tr_card_series_generation_log` (
  `tr_id` int(11) NOT NULL AUTO_INCREMENT,
  `card_series_code` int(11) NOT NULL,
  `action` varchar(20) NULL DEFAULT 'ADD',
  `qty` int(11) NOT NULL DEFAULT 0,
  `starting_index` varchar(64) NOT NULL DEFAULT '0',
  `ending_index` varchar(64) NOT NULL DEFAULT '0',
  `user_id` INT(11) NOT NULL DEFAULT 0,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`tr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `tr_card_type_allocation_log` (
  `allocation_id` int(11) NOT NULL AUTO_INCREMENT,
  `card_series_id` int(11) NOT NULL,
  `card_type_id` int(11) NOT NULL,
  `starting_index` varchar(64) NOT NULL DEFAULT '0',
  `ending_index` varchar(64) NOT NULL DEFAULT '0',
  `qty` int(11) NOT NULL DEFAULT 0,
  `user_id` INT(11) NOT NULL DEFAULT 0,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`allocation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `rf_card_type_bonuses` (
  `type_bonus_id` int(11) NOT NULL AUTO_INCREMENT,
  `card_type_id` int(11) NOT NULL,
  `commission_type` varchar(20) NOT NULL DEFAULT 'PAIRING',
  `bonus_type` varchar(20) NOT NULL DEFAULT 'FUNDS',
  `qty_amount` int(11) NOT NULL DEFAULT 0,
  `user_id` INT(11) NOT NULL DEFAULT 0,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`type_bonus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE  `rf_card_types` 
  ADD `status` varchar(10) NOT NULL DEFAULT 'ACTIVE' AFTER  `is_package`,
  ADD `is_locked` tinyint(1) NOT NULL DEFAULT 0 AFTER  `status`,
  ADD `points_to_pair` decimal(10,2) NOT NULL DEFAULT '700.00' AFTER `is_locked`,
  ADD `points` decimal(10,2) NOT NULL DEFAULT '700.00' AFTER `points_to_pair`;

CREATE TABLE IF NOT EXISTS `rf_modifiers` (
  `modifier_id` int(11) NOT NULL AUTO_INCREMENT,
  `modifier_name` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `insert_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`modifier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

ALTER TABLE  `rf_modifiers` ADD `user_id` INT(11) NOT NULL AFTER `description`;

INSERT INTO `rf_modifiers` (`modifier_id`, `modifier_name`, `description`, `user_id`, `insert_timestamp`)
VALUES
  (1, 'RAFFLE', '', 1, '2013-11-14 04:35:32'),
  (2, 'REFERRAL', '', 1, '2013-11-14 07:09:24'),
  (3, 'PAIRING', '', 1, '2013-11-14 07:09:36'),
  (4, 'UPGRADE', '', 1, '2013-11-18 12:35:13'),
  (5, 'CASCADE', '', 1, '2013-11-18 17:20:16'),
  (6, 'MAINTENANCE', '', 1, '2013-11-19 13:18:52');

CREATE TABLE IF NOT EXISTS `rf_card_modifiers` (
  `card_type_id` int(11) NOT NULL,
  `modifier_id` int(11) NOT NULL,
  PRIMARY KEY (`card_type_id`,`modifier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE  `rf_card_modifiers` ADD `user_id` INT(11) NOT NULL AFTER `modifier_id`;

CREATE TABLE IF NOT EXISTS `cm_member_account_upgrades` (
  `upgrade_id` int(11) NOT NULL AUTO_INCREMENT,
  `base_account_id` varchar(64) NOT NULL,
  `upgrade_account_id` text NOT NULL,
  `upgrade_type` varchar(20) NOT NULL,
  `insert_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`upgrade_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

INSERT INTO `rf_job_types` (`job_type_id`, `job_code`, `scripts`, `insert_timestamp`)
VALUES
  (9, 'upgrade_account', 'jobs/register/upgrade_account', '2013-11-15 22:33:38');

CREATE TABLE `cm_member_earnings_per_type` (
  `earning_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `account_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `pairing_bonus` decimal(10,2) NOT NULL DEFAULT '0.00',
  `gift_cheque` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`earning_id`),
  KEY `member_id` (`member_id`),
  KEY `account_id` (`account_id`),
  KEY `type_id` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `cm_member_account_pairing` (
  `pairing_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `account_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `card_type_id` int(11) NOT NULL,
  `left_count` decimal(10,2) NOT NULL DEFAULT '0.00',
  `right_count` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_left` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_right` decimal(10,2) NOT NULL DEFAULT '0.00',
  `pair_count` decimal(10,2) NOT NULL DEFAULT '0.00',
  `flushout` decimal(10,2) NOT NULL DEFAULT '0.00',
  `gc_count` decimal(10,2) NOT NULL DEFAULT '0.00',
  `gc_pair` decimal(10,2) NOT NULL DEFAULT '0.00',
  `updated_timestamp` timestamp NULL DEFAULT '0000-00-00 00:00',
  `insert_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pairing_id`),
  KEY `member_id` (`member_id`),
  KEY `account_id` (`account_id`),
  KEY `card_type_id` (`card_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

UPDATE rf_job_types SET scripts = "jobs/encoding/process_modifiers" WHERE job_type_id = 1;
UPDATE rf_job_types SET scripts = "jobs/cards/card_generation" WHERE job_type_id = 2;