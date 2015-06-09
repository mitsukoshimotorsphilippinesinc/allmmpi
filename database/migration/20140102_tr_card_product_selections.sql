CREATE TABLE `tr_card_product_selections` (
  `card_product_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `card_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_id` int(11) unsigned NOT NULL,
  `qty` int(11) unsigned NOT NULL,
  `original_member_id` int(11) DEFAULT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`card_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
