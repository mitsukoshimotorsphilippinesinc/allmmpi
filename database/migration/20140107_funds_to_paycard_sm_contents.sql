INSERT INTO `sm_contents` (`parent_content_id`, `user_id`, `title`, `slug`, `body`, `thumb`, `excerpt`, `is_active`, `path`, `content_type`, `updated_timestamp`) VALUES (0, 1, 'Cancel Funds To Paycard Notification Receipt', 'cancel_funds_to_paycard_notification_receipt', '<p>Hi {@=first_name},</p>\r\n<p>You have successfully cancelled your Funds To Paycard request with the following details: <br/> {@=html_data}</p>\r\n<br/>\r\n<p>Funds To Paycard Transaction ID : <b>{@=proper_funds_to_paycard_id}</b></p>\r\n<br/><br/>\r\n<p>Thanks,<br/>Vital-C</p>', '', NULL, 1, '', 'email_template', '0000-0-0 00:00:00');

INSERT INTO `sm_contents` (`parent_content_id`, `user_id`, `title`, `slug`, `body`, `thumb`, `excerpt`, `is_active`, `path`, `content_type`, `updated_timestamp`) VALUES (0, 1, 'Cancel Funds To Paycard Notification Receipt', 'request_funds_to_paycard_notification_receipt', '<p>Hi {@=first_name},</p>\r\n<p>You have successfully sumitted your Funds To Paycard request with the following details: <br/> {@=html_data}</p>\r\n<br/>\r\n<p>Funds To Paycard Transaction ID : <b>{@=proper_funds_to_paycard_id}</b></p>\r\n<br/><br/>\r\n<p>Thanks,<br/>Vital-C</p>', '', NULL, 1, '', 'email_template', '0000-0-0 00:00:00');

INSERT INTO `sm_contents` (`parent_content_id`, `user_id`, `title`, `slug`, `body`, `thumb`, `excerpt`, `is_active`, `path`, `content_type`, `updated_timestamp`) VALUES (0, 1, 'Cancel Funds To Paycard Notification Receipt Via Admin', 'cancel_funds_to_paycard_notification_receipt_admin', '<p>Hi {@=first_name},</p>\r\n<p>Your Funds To Paycard request has been cancelled via Admin with the following details: <br/> {@=html_data}</p>\r\n<br/>\r\n<p>Funds To Paycard Transaction ID : <b>{@=proper_funds_to_paycard_id}</b></p>\r\n<br/><br/>\r\n<p>Thanks,<br/>Vital-C</p>', '', NULL, 1, '', 'email_template', '0000-0-0 00:00:00');

INSERT INTO `sm_contents` (`parent_content_id`, `user_id`, `title`, `slug`, `body`, `thumb`, `excerpt`, `is_active`, `path`, `content_type`, `updated_timestamp`) VALUES (0, 1, 'Cancel Funds To Paycard Notification Receipt Via Admin', 'request_funds_to_paycard_notification_receipt_admin', '<p>Hi {@=first_name},</p>\r\n<p>Your Funds To Paycard request via Admin has been submitted with the following details: <br/> {@=html_data}</p>\r\n<br/>\r\n<p>Funds To Paycard Transaction ID : <b>{@=proper_funds_to_paycard_id}</b></p>\r\n<br/><br/>\r\n<p>Thanks,<br/>Vital-C</p>', '', NULL, 1, '', 'email_template', '0000-0-0 00:00:00');

INSERT INTO `rf_settings` (`slug`, `value`, `default`, `system_code`,`is_locked`)
VALUES ('minimum_f2p_amount', '10', '10', 'network','0');

INSERT INTO `rf_settings` (`slug`, `value`, `default`, `system_code`,`is_locked`)
VALUES ('maximum_f2p_amount', '0', '0', 'network','0');



insert into `ad_navigations` (`system_code`, `code`, `title`, `url`, `ordering`, `parent_id`, `is_active`, `type`)
VALUES
(
'system',
'funds_to_paycard',
'Funds To Paycard',
'/admin/funds_to_paycard',
'21',
'0',
'1',
'HEADER'
);


--update `ad_navigations` set 
--`type` = 'HEADER', 
--`url` = '#',
--`title` = 'Transfers'
--where `title` = 'Transfer Funds/GCs';
--
--insert into `ad_navigations` (`system_code`, `code`, `title`, `url`, `ordering`, `parent_id`, `is_active`, `type`)
--VALUES
--(
--'system',
--'commission_transfers',
--'Commission Transfers',
--'/admin/transfers',
--'21',
--'107',
--'1',
--'LINK'
--);
--
--insert into `ad_navigations` (`system_code`, `code`, `title`, `url`, `ordering`, `parent_id`, `is_active`, `type`)
--VALUES
--(
--'system',
--'voucher_transfers',
--'Vocuher Transfers',
--'/admin/voucher_transfers',
--'22',
--'107',
--'1',
--'LINK'
--);
--
--ALTER TABLE cm_member_account_upgrades ADD COLUMN `card_type_id` INT(10) NOT NULL DEFAULT 0 AFTER `upgrade_type`;
