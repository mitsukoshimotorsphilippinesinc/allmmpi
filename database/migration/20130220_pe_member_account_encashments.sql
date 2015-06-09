CREATE TABLE `pe_member_account_commissions_history` (
  `account_commission_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `payout_id` int(10) unsigned NOT NULL DEFAULT '0',
  `payout_type` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `account_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gross` decimal(10,2) DEFAULT '0.00',
  `witholding_tax` decimal(10,2) DEFAULT '0.00',
  `net_of_tax` decimal(10,2) DEFAULT '0.00',
  `balance` decimal(10,2) DEFAULT '0.00',
  `total` decimal(10,2) DEFAULT '0.00',
  `cash_card` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `account_status` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `commission_status` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `remarks` text COLLATE utf8_unicode_ci,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`account_commission_history_id`),
  KEY `member_id` (`member_id`),
  KEY `account_id` (`account_id`),
  KEY `start_date` (`start_date`),
  KEY `end_date` (`end_date`),
  KEY `start_end_date` (`start_date`,`end_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


select count(*) from pe_member_account_commissions_history;
select * from pe_member_account_commissions_history order by 1 desc limit 5;
--1-790
update `pe_member_account_commissions_history` set payout_id = 1, payout_type = 'IGPSM', commission_status = 'PROCESSED', start_date = '2012-12-08', end_date = '2012-12-17' where account_commission_history_id between 1 and 790;
update pe_member_account_commissions_history a set a.member_id = (select member_id from cm_member_accounts b where b.account_id = a.account_id) where a.account_commission_history_id between 1 and 790;
--791-1184
update `pe_member_account_commissions_history` set payout_id = 2, payout_type = 'IGPSM', commission_status = 'PROCESSED', start_date = '2012-12-18', end_date = '2012-12-21' where account_commission_history_id between 791 and 1184;
update pe_member_account_commissions_history a set a.member_id = (select member_id from cm_member_accounts b where b.account_id = a.account_id) where a.account_commission_history_id between 791 and 1184;
--374
--1185-1558
update `pe_member_account_commissions_history` set payout_id = 3, payout_type = 'IGPSM', commission_status = 'PROCESSED', start_date = '2012-12-22', end_date = '2012-12-28' where account_commission_history_id between 1185 and 1558;
update pe_member_account_commissions_history a set a.member_id = (select member_id from cm_member_accounts b where b.account_id = a.account_id) where a.account_commission_history_id between 1185 and 1558;
--695
--1559-2253
update `pe_member_account_commissions_history` set payout_id = 4, payout_type = 'IGPSM', commission_status = 'PROCESSED', start_date = '2012-12-29', end_date = '2013-01-04' where account_commission_history_id between 1559 and 2253;
update pe_member_account_commissions_history a set a.member_id = (select member_id from cm_member_accounts b where b.account_id = a.account_id) where a.account_commission_history_id between 1559 and 2253;
--582
--2254-2835
update `pe_member_account_commissions_history` set payout_id = 5, payout_type = 'IGPSM', commission_status = 'PROCESSED', start_date = '2013-01-05', end_date = '2013-01-11' where account_commission_history_id between 2254 and 2835;
update pe_member_account_commissions_history a set a.member_id = (select member_id from cm_member_accounts b where b.account_id = a.account_id) where a.account_commission_history_id between 2254 and 2835;
--670
--2836-3505
update `pe_member_account_commissions_history` set payout_id = 6, payout_type = 'IGPSM', commission_status = 'PROCESSED', start_date = '2013-01-12', end_date = '2013-01-18' where account_commission_history_id between 2836 and 3505;
update pe_member_account_commissions_history a set a.member_id = (select member_id from cm_member_accounts b where b.account_id = a.account_id) where a.account_commission_history_id between 2836 and 3505;
--703
--3506-4208
update `pe_member_account_commissions_history` set payout_id = 7, payout_type = 'IGPSM', commission_status = 'PROCESSED', start_date = '2013-01-19', end_date = '2013-01-25' where account_commission_history_id between 3506 and 4208;
update pe_member_account_commissions_history a set a.member_id = (select member_id from cm_member_accounts b where b.account_id = a.account_id) where a.account_commission_history_id between 3506 and 4208;
--730
--4209-4938
update `pe_member_account_commissions_history` set payout_id = 8, payout_type = 'IGPSM', commission_status = 'PROCESSED', start_date = '2013-01-26', end_date = '2013-02-01' where account_commission_history_id between 4209 and 4938;
update pe_member_account_commissions_history a set a.member_id = (select member_id from cm_member_accounts b where b.account_id = a.account_id) where a.account_commission_history_id between 4209 and 4938;
--977
--4939-5915
update `pe_member_account_commissions_history` set payout_id = 9, payout_type = 'IGPSM', commission_status = 'PROCESSED', start_date = '2013-02-02', end_date = '2013-02-08' where account_commission_history_id between 4939 and 5915;
update pe_member_account_commissions_history a set a.member_id = (select member_id from cm_member_accounts b where b.account_id = a.account_id) where a.account_commission_history_id between 4939 and 5915;
