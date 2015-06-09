-- add to system navigation
INSERT INTO `ad_navigations` (`navigation_id`, `system_code`, `code`, `title`, `url`, `ordering`, `parent_id`, `is_active`, `type`, `insert_timestamp`) VALUES (NULL, 'system', 'vouchers', 'Vouchers', '#', '13', '0', '1', 'HEADER', CURRENT_TIMESTAMP);

INSERT INTO `ad_navigations` (`navigation_id`, `system_code`, `code`, `title`, `url`, `ordering`, `parent_id`, `is_active`, `type`, `insert_timestamp`) VALUES (NULL, 'system', 'vouchers', 'Vouchers', '/admin/vouchers', '14', '82', '1', 'LINK', CURRENT_TIMESTAMP);

INSERT INTO `ad_navigations` (`navigation_id`, `system_code`, `code`, `title`, `url`, `ordering`, `parent_id`, `is_active`, `type`, `insert_timestamp`) VALUES (NULL, 'system', 'voucher products', 'Voucher Products', '/admin/voucher_products', '15', '82', '1', 'LINK', CURRENT_TIMESTAMP);

INSERT INTO `ad_navigations` (`navigation_id`, `system_code`, `code`, `title`, `url`, `ordering`, `parent_id`, `is_active`, `type`, `insert_timestamp`) VALUES (NULL, 'system', 'voucher types', 'Voucher Types', '/admin/voucher_types', '16', '82', '1', 'LINK', CURRENT_TIMESTAMP);

-- alter cm_member_voucher_types.name length
ALTER TABLE `cm_member_voucher_types` CHANGE `name` `name` VARCHAR( 200 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL;