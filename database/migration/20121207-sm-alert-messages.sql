DROP TABLE IF EXISTS `sm_alert_messages`;
CREATE TABLE `sm_alert_messages` (
  `message_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `is_visible` tinyint(1) unsigned NOT NULL,
  `start_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `ad_navigations` (`navigation_id`, `system_code`, `code`, `title`, `url`, `ordering`, `parent_id`, `is_active`, `type`, `insert_timestamp`)
VALUES
	(NULL, 'cms', 'alert-messages', 'Alerts', '/cms/alerts', 16, 46, 1, 'LINK', NOW());