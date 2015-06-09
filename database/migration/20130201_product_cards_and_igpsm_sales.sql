DROP TABLE IF EXISTS `rf_product_cards`;

CREATE TABLE `rf_product_cards` (
  `product_card_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `group_product_ids` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qty_needed` int(11) DEFAULT '1',
  `qty_counted` int(11) unsigned DEFAULT '1',
  PRIMARY KEY (`product_card_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `tr_igpsm_sales_logs`;

CREATE TABLE `tr_igpsm_sales_logs` (
  `product_id` int(11) NOT NULL,
  `qty` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` decimal(11,2) DEFAULT '0.00',
  `facility_id` int(11) DEFAULT NULL,
  `product_type_id` int(11) DEFAULT NULL,
  `product_line_id` int(11) DEFAULT NULL,
  `sales_type` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sales_date` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `insert_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;