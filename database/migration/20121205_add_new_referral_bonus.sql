-- add new referral bonus

UPDATE `vitalc`.`rf_settings` SET `slug` = 'referral_bonus_sp' WHERE `rf_settings`.`slug` = 'referral_bonus';

INSERT INTO `rf_settings` (`slug`, `value`, `default`, `system_code`, `is_locked`, `insert_timestamp`)
VALUES
	('referral_bonus_tp', '150', '', 'network', 0, '2012-12-05 12:01:37'),
	('referral_bonus_vp', '1500', '', 'network', 0, '2012-12-05 12:01:37');
