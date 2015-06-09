ALTER TABLE  `rt_facility_items` CHANGE  `insert_date`  `insert_timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;

DROP VIEW IF EXISTS `rt_facility_items_view`;
CREATE VIEW `rt_facility_items_view` AS select `r`.`facility_id` AS `facility_id`,`r`.`item_id` AS `item_id`,`i`.`item_name` AS `item_name`,`r`.`qty` AS `qty`,`r`.`unit_id` AS `unit_id`,`r`.`insert_timestamp` AS `insert_timestamp` from (`rt_facility_items` `r` left join `is_items` `i` on((`r`.`item_id` = `i`.`item_id`)));

ALTER TABLE  `rt_facility_items_receiving` CHANGE  `insert_date`  `insert_timestamp` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;
DROP VIEW IF EXISTS `rt_facility_items_receiving_view`;
CREATE VIEW `rt_facility_items_receiving_view` AS select `r`.`facility_id` AS `facility_id`,`r`.`item_id` AS `item_id`,`i`.`item_name` AS `item_name`,`i`.`item_code` AS `item_code`,`r`.`qty` AS `qty`,`r`.`unit_id` AS `unit_id`,`u`.`unit_name` AS `unit_name`,`r`.`insert_timestamp` AS `insert_timestamp` from ((`rt_facility_items_receiving` `r` join `is_items` `i`) join `is_units` `u`) where ((`r`.`item_id` = `i`.`item_id`) and (`r`.`unit_id` = `u`.`unit_id`));

ALTER TABLE  `rt_facility_items_releasing` CHANGE  `insert_date`  `insert_timestamp` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;
DROP VIEW IF EXISTS `rt_facility_items_releasing_view`;
CREATE VIEW `rt_facility_items_releasing_view` AS select `r`.`facility_id` AS `facility_id`,`r`.`item_id` AS `item_id`,`i`.`item_name` AS `item_name`,`i`.`item_code` AS `item_code`,`r`.`qty` AS `qty`,`r`.`unit_id` AS `unit_id`,`u`.`unit_name` AS `unit_name`,`r`.`insert_timestamp` AS `insert_timestamp` from ((`rt_facility_items_releasing` `r` join `is_items` `i`) join `is_units` `u`) where ((`r`.`item_id` = `i`.`item_id`) and (`r`.`unit_id` = `u`.`unit_id`));