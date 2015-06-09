DROP TABLE IF EXISTS `rf_payout_crediting_fields`;
CREATE TABLE `rf_payout_crediting_fields` (
  `crediting_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT 'NULL',
  `always_present` tinyint(1) NOT NULL DEFAULT 0,
  `member_payout_column` varchar(100) NOT NULL DEFAULT 'NULL',
  `column_position` text,
  PRIMARY KEY (`crediting_field_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `rf_payout_crediting_fields`(`name`, `always_present`, `member_payout_column`)
VALUES ('MEMBER ID', 1, 'member_id');
INSERT INTO `rf_payout_crediting_fields`(`name`, `always_present`, `member_payout_column`)
VALUES ('LAST NAME', 1, 'last_name');
INSERT INTO `rf_payout_crediting_fields`(`name`, `always_present`, `member_payout_column`)
VALUES ('FIRST NAME', 1, 'first_name');
INSERT INTO `rf_payout_crediting_fields`(`name`, `always_present`, `member_payout_column`)
VALUES ('MIDDLE NAME', 1, 'middle_name');
INSERT INTO `rf_payout_crediting_fields`(`name`, `always_present`, `member_payout_column`)
VALUES ('GROSS', 1, 'gross');
INSERT INTO `rf_payout_crediting_fields`(`name`, `always_present`, `member_payout_column`)
VALUES ('LESS 10 PERCENT', 1, 'gcep');
INSERT INTO `rf_payout_crediting_fields`(`name`, `always_present`, `member_payout_column`)
VALUES ('NET GROSS', 1, 'net_of_gcep');
INSERT INTO `rf_payout_crediting_fields`(`name`, `always_present`, `member_payout_column`)
VALUES ('TAX', 1, 'witholding_tax');
INSERT INTO `rf_payout_crediting_fields`(`name`, `always_present`, `member_payout_column`)
VALUES ('NET OF TAX', 1, 'net_of_tax');
INSERT INTO `rf_payout_crediting_fields`(`name`, `always_present`, `member_payout_column`)
VALUES ('NET AMOUNT', 1, 'total_amount');
INSERT INTO `rf_payout_crediting_fields`(`name`, `always_present`, `member_payout_column`)
VALUES ('CASH CARD', 1, 'cash_card');
INSERT INTO `rf_payout_crediting_fields`(`name`, `always_present`, `member_payout_column`)
VALUES ('ACCOUNT NUMBER', 1, 'account_number');
INSERT INTO `rf_payout_crediting_fields`(`name`, `always_present`, `member_payout_column`)
VALUES ('DEPOT', 1, 'service_depot');
INSERT INTO `rf_payout_crediting_fields`(`name`, `always_present`, `member_payout_column`)
VALUES ('GROUP NAME', 1, 'group_name');
INSERT INTO `rf_payout_crediting_fields`(`name`, `always_present`, `member_payout_column`)
VALUES ('IS CORPO SHARING', 1, 'is_corpo_sharing');
INSERT INTO `rf_payout_crediting_fields`(`name`, `always_present`, `member_payout_column`)
VALUES ('CHECK RELEASE', 1, 'check_release');
INSERT INTO `rf_payout_crediting_fields`(`name`, `always_present`, `member_payout_column`)
VALUES ('IS ON HOLD', 1, 'is_on_hold');
INSERT INTO `rf_payout_crediting_fields`(`name`, `always_present`, `member_payout_column`)
VALUES ('IS_ADJUSTMENT', 1, 'is_adjustment');
INSERT INTO `rf_payout_crediting_fields`(`name`, `always_present`, `member_payout_column`)
VALUES ('START DATE', 1, 'start_date');
INSERT INTO `rf_payout_crediting_fields`(`name`, `always_present`, `member_payout_column`)
VALUES ('END DATE', 1, 'end_date');
INSERT INTO `rf_payout_crediting_fields`(`name`, `always_present`, `member_payout_column`)
VALUES ('REMARKS', 1, 'remarks');
INSERT INTO `rf_payout_crediting_fields`(`name`, `always_present`, `member_payout_column`)
VALUES ('DEDUCTIONS', 0, 'total_deductions');


-- po_member_deductions
ALTER TABLE po_member_deductions ADD COLUMN `deduction_type` VARCHAR(100) DEFAULT 'DEDUCTION' AFTER `end_date`;
ALTER TABLE po_member_deductions ADD COLUMN `amount` DECIMAL(10, 2) DEFAULT 0.00 AFTER deduction_type;
UPDATE po_member_deductions SET amount = deduction1 + deduction2 + card_fee;

-- cm_member_payouts
ALTER TABLE cm_member_payouts ADD COLUMN `total_deductions` DECIMAL(10, 2) DEFAULT 0.00 AFTER `card_fee`;
UPDATE cm_member_payouts SET total_deductions = balance + deduction2 + card_fee;

-- cm_member_payouts_backups
ALTER TABLE cm_member_payouts_backups ADD COLUMN `total_deductions` DECIMAL(10, 2) DEFAULT 0.00 AFTER `card_fee`;
UPDATE cm_member_payouts_backups SET total_deductions = balance + deduction2 + card_fee;

DROP TABLE `rf_payout_crediting_fields`;

DROP TABLE IF EXISTS `cm_auto_crediting`;
CREATE TABLE `cm_auto_crediting` (
  `crediting_id` int(11) NOT NULL AUTO_INCREMENT,
  `payout_type` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'IGPSM',
  `start_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hash` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'PENDING',
  `user_id` int(11) DEFAULT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`crediting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE cm_auto_crediting ADD COLUMN `commission_type` VARCHAR(100) DEFAULT 'NULL' AFTER `status`;	

-- change is_corpo_sharing from tinyint to integer
ALTER TABLE cm_member_payouts CHANGE COLUMN is_corpo_sharing is_corpo_sharing INT(10) UNSIGNED DEFAULT 0;
ALTER TABLE cm_member_payouts_backups CHANGE COLUMN is_corpo_sharing is_corpo_sharing INT(10) UNSIGNED DEFAULT 0;

-- add crediting_id 
ALTER TABLE cm_member_payouts ADD COLUMN `crediting_id` INT(10) NOT NULL DEFAULT 0 AFTER `user_id`;
ALTER TABLE cm_member_payouts_backups ADD COLUMN `crediting_id` INT(10) NOT NULL DEFAULT 0 AFTER `user_id`;
ALTER TABLE ph_member_gcep_commissions ADD COLUMN `crediting_id` INT(10) NOT NULL DEFAULT 0 AFTER `user_id`;
ALTER TABLE ph_member_gcep_commissions_backups ADD COLUMN `crediting_id` INT(10) NOT NULL DEFAULT 0 AFTER `user_id`;
ALTER TABLE ph_member_gc_commissions ADD COLUMN `crediting_id` INT(10) NOT NULL DEFAULT 0 AFTER `user_id`;
ALTER TABLE ph_member_gc_commissions_backups ADD COLUMN `crediting_id` INT(10) NOT NULL DEFAULT 0 AFTER `user_id`;

ALTER TABLE po_member_deductions ADD COLUMN `user_id` INT(10) UNSIGNED DEFAULT 0 AFTER `type`;
ALTER TABLE po_member_deductions ADD COLUMN `crediting_id` INT(10) NOT NULL DEFAULT 0 AFTER `user_id`;

ALTER TABLE cm_auto_crediting DROP COLUMN `commission_type`;