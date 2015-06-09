ALTER TABLE `cm_member_withdraw_funds_transactions` ADD `update_timestamp` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' AFTER `completed_timestamp` ;

DROP TABLE IF EXISTS `cm_member_withdraw_funds_transactions_view`;
CREATE VIEW `cm_member_withdraw_funds_transactions_view` 
AS 
select 
`a`.`transaction_id` AS `transaction_id`,
`a`.`member_id` AS `member_id`,
`a`.`preferred_payout` AS `preferred_payout`,
`b`.`last_name` AS `last_name`,
`b`.`first_name` AS `first_name`,
`b`.`middle_name` AS `middle_name`,
`b`.`email` AS `email`,
`b`.`mobile_number` AS `mobile_number`,
`b`.`home_address` AS `home_address`,
`b`.`birthdate` AS `birthdate`,
`a`.`amount` AS `amount`,
`a`.`tax` AS `tax`,
`a`.`amount_after_tax` AS `amount_after_tax`,
`a`.`status` AS `status`,
`a`.`user_id` AS `user_id`,
`a`.`remarks` AS `remarks`,
`a`.`completed_timestamp` AS `completed_timestamp`,
`a`.`update_timestamp` AS `update_timestamp`,
`a`.`insert_timestamp` AS `insert_timestamp` 
from (`cm_member_withdraw_funds_transactions` `a` join `cm_members` `b`) where (`a`.`member_id` = `b`.`member_id`);

/* add link */ 
INSERT INTO `ad_navigations` (`system_code`, `code`, `title`, `url`, `ordering`, `parent_id`, `is_active`, `type`, `insert_timestamp`) VALUES ('withdraw funds', 'withdraw funds', 'Withdraw Funds', '/admin/withdraw_funds', '17', '0', '1', 'LINK', CURRENT_TIMESTAMP);