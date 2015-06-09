CREATE TABLE `cm_member_account_product_transaction` (
  `product_transaction_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` int(11) unsigned NOT NULL,
  `ar_number` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `card_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `node_address` text COLLATE utf8_unicode_ci,
  `product_id` int(11) unsigned NOT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `cm_member_account_credited_transaction` (
  `credited_transaction_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `left_account_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `right_account_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_id` int(11) unsigned NOT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`credited_transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;