INSERT INTO `rf_settings` (`slug`, `value`, `default`, `system_code`, `is_locked`, `insert_timestamp`)
VALUES
	('ipay_merchant_code', 'PH00103', 'PH00103', 'system', 0, '2014-02-27 12:48:36'),
	('ipay_merchant_key', 'te03ualLig', 'te03ualLig', 'system', 0, '2014-02-27 12:50:45');


CREATE TABLE `tr_ipay_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `log` varchar(4096) DEFAULT NULL,
  `transaction_id` int(11) NOT NULL DEFAULT '0',
  `txn_id` varchar(64) NOT NULL,
  `status` varchar(32) NOT NULL,
  `from` varchar(32) NOT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;