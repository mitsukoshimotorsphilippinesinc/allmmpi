ALTER TABLE  `rf_account_voucher_types` ADD  `allow_inactive` TINYINT( 1 ) NOT NULL DEFAULT  '0';

INSERT INTO `ad_navigations` ( `system_code`, `code`, `title`, `url`, `ordering`, `parent_id`, `is_active`, `type`) 
SELECT 'system', 'account_voucher_types', 'Account Voucher Types', '/admin/account_voucher_types/', ordering+5 , navigation_id, '1', 'LINK' FROM ad_navigations WHERE system_code = 'system' AND title = 'Settings';
