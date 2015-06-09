INSERT INTO `vitalc`.`sm_contents` (`content_id`, `parent_content_id`, `user_id`, `title`, `slug`, `body`, `thumb`, `excerpt`, `is_active`, `path`, `content_type`, `updated_timestamp`, `insert_timestamp`) VALUES (NULL, '0', '1', 'Mobile Number Update on Vital-C', 'mobile_number_verification_update', '<p>Hi {@=first_name},</p>
<p>You have requested to verify your mobile number under Member''s Profile on Vital-C. Please click this <a href=''{@=link}''>link</a> to confirm that your mobile number is correct.</p>
<br/>
<p>Mobile Number : <b>{@=detail}</b></p>
<p>Mobile Number Verification Code: <b>{@=generated_code}</b></p>
<br/><br/>
<p>If you do not see the link, copy and paste this in your browser:</p>
<br/>
<p>
{@=link}
</p>
<p>Thanks,<br/>Vital-C</p>', '', NULL, '1', '', 'email', '0000-00-00 00:00:00', CURRENT_TIMESTAMP);