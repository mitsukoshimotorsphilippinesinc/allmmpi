ALTER TABLE  `rf_card_types` ADD  `merge_to_point_type` INT NOT NULL AFTER  `points`;

UPDATE
	rf_card_types
SET
	merge_to_point_type = card_type_id;