CREATE TABLE `rf_upgrade_card_mapping` (
  `map_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `base_card_type_id` int(11) unsigned NOT NULL,
  `base_card_type_code` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `upgrade_card_type_id` int(11) unsigned NOT NULL,
  `upgrade_card_type_code` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`map_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;