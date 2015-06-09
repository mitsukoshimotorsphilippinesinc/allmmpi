DROP TABLE IF EXISTS `tr_voided_rs_cards`;
CREATE TABLE IF NOT EXISTS `tr_voided_rs_cards` (
	`log_id` int(11) NOT NULL AUTO_INCREMENT,
	`card_id` varchar(64) DEFAULT NULL,
	`transaction_id` int(11) DEFAULT NULL,
	`member_id` int(11) DEFAULT NULL,
	`insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;