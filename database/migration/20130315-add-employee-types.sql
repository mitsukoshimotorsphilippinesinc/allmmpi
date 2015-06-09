DROP TABLE IF EXISTS `rf_employee_types`;
CREATE TABLE `rf_employee_types` (
  `employee_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`employee_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `rf_employee_types` (`employee_type_id`, `name`) VALUES ('', 'EMPLOYEE');
INSERT INTO `rf_employee_types` (`employee_type_id`, `name`) VALUES ('', 'CORPO');

ALTER TABLE `ad_employees` ADD `employee_type_id` int(11) DEFAULT 1 AFTER `mobile_number`;