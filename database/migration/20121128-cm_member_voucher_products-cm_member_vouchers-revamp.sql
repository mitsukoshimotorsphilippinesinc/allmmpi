DROP TABLE IF EXISTS `cm_member_voucher_products`;
CREATE TABLE `cm_member_voucher_products` (
  `voucher_product_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `voucher_id` int(11) unsigned NOT NULL DEFAULT '0',
  `product_id` int(11) unsigned NOT NULL DEFAULT '0',
  `parent_product_id` int(11) unsigned NOT NULL DEFAULT '0',
  `qty` int(11) unsigned NOT NULL DEFAULT 1,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`voucher_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `cm_member_vouchers` DROP `member_code`;
ALTER TABLE `cm_member_vouchers` CHANGE  `product_id`  `cart_id` INT( 11 ) UNSIGNED NULL DEFAULT  '0';
ALTER TABLE  `cm_member_vouchers` ADD  `transaction_id` INT( 11 ) UNSIGNED NOT NULL DEFAULT  '0' AFTER  `cart_id`;