ALTER TABLE is_products ADD is_raffle tinyint(1) DEFAULT 0 AFTER is_variable_price;

DROP VIEW IF EXISTS `is_products_view`;
CREATE VIEW `is_products_view`
AS select
   `p`.`product_id` AS `product_id`,(case when ((isnull(`p`.`product_name`) or (`p`.`product_name` = _utf8'')) and (`p`.`product_type_id` = 1)) then `i`.`item_name` else `p`.`product_name` end) AS `product_name`,
   `p`.`product_type_id` AS `product_type_id`,
   `p`.`product_line_id` AS `product_line_id`,(case when ((isnull(`p`.`product_code`) or (`p`.`product_code` = _utf8'')) and (`p`.`product_type_id` = 1)) then `i`.`item_code` else `p`.`product_code` end) AS `product_code`,(case when ((isnull(`p`.`product_description`) or (`p`.`product_description` = _utf8'')) and (`p`.`product_type_id` = 1)) then `i`.`item_description` else `p`.`product_description` end) AS `product_description`,
   `r`.`product_line` AS `product_line`,
   `p`.`item_id` AS `item_id`,
   `i`.`item_name` AS `item_name`,
   `i`.`item_description` AS `item_description`,
   `p`.`image_filename` AS `image_filename`,
   `p`.`standard_retail_price` AS `standard_retail_price`,
   `p`.`member_price` AS `member_price`,
   `p`.`employee_price` AS `employee_price`,
   `p`.`giftcheque_standard_retail_price` AS `giftcheque_standard_retail_price`,
   `p`.`giftcheque_member_price` AS `giftcheque_member_price`,
   `p`.`giftcheque_employee_price` AS `giftcheque_employee_price`,
   `p`.`employee_slots` AS `employee_slots`,
   `p`.`is_igpsm` AS `is_igpsm`,
   `p`.`igpsm_points` AS `igpsm_points`,
   `i`.`item_type_id` AS `item_type_id`,
   `i`.`item_sub_type_id` AS `item_sub_type_id`,
   `i`.`sub_category` AS `sub_category`,
   `p`.`is_active` AS `is_active`,
   `p`.`is_display` AS `is_display`,
   `p`.`is_visible` AS `is_visible`,
   `p`.`is_vatable` AS `is_vatable`,
   `p`.`is_gc_buyable` AS `is_gc_buyable`,
   `p`.`is_gc_exclusive` AS `is_gc_exclusive`,
   `p`.`is_product_rebate` AS `is_product_rebate`,
   `p`.`is_variable_price` AS `is_variable_price`,
   `p`.`is_raffle` AS `is_raffle`,
   `p`.`insert_timestamp` AS `insert_timestamp`
from ((`is_products` `p` left join `is_items` `i` on((`p`.`item_id` = `i`.`item_id`))) left join `rf_product_lines` `r` on((`p`.`product_line_id` = `r`.`product_line_id`)));


CREATE TABLE IF NOT EXISTS is_raffle_products (
	product_id INT(11),
	qty_needed INT(11),
	qty_generated INT(11),
	insert_timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO rm_raffle_process_points (raffle_id, process_point, process_type) VALUES (2, 'webpoi', 'indiv');