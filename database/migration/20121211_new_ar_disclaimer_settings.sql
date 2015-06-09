-- new setting entry for ar_disclaimer

INSERT INTO `rf_settings` (`slug`, `value`, `default`, `system_code`, `is_locked`, `insert_timestamp`)
VALUES
	('ar_disclaimer', 'Disclaimer: This is to certify that the above-named products were received in proper condition.', 'Disclaimer: This is to certify that the above-named products were received in proper condition.', 'webpoi', 0, CURRENT_TIMESTAMP);
