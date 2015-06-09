INSERT INTO `rf_settings` (
`slug` ,
`value` ,
`default` ,
`system_code` ,
`is_locked` ,
`insert_timestamp`
)
VALUES 
('minimum_allowable_transfer', '1000', '1000', 'system', '0',CURRENT_TIMESTAMP);

INSERT INTO `rf_settings` (
`slug` ,
`value` ,
`default` ,
`system_code` ,
`is_locked` ,
`insert_timestamp`
)
VALUES 
('maximum_allowable_transfer', '0', '0', 'system', '0',CURRENT_TIMESTAMP);


-- RF_SETTINGS

INSERT INTO `sm_contents` (`parent_content_id`, `user_id`, `title`, `slug`, `body`, `thumb`, `excerpt`, `is_active`, `path`, `content_type`, `updated_timestamp`, `insert_timestamp`) VALUES ('0', '0', 'Transfer Funds', 'transfer_email', '<p>Hi {@=to_first_name},</p>
<p>{@=from_first_name} {@=from_last_name} is transferring an amount of Php{@=proper_amount} via {@=proper_transfer_type}. Please click this <a href=''{@=link}''>link</a> to confirm in order to complete the transaction. You may also enter the Confirmation Code into the Transfer Tab by logging-in to your Vital-C account.</p>
<br/>
<p>Email Confirmation Code: <b>{@=confirmation_code}</b></p>
<br/><br/>
<p>If you do not see the link, copy and paste this in your browser:</p>
<br/>
<p>
{@=link}
</p><br/>
<p>Thanks,<br/>Vital-C</p>', '', NULL, '1', '', '', '0000-00-00 00:00:00', CURRENT_TIMESTAMP);