INSERT INTO sm_contents(`parent_content_id`, `user_id`, `title`, `slug`, `body`, `is_active`, `content_type`)
VALUES (0, 1, 'Text Blast Generic Message', 'text-blast-generic-message', '{@=remarks}', 1, 'sms_template');

UPDATE sm_contents SET `body` = '{@=remarks} Please check your Vital-C account by logging in to vital-c.net. Thank you.' 
WHERE `slug` = 'text-blast-generic-message';

ALTER TABLE `cm_member_account_vouchers` ADD COLUMN `sms_sent` TINYINT(1) DEFAULT 0 AFTER `status`;