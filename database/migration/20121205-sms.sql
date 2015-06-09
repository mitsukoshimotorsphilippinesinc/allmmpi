CREATE TABLE IF NOT EXISTS `rf_telco_prefix` (
  `identifier` varchar(16) NOT NULL default '',
  `prefix` varchar(8) NOT NULL default '',
  PRIMARY KEY  (`identifier`,`prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

INSERT INTO `rf_telco_prefix` (`identifier`, `prefix`) VALUES
('globe', '905'),
('globe', '906'),
('globe', '915'),
('globe', '916'),
('globe', '917'),
('globe', '926'),
('globe', '927'),
('globe', '935'),
('globe', '936'),
('globe', '937'),
('globe', '994'),
('smart', '907'),
('smart', '908'),
('smart', '909'),
('smart', '910'),
('smart', '912'),
('smart', '918'),
('smart', '919'),
('smart', '920'),
('smart', '921'),
('smart', '928'),
('smart', '929'),
('smart', '930'),
('smart', '938'),
('smart', '939'),
('smart', '946'),
('smart', '947'),
('smart', '948'),
('smart', '949'),
('smart', '989'),
('smart', '999'),
('sun', '922'),
('sun', '923'),
('sun', '932'),
('sun', '933'),
('sun', '934'),
('sun', '942'),
('sun', '943');


INSERT INTO `rf_settings` (`slug`, `value`, `default`, `system_code`, `is_locked`, `insert_timestamp`) VALUES ('sms_use_sun_api', '0', '', 'system', 0, NOW());


INSERT INTO `rf_settings` (`slug`, `value`, `default`, `system_code`, `is_locked`, `insert_timestamp`)
VALUES
	('sms_sun_api_access_credential', '{\"user\":\"RDavid\", \"pass\":\"WHmpaMNc\"}', '', 'system', 0, NOW()),
	('sms_sun_api_login_url', 'http://mcpro1.sun-solutions.ph/mc/login.aspx', '', 'system', 0, NOW()),
	('sms_sun_api_logout_url', 'http://mcpro1.sun-solutions.ph/mc/logout.aspx', '', 'system', 0, NOW()),
	('sms_sun_api_originator1', 'VitalC', '', 'system', 0, NOW()),
	('sms_sun_api_originator2', '09229990190', '', 'system', 0, NOW()),
	('sms_sun_api_send_url', 'http://mcpro1.sun-solutions.ph/mc/send.aspx', '', 'system', 0, NOW());
