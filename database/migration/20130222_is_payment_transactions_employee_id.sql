-- add employee_id in is_payment_transactions

ALTER TABLE `is_payment_transactions` ADD `employee_id` INT( 11 ) NOT NULL DEFAULT '0' AFTER `user_id`;