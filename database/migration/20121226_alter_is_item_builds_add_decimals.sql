-- allow decimals for item builds

ALTER TABLE `is_item_builds` CHANGE `quantity` `quantity` DECIMAL( 15, 4 ) NULL DEFAULT NULL