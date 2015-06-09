INSERT INTO `ad_navigations` ( `system_code`, `code`, `title`, `url`, `ordering`, `parent_id`, `is_active`, `type`) 
SELECT 'system', 'card_management', 'Card Management', '#', ordering+1, 0, 1, 'HEADER' FROM ad_navigations WHERE system_code = 'system' ORDER by navigation_id DESC LIMIT 0,1;

INSERT INTO `ad_navigations` ( `system_code`, `code`, `title`, `url`, `ordering`, `parent_id`, `is_active`, `type`) 
SELECT 'system', 'card_types', 'Card Types', '/admin/card_management/card_types/', ordering+1 , navigation_id, '1', 'LINK' FROM ad_navigations WHERE code = 'card_management';

INSERT INTO `ad_navigations` ( `system_code`, `code`, `title`, `url`, `ordering`, `parent_id`, `is_active`, `type`) 
SELECT 'system', 'card_series', 'Card Series', '/admin/card_management/card_series/', ordering+2 , navigation_id, '1', 'LINK' FROM ad_navigations WHERE code = 'card_management';