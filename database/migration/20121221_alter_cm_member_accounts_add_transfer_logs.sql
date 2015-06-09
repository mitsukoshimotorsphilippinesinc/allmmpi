-- add transfer_member_id and transfer_timestamp to cm_member_accounts

ALTER TABLE  `cm_member_accounts` ADD `transfer_member_id` INT( 11 ) NOT NULL , ADD  `transfer_timestamp` TIMESTAMP NOT NULL;