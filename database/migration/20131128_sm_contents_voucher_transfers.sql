INSERT INTO `sm_contents` (`parent_content_id`, `user_id`, `title`, `slug`, `body`, `thumb`, `excerpt`, `is_active`, `path`, `content_type`, `updated_timestamp`, `insert_timestamp`) VALUES (0, 1, 'Transfer Voucher', 'transfer_voucher_email', '<p>Hi {@=from_first_name},</p>\r\n<p>You are transferring a voucher with Voucher Code {@=voucher_code} to {@=proper_name_to_member}. Please click this <a href=\'{@=link}\'>link</a> to redirect you to the Vital-C site. You may enter the Confirmation Code into the Vouchers Tab by logging-in to your Vital-C account.</p>\r\n<br/>\r\n<p>Email Confirmation Code: <b>{@=confirmation_code}</b></p>\r\n<br/><br/>\r\n<p>If you do not see the link, copy and paste this in your browser:</p>\r\n<br/>\r\n<p>\r\n{@=link}\r\n</p><br/>\r\n<p>Thanks,<br/>Vital-C</p>', '', NULL, 1, '', 'email_template', '0000-0-0 00:00:00', '2013-11-20 03:32:04');

INSERT INTO `sm_contents` (`parent_content_id`, `user_id`, `title`, `slug`, `body`, `thumb`, `excerpt`, `is_active`, `path`, `content_type`, `updated_timestamp`, `insert_timestamp`) VALUES (0, 1, 'Transfer Voucher Acceptance Receipt', 'transfer_voucher_acceptance_receipt', '<p>Hi {@=first_name},</p>\r\n<p>You have received  Voucher {@=voucher_code} from {@=proper_sender_name} via Transfer Voucher. The amount is added to your list of Vouchers.</p>\r\n<br/>\r\n<p>Voucher Transaction ID : <b>{@=proper_voucher_id}</b></p>\r\n<br/><br/>\r\n<p>Thanks,<br/>Vital-C</p>', '', NULL, 1, '', 'email_template', '0000-0-0 00:00:00', '2013-11-20 10:25:28');

INSERT INTO `sm_contents` (`parent_content_id`, `user_id`, `title`, `slug`, `body`, `thumb`, `excerpt`, `is_active`, `path`, `content_type`, `updated_timestamp`, `insert_timestamp`) VALUES (0, 1, 'Transfer Voucher Notification Receipt', 'transfer_voucher_notification_receipt', '<p>Hi {@=first_name},</p>\r\n<p>You have successfully transferred to {@=proper_recipient_name} Voucher {@=voucher_code} via Voucher Transfer. The voucher is added to the recipient\'s list of Vouchers.</p>\r\n<br/>\r\n<p>Voucher Transaction ID : <b>{@=proper_voucher_id}</b></p>\r\n<br/><br/>\r\n<p>Thanks,<br/>Vital-C</p>', '', NULL, 1, '', 'email_template', '0000-0-0 00:00:00', '2013-11-20 10:25:28');

INSERT INTO `sm_contents` (`parent_content_id`, `user_id`, `title`, `slug`, `body`, `thumb`, `excerpt`, `is_active`, `path`, `content_type`, `updated_timestamp`, `insert_timestamp`) VALUES (0, 1, 'Cancel Transfer Voucher Acceptance Receipt', 'cancel_transfer_voucher_acceptance_receipt', '<p>Hi {@=first_name},</p>\r\n<p>Voucher Transfer with code {@=voucher_code} from {@=proper_sender_name} was cancelled.</p>\r\n<br/>\r\n<p>Voucher Transaction ID : <b>{@=proper_voucher_id}</b></p>\r\n<br/><br/>\r\n<p>Thanks,<br/>Vital-C</p>', '', NULL, 1, '', 'email_template', '0000-0-0 00:00:00', '2013-11-21 03:50:35');

INSERT INTO `sm_contents` (`parent_content_id`, `user_id`, `title`, `slug`, `body`, `thumb`, `excerpt`, `is_active`, `path`, `content_type`, `updated_timestamp`, `insert_timestamp`) VALUES (0, 1, 'Cancel Transfer Voucher Notification Receipt', 'cancel_transfer_voucher_notification_receipt', '<p>Hi {@=first_name},</p>\r\n<p>You have successfully cancelled Voucher Transfer with code {@=voucher_code} for {@=proper_recipient_name}.</p>\r\n<br/>\r\n<p>Voucher Transaction ID : <b>{@=proper_voucher_id}</b></p>\r\n<br/><br/>\r\n<p>Thanks,<br/>Vital-C</p>', '', NULL, 1, '', 'email_template', '0000-0-0 00:00:00', '2013-11-21 03:50:35');

INSERT INTO `sm_contents` (`parent_content_id`, `user_id`, `title`, `slug`, `body`, `thumb`, `excerpt`, `is_active`, `path`, `content_type`, `updated_timestamp`, `insert_timestamp`) VALUES (0, 1, 'Voucher Transfer - Resend Confirmation Code', 'resend_voucher_code_via_admin_from_member', '<p>Hi {@=first_name},</p>\r\n<p>Below are the details of your pending Transfer transaction.</p> \r\n<br/>\r\n<p>Transaction ID : <b>{@=proper_transaction_id}</b></p>\r\n<p>Confirmation Code : <b>{@=confirmation_code}</b></p>\r\n<p>To Member : <b>{@=proper_to_member_name}</b></p>\r\n<p>Voucher Code : <b>{@=voucher_code}</b></p>\r\n<br/><br/>\r\n<p>Thanks,<br/>Vital-C</p>', '', NULL, 1, '', 'email_template', '0000-0-0 00:00:00', '2013-11-25 01:11:42');



update `ad_navigations` set 
`type` = 'HEADER', 
`url` = '#',
`title` = 'Transfers'
where `title` = 'Transfer Funds/GCs';

insert into `ad_navigations` (`system_code`, `code`, `title`, `url`, `ordering`, `parent_id`, `is_active`, `type`)
VALUES
(
'system',
'commission_transfers',
'Commission Transfers',
'/admin/transfers',
'21',
'107',
'1',
'LINK'
);

insert into `ad_navigations` (`system_code`, `code`, `title`, `url`, `ordering`, `parent_id`, `is_active`, `type`)
VALUES
(
'system',
'voucher_transfers',
'Vocuher Transfers',
'/admin/voucher_transfers',
'22',
'107',
'1',
'LINK'
);

ALTER TABLE cm_member_account_upgrades ADD COLUMN `card_type_id` INT(10) NOT NULL DEFAULT 0 AFTER `upgrade_type`;
