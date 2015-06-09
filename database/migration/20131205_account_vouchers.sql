INSERT INTO `rf_account_voucher_types` (`voucher_type_id`, `name`, `code`)
VALUES
	(3, 'P2P', 'P2P');


ALTER TABLE `rf_account_voucher_products` ADD COLUMN `voucher_product_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL AFTER `voucher_product_id`;