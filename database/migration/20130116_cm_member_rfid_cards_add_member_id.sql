-- change name of member id to rfid member id and add new member id column for paycard

ALTER TABLE `cm_member_rfid_cards` CHANGE `member_id` `rfid_member_id` INT( 11 ) NULL DEFAULT NULL;
ALTER TABLE `cm_member_rfid_cards` ADD `paycard_member_id` INT( 11 ) NULL DEFAULT NULL AFTER `rfid_member_id`;
ALTER TABLE `cm_member_rfid_cards` CHANGE `rfid_member_id` `rfid_member_id` INT( 11 ) NULL DEFAULT '0';
ALTER TABLE `cm_member_rfid_cards` CHANGE `paycard_member_id` `paycard_member_id` INT( 11 ) NULL DEFAULT '0';