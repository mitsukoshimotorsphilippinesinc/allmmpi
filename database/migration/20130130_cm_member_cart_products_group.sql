-- add group column

ALTER TABLE `cm_member_cart_products` ADD `group` INT( 11 ) NOT NULL DEFAULT '0' AFTER `parent_product_id`;