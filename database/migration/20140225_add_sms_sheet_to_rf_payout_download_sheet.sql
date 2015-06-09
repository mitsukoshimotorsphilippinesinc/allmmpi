INSERT INTO `rf_payout_download_sheets`(`sheet_name`, `sheet_method`, `file_name`)
VALUES ('Sms Count Deductions', 'segmented_sms_count_deductions', '_sms_count_deductions_');

DROP TABLE IF EXISTS `po_member_sms_deductions`;
CREATE TABLE `po_member_sms_deductions` (
    `member_sms_deduction_id` int(11) NOT NULL AUTO_INCREMENT,
    `member_id` int(11) DEFAULT NULL,
    `account_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
    `referral` int(11) DEFAULT NULL,
    `pairing` int(11) DEFAULT NULL,
    `total_sms` int(11) DEFAULT NULL, 
    `total_cost` decimal(10,2) DEFAULT NULL,
    `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`member_sms_deduction_id`),
    KEY `member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;