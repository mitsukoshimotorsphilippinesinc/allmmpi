-- add price column for cm_member_cart_products

ALTER TABLE `cm_member_cart_products` ADD `price` DECIMAL( 11, 2 ) NOT NULL DEFAULT '0.00' AFTER `qty`;