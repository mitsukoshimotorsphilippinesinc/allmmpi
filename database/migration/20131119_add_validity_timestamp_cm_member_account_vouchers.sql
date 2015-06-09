
INSERT into cm_member_account_vouchers(voucher_code, confirmation_code, voucher_type_id, member_id, original_member_id, original_account_id, to_member_id, ar_number, status, transfer_count, redeemed_by, redeemed_timestamp, updated_timestamp)
values ('FPV0000001', '1234567890', 1, 34937, 34937, '6500001390', 'NULL', '', 'ACTIVE', 0, 'NULL', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

INSERT into cm_member_account_vouchers(voucher_code, confirmation_code, voucher_type_id, member_id, original_member_id, original_account_id, to_member_id, ar_number, status, transfer_count, redeemed_by, redeemed_timestamp, updated_timestamp)
values ('FPV0000002', 'ADFGJKLFDP', 1, 34937, 34937, '6500001390', 'NULL', '', 'ACTIVE', 0, 'NULL', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

INSERT into cm_member_account_vouchers(voucher_code, confirmation_code, voucher_type_id, member_id, original_member_id, original_account_id, to_member_id, ar_number, status, transfer_count, redeemed_by, redeemed_timestamp, updated_timestamp)
values ('FPV0000003', '12345QWERT', 1, 34937, 34937, '6500001390', 1162, '123456', 'TRANSFERRING', 0, 'NULL', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

INSERT into cm_member_account_vouchers(voucher_code, confirmation_code, voucher_type_id, member_id, original_member_id, original_account_id, to_member_id, ar_number, status, transfer_count, redeemed_by, redeemed_timestamp, updated_timestamp)
values ('FPV0000004', 'QWERT67890', 1, 34937, 34937, '6500001390', 'NULL', '123456', 'INACTIVE', 0, 'NULL', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- sm_contents
INSERT INTO sm_contents (user_id, title, slug, `body`, is_active, content_type)
VALUES(1,
'Transfer Voucher',
'transfer_voucher',
'<p>Hi {@=from_first_name},</p>
<p>You are transferring a voucher with Voucher Code {@=voucher_code} to {@=proper_name_to_member}. Please click this <a href=''{@=link}''>link</a> to confirm in order to complete the transaction. You may also enter the Confirmation Code into the Vouchers Tab by logging-in to your Vital-C account.</p>
<br/>
<p>Email Confirmation Code: <b>{@=confirmation_code}</b></p>
<br/><br/>
<p>If you do not see the link, copy and paste this in your browser:</p>
<br/>
<p>
{@=link}
</p><br/>
<p>Thanks,<br/>Vital-C</p>',
1,
'email_template');


INSERT INTO sm_contents (user_id, title, slug, `body`, is_active, content_type)
VALUES(1,
'Transfer Voucher Acceptance Receipt',
'transfer_voucher_acceptance_receipt',
'<p>Hi {@=first_name},</p>
<p>You have received  Voucher {@=voucher_code} from {@=proper_sender_name} via Transfer Transfer. The amount is added to your list of Vouchers.</p>
<br/>
<p>Voucher Transaction ID : <b>{@=proper_voucher_id}</b></p>
<br/><br/>
<p>Thanks,<br/>Vital-C</p>',
1,
'email_template');


INSERT INTO sm_contents (user_id, title, slug, `body`, is_active, content_type)
VALUES(1,
'Transfer Voucher Notification Receipt',
'transfer_funds_notification_receipt',
'<p>Hi {@=first_name},</p>
<p>You have successfully transferred to {@=proper_recipient_name} Voucher {@=voucher_code} via Voucher Transfer. The voucher is added to the recipient''s list of Vouchers.</p>
<br/>
<p>Voucher Transaction ID : <b>{@=proper_voucher_id}</b></p>
<br/><br/>
<p>Thanks,<br/>Vital-C</p>',
1,
'email_template');


INSERT INTO sm_contents (user_id, title, slug, `body`, is_active, content_type)
VALUES(1,
'Cancel Transfer Voucher Acceptance Receipt',
'cancel_transfer_voucher_acceptance_receipt',
'<p>Hi {@=first_name},</p>
<p>Voucher Transfer with code {@=voucher_code} from {@=proper_sender_name} was cancelled.</p>
<br/>
<p>Voucher Transaction ID : <b>{@=proper_voucher_id}</b></p>
<br/><br/>
<p>Thanks,<br/>Vital-C</p>',
1,
'email_template');


INSERT INTO sm_contents (user_id, title, slug, `body`, is_active, content_type)
VALUES(1,
'Cancel Transfer Voucher Notification Receipt',
'cancel_transfer_voucher_notification_receipt',
'<p>Hi {@=first_name},</p>
<p>You have successfully cancelled Voucher Transfer with code {@=voucher_code} for {@=proper_recipient_name}.</p>
<br/>
<p>Voucher Transaction ID : <b>{@=proper_voucher_id}</b></p>
<br/><br/>
<p>Thanks,<br/>Vital-C</p>',
1,
'email_template');


INSERT INTO sm_contents (user_id, title, slug, `body`, is_active, content_type)
VALUES(1,
'Voucher Transfer - Resend Confirmation Code',
'resend_voucher_code_via_admin_from_member',
'<p>Hi {@=first_name},</p>
<p>Below are the details of your pending Transfer transaction.</p> 
<br/>
<p>Transaction ID : <b>{@=proper_transaction_id}</b></p>
<p>Confirmation Code : <b>{@=confirmation_code}</b></p>
<p>To Member : <b>{@=proper_to_member_name}</b></p>
<p>Voucher Code : <b>{@=voucher_code}</b></p>
<br/><br/>
<p>Thanks,<br/>Vital-C</p>',
1,
'email_template');


-- voucher transfer logs table
DROP TABLE IF EXISTS `tr_member_voucher_transfer_logs`;
CREATE TABLE `tr_member_voucher_transfer_logs` (
  `member_voucher_transfer_id` int(20) NOT NULL AUTO_INCREMENT,
  `voucher_id` int(11) NOT NULL DEFAULT '0',
  `from_member_id` int(11) DEFAULT '0',
  `to_member_id` int(11) DEFAULT '0',
  `details_before` text COLLATE utf8_unicode_ci,    
  `details_after` text COLLATE utf8_unicode_ci,    
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`member_voucher_transfer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ad_navigations
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


