INSERT INTO `rf_settings` (`slug`, `value`, `default`, `system_code`, `is_locked`, `insert_timestamp`)
VALUES ('psf_value', '10', '', 'system', 0, NOW());

DROP TABLE IF EXISTS `po_member_payouts`;
CREATE TABLE `po_member_payouts` (
  `payout_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(64) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `psf_type` varchar(64) DEFAULT NULL,
  `psf_value` int(11) DEFAULT NULL,
  `psf_limit` int(11) DEFAULT NULL,
  `status` varchar(64) DEFAULT 'PROCESSING',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`payout_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `po_member_commissions`;
CREATE TABLE `po_member_commissions` (
  `commission_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `account_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_code` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `payout_id` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`commission_id`),
  KEY `member_id` (`member_id`),
  KEY `account_id` (`account_id`),
  KEY `start_date` (`start_date`,`end_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP VIEW IF EXISTS `po_member_commissions_igpsm_view`;
CREATE VIEW `po_member_commissions_igpsm_view`
AS SELECT
   `a`.`member_id` AS `member_id`,
   `a`.`account_id` AS `account_id`,
   `b`.`last_name` AS `last_name`,
   `b`.`first_name` AS `first_name`,
   `b`.`middle_name` AS `middle_name`,sum(`a`.`amount`) AS `amount`,
   `c`.`cd_amount` AS `cd_amount`,(case when (`c`.`node_type` = 'CORPO') then 'CORPO' else (case when (`b`.`metrobank_paycard_number` IS NOT NULL) then `b`.`metrobank_paycard_number` else 'TO FUNDS' end) end) AS `cash_card`,(case when (`c`.`account_status_id` = 1) then 'ACTIVE' when (`c`.`account_status_id` = 2) then 'INACTIVE' when (`c`.`account_status_id` = 3) then 'COMPANY' end) AS `account_status`,
   `a`.`start_date` AS `start_date`,
   `a`.`end_date` AS `end_date`,
   `a`.`insert_timestamp` AS `insert_timestamp`,
   `c`.`insert_timestamp` AS `account_insert_timestamp`
FROM ((`po_member_commissions` `a` LEFT JOIN `cm_members` `b` ON((`a`.`member_id` = `b`.`member_id`))) LEFT JOIN `cm_member_accounts` `c` ON((`a`.`account_id` = `c`.`account_id`)))
WHERE (`a`.`transaction_code` IN (100,101,102,103,104))
GROUP BY `a`.`account_id`, `a`.`start_date`, `a`.`end_date`
ORDER BY `b`.`last_name`,`b`.`first_name`,`b`.`middle_name`;

DROP VIEW IF EXISTS `po_member_commissions_unilevel_view`;
CREATE VIEW `po_member_commissions_unilevel_view`
AS SELECT
   `a`.`member_id` AS `member_id`,
   `a`.`account_id` AS `account_id`,
   `b`.`last_name` AS `last_name`,
   `b`.`first_name` AS `first_name`,
   `b`.`middle_name` AS `middle_name`,sum(`a`.`amount`) AS `amount`,
   `c`.`cd_amount` AS `cd_amount`,(case when (`c`.`node_type` = 'CORPO') then 'CORPO' else (case when (`b`.`metrobank_paycard_number` IS NOT NULL) then `b`.`metrobank_paycard_number` else 'TO FUNDS' end) end) AS `cash_card`,(case when (`c`.`account_status_id` = 1) then 'ACTIVE' when (`c`.`account_status_id` = 2) then 'INACTIVE' when (`c`.`account_status_id` = 3) then 'COMPANY' end) AS `account_status`,
   `a`.`start_date` AS `start_date`,
   `a`.`end_date` AS `end_date`,
   `a`.`insert_timestamp` AS `insert_timestamp`,
   `c`.`insert_timestamp` AS `account_insert_timestamp`
FROM ((`po_member_commissions` `a` LEFT JOIN `cm_members` `b` ON((`a`.`member_id` = `b`.`member_id`))) LEFT JOIN `cm_member_accounts` `c` ON((`a`.`account_id` = `c`.`account_id`)))
WHERE (`a`.`transaction_code` = 105)
GROUP BY `a`.`account_id`, `a`.`start_date`, `a`.`end_date`
ORDER BY `b`.`last_name`,`b`.`first_name`,`b`.`middle_name`;

DROP TABLE IF EXISTS `po_member_commissions_report`;
CREATE TABLE `po_member_commissions_report` (
  `member_commission_id` int(11) NOT NULL AUTO_INCREMENT,
  `payout_id` int(11) NOT NULL DEFAULT '0',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `member_id` int(11) NOT NULL DEFAULT '0',
  `gross` decimal(10,2) DEFAULT NULL,
  `psf` decimal(10,2) DEFAULT NULL,
  `net_gross` decimal(10,2) DEFAULT NULL,
  `tax` decimal(10,2) DEFAULT NULL,
  `net_tax` decimal(10,2) DEFAULT NULL,
  `balance` decimal(10,2) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `cash_card` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`member_commission_id`),
  KEY (`payout_id`),
  KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;