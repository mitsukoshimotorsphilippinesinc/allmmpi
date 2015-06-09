
ALTER TABLE  `rf_card_modifiers` ADD  `insert_timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP AFTER  `user_id` ;

ALTER TABLE  `tr_card_series_generation_log` CHANGE  `card_series_code`  `card_series_code` VARCHAR( 10 ) NOT NULL ;

ALTER TABLE  `rf_card_type_series` ADD  `used` INT NOT NULL DEFAULT  '0' AFTER  `qty` ;