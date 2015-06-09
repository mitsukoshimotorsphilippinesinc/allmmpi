CREATE TABLE `cm_member_accounts_position_count` (
  `account_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `left_cnt` decimal(10,2) NOT NULL DEFAULT '0.00',
  `right_cnt` decimal(10,2) NOT NULL DEFAULT '0.00',
  `is_processing` tinyint(1) NOT NULL DEFAULT '0',
  `start_timestamp` int(11) DEFAULT NULL,
  `end_timestamp` int(11) DEFAULT NULL,
  `total_timestamp` int(11) DEFAULT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `rf_settings` (`slug`, `value`, `default`, `system_code`, `is_locked`, `insert_timestamp`)
VALUES
	('position_count_status', 'ready', 'ready', 'system', 0, '2013-10-25 10:33:49'),
	('position_count_timestamp', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'system', 0, '2013-10-25 10:26:21');

ALTER TABLE  `cm_member_accounts` ADD  `sp_downline_count_left` INT( 11 ) UNSIGNED NOT NULL DEFAULT  '0' AFTER  `gc_pair_ctr_sp` ,
ADD  `sp_downline_count_right` INT( 11 ) UNSIGNED NOT NULL DEFAULT  '0' AFTER  `sp_downline_count_left`;