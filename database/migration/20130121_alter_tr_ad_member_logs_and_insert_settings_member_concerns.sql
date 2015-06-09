ALTER TABLE `tr_ad_member_logs` ADD `inquiry_type` VARCHAR(255) DEFAULT NULL AFTER `member_id` ;

INSERT INTO rf_settings VALUES ('support_types', '{"profile":"Profile","accounts":"Accounts", "encode_sales":"Encode Sales","vouchers":"Vouchers","genealogy":"Genealogy","raffle":"Raffle", "transfer_funds":"Transfer Funds", "shopping_cart":"Shopping Cart", "earnings":"Earnings", "others":"Others"}', '', 'system', 0, CURRENT_TIMESTAMP);

ALTER TABLE `tr_ad_member_logs` MODIFY `status` VARCHAR(20);

INSERT INTO sm_contents VALUES ("", 0, 0, 'Member Concern', 'support-concern', "<p>Hi {@=first_name},</p>
<p>You have sent a concern regarding {@=inquiry_type}. Your Ticket ID for this concern is {@=generated_code}. You can use this ID check the status and remarks for this concern in the Support section of the Member's Area.</p>
<br/>
<p>Thanks,<br/>Vital-C</p>", "", "", 1, "", 'email', '', CURRENT_TIMESTAMP);