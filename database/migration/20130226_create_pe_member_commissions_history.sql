CREATE TABLE `pe_payout_periods` (
	`payout_period_id` int(11) NOT NULL AUTO_INCREMENT,
	`start_date` date DEFAULT NULL,
	`end_date` date DEFAULT NULL,
	`status` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
	`insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`payout_period_id`),	
	KEY `start_date` (`start_date`,`end_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO pe_payout_periods (start_date, end_date, status) VALUES ('2012-12-08 00:00:00','2012-12-07 23:59:59', 'COMPLETED');
INSERT INTO pe_payout_periods (start_date, end_date, status) VALUES ('2012-12-18 00:00:00','2012-12-21 23:59:59', 'COMPLETED');
INSERT INTO pe_payout_periods (start_date, end_date, status) VALUES ('2012-12-22 00:00:00','2012-12-28 23:59:59', 'COMPLETED');
INSERT INTO pe_payout_periods (start_date, end_date, status) VALUES ('2012-12-29 00:00:00','2013-01-04 23:59:59', 'COMPLETED');
INSERT INTO pe_payout_periods (start_date, end_date, status) VALUES ('2013-01-05 00:00:00','2013-01-11 23:59:59', 'COMPLETED');
INSERT INTO pe_payout_periods (start_date, end_date, status) VALUES ('2013-01-12 00:00:00','2013-01-18 23:59:59', 'COMPLETED');
INSERT INTO pe_payout_periods (start_date, end_date, status) VALUES ('2013-01-19 00:00:00','2013-01-25 23:59:59', 'COMPLETED');
INSERT INTO pe_payout_periods (start_date, end_date, status) VALUES ('2013-01-26 00:00:00','2013-02-01 23:59:59', 'COMPLETED');
INSERT INTO pe_payout_periods (start_date, end_date, status) VALUES ('2013-02-02 00:00:00','2013-02-08 23:59:59', 'COMPLETED');
INSERT INTO pe_payout_periods (start_date, end_date, status) VALUES ('2013-02-09 00:00:00','2013-02-15 23:59:59', 'COMPLETED');
INSERT INTO pe_payout_periods (start_date, end_date, status) VALUES ('2013-02-16 00:00:00','2013-02-22 23:59:59', 'COMPLETED');
INSERT INTO pe_payout_periods (start_date, end_date, status) VALUES ('2013-02-23 00:00:00','2013-03-01 23:59:59', 'ACTIVE');
	

CREATE TABLE `pe_member_commissions_history` (
  `commission_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT 0,
  `account_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `middle_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_code` int(11) DEFAULT 0,
  `quantity` int(11) DEFAULT 0,
  `amount` decimal(10,2) DEFAULT 0,
  `status` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payout_id` int(11) DEFAULT 0,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`commission_history_id`),
  KEY `member_id` (`member_id`),
  KEY `account_id` (`account_id`),
  KEY `start_date` (`start_date`,`end_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `pe_member_commissions_history_20121208_20121217` (
  `commission_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT 0,
  `account_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `middle_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_code` int(11) DEFAULT 0,
  `quantity` int(11) DEFAULT 0,
  `amount` decimal(10,2) DEFAULT 0,
  `status` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payout_id` int(11) DEFAULT 0,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`commission_history_id`),
  KEY `member_id` (`member_id`),
  KEY `account_id` (`account_id`),
  KEY `start_date` (`start_date`,`end_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- populate using csv file 20130227_igpsm_gc_payout_per_account_20121208_20121217.csv

-- update member_id, payout_id, start_date, end_date
 UPDATE pe_member_commissions_history_20121208_20121217 a
 SET
 member_id = (SELECT member_id FROM cm_member_accounts b where a.account_id = b.account_id),
 payout_id = 1,
 start_date = '2012-12-08',
 end_date = '2012-12-17';

-- check if member_ids are correct using the last_name, first_name,middle_name
UPDATE pe_member_commissions_history_20121208_20121217 a
SET a.member_id = (SELECT b.member_id FROM cm_members b WHERE a.last_name = b.last_name AND a.first_name = b.first_name AND a.middle_name = b.middle_name);
-- RESULT: 3

-----------------------------
-- PAYOUT 2 20121218_20121221
-----------------------------
DROP TABLE `pe_member_commissions_history_20121218_20121221`;
CREATE TABLE `pe_member_commissions_history_20121218_20121221` (
  `commission_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT 0,
  `account_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `middle_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_code` int(11) DEFAULT 0,
  `quantity` int(11) DEFAULT 0,
  `amount` decimal(10,2) DEFAULT 0,
  `status` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payout_id` int(11) DEFAULT 0,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`commission_history_id`),
  KEY `member_id` (`member_id`),
  KEY `account_id` (`account_id`),
  KEY `start_date` (`start_date`,`end_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- populate using csv file 20130227_igpsm_gc_payout_per_account_20121208_20121217.csv

-- update member_id, payout_id, start_date, end_date
 UPDATE pe_member_commissions_history_20121218_20121221 a
 SET
 member_id = (SELECT member_id FROM cm_member_accounts b where a.account_id = b.account_id),
 payout_id = 2,
 start_date = '2012-12-18',
 end_date = '2012-12-21';

-- check if member_ids are correct using the last_name, first_name,middle_name
UPDATE pe_member_commissions_history_20121218_20121221 a
SET a.member_id = (SELECT b.member_id FROM cm_members b WHERE a.last_name = b.last_name AND a.first_name = b.first_name AND a.middle_name = b.middle_name);
-- RESULT: 0


-----------------------------
-- PAYOUT 3 20121222_20121228
-----------------------------
DROP TABLE `pe_member_commissions_history_20121222_20121228`;
CREATE TABLE `pe_member_commissions_history_20121222_20121228` (
  `commission_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT 0,
  `account_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `middle_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_code` int(11) DEFAULT 0,
  `quantity` int(11) DEFAULT 0,
  `amount` decimal(10,2) DEFAULT 0,
  `status` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payout_id` int(11) DEFAULT 0,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`commission_history_id`),
  KEY `member_id` (`member_id`),
  KEY `account_id` (`account_id`),
  KEY `start_date` (`start_date`,`end_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- populate using csv file 20130227_igpsm_gc_payout_per_account_20121208_20121217.csv

-- update member_id, payout_id, start_date, end_date
 UPDATE pe_member_commissions_history_20121222_20121228 a
 SET
 member_id = (SELECT member_id FROM cm_member_accounts b where a.account_id = b.account_id),
 payout_id = 3,
 start_date = '2012-12-22',
 end_date = '2012-12-28';

--check if member_ids are correct using the last_name, first_name,middle_name
UPDATE pe_member_commissions_history_20121222_20121228 a
SET a.member_id = (SELECT b.member_id FROM cm_members b WHERE a.last_name = b.last_name AND a.first_name = b.first_name AND a.middle_name = b.middle_name);
-- RESULT: 2

-----------------------------
-- PAYOUT 4 20121229_20130104
-----------------------------
DROP TABLE `pe_member_commissions_history_20121229_20130104`;
CREATE TABLE `pe_member_commissions_history_20121229_20130104` (
  `commission_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT 0,
  `account_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `middle_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_code` int(11) DEFAULT 0,
  `quantity` int(11) DEFAULT 0,
  `amount` decimal(10,2) DEFAULT 0,
  `status` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payout_id` int(11) DEFAULT 0,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`commission_history_id`),
  KEY `member_id` (`member_id`),
  KEY `account_id` (`account_id`),
  KEY `start_date` (`start_date`,`end_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- populate using csv file 20130227_igpsm_gc_payout_per_account_20121208_20121217.csv

-- update member_id, payout_id, start_date, end_date
 UPDATE pe_member_commissions_history_20121229_20130104 a
 SET
 member_id = (SELECT member_id FROM cm_member_accounts b where a.account_id = b.account_id),
 payout_id = 4,
 start_date = '2012-12-29',
 end_date = '2013-01-04';


-----------------------------
-- PAYOUT 5 20130105_20130111
-----------------------------
DROP TABLE `pe_member_commissions_history_20130105_20130111`;
CREATE TABLE `pe_member_commissions_history_20130105_20130111` (
  `commission_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT 0,
  `account_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `middle_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_code` int(11) DEFAULT 0,
  `quantity` int(11) DEFAULT 0,
  `amount` decimal(10,2) DEFAULT 0,
  `status` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payout_id` int(11) DEFAULT 0,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`commission_history_id`),
  KEY `member_id` (`member_id`),
  KEY `account_id` (`account_id`),
  KEY `start_date` (`start_date`,`end_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- populate using csv file 20130227_igpsm_gc_payout_per_account_20121208_20121217.csv

-- update member_id, payout_id, start_date, end_date
 UPDATE pe_member_commissions_history_20130105_20130111 a
 SET
 member_id = (SELECT member_id FROM cm_member_accounts b where a.account_id = b.account_id),
 payout_id = 5,
 start_date = '2013-01-05',
 end_date = '2013-01-11';

-----------------------------
-- PAYOUT 6 20130112_20130118
-----------------------------
DROP TABLE `pe_member_commissions_history_20130112_20130118`;
CREATE TABLE `pe_member_commissions_history_20130112_20130118` (
  `commission_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT 0,
  `account_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `middle_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_code` int(11) DEFAULT 0,
  `quantity` int(11) DEFAULT 0,
  `amount` decimal(10,2) DEFAULT 0,
  `status` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payout_id` int(11) DEFAULT 0,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`commission_history_id`),
  KEY `member_id` (`member_id`),
  KEY `account_id` (`account_id`),
  KEY `start_date` (`start_date`,`end_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- populate using csv file 20130227_igpsm_gc_payout_per_account_20121208_20121217.csv

-- update member_id, payout_id, start_date, end_date
 UPDATE pe_member_commissions_history_20130112_20130118 a
 SET
 member_id = (SELECT member_id FROM cm_member_accounts b where a.account_id = b.account_id),
 payout_id = 6,
 start_date = '2013-01-12',
 end_date = '2013-01-18';


-----------------------------
-- PAYOUT 7 20130119_20130125
-----------------------------
DROP TABLE `pe_member_commissions_history_20130119_20130125`;
CREATE TABLE `pe_member_commissions_history_20130119_20130125` (
  `commission_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT 0,
  `account_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `middle_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_code` int(11) DEFAULT 0,
  `quantity` int(11) DEFAULT 0,
  `amount` decimal(10,2) DEFAULT 0,
  `status` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payout_id` int(11) DEFAULT 0,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`commission_history_id`),
  KEY `member_id` (`member_id`),
  KEY `account_id` (`account_id`),
  KEY `start_date` (`start_date`,`end_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- populate using csv file 20130227_igpsm_gc_payout_per_account_20121208_20121217.csv

-- update member_id, payout_id, start_date, end_date
 UPDATE pe_member_commissions_history_20130119_20130125 a
 SET
 member_id = (SELECT member_id FROM cm_member_accounts b where a.account_id = b.account_id),
 payout_id = 7,
 start_date = '2013-01-19',
 end_date = '2013-01-25';

 
-----------------------------
-- PAYOUT 8 20130126_20130201
-----------------------------
DROP TABLE `pe_member_commissions_history_20130126_20130201`;
CREATE TABLE `pe_member_commissions_history_20130126_20130201` (
  `commission_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT 0,
  `account_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `middle_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_code` int(11) DEFAULT 0,
  `quantity` int(11) DEFAULT 0,
  `amount` decimal(10,2) DEFAULT 0,
  `status` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payout_id` int(11) DEFAULT 0,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`commission_history_id`),
  KEY `member_id` (`member_id`),
  KEY `account_id` (`account_id`),
  KEY `start_date` (`start_date`,`end_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- populate using csv file 20130227_igpsm_gc_payout_per_account_20121208_20121217.csv

-- update member_id, payout_id, start_date, end_date
 UPDATE pe_member_commissions_history_20130126_20130201 a
 SET
 member_id = (SELECT member_id FROM cm_member_accounts b where a.account_id = b.account_id),
 payout_id = 8,
 start_date = '2013-01-26',
 end_date = '2013-02-01';
 
-----------------------------
-- PAYOUT 9 20130202_20130208
-----------------------------
DROP TABLE `pe_member_commissions_history_20130202_20130208`;
CREATE TABLE `pe_member_commissions_history_20130202_20130208` (
  `commission_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT 0,
  `account_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `middle_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_code` int(11) DEFAULT 0,
  `quantity` int(11) DEFAULT 0,
  `amount` decimal(10,2) DEFAULT 0,
  `status` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payout_id` int(11) DEFAULT 0,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`commission_history_id`),
  KEY `member_id` (`member_id`),
  KEY `account_id` (`account_id`),
  KEY `start_date` (`start_date`,`end_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- populate using csv file 20130227_igpsm_gc_payout_per_account_20121208_20121217.csv

-- update member_id, payout_id, start_date, end_date
 UPDATE pe_member_commissions_history_20130202_20130208 a
 SET
 member_id = (SELECT member_id FROM cm_member_accounts b where a.account_id = b.account_id),
 payout_id = 9,
 start_date = '2013-02-02',
 end_date = '2013-02-08';

 
 -----------------------------
-- PAYOUT 10 20130209_20130215
-----------------------------
DROP TABLE `pe_member_commissions_history_20130209_20130215`;
CREATE TABLE `pe_member_commissions_history_20130209_20130215` (
  `commission_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT 0,
  `account_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `middle_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_code` int(11) DEFAULT 0,
  `quantity` int(11) DEFAULT 0,
  `amount` decimal(10,2) DEFAULT 0,
  `status` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payout_id` int(11) DEFAULT 0,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`commission_history_id`),
  KEY `member_id` (`member_id`),
  KEY `account_id` (`account_id`),
  KEY `start_date` (`start_date`,`end_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- populate using csv file 20130227_igpsm_gc_payout_per_account_20121208_20121217.csv

-- update member_id, payout_id, start_date, end_date
 UPDATE pe_member_commissions_history_20130209_20130215 a
 SET
 member_id = (SELECT member_id FROM cm_member_accounts b where a.account_id = b.account_id),
 payout_id = 10,
 start_date = '2013-02-09',
 end_date = '2013-02-15';

 
 