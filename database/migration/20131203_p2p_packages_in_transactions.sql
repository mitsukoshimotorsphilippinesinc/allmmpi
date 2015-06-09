ALTER TABLE `is_payment_transaction_products` ADD  `lowest_product` int(11) DEFAULT '0' AFTER  `voucher_code`;
ALTER TABLE `is_payment_transaction_products` ADD  `card_id` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL AFTER  `voucher_code`;

ALTER TABLE `is_payment_transaction_products` DROP PRIMARY KEY ,
ADD PRIMARY KEY ( `transaction_id` , `package_product_id` , `product_id` , `is_product_rebate`, `group`, `voucher_code`, `card_id` );

INSERT INTO `rf_product_types` (`name`, `is_visible`, `is_regular`, `is_gc_buyable`, `is_package`, `is_igpsm`) VALUES ('P2P PACKAGES', 1, 1, 1, 1, 1);


#ALTER TABLE `cm_member_cart_products` ADD  `voucher_code` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL;
#ALTER TABLE `cm_member_cart_products` ADD  `voucher_type_id` int(11) DEFAULT '0';