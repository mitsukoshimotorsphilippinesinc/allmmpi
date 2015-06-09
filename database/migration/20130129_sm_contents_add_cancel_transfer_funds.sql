INSERT INTO `sm_contents` (`parent_content_id`, `user_id`, `title`, `slug`, `body`, `thumb`, `excerpt`, `is_active`, `path`, `content_type`, `updated_timestamp`, `insert_timestamp`) 
VALUES ('0', '1', 'Admin - Cancel Transfer Funds', 'cancel_transfer_funds_via_admin_from_member', '<p>Hi {@=first_name},</p>
<p>We have cancelled your Transfer Funds Request for {@=proper_to_member_name}. The amount of Php{@=proper_amount} is credited back to your {@=proper_transfer_type}.</p>
<br/>
<p>Transaction ID : <b>{@=proper_member_transfer_id}</b></p>
<p>Remarks/Notes : <b>{@=remarks}</b></p>
<br/><br/>
<p>Thanks,<br/>Vital-C Admin</p>', '', NULL, '1', '', 'email template', '0000-00-00 00:00:00', CURRENT_TIMESTAMP);


INSERT INTO `sm_contents` (`parent_content_id`, `user_id`, `title`, `slug`, `body`, `thumb`, `excerpt`, `is_active`, `path`, `content_type`, `updated_timestamp`, `insert_timestamp`) 
VALUES ('0', '1', 'Admin - Cancel Transfer Funds', 'cancel_transfer_funds_via_admin_to_member', '<p>Hi {@=first_name},</p>
<p>We have cancelled the Transfer Funds Request from {@=proper_from_member_name} to you. </p>
<br/>
<p>Transaction ID : <b>{@=proper_member_transfer_id}</b></p>
<p>Remarks/Notes : <b>{@=remarks}</b></p>
<br/><br/>
<p>Thanks,<br/>Vital-C Admin</p>', '', NULL, '1', '', 'email template', '0000-00-00 00:00:00', CURRENT_TIMESTAMP);