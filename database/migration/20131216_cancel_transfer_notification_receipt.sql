INSERT INTO `sm_contents` (`parent_content_id`, `user_id`, `title`, `slug`, `body`, `thumb`, `excerpt`, `is_active`, `path`, `content_type`, `updated_timestamp`, `insert_timestamp`) VALUES (0, 1, 'Cancel Transfer Commission Notification Receipt', 'cancel_transfer_funds_notification_receipt', '<p>Hi {@=first_name},</p>
<p>You have cancelled the Commission Transfer to {@=proper_recipient_name} with an amount of Php{@=proper_amount}. The amount is returned to the your {@=proper_transfer_type}</p>
<br/>
<p>Transaction ID : <b>{@=proper_transaction_id}</b></p>
<br/><br/>
<p>Thanks,<br/>Vital-C</p>', '', NULL, 1, '', 'email_template', '0000-0-0 00:00:00', '2013-11-20 10:25:28');



INSERT INTO `sm_contents` (`parent_content_id`, `user_id`, `title`, `slug`, `body`, `thumb`, `excerpt`, `is_active`, `path`, `content_type`, `updated_timestamp`, `insert_timestamp`) VALUES (0, 1, 'Resend Code to Member', 'resend_code_to_member', '<p>Hi {@=first_name},</p>
<p>Below are the details of your pending Transfer transaction.</p> 
<br/>
<p>Transaction ID : <b>{@=proper_transaction_id}</b></p>
<p>Confirmation Code : <b>{@=confirmation_code}</b></p>
<p>To Member : <b>{@=proper_to_member_name}</b></p>
<p>Amount : <b>{@=proper_amount}</b></p>
<p>Type : <b>{@=proper_transfer_type}</b></p>
<br/><br/>
<p>Thanks,<br/>Vital-C</p>', '', NULL, 1, '', 'email_template', '0000-0-0 00:00:00', '2013-11-20 10:25:28');


