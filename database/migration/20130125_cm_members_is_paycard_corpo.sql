-- add status if corpo

ALTER TABLE `cm_members` ADD `is_paycard_corpo` TINYINT( 1 ) NOT NULL DEFAULT '0' AFTER `is_auto_payout`;