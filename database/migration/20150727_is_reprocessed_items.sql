DROP TABLE IF EXISTS `is_reprocessed_item`;
CREATE TABLE `is_reprocessed_item` (
	`reprocessed_item_id`		int(11) NOT NULL AUTO_INCREMENT,
	`department_module_id`		int(11) NOT NULL DEFAULT 0,
	`request_id`				int(11) NOT NULL DEFAULT 0,
	`request_detail_id`			int(11) NOT NULL DEFAULT 0,
	`id_number`					varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
	`charge_discount` 			decimal(5,2) NOT NULL DEFAULT '0.00',
	`charge_discount_amount` 	decimal(10,2) NOT NULL DEFAULT '0.00',
	`total_amount` 				decimal(10,2) NOT NULL DEFAULT '0.00',
	`good_quantity`				decimal(10,2) NOT NULL DEFAULT '0.00',
	`bad_quantity`				decimal(10,2) NOT NULL DEFAULT '0.00',	
	`action` 					varchar(30) COLLATE utf8_unicode_ci DEFAULT 'RETURN',
	`status` 					varchar(30) COLLATE utf8_unicode_ci DEFAULT 'PREPARING',
	`remarks` 					text COLLATE utf8_unicode_ci,
	`update_timestamp` 			timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
	`insert_timestamp` 			timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`reprocessed_item_id`),
	KEY `department_module_id` (`department_module_id`),
	KEY `request_id` (`request_id`),
	KEY `request_detail_id` (`request_detail_id`),
	KEY `action` (`action`),
	KEY `status` (`status`),
	KEY `id_number` (`id_number`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;