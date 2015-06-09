-- add dr_id column to is_purchase_orders

ALTER TABLE  `is_purchase_orders` ADD  `dr_id` VARCHAR( 20 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT  '' AFTER  `supplier_id`