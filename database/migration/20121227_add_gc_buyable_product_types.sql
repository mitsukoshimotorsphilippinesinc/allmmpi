-- add gc buyable status of product type

ALTER TABLE `rf_product_types` ADD `is_gc_buyable` TINYINT( 1 ) NOT NULL DEFAULT '0' AFTER `is_visible`;

UPDATE `rf_product_types` SET `is_gc_buyable` = '1' WHERE `rf_product_types`.`product_type_id` = 1;

INSERT INTO `rf_product_types` (
`product_type_id` ,
`name` ,
`is_visible` ,
`is_gc_buyable`
)
VALUES (
NULL , 'GC PACKAGES', '1', '1');