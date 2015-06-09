INSERT INTO `sm_contents` (`parent_content_id`, `user_id`, `title`, `slug`, `body`, `thumb`, `excerpt`, `is_active`, `content_type`)
VALUES
	(0, 0, 'ESS Report', 'ess_email', '<p>An ESS Report was generated. Please follow this link:</p><p><a href="{@=excel_path}">{@=excel_path}</a></p>', '', '', 1, 'email_template');
