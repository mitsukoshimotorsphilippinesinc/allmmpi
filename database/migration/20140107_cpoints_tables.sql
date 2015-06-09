CREATE TABLE `cm_member_cpoints_transaction` (
  `transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'PENDING',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`transaction_id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `rf_cpoint_ratio` (
  `ratio_id` int(11) NOT NULL AUTO_INCREMENT,
  `from_type` varchar(15) DEFAULT 'GIFT_CHEQUES',
  `cpoint_ratio` decimal(10,2) DEFAULT 1.0,
  `user_id` int(11) DEFAULT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ratio_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `rf_cpoint_ratio` (`ratio_id`, `from_type`, `cpoint_ratio`, `user_id`, `insert_timestamp`)
VALUES
  (1, 'GIFT_CHEQUES', 1.00, 1, '2014-01-07 13:46:48'),
  (2, 'GCEP', 2.00, 1, '2014-01-07 13:46:55');

ALTER TABLE cm_members ADD COLUMN cpoints decimal(10,2) DEFAULT '0.0' after gcep;