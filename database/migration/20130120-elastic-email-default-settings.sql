INSERT INTO `rf_settings` (`slug`, `value`, `default`, `system_code`, `is_locked`, `insert_timestamp`)
VALUES
	('email_api', 'elastic_email', '', 'system', 0, NOW());

/* TODO: need to update these values to jkings' account */
INSERT INTO `rf_settings` (`slug`, `value`, `default`, `system_code`, `is_locked`, `insert_timestamp`)
VALUES
	('email_username', 'odie.miranda@gmail.com', '', 'system', 0, NOW());

INSERT INTO `rf_settings` (`slug`, `value`, `default`, `system_code`, `is_locked`, `insert_timestamp`)
VALUES
	('email_api_key', '5e75d891-37be-415d-985f-c1eda6b147c7', '', 'system', 0, NOW());
