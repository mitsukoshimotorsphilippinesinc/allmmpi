INSERT INTO `rf_card_series` (`series_number`, `is_package`, `status`, `card_type_id`)
VALUES
	('72', 0, 'ACTIVE', 0);

INSERT INTO `rf_card_types` (`code`, `name`, `is_package`, `status`, `is_locked`, `points_to_pair`, `points`, `merge_to_point_type`, `description`)
VALUES
	('RS72', 'Repeat Sale Raffle', 0, 'ACTIVE', 0, 700.00, 25.00, 19, 'Repeat Sale Raffle');

