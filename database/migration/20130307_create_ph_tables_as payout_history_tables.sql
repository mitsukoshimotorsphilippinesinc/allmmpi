--20121208_20121217
--20121218_20121221
--20121222_20121228
--20121229_20131204
--
--20130105_20130111
--20130112_20130118
--20130119_20130125
--20130126_20130201
--
--20130202_20130208
--20130209_20130215
--20130216_20130222
--20130223_20130301


-- 20121208_20121217
CREATE TABLE `ph_member_commissions_20121208_20121217` (
     `commission_id` INT(11) NOT NULL AUTO_INCREMENT,
     `member_id` INT(11) NULL DEFAULT '0',
     `account_id` VARCHAR(32) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
     `account_status_id` INT(11) UNSIGNED NOT NULL DEFAULT '0',
     `transaction_code` INT(11) NULL DEFAULT NULL,
     `amount` DECIMAL(10,2) NULL DEFAULT NULL,     
     `payout_id` INT(11) NULL DEFAULT NULL,
     `start_date` DATE NULL DEFAULT NULL,
     `end_date` DATE NULL DEFAULT NULL,
     `insert_timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
     PRIMARY KEY (`commission_id`),
     INDEX `member_id` (`member_id`),
     INDEX `account_id` (`account_id`),
     INDEX `start_date` (`start_date`, `end_date`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;

INSERT INTO `ph_member_commissions_20121208_20121217` 
(select
     commission_history_id,
     member_id,
     account_id,
     (CASE WHEN status = 'ACTIVE' THEN 1 WHEN status = 'INACTIVE' THEN 2 WHEN status = 'COMPANY' THEN 3 ELSE 0 END) AS account_status_id,
     transaction_code,
     amount,
     payout_id,
     start_date,
     end_date,
     insert_timestamp
from
`pe_member_commissions_history_20121208_20121217`); 

-- 20121222_20121228
CREATE TABLE `ph_member_commissions_20121218_20121221` (
     `commission_id` INT(11) NOT NULL AUTO_INCREMENT,
     `member_id` INT(11) NULL DEFAULT '0',
     `account_id` VARCHAR(32) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
     `account_status_id` INT(11) UNSIGNED NOT NULL DEFAULT '0',
     `transaction_code` INT(11) NULL DEFAULT NULL,
     `amount` DECIMAL(10,2) NULL DEFAULT NULL,     
     `payout_id` INT(11) NULL DEFAULT NULL,
     `start_date` DATE NULL DEFAULT NULL,
     `end_date` DATE NULL DEFAULT NULL,
     `insert_timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
     PRIMARY KEY (`commission_id`),
     INDEX `member_id` (`member_id`),
     INDEX `account_id` (`account_id`),
     INDEX `start_date` (`start_date`, `end_date`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;

INSERT INTO `ph_member_commissions_20121218_20121221` 
(select
     commission_history_id,
     member_id,
     account_id,
     (CASE WHEN status = 'ACTIVE' THEN 1 WHEN status = 'INACTIVE' THEN 2 WHEN status = 'COMPANY' THEN 3 ELSE 0 END) AS account_status_id,
     transaction_code,
     amount,
     payout_id,
     start_date,
     end_date,
     insert_timestamp
from
`pe_member_commissions_history_20121218_20121221`); 

-- 20121222_20121228
CREATE TABLE `ph_member_commissions_20121222_20121228` (
     `commission_id` INT(11) NOT NULL AUTO_INCREMENT,
     `member_id` INT(11) NULL DEFAULT '0',
     `account_id` VARCHAR(32) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
     `account_status_id` INT(11) UNSIGNED NOT NULL DEFAULT '0',
     `transaction_code` INT(11) NULL DEFAULT NULL,
     `amount` DECIMAL(10,2) NULL DEFAULT NULL,     
     `payout_id` INT(11) NULL DEFAULT NULL,
     `start_date` DATE NULL DEFAULT NULL,
     `end_date` DATE NULL DEFAULT NULL,
     `insert_timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
     PRIMARY KEY (`commission_id`),
     INDEX `member_id` (`member_id`),
     INDEX `account_id` (`account_id`),
     INDEX `start_date` (`start_date`, `end_date`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;

INSERT INTO `ph_member_commissions_20121222_20121228` 
(select
     commission_history_id,
     member_id,
     account_id,
     (CASE WHEN status = 'ACTIVE' THEN 1 WHEN status = 'INACTIVE' THEN 2 WHEN status = 'COMPANY' THEN 3 ELSE 0 END) AS account_status_id,
     transaction_code,
     amount,
     payout_id,
     start_date,
     end_date,
     insert_timestamp
from
`pe_member_commissions_history_20121222_20121228`); 
 
 -- 20121229_20130104
CREATE TABLE `ph_member_commissions_20121229_20130104` (
     `commission_id` INT(11) NOT NULL AUTO_INCREMENT,
     `member_id` INT(11) NULL DEFAULT '0',
     `account_id` VARCHAR(32) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
     `account_status_id` INT(11) UNSIGNED NOT NULL DEFAULT '0',
     `transaction_code` INT(11) NULL DEFAULT NULL,
     `amount` DECIMAL(10,2) NULL DEFAULT NULL,     
     `payout_id` INT(11) NULL DEFAULT NULL,
     `start_date` DATE NULL DEFAULT NULL,
     `end_date` DATE NULL DEFAULT NULL,
     `insert_timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
     PRIMARY KEY (`commission_id`),
     INDEX `member_id` (`member_id`),
     INDEX `account_id` (`account_id`),
     INDEX `start_date` (`start_date`, `end_date`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;

INSERT INTO `ph_member_commissions_20121229_20130104` 
(select
     commission_history_id,
     member_id,
     account_id,
     (CASE WHEN status = 'ACTIVE' THEN 1 WHEN status = 'INACTIVE' THEN 2 WHEN status = 'COMPANY' THEN 3 ELSE 0 END) AS account_status_id,
     transaction_code,
     amount,
     payout_id,
     start_date,
     end_date,
     insert_timestamp
from
`pe_member_commissions_history_20121229_20130104`); 
 
-- 20130105_20130111
CREATE TABLE `ph_member_commissions_20130105_20130111` (
     `commission_id` INT(11) NOT NULL AUTO_INCREMENT,
     `member_id` INT(11) NULL DEFAULT '0',
     `account_id` VARCHAR(32) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
     `account_status_id` INT(11) UNSIGNED NOT NULL DEFAULT '0',
     `transaction_code` INT(11) NULL DEFAULT NULL,
     `amount` DECIMAL(10,2) NULL DEFAULT NULL,     
     `payout_id` INT(11) NULL DEFAULT NULL,
     `start_date` DATE NULL DEFAULT NULL,
     `end_date` DATE NULL DEFAULT NULL,
     `insert_timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
     PRIMARY KEY (`commission_id`),
     INDEX `member_id` (`member_id`),
     INDEX `account_id` (`account_id`),
     INDEX `start_date` (`start_date`, `end_date`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;

INSERT INTO `ph_member_commissions_20130105_20130111` 
(select
     commission_history_id,
     member_id,
     account_id,
     (CASE WHEN status = 'ACTIVE' THEN 1 WHEN status = 'INACTIVE' THEN 2 WHEN status = 'COMPANY' THEN 3 ELSE 0 END) AS account_status_id,
     transaction_code,
     amount,
     payout_id,
     start_date,
     end_date,
     insert_timestamp
from
`pe_member_commissions_history_20130105_20130111`); 
 
 -- 20130112_20130118
CREATE TABLE `ph_member_commissions_20130112_20130118` (
     `commission_id` INT(11) NOT NULL AUTO_INCREMENT,
     `member_id` INT(11) NULL DEFAULT '0',
     `account_id` VARCHAR(32) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
     `account_status_id` INT(11) UNSIGNED NOT NULL DEFAULT '0',
     `transaction_code` INT(11) NULL DEFAULT NULL,
     `amount` DECIMAL(10,2) NULL DEFAULT NULL,     
     `payout_id` INT(11) NULL DEFAULT NULL,
     `start_date` DATE NULL DEFAULT NULL,
     `end_date` DATE NULL DEFAULT NULL,
     `insert_timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
     PRIMARY KEY (`commission_id`),
     INDEX `member_id` (`member_id`),
     INDEX `account_id` (`account_id`),
     INDEX `start_date` (`start_date`, `end_date`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;

INSERT INTO `ph_member_commissions_20130112_20130118` 
(select
     commission_history_id,
     member_id,
     account_id,
     (CASE WHEN status = 'ACTIVE' THEN 1 WHEN status = 'INACTIVE' THEN 2 WHEN status = 'COMPANY' THEN 3 ELSE 0 END) AS account_status_id,
     transaction_code,
     amount,
     payout_id,
     start_date,
     end_date,
     insert_timestamp
from
`pe_member_commissions_history_20130112_20130118`);  
 
 -- 20130119_20130125
CREATE TABLE `ph_member_commissions_20130119_20130125` (
     `commission_id` INT(11) NOT NULL AUTO_INCREMENT,
     `member_id` INT(11) NULL DEFAULT '0',
     `account_id` VARCHAR(32) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
     `account_status_id` INT(11) UNSIGNED NOT NULL DEFAULT '0',
     `transaction_code` INT(11) NULL DEFAULT NULL,
     `amount` DECIMAL(10,2) NULL DEFAULT NULL,     
     `payout_id` INT(11) NULL DEFAULT NULL,
     `start_date` DATE NULL DEFAULT NULL,
     `end_date` DATE NULL DEFAULT NULL,
     `insert_timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
     PRIMARY KEY (`commission_id`),
     INDEX `member_id` (`member_id`),
     INDEX `account_id` (`account_id`),
     INDEX `start_date` (`start_date`, `end_date`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;

INSERT INTO `ph_member_commissions_20130119_20130125` 
(select
     commission_history_id,
     member_id,
     account_id,
     (CASE WHEN status = 'ACTIVE' THEN 1 WHEN status = 'INACTIVE' THEN 2 WHEN status = 'COMPANY' THEN 3 ELSE 0 END) AS account_status_id,
     transaction_code,
     amount,
     payout_id,
     start_date,
     end_date,
     insert_timestamp
from
`pe_member_commissions_history_20130119_20130125`);  
 
-- 20130126_20130201
CREATE TABLE `ph_member_commissions_20130126_20130201` (
     `commission_id` INT(11) NOT NULL AUTO_INCREMENT,
     `member_id` INT(11) NULL DEFAULT '0',
     `account_id` VARCHAR(32) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
     `account_status_id` INT(11) UNSIGNED NOT NULL DEFAULT '0',
     `transaction_code` INT(11) NULL DEFAULT NULL,
     `amount` DECIMAL(10,2) NULL DEFAULT NULL,     
     `payout_id` INT(11) NULL DEFAULT NULL,
     `start_date` DATE NULL DEFAULT NULL,
     `end_date` DATE NULL DEFAULT NULL,
     `insert_timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
     PRIMARY KEY (`commission_id`),
     INDEX `member_id` (`member_id`),
     INDEX `account_id` (`account_id`),
     INDEX `start_date` (`start_date`, `end_date`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;

INSERT INTO `ph_member_commissions_20130126_20130201` 
(select
     commission_history_id,
     member_id,
     account_id,
     (CASE WHEN status = 'ACTIVE' THEN 1 WHEN status = 'INACTIVE' THEN 2 WHEN status = 'COMPANY' THEN 3 ELSE 0 END) AS account_status_id,
     transaction_code,
     amount,
     payout_id,
     start_date,
     end_date,
     insert_timestamp
from
`pe_member_commissions_history_20130126_20130201`);  
 
-- 20130202_20130208
CREATE TABLE `ph_member_commissions_20130202_20130208` (
     `commission_id` INT(11) NOT NULL AUTO_INCREMENT,
     `member_id` INT(11) NULL DEFAULT '0',
     `account_id` VARCHAR(32) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
     `account_status_id` INT(11) UNSIGNED NOT NULL DEFAULT '0',
     `transaction_code` INT(11) NULL DEFAULT NULL,
     `amount` DECIMAL(10,2) NULL DEFAULT NULL,     
     `payout_id` INT(11) NULL DEFAULT NULL,
     `start_date` DATE NULL DEFAULT NULL,
     `end_date` DATE NULL DEFAULT NULL,
     `insert_timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
     PRIMARY KEY (`commission_id`),
     INDEX `member_id` (`member_id`),
     INDEX `account_id` (`account_id`),
     INDEX `start_date` (`start_date`, `end_date`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;

INSERT INTO `ph_member_commissions_20130202_20130208` 
(select
     commission_history_id,
     member_id,
     account_id,
     (CASE WHEN status = 'ACTIVE' THEN 1 WHEN status = 'INACTIVE' THEN 2 WHEN status = 'COMPANY' THEN 3 ELSE 0 END) AS account_status_id,
     transaction_code,
     amount,
     payout_id,
     start_date,
     end_date,
     insert_timestamp
from
`pe_member_commissions_history_20130202_20130208`); 
 
-- 20130209_20130215
CREATE TABLE `ph_member_commissions_20130209_20130215` (
     `commission_id` INT(11) NOT NULL AUTO_INCREMENT,
     `member_id` INT(11) NULL DEFAULT '0',
     `account_id` VARCHAR(32) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
     `account_status_id` INT(11) UNSIGNED NOT NULL DEFAULT '0',
     `transaction_code` INT(11) NULL DEFAULT NULL,
     `amount` DECIMAL(10,2) NULL DEFAULT NULL,     
     `payout_id` INT(11) NULL DEFAULT NULL,
     `start_date` DATE NULL DEFAULT NULL,
     `end_date` DATE NULL DEFAULT NULL,
     `insert_timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
     PRIMARY KEY (`commission_id`),
     INDEX `member_id` (`member_id`),
     INDEX `account_id` (`account_id`),
     INDEX `start_date` (`start_date`, `end_date`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;

INSERT INTO `ph_member_commissions_20130209_20130215` 
(select
     commission_history_id,
     member_id,
     account_id,
     (CASE WHEN status = 'ACTIVE' THEN 1 WHEN status = 'INACTIVE' THEN 2 WHEN status = 'COMPANY' THEN 3 ELSE 0 END) AS account_status_id,
     transaction_code,
     amount,
     payout_id,
     start_date,
     end_date,
     insert_timestamp
from
`pe_member_commissions_history_20130209_20130215`);
 
-- 20130216_20130222
CREATE TABLE `ph_member_commissions_20130216_20130222` (
     `commission_id` INT(11) NOT NULL AUTO_INCREMENT,
     `member_id` INT(11) NULL DEFAULT '0',
     `account_id` VARCHAR(32) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
     `account_status_id` INT(11) UNSIGNED NOT NULL DEFAULT '0',
     `transaction_code` INT(11) NULL DEFAULT NULL,
     `amount` DECIMAL(10,2) NULL DEFAULT NULL,     
     `payout_id` INT(11) NULL DEFAULT NULL,
     `start_date` DATE NULL DEFAULT NULL,
     `end_date` DATE NULL DEFAULT NULL,
     `insert_timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
     PRIMARY KEY (`commission_id`),
     INDEX `member_id` (`member_id`),
     INDEX `account_id` (`account_id`),
     INDEX `start_date` (`start_date`, `end_date`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;

INSERT INTO `ph_member_commissions_20130216_20130222` 
(select
     commission_history_id,
     member_id,
     account_id,
     0,
     transaction_code,
     amount,
     payout_id,
     start_date,
     end_date,
     insert_timestamp
from
`pe_member_commissions_history_20130216_20130222`);


CREATE TABLE `ph_member_commissions_20130223_20130301` (
     `commission_id` INT(11) NOT NULL AUTO_INCREMENT,
     `member_id` INT(11) NULL DEFAULT '0',
     `account_id` VARCHAR(32) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
     `account_status_id` INT(11) UNSIGNED NOT NULL DEFAULT '0',
     `transaction_code` INT(11) NULL DEFAULT NULL,
     `amount` DECIMAL(10,2) NULL DEFAULT NULL,     
     `payout_id` INT(11) NULL DEFAULT NULL,
     `start_date` DATE NULL DEFAULT NULL,
     `end_date` DATE NULL DEFAULT NULL,
     `insert_timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
     PRIMARY KEY (`commission_id`),
     INDEX `member_id` (`member_id`),
     INDEX `account_id` (`account_id`),
     INDEX `start_date` (`start_date`, `end_date`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;

INSERT INTO ph_member_commissions_20130223_20130301 (member_id,account_id,account_status_id, transaction_code,amount,payout_id,start_date,end_date)
(SELECT member_id,account_id,0, transaction_code,amount,payout_id,start_date,end_date from tmp_po_member_commissions_20130223_20130301);


CREATE TABLE `ph_member_commissions_20130302_20130308` (
     `commission_id` INT(11) NOT NULL AUTO_INCREMENT,
     `member_id` INT(11) NULL DEFAULT '0',
     `account_id` VARCHAR(32) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
     `account_status_id` INT(11) UNSIGNED NOT NULL DEFAULT '0',
     `transaction_code` INT(11) NULL DEFAULT NULL,
     `amount` DECIMAL(10,2) NULL DEFAULT NULL,     
     `payout_id` INT(11) NULL DEFAULT NULL,
     `start_date` DATE NULL DEFAULT NULL,
     `end_date` DATE NULL DEFAULT NULL,
     `insert_timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
     PRIMARY KEY (`commission_id`),
     INDEX `member_id` (`member_id`),
     INDEX `account_id` (`account_id`),
     INDEX `start_date` (`start_date`, `end_date`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;

INSERT INTO ph_member_commissions_20130302_20130308 (member_id,account_id,account_status_id, transaction_code,amount,payout_id,start_date,end_date)
(SELECT member_id,account_id,0, transaction_code,amount,payout_id,start_date,end_date from tmp_po_member_commissions_20130302_20130308);

