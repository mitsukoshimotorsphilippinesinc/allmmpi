############
##Voucher Type Reference Table
############
DROP TABLE IF EXISTS `rf_account_voucher_types`;
CREATE TABLE `rf_account_voucher_types` (
  	`voucher_type_id` int(11) NOT NULL AUTO_INCREMENT,
  	`name` varchar(64) DEFAULT NULL,
	`code` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`voucher_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `rf_account_voucher_types` (`voucher_type_id`, `name`, `code`)
VALUES
  (1, 'Free Product Voucher', 'FPV'),
  (2, 'Magic Product Voucher', 'MPV');

############
##Account Voucher Products 
############
DROP TABLE IF EXISTS `rf_account_voucher_products`;
CREATE TABLE `rf_account_voucher_products` (
	`voucher_product_id` int(11) NOT NULL AUTO_INCREMENT,
	`voucher_type_id` int(11) NOT NULL,
	`json_products` TEXT,
	`is_active` tinyint(1),
	PRIMARY KEY (`voucher_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

##ALTERNATIVE TABLE STRUCTURE FOR rf_account_voucher_products
##DROP TABLE IF EXISTS `rf_account_voucher_products`;
##CREATE TABLE `rf_account_voucher_products` (
##	`voucher_type_id` int(11) NOT NULL AUTO_INCREMENT,
##	`product_id` int(11) NOT NULL
##	`quantity` int(11),
##	`group`		int(11)
##) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `cm_member_account_vouchers`;
CREATE TABLE `cm_member_account_vouchers` (
  `voucher_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `voucher_code` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `confirmation_code` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `voucher_type_id` int(11) DEFAULT '0',
  `member_id` int(11) DEFAULT '0',
  `to_member_id` int(11) DEFAULT '0',
  `original_member_id` int(11) DEFAULT '0',
  `original_account_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ar_number` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transfer_count` int(11) DEFAULT '0',
  `redeemed_by` int(11) DEFAULT '0',
  `redeemed_timestamp` timestamp NULL DEFAULT NULL,
  `validity_timestamp` timestamp NULL DEFAULT NULL,
  `updated_timestamp` timestamp NULL DEFAULT NULL,
  `insert_timestamp` timestamp DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`voucher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `cm_member_account_voucher_products`;
CREATE TABLE `cm_member_account_voucher_products` (
  `voucher_id` int(11) unsigned NOT NULL,
  `product_id` int(11) DEFAULT '0',
  `quantity` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


ALTER TABLE `is_payment_transaction_products` ADD  `voucher_code` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL AFTER  `is_product_rebate`;
ALTER TABLE `is_payment_transaction_products` ADD  `voucher_type_id` int(11) DEFAULT '0' AFTER  `is_product_rebate`;

ALTER TABLE `is_payment_transaction_products` DROP PRIMARY KEY ,
ADD PRIMARY KEY ( `transaction_id` , `package_product_id` , `product_id` , `is_product_rebate`, `group`, `voucher_code` );


ALTER TABLE `cm_member_cart_products` ADD  `voucher_code` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL;
ALTER TABLE `cm_member_cart_products` ADD  `voucher_type_id` int(11) DEFAULT '0';

INSERT INTO `rf_settings` (`slug`, `value`, `default`, `system_code`) VALUES ('mpv_discount', '0.5', '0.5', 'webpoi');

DROP TABLE IF EXISTS `tr_voucher_redemption_logs`;
CREATE TABLE `tr_voucher_redemption_logs` (
	`voucher_redemption_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`voucher_id` int(11) NOT NULL,
	`voucher_code` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
	`voucher_type_id` int(11) NOT NULL,
	`status` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
	`previous_status` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
	`member_id` int(11) DEFAULT 0 NOT NULL,
	`transaction_id` int(11) DEFAULT 0,
	`ar_number` varchar(64) DEFAULT NULL,
	`insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`voucher_redemption_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
