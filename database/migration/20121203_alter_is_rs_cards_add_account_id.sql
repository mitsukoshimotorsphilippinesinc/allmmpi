--ALTER TABLE `is_rs_cards` ADD COLUMN `account_id` VARCHAR(32) DEFAULT '' AFTER `member_id`;
ALTER TABLE  `is_rs_cards` CHANGE  `account_id`  `account_id` VARCHAR(32)  DEFAULT '';