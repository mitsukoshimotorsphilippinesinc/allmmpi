DROP TABLE IF EXISTS `cm_member_p2p_products_cards_tally`;
CREATE TABLE `cm_member_p2p_products_cards_tally` (
  `product_cards_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` int(11) NOT NULL DEFAULT '0',
  `transaction_code` varchar(32) DEFAULT NULL,
  `member_id` int(11) NOT NULL DEFAULT '0',
  `p2p_products_count` int(11) DEFAULT '0',
  `p2p_cards_released` int(11) DEFAULT '0',
  `update_timestamp` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `insert_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_cards_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;