INSERT INTO `ad_navigations` (`system_code`, `code`, `title`, `url`, `ordering`, `parent_id`, `is_active`, `type`, `insert_timestamp`)
VALUES
	('system', 'cpoint_conversion', 'C Point Conversion', '/admin/cpoints/conversion_rate', 23, 3, 1, 'LINK', '2014-01-15 17:30:24');

INSERT INTO `rf_transaction_codes` (`transaction_code`, `transaction_description`)
VALUES
	(507, 'Credit C Points via Admin'),
	(508, 'Debit C Points via Admin');