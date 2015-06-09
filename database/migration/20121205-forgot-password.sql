ALTER TABLE  `cm_member_verification` ADD  `forgot_password_code` VARCHAR( 64 ) NOT NULL AFTER  `paycard_code`;

INSERT INTO `sm_contents` (`content_id`, `parent_content_id`, `user_id`, `title`, `slug`, `body`, `thumb`, `excerpt`, `is_active`, `path`, `content_type`, `updated_timestamp`, `insert_timestamp`)
VALUES
	(null, 0, 0, 'Reset Password Request', 'forgot-password-request-email', '<p>Hi {@=first_name},</p>\n<p>You requested to reset your password at VitalC.com. Follow this link to  reset your password.</p>\n<p>{@=url}</p>\n<br><br>\n<p>Thanks,<br>Vital C Health Products, Inc.</p>', '', NULL, 1, '', 'email_template', '0000-00-00 00:00:00', NOW()),
	(null, 0, 0, 'Reset Password Request', 'forgot-password-request-sms', 'Hi {@=first_name}, \\n\nYou requested to reset your password at VitalC.com. Follow this link to  reset your password. \\n\n{@=url} \\n\n\\n\nThanks, \\n\nVital C Health Products, Inc.', '', NULL, 1, '', 'sms_template', '0000-00-00 00:00:00', NOW()),
	(null, 0, 0, 'Reset Password Success', 'forgot-password-success-email', '<p>Hi {@=first_name},</p>\n<p>Your password was reset at VitalC.com</p>\n<br><br>\n<p>New Password: <b>{@=password}</b></p>\n<br><br>\n<p>Thanks,<br>Vital C Health Products, Inc.</p>', '', NULL, 1, '', 'email_template', '0000-00-00 00:00:00', NOW()),
	(null, 0, 0, 'Reset Password Success', 'forgot-password-success-sms', 'Hi {@=first_name},\\n\nYour password was reset at VitalC.com \\n\n\\n\nNew Password: {@=password} \\n\n\\n\nThanks, \\n\nVital C Health Products, Inc.', '', NULL, 1, '', 'sms_template', '0000-00-00 00:00:00', NOW());
