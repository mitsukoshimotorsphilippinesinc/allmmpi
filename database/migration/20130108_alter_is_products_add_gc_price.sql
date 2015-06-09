-- add gc price

ALTER TABLE `is_products` ADD `giftcheque_standard_retail_price` DECIMAL( 11, 2 ) NOT NULL DEFAULT '0.00' AFTER `employee_price`;
ALTER TABLE `is_products` ADD `giftcheque_member_price` DECIMAL( 11, 2 ) NOT NULL DEFAULT '0.00' AFTER `giftcheque_standard_retail_price`;
ALTER TABLE `is_products` ADD `giftcheque_employee_price` DECIMAL( 11, 2 ) NOT NULL DEFAULT '0.00' AFTER `giftcheque_member_price`;
UPDATE `is_products` SET `is_products`.`giftcheque_standard_retail_price` = `is_products`.`standard_retail_price`;
UPDATE `is_products` SET `is_products`.`giftcheque_member_price` = `is_products`.`giftcheque_standard_retail_price`;
UPDATE `is_products` SET `is_products`.`giftcheque_employee_price` = `is_products`.`giftcheque_standard_retail_price`;

DROP VIEW IF EXISTS `is_products_view`;

CREATE VIEW `is_products_view` AS select `p`.`product_id` AS `product_id`,(case when ((isnull(`p`.`product_name`) or (`p`.`product_name` = _utf8'')) and (`p`.`product_type_id` = 1)) then `i`.`item_name` else `p`.`product_name` end) AS `product_name`,`p`.`product_type_id` AS `product_type_id`,`p`.`product_line_id` AS `product_line_id`,(case when ((isnull(`p`.`product_code`) or (`p`.`product_code` = _utf8'')) and (`p`.`product_type_id` = 1)) then `i`.`item_code` else `p`.`product_code` end) AS `product_code`,(case when ((isnull(`p`.`product_description`) or (`p`.`product_description` = _utf8'')) and (`p`.`product_type_id` = 1)) then `i`.`item_description` else `p`.`product_description` end) AS `product_description`,`r`.`product_line` AS `product_line`,`p`.`item_id` AS `item_id`,`i`.`item_name` AS `item_name`,`i`.`item_description` AS `item_description`,`p`.`image_filename` AS `image_filename`,`p`.`standard_retail_price` AS `standard_retail_price`,`p`.`member_price` AS `member_price`,`p`.`employee_price` AS `employee_price`,`p`.`giftcheque_standard_retail_price` AS `giftcheque_standard_retail_price`,`p`.`giftcheque_member_price` AS `giftcheque_member_price`,`p`.`giftcheque_employee_price` AS `giftcheque_employee_price`,`p`.`igpsm_points` AS `igpsm_points`,`i`.`item_type_id` AS `item_type_id`,`i`.`item_sub_type_id` AS `item_sub_type_id`,`i`.`sub_category` AS `sub_category`,`p`.`is_active` AS `is_active`,`p`.`is_display` AS `is_display`,`p`.`is_visible` AS `is_visible`,`p`.`is_vatable` AS `is_vatable`,`p`.`is_gc_buyable` AS `is_gc_buyable`,`p`.`is_product_rebate` AS `is_product_rebate`,`p`.`insert_timestamp` AS `insert_timestamp` from ((`is_products` `p` left join `is_items` `i` on((`p`.`item_id` = `i`.`item_id`))) left join `rf_product_lines` `r` on((`p`.`product_line_id` = `r`.`product_line_id`)));