DROP TABLE IF EXISTS `po_member_accounts`;
DROP TABLE IF EXISTS `po_member_accounts_history`;
CREATE TABLE `po_member_accounts_history` (
  `member_account_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `member_user_account_id` int(11) DEFAULT NULL,
  `account_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sponsor_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `upline_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_type_id` int(11) DEFAULT NULL,
  `account_status_id` int(11) DEFAULT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`member_account_id`),
  KEY `account_id` (`account_id`),
  KEY `member_id` (`member_id`),
  KEY `sponsor_id` (`sponsor_id`),
  KEY `upline_id` (`upline_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;