INSERT INTO `rf_job_types` (`job_type_id`, `job_code`, `scripts`, `insert_timestamp`) 
VALUES
(4, 'payout', 'jobs/payout/process', '2013-02-08 06:08:01');

CREATE TABLE IF NOT EXISTS `rf_payout_download_sheets` (
  `sheet_id` int(11) NOT NULL AUTO_INCREMENT,
  `sheet_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `sheet_method` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `file_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sheet_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `rf_payout_download_sheets` (`sheet_id`, `sheet_name`, `sheet_method`, `file_name`, `insert_timestamp`) VALUES
(1, 'Members Payout', 'segmented_download_member_payout', '_member_payout_', '2013-02-08 05:01:55'),
(2, 'Commission per Account', 'segmented_download_commission_per_account', '_commission_per_account_', '2013-02-08 05:05:31'),
(3, '3 Month Old per Account', 'segmented_download_3_month_old_per_account', '_3_month_old_per_account_', '2013-02-08 05:05:31'),
(4, '3 Month Old per Member', 'segmented_download_3_month_old_per_member', '_3_month_old_per_member_', '2013-02-08 05:07:30'),
(5, 'Gift Cheques per Account', 'segmented_download_gift_cheques_per_account', '_gift_cheques_per_account_', '2013-02-08 05:07:30'),
(6, 'Transferred Funds', 'segmented_download_transferred_funds', '_transferred_funds_', '2013-02-08 05:09:16'),
(7, 'Transferred Gift Cheques', 'segmented_download_transferred_gift_cheques', '_transferred_gift_cheques_', '2013-02-08 05:09:16'),
(8, 'Transaction Logs', 'segmented_transaction_logs', '_transaction_logs_', '2013-02-11 03:44:29');

CREATE TABLE IF NOT EXISTS `po_download_sheet_processing` (
  `process_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`process_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
