 alter table cm_member_accounts_history add column node_address text COLLATE utf8_unicode_ci after account_status_id;
 alter table cm_member_accounts_history add column uni_node text COLLATE utf8_unicode_ci after node_address;

 CREATE TABLE `cm_member_earnings_per_type_history` (
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `account_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `pairing_bonus` decimal(10,2) NOT NULL DEFAULT '0.00',
  `gift_cheque` decimal(10,2) NOT NULL DEFAULT '0.00',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`history_id`),
  KEY `member_id` (`member_id`),
  KEY `account_id` (`account_id`),
  KEY `type_id` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;