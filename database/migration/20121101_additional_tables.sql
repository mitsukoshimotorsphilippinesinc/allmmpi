DROP TABLE IF EXISTS `cm_member_verification`;
CREATE TABLE IF NOT EXISTS `cm_member_verification` (
  `member_id` int(11) NOT NULL DEFAULT '0',
  `email_code` varchar(64) DEFAULT NULL,
  `mobile_code` varchar(6) DEFAULT NULL,
  `rf_id_code` varchar(64) DEFAULT NULL,
  `paycard_code` varchar(64) DEFAULT NULL,
  `email_verification_timestamp` timestamp NULL DEFAULT NULL,
  `mobile_verification_timestamp` timestamp NULL DEFAULT NULL,
  `rf_id_verification_timestamp` timestamp NULL DEFAULT NULL,
  `paycard_verification_timestamp` timestamp NULL DEFAULT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`member_id`),
  KEY `member_id` (`member_id`,`email_code`),
  KEY `member_id_2` (`member_id`,`mobile_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `tr_ad_member_logs`;
CREATE TABLE IF NOT EXISTS `tr_ad_member_logs` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `member_id` int(11) NOT NULL,
  `details` varchar(100) NOT NULL,
  `remarks` text,
  `status` varchar(10) DEFAULT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;


---------------------
-- ADD TO SM_CONTENTS
---------------------
INSERT INTO `sm_contents` (`content_id`, `parent_content_id`, `user_id`, `title`, `slug`, `body`, `thumb`, `excerpt`, `is_active`, `path`, `content_type`, `updated_timestamp`, `insert_timestamp`) VALUES (NULL, '0', '0', 'Welcome Email', 'welcome_email', '<p>Dear {@=first_name} {@=last_name}:</p>
<br/>
<p><i>Congratulations!</i></p>
<p>You have registered to Vital-C. We welcome you to our VitalC network family.</p>
<p>Please click this <a href=''{@=link}''>link</a> to validate your email using the verification code below.</p>
<br/>
<p>Email Verification Code: <b>{@=generated_email_code}</b></p>
<br/><br/>
<p>If you do not see the link, copy and paste this in your browser:</p>
<br/>
<p>{@=link}</p>
<br/><br/>

<p>As such, please find the pertinent information for your membership, as follows:</p>

	<ul>
        <li>Account ID : <strong>{@=account_id}</strong></li>
		<li>Sponsor ID : <strong>{@=sponsor_id}</strong></li>
        <li>Upline ID : <strong>{@=upline_id}</strong></li>
        <li>Position : <strong>{@=position}</strong></li>
	</ul>

<p><i>The information above is key to handle and manage your network genealogy, business roadmap and most importantly fund usages. These are highly confidential and should not in any way be disclosed to others.</i></p>

                    <p>It is our great pleasure to be your Business partner. We wish you much success and great networking power opportunities.</p>

		<p>Thank you.</p>
		<br/>
		<p>Very Truly Yours,<br/>Vital-C</p>', '', NULL, '1', '', 'email', '0000-00-00 00:00:00', CURRENT_TIMESTAMP);


INSERT INTO `sm_contents` (`content_id`, `parent_content_id`, `user_id`, `title`, `slug`, `body`, `thumb`, `excerpt`, `is_active`, `path`, `content_type`, `updated_timestamp`, `insert_timestamp`) VALUES (NULL, '0', '0', 'Email Update on Vital-C', 'email_verification_update', '<p>Hi {@=first_name},</p>
<p>You have requested to verify your email address under Member''s Profile on Vital-C. Please click this <a href=''{@=link}''>link</a> to confirm that your email address is correct.</p>
<br/>
<p>Email Address : <b>{@=detail}</b></p>
<p>Email Verification Code: <b>{@=generated_code}</b></p>
<br/><br/>
<p>If you do not see the link, copy and paste this in your browser:</p>
<br/>
<p>
{@=link}
</p>
<p>Thanks,<br/>Vital-C</p>', '', NULL, '1', '', 'email', '0000-00-00 00:00:00', CURRENT_TIMESTAMP);

INSERT INTO `sm_contents` (`content_id`, `parent_content_id`, `user_id`, `title`, `slug`, `body`, `thumb`, `excerpt`, `is_active`, `path`, `content_type`, `updated_timestamp`, `insert_timestamp`) VALUES (NULL, '0', '0', 'RF ID Update on Vital-C', 'rf_id_verification_update', '<p>Hi {@=first_name},</p>
<p>You have requested to verify your RF ID under Member''s Profile on Vital-C. Please click this <a href=''{@=link}''>link</a> to confirm that your RF ID is correct.</p>
<br/>
<p>RF ID : <b>{@=detail}</b></p>
<p>RF ID Verification Code: <b>{@=generated_code}</b></p>
<br/><br/>
<p>If you do not see the link, copy and paste this in your browser:</p>
<br/>
<p>
{@=link}
</p>
<p>Thanks,<br/>Vital-C</p>', '', NULL, '1', '', 'email', '0000-00-00 00:00:00', CURRENT_TIMESTAMP);

INSERT INTO `sm_contents` (`content_id`, `parent_content_id`, `user_id`, `title`, `slug`, `body`, `thumb`, `excerpt`, `is_active`, `path`, `content_type`, `updated_timestamp`, `insert_timestamp`) VALUES (NULL, '0', '0', 'Metrobank Paycard Number Update on Vital-C', 'paycard_verification_update', '<p>Hi {@=first_name},</p>
<p>You have requested to verify your Metrobank Paycard Number under Member''s Profile on Vital-C. Please click this <a href=''{@=link}''>link</a> to confirm that your Metrobank Paycard Number is correct.</p>
<br/>
<p>Metrobank Paycard Number : <b>{@=detail}</b></p>
<p>Metrobank Paycard Number Verification Code: <b>{@=generated_code}</b></p>
<br/><br/>
<p>If you do not see the link, copy and paste this in your browser:</p>
<br/>
<p>
{@=link}
</p>
<p>Thanks,<br/>Vital-C</p>', '', NULL, '1', '', 'email', '0000-00-00 00:00:00', CURRENT_TIMESTAMP);


INSERT INTO `sm_contents` (`content_id`, `parent_content_id`, `user_id`, `title`, `slug`, `body`, `thumb`, `excerpt`, `is_active`, `path`, `content_type`, `updated_timestamp`, `insert_timestamp`) VALUES (NULL, '0', '0', 'New Account', 'new_account', '<p>Dear {@=first_name} {@=last_name}:</p>
<br/>
<p><i>Congratulations!</i></p>
<p>You have registered a new account to Vital-C.</p>
<p>As such, please find the pertinent information for your membership, as follows:</p>

	<ul>
        <li>Account ID : <strong>{@=account_id}</strong></li>
        <li>Upline ID : <strong>{@=upline_id}</strong></li>
        <li>Sponsor ID : <strong>{@=sponsor_id}</strong></li>
		<li>Position : <strong>{@=position}</strong></li>
	</ul>

<p><i>The information above is key to handle and manage your network genealogy, business roadmap and most importantly fund usages. These are highly confidential and should not in any way be disclosed to others.</i></p>

<p>It is our great pleasure to be your Business partner. We wish you much success and great networking power opportunities.</p>

<p>Thank you.</p>
<br/>
<p>Very Truly Yours,<br/>Vital-C</p>', '', NULL, '1', '', 'email', '0000-00-00 00:00:00', CURRENT_TIMESTAMP);




------------------------------------------------
-- ALTER CM_MEMBERS ----------------------------
-- add is_paycard_verified and is_rf_id_verified
-------------------------------------------------
ALTER TABLE `cm_members` ADD `is_paycard_verified` TINYINT( 1 ) NOT NULL DEFAULT '0' AFTER `is_email_verified`;
ALTER TABLE `cm_members` ADD `is_rf_id_verified` TINYINT( 1 ) NOT NULL DEFAULT '0' AFTER `is_paycard_verified`;
ALTER TABLE `cm_members` ADD `is_mobile_verified` TINYINT( 1 ) NOT NULL DEFAULT '0' AFTER `is_rf_id_verified`;