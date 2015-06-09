-- add privilege for authorization for voiding of transaction

INSERT INTO `ad_privileges` (`privilege_id`, `privilege_code`, `privilege_description`, `privilege_uri`, `system_code`, `menu_code`)
VALUES
	(NULL, 'authorize-voiding', 'Authorize Voiding', '[]', 'webpoi', NULL);
