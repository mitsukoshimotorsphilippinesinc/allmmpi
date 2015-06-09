
DROP TABLE IF EXISTS `tr_member_acct_credit_logs`;
CREATE TABLE `tr_member_acct_credit_logs` (
  `credit_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `account_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `card_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from_account_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_code` INT NOT NULL DEFAULT 0,
  `type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `remarks` text COLLATE utf8_unicode_ci,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`credit_log_id`),
  KEY `member_id` (`member_id`),
  KEY `account_id` (`account_id`),
  KEY `card_id` (`card_id`),
  KEY `transaction_code` (`transaction_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table tr_member_acct_debit_points_logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tr_member_acct_debit_logs`;
CREATE TABLE `tr_member_acct_debit_logs` (
  `debit_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `account_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `card_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_code` INT NOT NULL DEFAULT 0,
  `type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `remarks` text COLLATE utf8_unicode_ci,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`debit_log_id`),
  KEY `member_id` (`member_id`),
  KEY `card_id` (`card_id`),
  KEY `account_id` (`account_id`),
  KEY `transaction_code` (`transaction_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;





-- DROP CREATE tmp_rs_comm

DROP TABLE IF EXISTS tmp_tran_commission;
CREATE TABLE tmp_tran_commission(
	account_id VARCHAR(32),
	card_id VARCHAR(32),
	from_account_id VARCHAR(32),
	tran_type INT,
	amount DECIMAL(10,2),
	insert_timestamp TIMESTAMP,
	KEY (account_id),
	KEY (account_id,tran_type),
	KEY (account_id,tran_type,insert_timestamp),
	KEY (insert_timestamp)
);

INSERT INTO tmp_tran_commission (account_id,card_id,from_account_id,tran_type,amount,insert_timestamp) (
SELECT
	tran_toaccountid as account_id,
	tran_prodid as card_id,	
	tran_prodid as from_account_id,	
	CASE 
		WHEN tran_type = 2 AND tran_amount = 0 THEN 777
		WHEN tran_type = 3 AND tran_amount = 0 THEN 888
		WHEN tran_type = 9  AND tran_amount = 0 THEN 999
		ELSE tran_type
	END AS tran_type,
	CASE 
		WHEN (tran_type = 2 OR tran_type = 9)  AND tran_amount = 0 THEN 1000
		WHEN tran_type = 3 AND tran_amount = 0 THEN 2000
		ELSE ((tran_amount*10)/9) 
	END AS amount,
	tran_date AS insert_timestamp
FROM
	tran_commission
WHERE
	tran_type IN (1,2,3,9)
);


-- DROP CREATE tmp_rs_comm

DROP TABLE IF EXISTS tmp_rs_comm;
CREATE TABLE tmp_rs_comm(
	account_id VARCHAR(32),
	card_id VARCHAR(32),
	from_account_id VARCHAR(32),
	amount DECIMAL(10,2),
	insert_timestamp TIMESTAMP,
	KEY (account_id),
	KEY (account_id,insert_timestamp)
);

INSERT INTO tmp_rs_comm (account_id,card_id,from_account_id,amount,insert_timestamp) (
SELECT
	to_accountid as account_id,
	product_id as card_id,
	fr_accountid as from_acount_id,
	amount,
	tran_date AS insert_timestamp
FROM
	rs_comm
);


	

INSERT INTO tr_member_acct_credit_logs (member_id,account_id,card_id,from_account_id,transaction_code,amount,type,remarks,insert_timestamp)	 
(SELECT
	b.member_id, 
	a.account_id,
	a.card_id,
	a.from_account_id,
	CASE 
		WHEN a.tran_type = 1 THEN 100
		WHEN a.tran_type = 2 THEN 101
		WHEN a.tran_type = 3 THEN 102
		WHEN a.tran_type = 9 THEN 104
		WHEN a.tran_type = 777 THEN 106
		WHEN a.tran_type = 888 THEN 107
		WHEN a.tran_type = 999 THEN 109
	END AS transaction_code,
	a.amount,
	CASE
		WHEN a.tran_type IN (1,2,3,9) THEN 'FUNDS'
		WHEN a.tran_type IN (777,888,999) THEN 'GC'
	END AS type,
	CASE 
		WHEN a.tran_type = 1 THEN CONCAT('Credited Referral Bonus from ',a.card_id)
		WHEN a.tran_type = 2 THEN CONCAT('Credit SP pairing bonus from ',a.card_id)
		WHEN a.tran_type = 3 THEN CONCAT('Credit VP pairing bonus from ',a.card_id)
		WHEN a.tran_type = 9 THEN CONCAT('Credit RS pairing bonus from ',a.card_id)
		WHEN a.tran_type = 777 THEN CONCAT('Credit gift cheque for fifth pair from ',a.card_id)
		WHEN a.tran_type = 888 THEN CONCAT('Credit gift cheque for fifth pair from ',a.card_id)
		WHEN a.tran_type = 999 THEN CONCAT('Credit gift cheque for fifth pair from ',a.card_id)
	END AS remarks,
	a.insert_timestamp
FROM
	tmp_tran_commission a
LEFT JOIN
	cm_member_accounts b ON a.account_id = b.account_id
WHERE
	a.insert_timestamp>'2008-01-01'
);


INSERT INTO tr_member_acct_credit_logs (member_id,account_id,card_id,from_account_id,transaction_code,amount,type,remarks,insert_timestamp)	
(SELECT
	b.member_id, 
	a.account_id,
	a.card_id,
	a.from_account_id,
	105 AS transaction_code,
	a.amount,
	'FUNDS' AS type,	
	CONCAT('Credit repeat sales unilevel commission from ',card_id) AS remarks,
	a.insert_timestamp
FROM
	tmp_rs_comm a
LEFT JOIN
	cm_member_accounts b ON a.account_id = b.account_id
WHERE
	a.amount > 0
AND
	a.insert_timestamp>'2008-01-01'
);

--

DROP TABLE IF EXISTS tmp_tr_member_acct_credit_logs;
CREATE TABLE tmp_tr_member_acct_credit_logs(
	account_id VARCHAR(32),
	transaction_code INT,
	amount DECIMAL(10,2),
	KEY(account_id),
	KEY(transaction_code),
	KEY (account_id,transaction_code)
);

INSERT INTO tmp_tr_member_acct_credit_logs (account_id,transaction_code,amount) (SELECT account_id, transaction_code, SUM(amount) AS amount  FROM tr_member_acct_credit_logs WHERE insert_timestamp > '2008-01-01' GROUP BY account_id,transaction_code);

--

UPDATE cm_member_earnings a SET referral_bonus = (SELECT SUM(amount) FROM tmp_tr_member_acct_credit_logs b WHERE a.account_id = b.account_id AND transaction_code = 100 GROUP BY account_id,transaction_code);
UPDATE cm_member_earnings a SET pairing_bonus_sp = (SELECT SUM(amount) FROM tmp_tr_member_acct_credit_logs b WHERE a.account_id = b.account_id AND transaction_code = 101 GROUP BY account_id,transaction_code);
UPDATE cm_member_earnings a SET pairing_bonus_vp = (SELECT SUM(amount) FROM tmp_tr_member_acct_credit_logs b WHERE a.account_id = b.account_id AND transaction_code = 102 GROUP BY account_id,transaction_code);
UPDATE cm_member_earnings a SET pairing_bonus_tp = (SELECT SUM(amount) FROM tmp_tr_member_acct_credit_logs b WHERE a.account_id = b.account_id AND transaction_code = 103 GROUP BY account_id,transaction_code);
UPDATE cm_member_earnings a SET pairing_bonus_rs = (SELECT SUM(amount) FROM tmp_tr_member_acct_credit_logs b WHERE a.account_id = b.account_id AND transaction_code = 104 GROUP BY account_id,transaction_code);
UPDATE cm_member_earnings a SET unilevel_commission = (SELECT SUM(amount) FROM tmp_tr_member_acct_credit_logs b WHERE a.account_id = b.account_id AND transaction_code = 105 GROUP BY account_id,transaction_code);
UPDATE cm_member_earnings a SET gift_cheque_sp = (SELECT SUM(amount) FROM tmp_tr_member_acct_credit_logs b WHERE a.account_id = b.account_id AND transaction_code = 106 GROUP BY account_id,transaction_code);
UPDATE cm_member_earnings a SET gift_cheque_vp = (SELECT SUM(amount) FROM tmp_tr_member_acct_credit_logs b WHERE a.account_id = b.account_id AND transaction_code = 107 GROUP BY account_id,transaction_code);
UPDATE cm_member_earnings a SET gift_cheque_tp = (SELECT SUM(amount) FROM tmp_tr_member_acct_credit_logs b WHERE a.account_id = b.account_id AND transaction_code = 108 GROUP BY account_id,transaction_code);
UPDATE cm_member_earnings a SET gift_cheque_rs = (SELECT SUM(amount) FROM tmp_tr_member_acct_credit_logs b WHERE a.account_id = b.account_id AND transaction_code = 109 GROUP BY account_id,transaction_code);



INSERT INTO tr_member_acct_debit_logs (member_id,account_id,transaction_code,type,amount,remarks)
(SELECT
	b.member_id,
	a.account_id,
	500 as transaction_code,
	CASE WHEN a.transaction_code BETWEEN 100 AND 105 THEN 'FUNDS' ELSE 'GC'	END as type,
	SUM(a.amount) as amount,
	'Processed from the old system'
FROM
	tmp_tr_member_acct_credit_logs a
LEFT JOIN
	cm_member_accounts b ON a.account_id = b.account_id 
GROUP BY 
	a.account_id);