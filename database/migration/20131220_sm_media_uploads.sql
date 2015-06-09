DROP TABLE IF EXISTS `sm_media_uploads`;
CREATE TABLE `sm_media_uploads` (
  `media_upload_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(1024) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'insert title here',
  `description` text COLLATE utf8_unicode_ci,
  `body` text COLLATE utf8_unicode_ci,
  `is_display` tinyint(4) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `update_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`media_upload_id`),
  KEY `user_id` (`user_id`),
  KEY `is_published` (`is_display`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO rf_settings(`slug`, `value`, `default`, `system_code`, `is_locked`)
VALUES ('media_uploads_on_dashboard', '5', '5', 'system', '0');