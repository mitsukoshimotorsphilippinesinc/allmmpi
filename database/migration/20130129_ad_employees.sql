DROP TABLE IF EXISTS `ad_employees`;
CREATE TABLE IF NOT EXISTS `ad_employees` (
  `employee_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `employee_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `first_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `mobile_number` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `is_active` smallint(6) NOT NULL DEFAULT '0',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`employee_id`),
  KEY `employee_code` (`employee_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

ALTER TABLE `ad_employees` ADD `change_log` TEXT NOT NULL DEFAULT '' AFTER `is_active`;