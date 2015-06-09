ALTER TABLE  `cm_member_user_accounts` ADD  `orig_password` VARCHAR( 100 ) NULL AFTER  `password`;


/* privilege */
INSERT INTO `ad_privileges` (`privilege_id`, `privilege_code`, `privilege_description`, `privilege_uri`, `system_code`, `menu_code`)
VALUES
	(56, 'view-member-password', 'View Member\'s Password', '[]', 'mlm', NULL);


/* user privilege */
INSERT INTO `ad_user_privileges` (`user_id`, `privilege_id`, `insert_timestamp`)
VALUES
	(1, 56, '2012-12-17 11:32:29');




	UPDATE `cm_member_user_accounts` SET `orig_password` = (SELECT `password` FROM `user_accounts` WHERE `user_accounts`.`username`=`cm_member_user_accounts`.`username` GROUP BY `user_accounts`.`username`)