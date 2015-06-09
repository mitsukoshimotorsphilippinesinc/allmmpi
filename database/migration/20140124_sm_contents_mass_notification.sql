INSERT INTO `sm_contents` (`parent_content_id`, `user_id`, `title`, `slug`, `body`, `thumb`, `excerpt`, `is_active`, `path`, `content_type`, `updated_timestamp`, `insert_timestamp`) VALUES (0, 1, 'Mass Notfication-SMS', 'mass-notification-sms', '{@=sms_message}', '', NULL, 1, '', 'email_template', '0000-0-0 00:00:00', '2014-01-24 03:32:04');


insert into `ad_navigations` (`system_code`, `code`, `title`, `url`, `ordering`, `parent_id`, `is_active`, `type`)
VALUES
(
'system',
'notifications',
'Notification Tools',
'/admin/notifications',
'27',
'0',
'1',
'HEADER'
);

--------------
-- rf_settings
--------------
INSERT INTO `rf_settings`(`slug`, `value`, `default`, `system_code`, `is_locked`)
VALUES ('mass_notification_cost_sms', '1.00', '1.00', 'system', '1');

INSERT INTO `rf_settings`(`slug`, `value`, `default`, `system_code`, `is_locked`)
VALUES ('mass_notification_cost_email', '0.00', '0.00', 'system', '1');

------------------
-- tr_sms_outgoing
------------------
ALTER TABLE `tr_sms_outgoing` ADD COLUMN `account_id` VARCHAR(20) COLLATE utf8_unicode_ci DEFAULT NULL AFTER `member_id`;
ALTER TABLE `tr_sms_outgoing` ADD COLUMN `is_charged` TINYINT(1) NOT NULL DEFAULT '0' AFTER `status`;
ALTER TABLE `tr_sms_outgoing` ADD COLUMN `tariff` DECIMAL(10,2) NOT NULL DEFAULT '0.00' AFTER `is_charged`;

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
