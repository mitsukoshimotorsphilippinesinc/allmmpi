ALTER TABLE `rf_card_types` ADD COLUMN `display_on_dashboard` TINYINT(1) DEFAULT 0 AFTER `description`;

UPDATE `rf_card_types` SET display_on_dashboard = 1 WHERE code IN ('SP','VP','RS','ERHM', 'UP1', 'P2P');

ALTER TABLE `tr_member_acct_credit_logs` ADD COLUMN `sms_sent` TINYINT(1) DEFAULT 0 AFTER `remarks`;

ALTER TABLE `cm_member_earnings_per_type` ADD COLUMN `sms_pairing_total` INT(11) DEFAULT 0 AFTER `gift_cheque`;
ALTER TABLE `cm_member_earnings_per_type` ADD COLUMN `sms_referral_total` INT(11) DEFAULT 0 AFTER `sms_pairing_total`;

INSERT INTO rf_settings(`slug`, `value`, `default`, `system_code`, `is_locked`)
VALUES ('display_sms_count', '0', '0', 'network', '0');

INSERT INTO rf_settings(`slug`, `value`, `default`, `system_code`, `is_locked`)
VALUES ('display_monthly_igpsm_earnings', '0', '0', 'network', '0');

INSERT INTO rf_settings(`slug`, `value`, `default`, `system_code`, `is_locked`)
VALUES ('notification_cost_sms', '1.00', '1.00', 'system', '0');