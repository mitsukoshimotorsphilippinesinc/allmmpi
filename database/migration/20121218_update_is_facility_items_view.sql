-- get unit_id from is_items instead of is_facility_items

DROP VIEW IF EXISTS `is_facility_items_view`;

CREATE VIEW `is_facility_items_view`
AS select
   `a`.`facility_item_id` AS `facility_item_id`,
   `a`.`facility_id` AS `facility_id`,
   `a`.`item_id` AS `item_id`,
   `b`.`item_name` AS `item_name`,
   `b`.`item_description` AS `item_description`,
   `a`.`qty` AS `qty`,
   `b`.`unit_id` AS `unit_id`,
   `c`.`unit_name` AS `unit_name`,
   `a`.`critical_qty` AS `critical_qty`,
   `a`.`update_timestamp` AS `update_timestamp`,
   `a`.`insert_timestamp` AS `insert_timestamp`
from ((`is_facility_items` `a` left join `is_items` `b` on((`a`.`item_id` = `b`.`item_id`))) left join `is_units` `c` on((`b`.`unit_id` = `c`.`unit_id`)));