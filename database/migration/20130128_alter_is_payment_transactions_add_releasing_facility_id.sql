-- alter is_payment_transactions, releasing facility id to be used to determine where transaction will be/was released

ALTER TABLE `is_payment_transactions` ADD `releasing_facility_id` int(11) DEFAULT 0 AFTER `facility_id`;