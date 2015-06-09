DROP TABLE IF EXISTS `cm_member_withdraw_funds_transactions`;
CREATE TABLE IF NOT EXISTS `cm_member_withdraw_funds_transactions` (
  `transaction_id` int(11) NOT NULL auto_increment,
  `member_id` int(10) unsigned NOT NULL default '0',
  `preferred_payout` varchar(64) NOT NULL,
  `amount` decimal(10,2) default NULL,
  `tax` decimal(10,2) default NULL,
  `amount_after_tax` decimal(10,2) default NULL,
  `status` varchar(10) default NULL,
  `user_id` int(10) unsigned NOT NULL default '0',
  `remarks` text,
  `completed_timestamp` timestamp NOT NULL default '0000-00-00 00:00:00',
  `insert_timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`transaction_id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;



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
`a`.`insert_timestamp` AS `insert_timestamp` 
from (`cm_member_withdraw_funds_transactions` `a` join `cm_members` `b`) where (`a`.`member_id` = `b`.`member_id`);
