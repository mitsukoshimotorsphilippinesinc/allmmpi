-- rf_settings
INSERT INTO `rf_settings` (`slug`, `value`, `default`,`system_code`, `is_locked`)
VALUES ('backup_history_tables_email_group','dante@gobeyondstudios.com','dante@gobeyondstudios.com','system','0');

-- sm_contents (generic email content)
INSERT INTO `sm_contents` (`parent_content_id`, `user_id`, `title`, `slug`, `body`, `thumb`, `excerpt`, `is_active`, `path`, `content_type`) VALUES (0, 1, 'Backup History Table Generic Email', 'backup_history_table_generic_email', '<p>Hi Vital-C,<br/>This is an email notification that {@=table_name} has been successfully created today, {@=current_timestamp}. You may now backup the table to create free space in our LIVE database.<br/>Thank you.</p>', '', NULL, 1, '', 'email_template');

INSERT INTO `sm_contents` (`parent_content_id`, `user_id`, `title`, `slug`, `body`, `thumb`, `excerpt`, `is_active`, `path`, `content_type`) VALUES (0, 1, 'Drop History Tables Generic Email', 'drop_history_tables_generic_email', '<p>Hi Vital-C,<br/>The following history table/s has/have been deleted, as of {@=current_timestamp}, from our Live Database: {@=table_name}. This is a part of our monthly DB maintenance and optimization.<br/>Thank you.</p>', '', NULL, 1, '', 'email_template');