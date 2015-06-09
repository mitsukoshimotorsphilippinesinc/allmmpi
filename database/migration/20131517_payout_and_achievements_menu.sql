
INSERT INTO `ad_navigations` ( `system_code`, `code`, `title`, `url`, `ordering`, `parent_id`, `is_active`, `type`) 
SELECT 'system', 'achievements', 'Achievements', '/admin/achievements/', ordering+4 , navigation_id, '1', 'LINK' FROM ad_navigations WHERE system_code = 'system' AND title = 'Settings';


INSERT INTO `ad_navigations` ( `system_code`, `code`, `title`, `url`, `ordering`, `parent_id`, `is_active`, `type`) 
SELECT 'system', 'payout_periods', 'Payout Period', '/admin/payout_periods/', ordering+1 , navigation_id, '1', 'LINK' FROM ad_navigations WHERE code = 'payout_header';