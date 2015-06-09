DROP TABLE IF EXISTS `ad_systems`;

CREATE TABLE `ad_systems` (
  `code` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pretty_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ordering` tinyint(4) NOT NULL DEFAULT '0',
  `is_visible` tinyint(4) NOT NULL DEFAULT '0',
  `is_locked` tinyint(4) NOT NULL DEFAULT '0',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`code`),
  UNIQUE KEY `unique - code` (`code`),
  KEY `index - code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO `ad_systems` (`code`, `name`, `pretty_name`, `url`, `ordering`, `is_visible`, `is_locked`, `insert_timestamp`)
VALUES
	('cms','CMS','Content Management','/cms',6,1,0,'2012-07-06 10:00:15'),
	('inventory','Inventory','Inventory','/inventory',1,1,0,'2012-04-04 14:40:20'),
	('mis','MIS Reports','MIS Reports','/mis',7,1,0,'2012-12-04 18:05:23'),
	('network','Network','MLM Network','/network',2,1,0,'2012-04-04 14:41:25'),
	('releasing','WebPOI Releasing','Web-POI Releasing','/webpoi/releasing',4,1,0,'2013-02-20 17:15:42'),
	('site','Site','Site','/',0,0,0,'2012-04-05 23:09:31'),
	('system','System','System','/admin/systems',5,1,0,'2012-04-04 14:40:00'),
	('webpoi','WebPOI','Web-POI','/webpoi',3,1,0,'2012-04-04 14:40:51');