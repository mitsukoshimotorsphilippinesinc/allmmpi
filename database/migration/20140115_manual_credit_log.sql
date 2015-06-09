CREATE TABLE `tr_member_acct_credit_manual_logs` (
  `credit_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `account_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_status_id` int(11) unsigned NOT NULL DEFAULT '0',
  `card_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from_account_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_code` int(11) NOT NULL DEFAULT '0',
  `type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `remarks` text COLLATE utf8_unicode_ci,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`credit_log_id`),
  KEY `member_id` (`member_id`),
  KEY `account_id` (`account_id`),
  KEY `card_id` (`card_id`),
  KEY `transaction_code` (`transaction_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DELIMITER ;;
/*!50003 CREATE */ /*!50003 TRIGGER `manual logs` AFTER INSERT ON `tr_member_acct_credit_manual_logs` FOR EACH ROW BEGIN
  INSERT INTO
    tr_member_acct_credit_logs
  (
    `member_id`,
    `account_id`,
    `account_status_id`,
    `card_id`,
    `from_account_id`,
    `transaction_code`,
    `type`,
    `level`,
    `amount`,
    `remarks`
  )
  VALUES
  (
    NEW.member_id,
    NEW.account_id,
    NEW.account_status_id,
    NEW.card_id,
    NEW.from_account_id,
    NEW.transaction_code,
    NEW.type,
    NEW.level,
    NEW.amount,
    NEW.remarks
  );
END */;;
DELIMITER ;