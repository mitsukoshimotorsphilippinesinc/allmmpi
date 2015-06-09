


--
-- DATA MIGRATIONS
--



--
-- CREATE DATABASE FROM SQL SERVER DB BACKUP
--

-- vitalc back up
-- rs master -- all rs cards
-- tran commission -- to get cd remaining balance


-- CREATE TABLE IN migrated backup db FROM sql server


-- PREPARE cm_member_ tables FOR MIGRATION

# Dump of table cm_member_accounts
# ------------------------------------------------------------

ALTER DATABASE temp_vitalc_20121101 CHARACTER SET utf8 COLLATE utf8_unicode_ci;

DROP TABLE IF EXISTS `cm_member_accounts`;
CREATE TABLE `cm_member_accounts` (
  `member_account_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `member_user_account_id` int(11) DEFAULT NULL,
  `account_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sponsor_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `upline_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_type_id` int(11) DEFAULT NULL,
  `account_status_id` int(11) DEFAULT NULL,
  `left_sp` decimal(10,2) NOT NULL DEFAULT 0,
  `right_sp` decimal(10,2) NOT NULL DEFAULT 0,
  `pairs_sp` decimal(10,2) NOT NULL DEFAULT 0,
  `gc_sp` decimal(10,2) NOT NULL DEFAULT 0, 
  `flushout_sp` decimal(10,2) NOT NULL DEFAULT 0, 
  `gc_pair_ctr_sp` decimal(10,2) NOT NULL DEFAULT 0,
  `left_vp` decimal(10,2) NOT NULL DEFAULT 0,
  `right_vp` decimal(10,2) NOT NULL DEFAULT 0,
  `pairs_vp` decimal(10,2) NOT NULL DEFAULT 0,
  `gc_vp` decimal(10,2) NOT NULL DEFAULT 0, 
  `flushout_vp` decimal(10,2) NOT NULL DEFAULT 0, 
  `gc_pair_ctr_vp` decimal(10,2) NOT NULL DEFAULT 0,
  `left_rs` decimal(10,2)  NOT NULL DEFAULT 0,
  `right_rs` decimal(10,2)  NOT NULL DEFAULT 0,
  `pairs_rs` decimal(10,2)  NOT NULL DEFAULT 0,
  `gc_rs` decimal(10,2) NOT NULL DEFAULT 0, 
  `flushout_rs` decimal(10,2) NOT NULL DEFAULT 0, 
  `gc_pair_ctr_rs` decimal(10,2) NOT NULL DEFAULT 0,
  `node_address` text COLLATE utf8_unicode_ci,
  `uni_node` text COLLATE utf8_unicode_ci,
  `monthly_maintenance_ctr` INT NOT NULL DEFAULT 0,
  `annual_maintenance_ctr` INT NOT NULL DEFAULT 0,
  `cd_amount` DECIMAL(10,2) NOT NULL DEFAULT 0,
  `node_type` VARCHAR(100) NULL,
  `update_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`member_account_id`),
  UNIQUE KEY `account_id` (`account_id`),
  KEY `member_id` (`member_id`),
  KEY `sponsor_id` (`sponsor_id`),
  KEY `upline_id` (`upline_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
DROP TABLE IF EXISTS `cm_member_accounts_history`;
CREATE TABLE `cm_member_accounts_history` (
  history_id INT AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `account_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_type_id` int(11) DEFAULT NULL,
  `account_status_id` int(11) DEFAULT NULL,
  `left_sp` decimal(10,2) NOT NULL DEFAULT 0,
  `right_sp` decimal(10,2) NOT NULL DEFAULT 0,
  `pairs_sp` decimal(10,2) NOT NULL DEFAULT 0,
  `gc_sp` decimal(10,2) NOT NULL DEFAULT 0, 
  `flushout_sp` decimal(10,2) NOT NULL DEFAULT 0, 
  `gc_pair_ctr_sp` decimal(10,2) NOT NULL DEFAULT 0,
  `left_vp` decimal(10,2) NOT NULL DEFAULT 0,
  `right_vp` decimal(10,2) NOT NULL DEFAULT 0,
  `pairs_vp` decimal(10,2) NOT NULL DEFAULT 0,
  `gc_vp` decimal(10,2) NOT NULL DEFAULT 0, 
  `flushout_vp` decimal(10,2) NOT NULL DEFAULT 0, 
  `gc_pair_ctr_vp` decimal(10,2) NOT NULL DEFAULT 0,
  `left_rs` decimal(10,2)  NOT NULL DEFAULT 0,
  `right_rs` decimal(10,2)  NOT NULL DEFAULT 0,
  `pairs_rs` decimal(10,2)  NOT NULL DEFAULT 0,
  `gc_rs` decimal(10,2) NOT NULL DEFAULT 0, 
  `flushout_rs` decimal(10,2) NOT NULL DEFAULT 0, 
  `gc_pair_ctr_rs` decimal(10,2) NOT NULL DEFAULT 0,
  `monthly_maintenance_ctr` INT NOT NULL DEFAULT 0,
  `annual_maintenance_ctr` INT NOT NULL DEFAULT 0,
  `cd_amount` DECIMAL(10,2) NOT NULL DEFAULT 0,
  `node_type` VARCHAR(100) NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`history_id`),
  KEY `member_id` (`member_id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



--

DROP TABLE IF EXISTS cm_member_payouts;
CREATE TABLE cm_member_payouts(
	payout_id INT AUTO_INCREMENT,
	member_id INT,
	account_id VARCHAR(64) DEFAULT NULL,
	transaction_code INT,
	amount DECIMAL(10,2),
	status VARCHAR(32) NOT NULL DEFAULT 'PENDING', 
	start_date DATE,
	end_date DATE,
	insert_timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (payout_id),
	KEY (member_id),
	KEY (account_id),
	KEY (start_date,end_date,status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


--
DROP TABLE IF EXISTS cm_member_earnings;
CREATE TABLE cm_member_earnings(
	earning_id INT AUTO_INCREMENT,
	member_id INT,
	account_id VARCHAR(64) DEFAULT NULL,
	referral_bonus DECIMAL(10,2) NOT NULL DEFAULT 0,
	pairing_bonus_sp DECIMAL(10,2) NOT NULL DEFAULT 0,
	gift_cheque_sp DECIMAL(10,2) NOT NULL DEFAULT 0,
	pairing_bonus_vp DECIMAL(10,2) NOT NULL DEFAULT 0,
	gift_cheque_vp DECIMAL(10,2) NOT NULL DEFAULT 0,
	pairing_bonus_tp DECIMAL(10,2) NOT NULL DEFAULT 0,
	gift_cheque_tp DECIMAL(10,2) NOT NULL DEFAULT 0,
	pairing_bonus_rs DECIMAL(10,2) NOT NULL DEFAULT 0,
	gift_cheque_rs DECIMAL(10,2) NOT NULL DEFAULT 0,
	unilevel_commission DECIMAL(10,2) NOT NULL DEFAULT 0,
	PRIMARY KEY (earning_id),
	KEY (member_id),
	KEY (account_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table 
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cm_member_user_accounts`;
CREATE TABLE cm_member_user_accounts (
  `member_user_account_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `primary_account_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login_hash` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`member_user_account_id`),
  KEY `member_id` (`member_id`),
  KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table cm_members
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cm_members`;

CREATE TABLE `cm_members` (
  `member_id` int(11) NOT NULL AUTO_INCREMENT,
  `last_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `middle_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `secondary_email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile_number` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `secondary_mobile_number` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_filename` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `home_address` text COLLATE utf8_unicode_ci,
  `home_address_street` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `home_address_city` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `home_address_province` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `home_address_country` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `home_address_zip_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `sex` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nationality` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `marital_status` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tin` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `beneficiary1` text COLLATE utf8_unicode_ci,
  `beneficiary2` text COLLATE utf8_unicode_ci,
  `service_depot` INT, 
  `id_number` VARCHAR(64) NULL, 
  `rf_id` VARCHAR( 20 ) NULL,
  `metrobank_paycard_number` VARCHAR( 20 ) NULL,
  `group_id` INT NULL, 
  `group_name` VARCHAR(100) NULL,
  `is_email_verified` TINYINT( 1 ) NOT NULL DEFAULT '0',
  `is_auto_payout` TINYINT( 1 ) NOT NULL DEFAULT '1',
  `funds` DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  `gift_cheques` DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  `session_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `update_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `completed_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`member_id`),
  KEY `last_name` (`last_name`),
  KEY `first_name` (`first_name`),
  KEY `middle_name` (`middle_name`),
  KEY `email` (`email`),
  KEY (service_depot),
  KEY (rf_id),
  KEY (metrobank_paycard_number),
  KEY (id_number),
  KEY (home_address_country)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



-- Create rs card and sp cards table

DROP TABLE IF EXISTS is_rs_cards;
CREATE TABLE IF NOT EXISTS is_rs_cards(
	rs_card_id INT AUTO_INCREMENT,
	card_id VARCHAR(64),
	card_code VARCHAR(64),
	status VARCHAR(64) NOT NULL DEFAULT 'INACTIVE',
	type VARCHAR(64),	
	member_id INT NOT NULL DEFAULT 0,
	released_to VARCHAR(100),
	issued_to VARCHAR(100),
	user_id INT NOT NULL DEFAULT 0,
	used_timestamp TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',	
	released_timestamp TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',	
	issued_timestamp TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',	
	activate_timestamp TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
	insert_timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (rs_card_id),
	KEY (card_id),
	KEY (card_code),
	KEY (member_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS is_sp_cards;
CREATE TABLE IF NOT EXISTS is_sp_cards(
	sp_card_id INT AUTO_INCREMENT,
	card_id VARCHAR(64),
	card_code VARCHAR(64),
	status VARCHAR(64) NOT NULL DEFAULT 'INACTIVE',
	type VARCHAR(64),	
	member_id INT NOT NULL DEFAULT 0,
	released_to VARCHAR(100),
	issued_to VARCHAR(100),
	user_id INT NOT NULL DEFAULT 0,
	used_timestamp TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',	
	released_timestamp TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',	
	issued_timestamp TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',	
	activate_timestamp TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
	insert_timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (sp_card_id),
	KEY (card_id),
	KEY (card_code),
	KEY (member_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--

DROP TABLE IF EXISTS tr_member_acct_credit_logs;
CREATE TABLE tr_member_acct_credit_logs (
  credit_log_id int(11) NOT NULL AUTO_INCREMENT,
  member_id int(11) DEFAULT NULL,
  account_id varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  card_id varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  from_account_id varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  transaction_code INT NOT NULL DEFAULT 0,
  type varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  amount decimal(10,2) DEFAULT NULL,
  remarks text COLLATE utf8_unicode_ci,
  insert_timestamp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (credit_log_id),
  KEY member_id (member_id),
  KEY account_id (account_id),
  KEY card_id (card_id),
  KEY transaction_code (transaction_code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



DROP TABLE IF EXISTS tr_member_acct_debit_logs;
CREATE TABLE tr_member_acct_debit_logs (
  debit_log_id int(11) NOT NULL AUTO_INCREMENT,
  member_id int(11) DEFAULT NULL,
  account_id varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  card_id varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  transaction_code INT NOT NULL DEFAULT 0,
  type varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  amount decimal(10,2) DEFAULT NULL,
  remarks text COLLATE utf8_unicode_ci,
  insert_timestamp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (debit_log_id),
  KEY member_id (member_id),
  KEY card_id (card_id),
  KEY account_id (account_id),
  KEY transaction_code (transaction_code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



-- 14

-- SET TEMPORARY TABLE

DROP TABLE IF EXISTS tmp_cm_members;
CREATE TABLE tmp_cm_members AS
SELECT 
	lastname,
	firstname,
	midname,	
	sex,
	bday_month,
	bday_day,
	bday_year,
	civil_status,
	(SELECT UPPER(country_name) FROM country_master WHERE country_master.country_id = user_info.country) as country,
	province AS service_depot,
	(SELECT UPPER(prov_name) FROM province_master WHERE province_master.prov_id = user_info.province) as province, 
	address,
	tel_num,
	mob_num,
	email,
	tin,
	beneficiary
FROM
	user_info
GROUP BY 
	UPPER(CONCAT(lastname,',',firstname,' ',SUBSTR(midname,1,1)));

-- ADD KEYS

INSERT INTO cm_members (last_name,first_name,middle_name,email,mobile_number,home_address,home_address_province,home_address_country,birthdate,sex,marital_status,tin,beneficiary1,service_depot) 
(SELECT lastname,firstname,midname,email,mob_num,address,province,country,CONCAT(bday_year,'-',bday_month,'-',bday_day),sex,civil_status,tin,beneficiary,service_depot FROM tmp_cm_members);

DROP TABLE IF EXISTS tmp_cm_member_names;
CREATE TABLE IF NOT EXISTS tmp_cm_member_names (
	member_id INT,
	last_name VARCHAR(100),
	first_name VARCHAR(100),
	middle_name VARCHAR(100),
	PRIMARY KEY (member_id),
	KEY (last_name,first_name,middle_name)
);

INSERT INTO tmp_cm_member_names (member_id,last_name,first_name,middle_name) (SELECT member_id,UPPER(last_name),UPPER(first_name),UPPER(middle_name) FROM cm_members);

-- UPDATE user_INFO to SET MEMBER ID

-- ADD ALTER TABLE TO ADD ADDITIONAL COLUMN IF COLUMN DOES NOT EXISTS


ALTER TABLE user_info ADD COLUMN member_id INT NOT NULL DEFAULT 0 AFTER midname;

-- ADD KEYS TO USER INFO

ALTER TABLE user_info ADD KEY (member_id);

UPDATE user_info SET member_id = (SELECT member_id FROM tmp_cm_member_names WHERE tmp_cm_member_names.last_name=UPPER(user_info.lastname) AND tmp_cm_member_names.first_name=UPPER(user_info.firstname) AND tmp_cm_member_names.middle_name=UPPER(user_info.midname) LIMIT 1);


-- 21

-- UPDATE  to add all unique usernames
-- ALTER TABLE user_accounts ADD KEY (username);

INSERT INTO cm_member_user_accounts (username,member_id,password) (SELECT b.username,a.member_id,md5(UPPER(b.password)) FROM user_info a LEFT JOIN user_accounts b ON a.username=b.username GROUP BY username);

-- UPDATE all passwords that are null to 123456

UPDATE cm_member_user_accounts SET password = md5('123456') WHERE password IS NULL;


-- UPDATE cm_member_accounts SET WHERE user_info.member_id = 0;

UPDATE user_info b SET b.member_id = (SELECT a.member_id FROM tmp_cm_member_names a WHERE a.last_name = b.lastname AND a.first_name=b.firstname AND SUBSTR(a.middle_name,1,1)=SUBSTR(b.midname,1,1) ) WHERE member_id = 0;
UPDATE cm_member_user_accounts a SET member_id=(SELECT member_id FROM user_info b WHERE a.username=b.username) WHERE member_id = 0;
UPDATE cm_member_accounts a SET member_id = (SELECT member_id FROM cm_member_user_accounts b WHERE a.member_user_account_id = b.member_user_account_id) WHERE member_id = 0;


-- UPDATE ALL accnt_status_master 


DROP TABLE IF EXISTS accnt_status_master;
CREATE TABLE accnt_status_master (
  accnt_status_id int(11) NOT NULL,
  accnt_status_name varchar(2) NOT NULL,
  description text,
  new_value int(11) DEFAULT NULL,
  PRIMARY KEY (accnt_status_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO accnt_status_master (accnt_status_id, accnt_status_name, description, new_value)
VALUES
	(0,'IA','Inactive',0),
	(1,'CD','Commission Deduct',4),
	(2,'FS','Free Slot',5),
	(3,'SP','Regular (Starter Pack)',1),
	(4,'VP','Value Pack',2),
	(5,'FR','?',0),
	(6,'TP','Trial Pack',3),
	(7,'UP','Ultimate Pack',6),
	(8,'PP','Premium Pack',7);

-- ALTER user_utility ADD KEY

-- ALTER TABLE user_utility ADD KEY (accountid);

-- INSERT user_status to cm_member_accounts

INSERT INTO cm_member_accounts (member_id,member_user_account_id,account_id,sponsor_id,upline_id,account_type_id,account_status_id,left_sp,right_sp,pairs_sp,gc_pair_ctr_sp,left_rs,right_rs,pairs_rs,gc_pair_ctr_rs,left_vp,right_vp,pairs_vp,gc_pair_ctr_vp,node_address,uni_node,update_timestamp,insert_timestamp,node_type)
(SELECT
	b.member_id,
	b.member_user_account_id,
 	a.accountid,
	a.sponsorid,
	a.uplineid,
	c.new_value,
	CASE WHEN d.accnt_status='A' THEN 1 ELSE 2 END AS account_status,
	a.left_ppv,
	a.right_ppv,
	a.pair_cnt,
	MOD(d.pair_ibsp,5) AS gc_pair_ctr_sp,
	a.left_ppv_rs,
	a.right_ppv_rs,
	a.pair_cnt_rs,
	MOD(d.pair_irs,5) AS gc_pair_ctr_rs,
	a.left_ppv_mf,
	a.right_ppv_mf,
	a.pair_cnt_mf,
	MOD(d.pair_ivp,5) AS gc_pair_ctr_vp,
	REPLACE(a.node,'.',''),
	REPLACE(REPLACE(a.uni_node,'.00','.'),'.0','.'),
	a.dateRegistered,
	a.date_completed,
	CASE 
		WHEN d.cash_card = 'UNCLAIMED' THEN 'UNCLAIMED'
		WHEN d.cash_card = 'CORPO' THEN 'CORPO'
		WHEN d.cash_card = 'HOLD' THEN 'HOLD'
		ELSE 'REGULAR'
	END AS node_type
FROM 
	user_status a
LEFT JOIN
	user_utility d ON a.accountid = d.accountid
LEFT JOIN
	 cm_member_user_accounts b ON a.username = b.username
LEFT JOIN 
	accnt_status_master c ON a.accnt_status=c.accnt_status_id);


-- UPDATE cd_amount

-- ONLY GET tran_amount < 0 AND tran_type = 10 as commission deduct amount
-- ONLY GET tran_type 1,2,3, and 9 for commissions to be deducted to transaction amount

-- 27

DROP TABLE IF EXISTS tmp_cm_member_account_cd_amount;
CREATE TABLE tmp_cm_member_account_cd_amount AS
SELECT
	tran_toaccountid AS account_id,
	CASE 
		WHEN tran_type = 10 AND tran_amount<0
		THEN ABS(tran_amount) 
		ELSE 0
	END AS cd_amount,
	CASE 
		WHEN tran_type IN (1,2,3,9)
		THEN tran_amount 
		ELSE 0
	END AS commission_amount,
	tran_date AS insert_timestamp	
FROM
	tran_commission
ORDER BY account_id;

ALTER TABLE tmp_cm_member_account_cd_amount ADD KEY (account_id);

DROP TABLE IF EXISTS tmp_cm_member_account_cd_amount2;
CREATE TABLE tmp_cm_member_account_cd_amount2 AS 
SELECT
	account_id, SUM(commission_amount) AS commission_amount, SUM(cd_amount) AS cd_amount
FROM 
	tmp_cm_member_account_cd_amount
GROUP BY account_id;

ALTER TABLE tmp_cm_member_account_cd_amount2 ADD KEY (account_id);

DROP TABLE IF EXISTS tmp_cm_member_account_cd_amount3;
CREATE TABLE tmp_cm_member_account_cd_amount3 AS 
SELECT
	account_id,
	commission_amount,
	cd_amount,
	cd_amount - commission_amount AS cd_remaining_balance		
FROM 
	tmp_cm_member_account_cd_amount2
WHERE
	(cd_amount - commission_amount)>0;

ALTER TABLE tmp_cm_member_account_cd_amount3 ADD KEY (account_id);

-- UPDATE cm_member_accounts cd_amount

UPDATE cm_member_accounts SET cd_amount = (SELECT cd_remaining_balance FROM tmp_cm_member_account_cd_amount3 WHERE tmp_cm_member_account_cd_amount3.account_id = cm_member_accounts.account_id) WHERE account_id IN (SELECT account_id FROM tmp_cm_member_account_cd_amount3);

-- UPDATE PRIMARY ACCOUNT

UPDATE cm_member_user_accounts SET primary_account_id = (SELECT account_id FROM cm_member_accounts WHERE cm_member_accounts.member_id = cm_member_user_accounts.member_id ORDER BY insert_timestamp DESC LIMIT 1);

UPDATE cm_member_user_accounts SET email = (SELECT email FROM cm_members WHERE cm_members.member_id = cm_member_user_accounts.member_id LIMIT 1);

-- CREATE cm_member_groups based on 
DROP TABLE IF EXISTS cm_groups;
--
--
DROP TABLE IF EXISTS `cm_member_groups`;

CREATE TABLE `cm_member_groups` (
  `member_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `group_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_leader_member_id` int(11) NOT NULL DEFAULT '0',
  `group_leader` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `node_address` text COLLATE utf8_unicode_ci,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`member_group_id`),
  KEY `group_id` (`group_id`),
  KEY `group_name` (`group_name`),
  KEY `group_leader_member_id` (`group_leader_member_id`),
  KEY `group_leader` (`group_leader`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO `cm_member_groups` (`member_group_id`, `group_id`, `group_name`, `group_leader_member_id`, `group_leader`, `node_address`, `insert_timestamp`)
VALUES
	(1,NULL,NULL,0,'Karina Laurente','11111122','2012-10-31 12:27:09'),
	(2,18,'GOLDVINE',0,'Florentino Garcia','111111111','2012-10-31 12:27:09'),
	(3,12,'DAVAO EAGLES',0,'Davao','111111112','2012-10-31 12:27:09'),
	(4,NULL,NULL,0,'Rosa Reyes','1222222222','2012-10-31 12:27:09'),
	(5,8,'MILLIONAIRES IN ACTION',0,'Baby Eden Nagrampa','1222222221','2012-10-31 12:27:09'),
	(6,7,'RAVEN',0,'Karim Group','11111112222','2012-10-31 12:27:09'),
	(7,17,'RAVEN DAVAO',0,'Manuel Torrejon','11111112221','2012-10-31 12:27:09'),
	(8,17,'RAVEN DAVAO',0,'Melanie Torrejon','11111112221122','2012-10-31 12:27:09'),
	(9,17,'RAVEN DAVAO',0,'Joselito Balunan','11111112221211','2012-10-31 12:27:09'),
	(10,12,'DAVAO EAGLES',0,'Marc T. Boo','1222222211111111','2012-10-31 12:27:09'),
	(11,1,'HI-ENERGY',0,'Manny Cultura','122222221122222222','2012-10-31 12:27:09'),
	(12,12,'DAVAO EAGLES',0,'Gil Oña','122222221111111112','2012-10-31 12:27:09'),
	(13,19,'VITAL ACHIEVERS',0,'Jhufel Sarno 1','111111111111121111','2012-10-31 12:27:09'),
	(14,NULL,NULL,0,'Fel & Meann','122222221122222221','2012-10-31 12:27:09'),
	(15,7,'RAVEN',0,'Rodel Domingo','111111122222222222','2012-10-31 12:27:09'),
	(16,19,'VITAL ACHIEVERS',0,'Jhufel Sarno 2','111111111111121112','2012-10-31 12:27:09'),
	(17,5,'PROSPERITY TEAM',0,'Mercylita Aguilar 1','122222222222222221','2012-10-31 12:27:09'),
	(18,3,'SPARTANS',0,'Jazon Merjilla','1222222211111111112','2012-10-31 12:27:09'),
	(19,5,'PROSPERITY TEAM',0,'Nono Arellano','1222222222111111111','2012-10-31 12:27:09'),
	(20,5,'PROSPERITY TEAM',0,'Romy Nuyana','1222222222111111112','2012-10-31 12:27:09'),
	(21,8,'MILLIONAIRES IN ACTION',0,'Sam Enriquez','1222222221111122222','2012-10-31 12:27:09'),
	(22,6,'KING EAGLES',0,'Patrick','1222222212222222221','2012-10-31 12:27:09'),
	(23,9,'ACE GROUP',0,'Marlo Sison','1222222211111111111','2012-10-31 12:27:09'),
	(24,20,'ONLINE TEAM',0,'Gires Alo Jr.','1111111111111211111','2012-10-31 12:27:09'),
	(25,5,'PROSPERITY TEAM',0,'Mercylita Aguilar 2','1222222222222222212','2012-10-31 12:27:09'),
	(26,5,'PROSPERITY TEAM',0,'Reynaldo Aguilar 1','1222222222222222211','2012-10-31 12:27:09'),
	(27,8,'MILLIONAIRES IN ACTION',0,'Ana La Rosa','12222222212222221221','2012-10-31 12:27:09'),
	(28,9,'ACE GROUP',0,'Eliza Sison','12222222111111111111','2012-10-31 12:27:09'),
	(29,20,'ONLINE TEAM',0,'Roberto Medina','11111111111112111111','2012-10-31 12:27:09'),
	(30,12,'DAVAO EAGLES',0,'ZDP','12222222111111112221','2012-10-31 12:27:09'),
	(31,5,'PROSPERITY TEAM',0,'Reynaldo Aguilar 2','12222222222222222112','2012-10-31 12:27:09'),
	(32,4,'WILL OF FORTUNE',0,'Willy Balasta','122222221111111111211','2012-10-31 12:27:09'),
	(33,21,'SKYSCRAPERS',0,'Eddie Mahilum','111111111111121112212','2012-10-31 12:27:09'),
	(34,20,'ONLINE TEAM',0,'Adonis Montero','111111111111121111111','2012-10-31 12:27:09'),
	(35,20,'ONLINE TEAM',0,'Filomena Felicilda','111111111111121111112','2012-10-31 12:27:09'),
	(36,5,'PROSPERITY TEAM',0,'Imelda Milanbilen','122222222222222221222','2012-10-31 12:27:09'),
	(37,5,'PROSPERITY TEAM',0,'Theresa Atendido','122222222222222221111','2012-10-31 12:27:09'),
	(38,5,'PROSPERITY TEAM',0,'Abdon Zoleta','122222222222222221122','2012-10-31 12:27:09'),
	(39,12,'DAVAO EAGLES',0,'Roger Laguna','1222222211111111222222','2012-10-31 12:27:09'),
	(40,12,'DAVAO EAGLES',0,'Carina de Guzman','1222222211111111122222','2012-10-31 12:27:09'),
	(41,3,'SPARTANS',0,'Aimy Orpeza','1222222211111111112211','2012-10-31 12:27:09'),
	(42,18,'GOLDVINE',0,'Henry Yu','11111111111112221121212','2012-10-31 12:27:09'),
	(43,18,'GOLDVINE',0,'BriNel Corpo','11111111111112111221212','2012-10-31 12:27:09'),
	(44,18,'GOLDVINE',0,'Marcelo Engcot','11111111111112121212222','2012-10-31 12:27:09'),
	(45,4,'WILL OF FORTUNE',0,'Brenda Malacas','12222222111111111121112','2012-10-31 12:27:09'),
	(46,1,'HI-ENERGY',0,'Jess Nuite','122222221122222222211112','2012-10-31 12:27:09'),
	(47,5,'PROSPERITY TEAM',0,'Armando Guidote','122222222211111111212222','2012-10-31 12:27:09'),
	(48,23,'UNIFIED GROUP',0,'Dale Renacia','111111111111121112212222','2012-10-31 12:27:09'),
	(49,12,'DAVAO EAGLES',0,'Franco Palacio (ALLIANCE)','122222221111111122222221','2012-10-31 12:27:09'),
	(50,23,'UNIFIED GROUP',0,'Susan Renacia 9','111111111111121122211111','2012-10-31 12:27:09'),
	(51,1,'HI-ENERGY',0,'Elpidio Canimo','1222222211222222222222211','2012-10-31 12:27:09'),
	(52,1,'HI-ENERGY',0,'The Empire','1222222211222222222222222','2012-10-31 12:27:09'),
	(53,21,'SKYSCRAPERS',0,'Nelson Judal 2','1111111111111211122121211','2012-10-31 12:27:09'),
	(54,22,'QCI GROUP',0,'Brilliantino Fabros III (under Eddie Mahilum) [QCI]','1111111111111211122121221','2012-10-31 12:27:09'),
	(55,13,'INFINITY',0,'Peng Ocampo','12222222111111112222222221','2012-10-31 12:27:09'),
	(56,1,'HI-ENERGY',0,'Mike Tan','12222222112222222221111122','2012-10-31 12:27:09'),
	(57,1,'HI-ENERGY',0,'Malou Distor','12222222112222222222222221','2012-10-31 12:27:09'),
	(58,3,'SPARTANS',0,'Spartans','12222222111111111122222211','2012-10-31 12:27:09'),
	(59,1,'HI-ENERGY',0,'Divina Maruya','12222222112222222221111211','2012-10-31 12:27:09'),
	(60,15,'DYNAMIC',0,'Marjorie Candog','12222222111111112222222212','2012-10-31 12:27:09'),
	(61,22,'QCI GROUP',0,'Roy Palma (new)','11111111111112111221211222','2012-10-31 12:27:09'),
	(62,12,'DAVAO EAGLES',0,'Nenita Mausic','12222222111111112222222222','2012-10-31 12:27:09'),
	(63,22,'QCI GROUP',0,'Roy Palma (old)','11111111111112112221112222','2012-10-31 12:27:09'),
	(64,10,'DREAM TEAM ALLIANCE',0,'Ariel Cacho','11111122222221111212222222','2012-10-31 12:27:09'),
	(65,3,'SPARTANS',0,'Danilo Servano','12222222111111111122111211','2012-10-31 12:27:09'),
	(66,14,'BLUE WARRIORS',0,'Andres Mondreza Jr.','122222221111111122222222222','2012-10-31 12:27:09'),
	(67,1,'HI-ENERGY',0,'Bernie Galang','122222221122222222222222222','2012-10-31 12:27:09'),
	(68,1,'HI-ENERGY',0,'Lucy Ramos','122222221122222222222222221','2012-10-31 12:27:09'),
	(69,3,'SPARTANS',0,'Alpha Spartans','122222221111111111222222112','2012-10-31 12:27:09'),
	(70,4,'WILL OF FORTUNE',0,'Francia Balasta','122222221111111111211112222','2012-10-31 12:27:09'),
	(71,22,'QCI GROUP',0,'Ronilo Oflas','111111111111121112211222222','2012-10-31 12:27:09'),
	(72,23,'UNIFIED GROUP',0,'Susan Renacia 1','111111111111121112212222111','2012-10-31 12:27:09'),
	(73,23,'UNIFIED GROUP',0,'Susan Renacia 2','111111111111121112212222121','2012-10-31 12:27:09'),
	(74,6,'KING EAGLES',0,'Charles Mundo','1222222212222222221122212122','2012-10-31 12:27:09'),
	(75,20,'ONLINE TEAM',0,'Janebeth Alo','1111111111111211111221222222','2012-10-31 12:27:09'),
	(76,21,'SKYSCRAPERS',0,'Nelson Judal 3','1111111111111211122222222211','2012-10-31 12:27:09'),
	(77,12,'DAVAO EAGLES',0,'Perly Edilo','1222222211111111222222212221','2012-10-31 12:27:09'),
	(78,3,'SPARTANS',0,'Francis Cyril Espino','1222222211111111112222221122','2012-10-31 12:27:09'),
	(79,3,'SPARTANS',0,'Celso Dava','1222222211111111112222221121','2012-10-31 12:27:09'),
	(80,3,'SPARTANS',0,'Alma Pangilinan','1222222211111111112212122222','2012-10-31 12:27:09'),
	(81,12,'DAVAO EAGLES',0,'Ryan Jubahib','1222222211111111222222211111','2012-10-31 12:27:09'),
	(82,1,'HI-ENERGY',0,'Dexter Diano','12222222112222222221111122112','2012-10-31 12:27:09'),
	(83,1,'HI-ENERGY',0,'Daniel Barrion','12222222112222222221111122122','2012-10-31 12:27:09'),
	(84,4,'WILL OF FORTUNE',0,'Oseas Robles','12222222111111111121112212121','2012-10-31 12:27:09'),
	(85,23,'UNIFIED GROUP',0,'Susan Renacia 8','11111111111112111221222222121','2012-10-31 12:27:09'),
	(86,1,'HI-ENERGY',0,'Malou Mariano','122222221122222222222221222212','2012-10-31 12:27:09'),
	(87,5,'PROSPERITY TEAM',0,'Charlene Villapaz','122222222211111111212222211222','2012-10-31 12:27:09'),
	(88,6,'KING EAGLES',0,'Juanito Solamo','122222221222222222112221212212','2012-10-31 12:27:09'),
	(89,1,'HI-ENERGY',0,'Jun Alba','122222221122222222211112222222','2012-10-31 12:27:09'),
	(90,1,'HI-ENERGY',0,'Ryan Fernandez','122222221122222222211112111111','2012-10-31 12:27:09'),
	(91,22,'QCI GROUP',0,'Brilliantino Fabros III 1 (right line of Roy Palma)','111111111111121112212112221111','2012-10-31 12:27:09'),
	(92,22,'QCI GROUP',0,'Brilliantino Fabros III 2 (left line of Roy Palma)','111111111111121112212112222211','2012-10-31 12:27:09'),
	(93,14,'BLUE WARRIORS',0,'Carol Legacion','122222221111111122222222222221','2012-10-31 12:27:09'),
	(94,20,'ONLINE TEAM',0,'CPMPC','111111111111121111112212222222','2012-10-31 12:27:09'),
	(95,15,'DYNAMIC',0,'Astrid Acedo','122222221111111122222222121122','2012-10-31 12:27:09'),
	(96,4,'WILL OF FORTUNE',0,'Juliet Labisto','122222221111111111211211112212','2012-10-31 12:27:09'),
	(97,23,'UNIFIED GROUP',0,'Susan Renacia 3','111111111111121112212222212112','2012-10-31 12:27:09'),
	(98,23,'UNIFIED GROUP',0,'Susan Renacia 11','111111111111121122211122222222','2012-10-31 12:27:09'),
	(99,21,'SKYSCRAPERS',0,'Jose Chelo Ferrer 1','111111111111121112212111211222','2012-10-31 12:27:09'),
	(100,6,'KING EAGLES',0,'Rogelyn Cantoja','1222222212222222221122212122211','2012-10-31 12:27:09'),
	(101,21,'SKYSCRAPERS',0,'Jose Chelo Ferrer 5','1111111111111211222111222222222','2012-10-31 12:27:09'),
	(102,14,'BLUE WARRIORS',0,'Lilian Gilves','1222222211111111222222222222111','2012-10-31 12:27:09'),
	(103,20,'ONLINE TEAM',0,'Titus Bantiles','1111111111111211111221222222111','2012-10-31 12:27:09'),
	(104,1,'HI-ENERGY',0,'Erlinda Trinidad','1222222211222222222111112211222','2012-10-31 12:27:09'),
	(105,3,'SPARTANS',0,'Melanie Cabico','1222222211111111112222221121211','2012-10-31 12:27:09'),
	(106,3,'SPARTANS',0,'Celso Dava 2','1222222211111111112222221111121','2012-10-31 12:27:09'),
	(107,12,'DAVAO EAGLES',0,'Gloria Sarmiento','1222222211111111222222212221112','2012-10-31 12:27:09'),
	(108,22,'QCI GROUP',0,'Roberto Roque 2','1111111111111211122121221222222','2012-10-31 12:27:09'),
	(109,23,'UNIFIED GROUP',0,'Susan Renacia 7','1111111111111211122122222211112','2012-10-31 12:27:09'),
	(110,3,'SPARTANS',0,'JANITH SARIO','1222222211111111112211121122222','2012-10-31 12:27:09'),
	(111,5,'PROSPERITY TEAM',0,'Ritchel Ligan','12222222221111111112222222121112','2012-10-31 12:27:09'),
	(112,21,'SKYSCRAPERS',0,'Nelson Judal 1','11111111111112111221211222111111','2012-10-31 12:27:09'),
	(113,13,'INFINITY',0,'Paquito Bitang','12222222111111112222222221221112','2012-10-31 12:27:09'),
	(114,13,'INFINITY',0,'Jaime Luis Doromal','12222222111111112222222221221121','2012-10-31 12:27:09'),
	(115,13,'INFINITY',0,'Alvin Esperil 1','12222222111111112222222221221122','2012-10-31 12:27:09'),
	(116,15,'DYNAMIC',0,'Alberto Genise','12222222111111112222222212111111','2012-10-31 12:27:09'),
	(117,1,'HI-ENERGY',0,'Cesar Barela','12222222112222222221111122112112','2012-10-31 12:27:09'),
	(118,1,'HI-ENERGY',0,'Mayson Vidal 1','12222222112222222221111122222121','2012-10-31 12:27:09'),
	(119,13,'INFINITY',0,'Teresita Parreño','12222222111111112222222221221222','2012-10-31 12:27:09'),
	(120,14,'BLUE WARRIORS',0,'Imelda Chavez 2','12222222111111112222222222211111','2012-10-31 12:27:09'),
	(121,22,'QCI GROUP',0,'Estrella Macatumbas 2','11111111111112111221211222222211','2012-10-31 12:27:09'),
	(122,13,'INFINITY',0,'Merla Cabusas 1','122222221111111122222222212212121','2012-10-31 12:27:09'),
	(123,13,'INFINITY',0,'El Marie Estigoy','122222221111111122222222212211211','2012-10-31 12:27:09'),
	(124,3,'SPARTANS',0,'Marlo Guanzon 1','122222221111111111221112112222211','2012-10-31 12:27:09'),
	(125,12,'DAVAO EAGLES',0,'Ronald Dalumpines','122222221111111122222221111122222','2012-10-31 12:27:09'),
	(126,22,'QCI GROUP',0,'Enrique Abella 2','111111111111121112212112222222111','2012-10-31 12:27:09'),
	(127,23,'UNIFIED GROUP',0,'Susan Renacia 10','111111111111121122211122221111111','2012-10-31 12:27:09'),
	(128,21,'SKYSCRAPERS',0,'Jose Chelo Ferrer 2','111111111111121112212112222211111','2012-10-31 12:27:09'),
	(129,1,'HI-ENERGY',0,'Jess Baay','1222222211222222222111112222222221','2012-10-31 12:27:09'),
	(130,14,'BLUE WARRIORS',0,'Eubert Serondo','1222222211111111222222222222122222','2012-10-31 12:27:09'),
	(131,13,'INFINITY',0,'Merla Cabusas 2','1222222211111111222222222122121221','2012-10-31 12:27:09'),
	(132,3,'SPARTANS',0,'SUZETH SUAZO','1222222211111111112211121112222211','2012-10-31 12:27:09'),
	(133,14,'BLUE WARRIORS',0,'Melchor Maique','12222222111111112222222222221222222','2012-10-31 12:27:09'),
	(134,22,'QCI GROUP',0,'Francis Ramayla','11111111111112111221212211122222122','2012-10-31 12:27:09'),
	(135,14,'BLUE WARRIORS',0,'Andres Manlapus','12222222111111112222222222212222222','2012-10-31 12:27:09'),
	(136,15,'DYNAMIC',0,'Danilo Balana Jr.','12222222111111112222222212222211111','2012-10-31 12:27:09'),
	(137,4,'WILL OF FORTUNE',0,'Melinda Miranda','12222222111111111121121111222111111','2012-10-31 12:27:09'),
	(138,22,'QCI GROUP',0,'QCI Cebu','11111111111112111221211222221111112','2012-10-31 12:27:09'),
	(139,23,'UNIFIED GROUP',0,'Virginia Russel 1','11111111111112111221222222111121121','2012-10-31 12:27:09'),
	(140,23,'UNIFIED GROUP',0,'Virginia Russel 2','11111111111112111221222222111121122','2012-10-31 12:27:09'),
	(141,13,'INFINITY',0,'Perry Bersaluna','12222222111111112222222221221121112','2012-10-31 12:27:09'),
	(142,13,'INFINITY',0,'Jan Wenzel Ocampo 5','12222222111111112222222221221222111','2012-10-31 12:27:09'),
	(143,13,'INFINITY',0,'Peter Salvador','12222222111111112222222221221221221','2012-10-31 12:27:09'),
	(144,23,'UNIFIED GROUP',0,'Gemma Pelit 1','11111111111112111221222221221212211','2012-10-31 12:27:09'),
	(145,23,'UNIFIED GROUP',0,'Susan Renacia 4','11111111111112111221222222111111111','2012-10-31 12:27:09'),
	(146,23,'UNIFIED GROUP',0,'Susan Renacia 5','11111111111112111221222222111111112','2012-10-31 12:27:09'),
	(147,23,'UNIFIED GROUP',0,'Susan Renacia 6','11111111111112111221222222111111122','2012-10-31 12:27:09'),
	(148,12,'DAVAO EAGLES',0,'Gladys Glenda Patriarca','12222222111111112222222222122222222','2012-10-31 12:27:09'),
	(149,3,'SPARTANS',0,'ERROL ZAMORA','12222222111111111122111211222222222','2012-10-31 12:27:09'),
	(150,1,'HI-ENERGY',0,'Francisco Negrido','122222221122222222211111222222222211','2012-10-31 12:27:09'),
	(151,14,'BLUE WARRIORS',0,'Cecile Abacial','122222221111111122222222222111112222','2012-10-31 12:27:09'),
	(152,15,'DYNAMIC',0,'John Paul Celdran','122222221111111122222222122221111121','2012-10-31 12:27:09'),
	(153,13,'INFINITY',0,'Charmaine Uy-Ocampo 3','122222221111111122222222212212212222','2012-10-31 12:27:09'),
	(154,13,'INFINITY',0,'Alvin Esperil 2','122222221111111122222222212212111121','2012-10-31 12:27:09'),
	(155,13,'INFINITY',0,'Alvin Esperil 3','122222221111111122222222212212111122','2012-10-31 12:27:09'),
	(156,14,'BLUE WARRIORS',0,'Christian Carrol Legacion 1','122222221111111122222222222221121211','2012-10-31 12:27:09'),
	(157,1,'HI-ENERGY',0,'Myrna Devera','122222221122222222211111221121221222','2012-10-31 12:27:09'),
	(158,13,'INFINITY',0,'Jan Wenzel Ocampo 1','122222221111111122222222212211122221','2012-10-31 12:27:09'),
	(159,23,'UNIFIED GROUP',0,'Norminda Badayos 1','111111111111121112212222212212122111','2012-10-31 12:27:09'),
	(160,14,'BLUE WARRIORS',0,'Wayne Gutual Jr. 1','122222221111111122222222222211121111','2012-10-31 12:27:09'),
	(161,14,'BLUE WARRIORS',0,'Christian Carrol Legacion 2','1222222211111111222222222222211212222','2012-10-31 12:27:09'),
	(162,3,'SPARTANS',0,'Juanito Cajes','1222222211111111112222221111121111111','2012-10-31 12:27:09'),
	(163,13,'INFINITY',0,'John Ady Solis','1222222211111111222222222122112122121','2012-10-31 12:27:09'),
	(164,13,'INFINITY',0,'Jan Wenzel Ocampo 2','1222222211111111222222222122112112211','2012-10-31 12:27:09'),
	(165,14,'BLUE WARRIORS',0,'Wayne Gutual Jr. 2','1222222211111111222222222222122222222','2012-10-31 12:27:09'),
	(166,5,'PROSPERITY TEAM',0,'Jojo Poblador','12222222222222222222222222111222222222','2012-10-31 12:27:09'),
	(167,23,'UNIFIED GROUP',0,'Vivian Hernandez','11111111111112111221222211111111222122','2012-10-31 12:27:09'),
	(168,23,'UNIFIED GROUP',0,'Verna Gonzales','11111111111112111221222222121112112122','2012-10-31 12:27:09'),
	(169,22,'QCI GROUP',0,'Richard Bukiron 1 (under Eddie Mahilum) [QCI]','11111111111112111221212212222221222111','2012-10-31 12:27:09'),
	(170,14,'BLUE WARRIORS',0,'Bryan Biol (right of Andres Mondreza)','12222222111111112222222222211111122222','2012-10-31 12:27:09'),
	(171,14,'BLUE WARRIORS',0,'Bryan Biol (left of Andres Mondreza)','12222222111111112222222222221212111112','2012-10-31 12:27:09'),
	(172,13,'INFINITY',0,'Charmaine Uy-Ocampo 1','12222222111111112222222221221121122222','2012-10-31 12:27:09'),
	(173,13,'INFINITY',0,'Charmaine Uy-Ocampo 2','12222222111111112222222221221122222222','2012-10-31 12:27:09'),
	(174,13,'INFINITY',0,'Pablito Samson','12222222111111112222222221221212212211','2012-10-31 12:27:09'),
	(175,1,'HI-ENERGY',0,'Efren Satorre','12222222112222222221111122112112112121','2012-10-31 12:27:09'),
	(176,1,'HI-ENERGY',0,'Mayson Vidal 2','12222222112222222221111222222111111211','2012-10-31 12:27:09'),
	(177,3,'SPARTANS',0,'Ana Faelangco','12222222111111111122222211111211111111','2012-10-31 12:27:09'),
	(178,3,'SPARTANS',0,'Marlo Guanzon 2','12222222111111111122111211222221211111','2012-10-31 12:27:09'),
	(179,6,'KING EAGLES',0,'Elizabeth Flores','12222222122222222211222121221222222221','2012-10-31 12:27:09'),
	(180,14,'BLUE WARRIORS',0,'Imelda Chavez 1','12222222111111112222222111221212111111','2012-10-31 12:27:09'),
	(181,22,'QCI GROUP',0,'Estrella Macatumbas 1','11111111111112111221211222111111111211','2012-10-31 12:27:09'),
	(182,23,'UNIFIED GROUP',0,'Gemma Pelit 2','11111111111112111221222222121211222211','2012-10-31 12:27:09'),
	(183,22,'QCI GROUP',0,'Richard Bukiron (under Roy Palma old account)','111111111111121122211122222222221111122','2012-10-31 12:27:09'),
	(184,23,'UNIFIED GROUP',0,'Oliva Fuentes','111111111111121112212222221111211222112','2012-10-31 12:27:09'),
	(185,1,'HI-ENERGY',0,'Filipina Pascual','122222221122222222211111221121122211111','2012-10-31 12:27:09'),
	(186,1,'HI-ENERGY',0,'Nicpar Pamor','122222221122222222211111222222222211122','2012-10-31 12:27:09'),
	(187,3,'SPARTANS',0,'Marlo Guanzon 3','122222221111111111221112112222212222222','2012-10-31 12:27:09'),
	(188,13,'INFINITY',0,'Princess Belgira','122222221111111122222222212211211111112','2012-10-31 12:27:09'),
	(189,13,'INFINITY',0,'Jan Wenzel Ocampo 3','122222221111111122222222212211211222222','2012-10-31 12:27:09'),
	(190,14,'BLUE WARRIORS',0,'Roselito Maligro','122222221111111122222222222211122222222','2012-10-31 12:27:09'),
	(191,22,'QCI GROUP',0,'Richard Bukiron 2 (under Eddie Mahilum) [QCI]','1111111111111211122121221222222212212222','2012-10-31 12:27:09'),
	(192,13,'INFINITY',0,'Riza Marie Daungcay','1222222211111111222222222122121111222222','2012-10-31 12:27:09'),
	(193,14,'BLUE WARRIORS',0,'Dhora Embajadora','1222222211111111222222222222122222121121','2012-10-31 12:27:09'),
	(194,1,'HI-ENERGY',0,'Perpetua Datul','1222222211222222222111112211211222211211','2012-10-31 12:27:09'),
	(195,23,'UNIFIED GROUP',0,'Norminda Badayos 2','1111111111111211122122222212121122221121','2012-10-31 12:27:09'),
	(196,22,'QCI GROUP',0,'Gino Anthony Calvo 2','1111111111111211222111222211111111222222','2012-10-31 12:27:09'),
	(197,23,'UNIFIED GROUP',0,'Elvin Englisa','11111111111112111221222211111111222122112','2012-10-31 12:27:09'),
	(198,1,'HI-ENERGY',0,'Ludivina Galano','12222222112222222221111122112112222112111','2012-10-31 12:27:09'),
	(199,13,'INFINITY',0,'Jan Wenzel Ocampo 4','12222222111111112222222221221122222222211','2012-10-31 12:27:09'),
	(200,22,'QCI GROUP',0,'Elizabeth Tai','111111111111121112212112221111111112112222','2012-10-31 12:27:09'),
	(201,13,'INFINITY',0,'Mary Jane Anillo 1','122222221111111122222222212212122122112121','2012-10-31 12:27:09'),
	(202,1,'HI-ENERGY',0,'Gemma Oh','122222221122222222211111221121122221121111','2012-10-31 12:27:09'),
	(203,13,'INFINITY',0,'Luisa Toto','122222221111111122222222212212111122222211','2012-10-31 12:27:09'),
	(204,14,'BLUE WARRIORS',0,'Angel Rosello','122222221111111122222222222111111222221122','2012-10-31 12:27:09'),
	(205,14,'BLUE WARRIORS',0,'Zaldy Castillon','122222221111111122222222222122222221111122','2012-10-31 12:27:09'),
	(206,21,'SKYSCRAPERS',0,'Jose Chelo Ferrer 3','111111111111121112212121112222122222211222','2012-10-31 12:27:09'),
	(207,13,'INFINITY',0,'Hans Dumar','1222222211111111222222222122111222212112112','2012-10-31 12:27:09'),
	(208,13,'INFINITY',0,'Mary Jane Anillo 2','1222222211111111222222222122121221221121221','2012-10-31 12:27:09'),
	(209,14,'BLUE WARRIORS',0,'Elmer Yepez','1222222211111111222222222221111122222111111','2012-10-31 12:27:09'),
	(210,14,'BLUE WARRIORS',0,'Robert Tan','12222222111111112222222222222112122222222211','2012-10-31 12:27:09'),
	(211,1,'HI-ENERGY',0,'Raquel Abad','12222222112222222221111122222222221112221212','2012-10-31 12:27:09'),
	(212,12,'DAVAO EAGLES',0,'Genevieve Macasilhig','12222222111111112222222222122222222112121212','2012-10-31 12:27:09'),
	(213,14,'BLUE WARRIORS',0,'June Ford Salig','122222221111111122222222222212222222212111122','2012-10-31 12:27:09'),
	(214,14,'BLUE WARRIORS',0,'Moctar Abdulgani','122222221111111122222222222212222222222222222','2012-10-31 12:27:09'),
	(215,23,'UNIFIED GROUP',0,'Toscanini Rose De Jesus','111111111111121112212222111111112221222221212','2012-10-31 12:27:09'),
	(216,13,'INFINITY',0,'Sitti Jane Abastillas','122222221111111122222222212212111122222222221','2012-10-31 12:27:09'),
	(217,1,'HI-ENERGY',0,'PMRC','122222221122222222211111221122211222222221111','2012-10-31 12:27:09'),
	(218,13,'INFINITY',0,'Kathryn Fe Dumar 2','122222221111111122222222212211122221211211222','2012-10-31 12:27:09'),
	(219,13,'INFINITY',0,'Noel Catungal','122222221111111122222222212211122221211211212','2012-10-31 12:27:09'),
	(220,14,'BLUE WARRIORS',0,'Daryl Mislang','1222222211111111222222222222211212222122221222','2012-10-31 12:27:09'),
	(221,4,'WILL OF FORTUNE',0,'Bonifacio Tangonan','1222222211111111112112111122211111111111211122','2012-10-31 12:27:09'),
	(222,13,'INFINITY',0,'Manuel Cartagena','1222222211111111222222222122111222212112112221','2012-10-31 12:27:09'),
	(223,13,'INFINITY',0,'Erwin & Yvonne Dadis','1222222211111111222222222122121111222112222212','2012-10-31 12:27:09'),
	(224,23,'UNIFIED GROUP',0,'Celsa Rodrigo 3','1111111111111211122122221111111122212222212121','2012-10-31 12:27:09'),
	(225,23,'UNIFIED GROUP',0,'Virginio Zamoras','111111111111121112212222111111112221221121111222','2012-10-31 12:27:09'),
	(226,1,'HI-ENERGY',0,'Catherine Cortes','122222221122222222211111222221211122122222222222','2012-10-31 12:27:09'),
	(227,13,'INFINITY',0,'Kathryn Fe Dumar 1','122222221111111122222222212211122221211211211212','2012-10-31 12:27:09'),
	(228,23,'UNIFIED GROUP',0,'Myra Gamboa','1111111111111211122122221111111122212221121211222','2012-10-31 12:27:09'),
	(229,21,'SKYSCRAPERS',0,'Jose Chelo Ferrer 4','1111111111111211222111222211111111222222121112122','2012-10-31 12:27:09'),
	(230,23,'UNIFIED GROUP',0,'Lovely Robillos','1111111111111211122122222211112112211111211111222','2012-10-31 12:27:09'),
	(231,23,'UNIFIED GROUP',0,'Maria Eden Cagulada','1111111111111211122122221111111122212221122122222','2012-10-31 12:27:09'),
	(232,23,'UNIFIED GROUP',0,'Nelyn Gomez','1111111111111211122122221111111122212211211112222','2012-10-31 12:27:09'),
	(233,12,'DAVAO EAGLES',0,'Mario Madero','1222222211111111222222222212222222212121122121222','2012-10-31 12:27:09'),
	(234,13,'INFINITY',0,'Darwin Cambangay','1222222211111111222222222122121111222212121212122','2012-10-31 12:27:09'),
	(235,12,'DAVAO EAGLES',0,'Rogelio Tocmo','1222222211111111222222222221222222211111222211111','2012-10-31 12:27:09'),
	(236,23,'UNIFIED GROUP',0,'Jesse George Robillos 2','11111111111112111221222222111121122111112111112222','2012-10-31 12:27:09'),
	(237,14,'BLUE WARRIORS',0,'Maria Luisa Rebarbas','12222222111111112222222222222112122221222211111111','2012-10-31 12:27:09'),
	(238,13,'INFINITY',0,'Gregorio Jover','12222222111111112222222221221112222121121121111212','2012-10-31 12:27:09'),
	(239,23,'UNIFIED GROUP',0,'Grace Fua 1','11111111111112111221222211111111222122211212112211','2012-10-31 12:27:09'),
	(240,23,'UNIFIED GROUP',0,'Grace Fua 2','11111111111112111221222211111111222122211212112212','2012-10-31 12:27:09'),
	(241,14,'BLUE WARRIORS',0,'Lilian Gilves 2','122222221111111122222222222212222222222222222222222','2012-10-31 12:27:09'),
	(242,23,'UNIFIED GROUP',0,'Celsa Rodrigo 2','111111111111121112212222111111112221222211111222222','2012-10-31 12:27:09'),
	(243,13,'INFINITY',0,'Aldwin Bautista','1222222211111111222222222122121111222222222222122221','2012-10-31 12:27:09'),
	(244,23,'UNIFIED GROUP',0,'Celsa Rodrigo 1','1111111111111211122122221111111122212222111112222211','2012-10-31 12:27:09'),
	(245,22,'QCI GROUP',0,'Enrique Abella 1','1111111111111211122121122211111111121111221221221222','2012-10-31 12:27:09'),
	(246,23,'UNIFIED GROUP',0,'Jesse George Robillos 1','11111111111112111221222222111121122111112111112221221','2012-10-31 12:27:09'),
	(247,23,'UNIFIED GROUP',0,'Grace Manatad','11111111111112111221222211111111222122112221211222112','2012-10-31 12:27:09'),
	(248,23,'UNIFIED GROUP',0,'Maria Fe Lepaopao','111111111111121112212222111111112221221122212112222222','2012-10-31 12:27:09'),
	(249,1,'HI-ENERGY',0,'Raymund Tuvera','122222221122222222211111222222222211122222122111111221','2012-10-31 12:27:09'),
	(250,23,'UNIFIED GROUP',0,'Magdalena De Jesus','1111111111111211122122221111111122212222212121211112212','2012-10-31 12:27:09'),
	(251,23,'UNIFIED GROUP',0,'Jonjon Labis','1111111111111211122122221111111122212211212221212211212','2012-10-31 12:27:09'),
	(252,13,'INFINITY',0,'Enrique Llorente','1222222211111111222222222122112112222221222222221211222','2012-10-31 12:27:09'),
	(253,22,'QCI GROUP',0,'Richard Bukiron (under Roy Palma new account)','11111111111112111221211222111111111211222221211121222222','2012-10-31 12:27:09'),
	(254,1,'HI-ENERGY',0,'Leon Bucago','12222222112222222221111122222222221112222212212222121111','2012-10-31 12:27:09'),
	(255,12,'DAVAO EAGLES',0,'Churchil Cordero','12222222111111112222222222122222222121211221212222212222','2012-10-31 12:27:09'),
	(256,1,'HI-ENERGY',0,'Armando Regala','122222221122222222211111222221211122122222222222222221222','2012-10-31 12:27:09'),
	(257,22,'QCI GROUP',0,'Gino Anthony Calvo 1','111111111111121112212122111222221222221121111211112222222','2012-10-31 12:27:09'),
	(258,23,'UNIFIED GROUP',0,'Carmelita Agan','111111111111121112212222111111112221221121111222211122122','2012-10-31 12:27:09'),
	(259,23,'UNIFIED GROUP',0,'Corazon Mendoza','1111111111111211122122221111111122212211211112222121211212','2012-10-31 12:27:09'),
	(260,23,'UNIFIED GROUP',0,'Grace Fua 3','1111111111111211122122221111111122212222212121211112212121','2012-10-31 12:27:09'),
	(261,22,'QCI GROUP',0,'Roberto Roque 1','111111111111121112212122111222221222221121111211112222222222','2012-10-31 12:27:09');



# Dump of table rf_member_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rf_member_groups`;

CREATE TABLE `rf_member_groups` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`group_id`),
  KEY `group_name` (`group_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO `rf_member_groups` (`group_id`, `group_name`, `insert_timestamp`)
VALUES
	(1,'HI-ENERGY','2012-10-31 17:57:24'),
	(2,'USA','2012-10-31 17:57:24'),
	(3,'SPARTANS','2012-10-31 17:57:24'),
	(4,'WILL OF FORTUNE','2012-10-31 17:57:24'),
	(5,'PROSPERITY TEAM','2012-10-31 17:57:24'),
	(6,'KING EAGLES','2012-10-31 17:57:24'),
	(7,'RAVEN','2012-10-31 17:57:24'),
	(8,'MILLIONAIRES IN ACTION','2012-10-31 17:57:24'),
	(9,'ACE GROUP','2012-10-31 17:57:24'),
	(10,'DREAM TEAM ALLIANCE','2012-10-31 17:57:24'),
	(12,'DAVAO EAGLES','2012-10-31 17:57:24'),
	(13,'INFINITY','2012-10-31 17:57:24'),
	(14,'BLUE WARRIORS','2012-10-31 17:57:24'),
	(15,'DYNAMIC','2012-10-31 17:57:24'),
	(16,'MINDANAO CORPO','2012-10-31 17:57:24'),
	(17,'RAVEN DAVAO','2012-10-31 17:57:24'),
	(18,'GOLDVINE','2012-10-31 17:57:24'),
	(19,'VITAL ACHIEVERS','2012-10-31 17:57:24'),
	(20,'ONLINE TEAM','2012-10-31 17:57:24'),
	(21,'SKYSCRAPERS','2012-10-31 17:57:24'),
	(22,'QCI GROUP','2012-10-31 17:57:24'),
	(23,'UNIFIED GROUP','2012-10-31 17:57:24');


-- INSERT INTO cm_member_earnings TABLE
INSERT INTO cm_member_earnings (member_id,account_id)
(SELECT
	member_id,
	account_id
FROM
	cm_member_accounts);

-- TODO: UPDATE cm_members types, if EPC, Stockists etc;

-- MIGRATE RS AND SP CARDS

-- rs_master to is_rs_cards

INSERT INTO is_rs_cards (card_id,card_code,status,type,member_id,issued_to,user_id,used_timestamp,released_timestamp,activate_timestamp)
(SELECT
	rs_prodid AS card_id,
	rs_control AS card_code,
	CASE 
		WHEN rs_status='U' THEN 'USED' 
		WHEN rs_status='A' THEN 'ACTIVE' 
		WHEN rs_status='I' THEN 'INACTIVE' 
		WHEN rs_status='X' THEN 'INVALID' 
	END AS `status`,
 	rs_type AS type,
	0 AS member_id,
	rs_issuedto AS issued_to,
	1 AS user_id,
	rs_date_used AS used_timestamp,
	rs_date_released AS released_timestamp,
	rs_date_activated AS activate_timestamp
FROM
	rs_master);

-- pp_master to is_sp_cards

INSERT INTO is_sp_cards (card_id,card_code,status,type,member_id,issued_to,user_id,used_timestamp,released_timestamp,activate_timestamp)
(SELECT
	pp_prodid AS card_id,
	pp_bprn AS card_code,
	CASE 
		WHEN pp_status='U' THEN 'USED' 
		WHEN pp_status='A' THEN 'ACTIVE' 
		WHEN pp_status='I' THEN 'INACTIVE' 
		WHEN pp_status='X' THEN 'INVALID' 
	END AS `status`,
	CASE
		WHEN pp_type = 'RG' THEN 'SP'
		WHEN pp_type = 'MF' THEN 'VP'
		ELSE pp_type		
	END AS type,
	(SELECT member_id FROM cm_member_accounts WHERE cm_member_accounts.account_id = pp_master.pp_prodid ) AS member_id,
	pp_issuedto AS issued_to,
	1 AS user_id,
	pp_date_used AS used_timestamp,	
	pp_date_released AS released_timestamp,
	pp_date_activated AS activate_timestamp
FROM
	pp_master);



-- UPDATE cm_member group names based on cm_member_groups

DROP TABLE IF EXISTS tmp_cm_member_member_accounts;
CREATE TABLE tmp_cm_member_member_accounts AS
SELECT 
	member_id,
	last_name,first_name,middle_name,
	(SELECT account_id FROM cm_member_accounts WHERE cm_member_accounts.member_id = cm_members.member_id ORDER BY insert_timestamp ASC LIMIT 1) as primary_account_id
FROM
	cm_members;

ALTER TABLE tmp_cm_member_member_accounts ADD KEY (primary_account_id);
ALTER TABLE tmp_cm_member_member_accounts ADD KEY (member_id);
ALTER TABLE tmp_cm_member_member_accounts ADD COLUMN node_address TEXT;
ALTER TABLE tmp_cm_member_member_accounts ADD COLUMN group_id INT NULL;
ALTER TABLE tmp_cm_member_member_accounts ADD COLUMN group_name VARCHAR(100);
ALTER TABLE tmp_cm_member_member_accounts COLLATE utf8_unicode_ci;


UPDATE tmp_cm_member_member_accounts SET node_address = (SELECT node_address FROM cm_member_accounts WHERE cm_member_accounts.account_id=tmp_cm_member_member_accounts.primary_account_id);


UPDATE tmp_cm_member_member_accounts SET group_id = (SELECT group_id FROM cm_member_groups WHERE tmp_cm_member_member_accounts.node_address LIKE CONCAT(cm_member_groups.node_address,'%') ORDER BY node_address DESC LIMIT 1);

UPDATE tmp_cm_member_member_accounts SET group_name = (SELECT group_name FROM rf_member_groups WHERE rf_member_groups.group_id=tmp_cm_member_member_accounts.group_id LIMIT 1);

UPDATE cm_members SET group_id = (SELECT group_id FROM tmp_cm_member_member_accounts WHERE tmp_cm_member_member_accounts.member_id = cm_members.member_id);

UPDATE cm_members SET group_name = (SELECT group_name FROM tmp_cm_member_member_accounts WHERE tmp_cm_member_member_accounts.member_id = cm_members.member_id);


-- UPDATE epc members

-- UPDATE tmp_epc_members a SET new_member_id = (SELECT member_id FROM cm_members b WHERE CONCAT(b.first_name,' ',b.last_name)=a.owner LIMIT 1) WHERE new_member_id IS NULL;


-- TRUNCATE cm_member_types;
-- INSERT INTO cm_member_types (member_id,member_type_id,is_active) (SELECT DISTINCT(new_member_id),2,1 FROM tmp_epc_members WHERE new_member_id IS NOT NULL);



-- RUN THE SQL SCRIPT BELOW TO FIX THE VITAL C COMPANY ACCOUNTS
-- first_name last_name

UPDATE cm_member_accounts SET account_status_id = 3 WHERE member_id IN (SELECT member_id FROM cm_members WHERE (first_name='COMPANY' AND last_name='ACCOUNT') OR (first_name='ORTIGAS I' AND last_name='CORPO') OR  (first_name='PROSPERITY' AND last_name='TEAM') OR (first_name='HEALTH' AND last_name='THE WORLD')); 