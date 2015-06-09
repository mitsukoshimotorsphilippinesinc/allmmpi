-- added account_status_id on po_member_commissions
ALTER TABLE  `po_member_commissions` ADD  `account_status_id` INT( 11 ) UNSIGNED NOT NULL DEFAULT  '0' AFTER  `account_id`