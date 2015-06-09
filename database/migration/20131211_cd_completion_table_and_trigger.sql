INSERT INTO `rf_payout_download_sheets` (`sheet_id`, `sheet_name`, `sheet_method`, `file_name`, `insert_timestamp`)
VALUES
	(11, 'Vouchers Released', 'segmented_vouchers_released', '_vouchers_released_', '2013-12-11 18:42:28'),
	(12, 'CD Completions', 'segmented_commission_deduct_completions', '_commission_deduct_completions_', '2013-12-11 21:35:05');

CREATE TABLE `trg_commission_deduct_completion` (
  `cd_completion_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `account_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cd_completion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DELIMITER ;;
/*!50003 CREATE */ /*!50003 TRIGGER `cd_completion` BEFORE UPDATE ON `cm_member_accounts` FOR EACH ROW BEGIN
	IF NEW.cd_amount = 0 THEN
	INSERT INTO
		trg_commission_deduct_completion
	(
		`member_id`,
		`account_id`
	)
	VALUES
	(
		NEW.member_id,
		NEW.account_id
	);
	END IF;
END */;;
DELIMITER ;