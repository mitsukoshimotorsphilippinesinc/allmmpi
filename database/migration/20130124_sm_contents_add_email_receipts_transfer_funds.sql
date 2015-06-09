INSERT INTO `sm_contents` (`parent_content_id`, `user_id`, `title`, `slug`, `body`, `thumb`, `excerpt`, `is_active`, `path`, `content_type`, `updated_timestamp`, `insert_timestamp`) 
VALUES ('0', '1', 'Transfer Funds Acceptance Receipt', 'transfer_email', '<p>Hi {@=from_first_name},</p>
<p>You are transferring an amount of Php{@=proper_amount} via {@=proper_transfer_type} to {@=proper_name_to_member}. Please click this <a href=''{@=link}''>link</a> to confirm in order to complete the transaction. You may also enter the Confirmation Code into the Transfer Tab by logging-in to your Vital-C account.</p>
<br/>
<p>Email Confirmation Code: <b>{@=confirmation_code}</b></p>
<br/><br/>
<p>If you do not see the link, copy and paste this in your browser:</p>
<br/>
<p>
{@=link}
</p><br/>
<p>Thanks,<br/>Vital-C</p>', '', NULL, '1', '', 'email', '0000-00-00 00:00:00', CURRENT_TIMESTAMP);


INSERT INTO `sm_contents` (`parent_content_id`, `user_id`, `title`, `slug`, `body`, `thumb`, `excerpt`, `is_active`, `path`, `content_type`, `updated_timestamp`, `insert_timestamp`) 
VALUES ('0', '1', 'Transfer Funds Acceptance Receipt', 'transfer_funds_acceptance_receipt', '<p>Hi {@=first_name},</p>
<p>You have received  an amount of Php{@=proper_amount} from {@=proper_sender_name} via Transfer Funds.</p>
<br/>
<p>Transaction ID : <b>{@=proper_transaction_id}</b></p>
<br/><br/>
<p>Thanks,<br/>Vital-C</p>', '', NULL, '1', '', 'email', '0000-00-00 00:00:00', CURRENT_TIMESTAMP);


INSERT INTO `sm_contents` (`parent_content_id`, `user_id`, `title`, `slug`, `body`, `thumb`, `excerpt`, `is_active`, `path`, `content_type`, `updated_timestamp`, `insert_timestamp`) 
VALUES ('0', '1', 'Transfer Funds Notification Receipt', 'transfer_funds_notification_receipt', '<p>Hi {@=first_name},</p>
<p>You have successfully transferred to {@=proper_recipient_name} an amount of Php{@=proper_amount} via Transfer Funds.</p>
<br/>
<p>Transaction ID : <b>{@=proper_transaction_id}</b></p>
<br/><br/>
<p>Thanks,<br/>Vital-C</p>', '', NULL, '1', '', 'email', '0000-00-00 00:00:00', CURRENT_TIMESTAMP);



INSERT INTO `sm_contents` (`parent_content_id`, `user_id`, `title`, `slug`, `body`, `thumb`, `excerpt`, `is_active`, `path`, `content_type`, `updated_timestamp`, `insert_timestamp`) 
VALUES ('0', '1', 'Transfer Funds Request Receipt - Admin', 'transfer_funds_request_receipt_via_admin', '<p>Hi {@=first_name},</p>
<p>We have processed your request to transfer an amount of Php{@=proper_amount} to {@=proper_recipient_name} via Transfer Funds.</p>
<br/>
<p>Transaction ID : <b>{@=proper_transaction_id}</b></p>
<br/><br/>
<p>Thanks,<br/>Vital-C</p>', '', NULL, '1', '', 'email', '0000-00-00 00:00:00', CURRENT_TIMESTAMP);

INSERT INTO `sm_contents` (`parent_content_id`, `user_id`, `title`, `slug`, `body`, `thumb`, `excerpt`, `is_active`, `path`, `content_type`, `updated_timestamp`, `insert_timestamp`) 
VALUES ('0', '1', 'Transfer Funds Acceptance Receipt - Admin', 'transfer_funds_acceptance_receipt_via_admin', '<p>Hi {@=first_name},</p>
<p>We have processed a transfer request from {@=proper_recipient_name} and credited an amount of Php{@=proper_amount} to your Funds via Transfer Funds.</p>
<br/>
<p>Transaction ID : <b>{@=proper_transaction_id}</b></p>
<br/><br/>
<p>Thanks,<br/>Vital-C</p>', '', NULL, '1', '', 'email', '0000-00-00 00:00:00', CURRENT_TIMESTAMP);



INSERT INTO `sm_contents` (`parent_content_id`, `user_id`, `title`, `slug`, `body`, `thumb`, `excerpt`, `is_active`, `path`, `content_type`, `updated_timestamp`, `insert_timestamp`) 
VALUES ('0', '1', 'Transfer Funds - Resend Confirmation Code', 'resend_code_via_admin_from_member', '<p>Hi {@=first_name},</p>
<p>Below are the details of your pending Transfer transaction.</p> 
<br/>
<p>Transaction ID : <b>{@=proper_transaction_id}</b></p>
<p>Confirmation Code : <b>{@=confirmation_code}</b></p>
<p>To Member : <b>{@=proper_to_member_name}</b></p>
<p>Amount : <b>{@=proper_amount}</b></p>
<p>Type : <b>{@=proper_transfer_type}</b></p>
<br/><br/>
<p>Thanks,<br/>Vital-C</p>', '', NULL, '1', '', 'email', '0000-00-00 00:00:00', CURRENT_TIMESTAMP);



