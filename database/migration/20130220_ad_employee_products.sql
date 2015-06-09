DROP TABLE IF EXISTS `ad_employee_products`;
CREATE TABLE IF NOT EXISTS `ad_employee_products` (
  `employee_id` int(11) unsigned NOT NULL,
  `product_id` int(11) NOT NULL,
  `available_qty` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`employee_id`,`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

DROP VIEW IF EXISTS `ad_employee_products_view`;
CREATE VIEW `ad_employee_products_view` AS
SELECT
	`a`.`employee_id` as `employee_id`,
	`a`.`product_id` as `product_id`,
	`b`.`employee_slots` as `employee_slots`,
	`a`.`available_qty` as `available_qty`
FROM
	`ad_employee_products` `a`
LEFT JOIN
	`is_products` `b`
ON
	`a`.`product_id` = `b`.`product_id`;