-- change qty type from integer to decimal

ALTER TABLE `is_facility_items` CHANGE `qty` `qty` DECIMAL( 15, 4 ) NULL DEFAULT NULL;
ALTER TABLE `is_facility_items` CHANGE `critical_qty` `critical_qty` DECIMAL( 15, 4 ) NULL DEFAULT NULL;