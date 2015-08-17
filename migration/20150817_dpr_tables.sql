DROP TABLE IF EXISTS `rf_printing_press`;
CREATE TABLE `rf_printing_press` (
  `printing_presS_id` 			int(11) NOT NULL AUTO_INCREMENT,
  `name` 						int(11) DEFAULT NULL,
  `address` 					varchar(10) COLLATE utf8_unicode_ci DEFAULT '',
  `contact_number` 				int(2) NOT NULL DEFAULT 0,
  `table_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active`					tinyint(2) NOT NULL DEFAULT 0,  
  `is_deleted`					tinyint(2) NOT NULL DEFAULT 0,  
  `remarks` text COLLATE utf8_unicode_ci,
  `update_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (printing_presS_id),
  KEY `name` (`name`)  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

