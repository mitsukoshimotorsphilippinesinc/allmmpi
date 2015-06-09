-- add table cm_member_deductions

CREATE TABLE `cm_member_deductions` (
  `deduction_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `amount_due` decimal(10,2) DEFAULT NULL,
  `deduction_per_payout` decimal(10,2) DEFAULT NULL,
  `terms` int(11) DEFAULT NULL,
  `remarks` text COLLATE utf8_unicode_ci,
  `lapsed_balance` decimal(10,2) DEFAULT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`deduction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- add table po_member_deductions

CREATE TABLE `po_member_deductions` (
  `member_deduction_id` int(11) NOT NULL AUTO_INCREMENT,
  `deduction_id` int(11) NOT NULL DEFAULT '0',
  `payout_id` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `deducted_amount` decimal(10,2) DEFAULT NULL,
  `amount_due` decimal(10,2) DEFAULT NULL,
  `amount_lapsed` decimal(10,2) DEFAULT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`member_deduction_id`),
  KEY `deduction_id` (`deduction_id`),
  KEY `payout_id` (`payout_id`),
  KEY `member_id` (`member_id`),
  KEY `start_date` (`start_date`),
  KEY `end_date` (`end_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- add table po_member_deduction_conflicts

CREATE TABLE `po_member_deduction_conflicts` (
  `deduction_conflicts_id` int(11) NOT NULL AUTO_INCREMENT,
  `deduction_id` int(11) NOT NULL DEFAULT '0',
  `payout_id` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `amount_total` decimal(10,2) DEFAULT NULL,
  `deduction_amount` decimal(10,2) DEFAULT NULL,
  `is_resolved` tinyint(1) NOT NULL DEFAULT '0',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`deduction_conflicts_id`),
  KEY `deduction_id` (`deduction_id`),
  KEY `payout_id` (`payout_id`),
  KEY `member_id` (`member_id`),
  KEY `start_date` (`start_date`),
  KEY `end_date` (`end_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


