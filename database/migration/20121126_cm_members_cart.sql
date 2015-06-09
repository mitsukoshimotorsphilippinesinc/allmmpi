DROP TABLE IF EXISTS `cm_member_shopping_cart_products`;
DROP TABLE IF EXISTS `cm_member_cart`;
CREATE TABLE `cm_member_cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) unsigned NOT NULL,
  `status` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remarks` TEXT,
  `payment_transaction_id` int(11) unsigned NOT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `cm_member_cart_products`;
CREATE TABLE `cm_member_cart_products` (
  `cart_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_id` int(11) unsigned NOT NULL,
  `product_id` int(11) unsigned NOT NULL,
  `qty` int(11) unsigned NOT NULL,
  `is_product_rebate` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_package` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `parent_product_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`cart_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;