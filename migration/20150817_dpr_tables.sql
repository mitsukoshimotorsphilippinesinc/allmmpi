DROP TABLE IF EXISTS `rf_printing_press`;
CREATE TABLE `rf_printing_press` (
  `printing_presS_id` 			int(11) NOT NULL AUTO_INCREMENT,
  `complete_name` 				varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` 					varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_number` 				int(2) NOT NULL DEFAULT 0,  
  `is_active`					tinyint(2) NOT NULL DEFAULT 0,  
  `is_deleted`					tinyint(2) NOT NULL DEFAULT 0,  
  `remarks` 					text COLLATE utf8_unicode_ci,
  `update_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (printing_presS_id),
  KEY `name` (`name`)  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO rf_printing_press`(complete_name, complete_address, contact_number)
VALUES ('PRINTING PRESS ONE', '123 BLUMENTRITT COR. ESPANA MANILA', '(02)123-4567');
INSERT INTO rf_printing_press`(complete_name, complete_address, contact_number)
VALUES ('PRINTING PRESS TWO', '123 QUEZON AVE QUEZON CITY', '(02)321-1111');

DROP TABLE IF EXISTS `rf_form`;
CREATE TABLE `rf_form` (
	`form_id`					int(11) NOT NULL AUTO_INCREMENT,
	`name`						varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
	`code`						varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
	`description`				varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
	`parent_form_id`			int(11) NOT NULL DEFAULT 0,
	`bir_required`				tinyint(2) NOT NULL DEFAULT 0,  
	`is_active`					tinyint(2) NOT NULL DEFAULT 0,  
	`is_deleted`				tinyint(2) NOT NULL DEFAULT 0,  
	`remarks` 					text COLLATE utf8_unicode_ci,
  `update_timestamp` 			timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `insert_timestamp` 			timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (form_id),
  KEY `form_name` (`form_name`),
  KEY `form_code` (`form_code`),
  KEY `bir_required` (`bir_required`),
  KEY `parent_form_id` (`parent_form_id`),
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO rf_form(name, code, description, bir_required)
VALUES ('OFFICIAL RECEIPT', 'OR', 'OFFICIAL RECIPT', '1');
INSERT INTO rf_form(name, code, description, bir_required)
VALUES ('COLLECTION RECEIPT', 'CR', 'COLLECTION RECIPT', '1');
INSERT INTO rf_form(name, code, description, bir_required)
VALUES ('DELIVERY RECEIPT', 'DR', 'DELIVERY RECIPT', '1');
INSERT INTO rf_form(name, code, description, bir_required)
VALUES ('SALES INVOICE', 'SI', 'SALES INVOICE', '1');
INSERT INTO rf_form(name, code, description, bir_required)
VALUES ('CASH SALES INVOICE', 'CASH SI', 'CASH SALES INVOICE', '1');
INSERT INTO rf_form(name, code, description, bir_required)
VALUES ('CHARGE SALES INVOICE', 'CHARGE SI', 'CHARGE SALES INVOICE', '1');
INSERT INTO rf_form(name, code, description, bir_required)
VALUES ('CASH INVOICE', 'CI', 'CASH INVOICE', '1');
INSERT INTO rf_form(name, code, description, bir_required)
VALUES ('', 'SISP', '', '1');

DROP TABLE `rf_department_module`;
CREATE TABLE `rf_department_module` (
  `department_module_id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N/A',
  `department_id` int(11) NOT NULL DEFAULT '0',
  `module_code` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'NON',
  `segment_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(2) NOT NULL DEFAULT '0',
  `signatory_id_number` int(11) NOT NULL DEFAULT '0',
  `update_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`department_module_id`),
  KEY `module_name` (`module_name`),
  KEY `department_id` (`department_id`),
  KEY `module_code` (`module_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `rf_department_module`(module_name, department_id, segment_name, is_active)
VALUES('Form Request', '33', 'form_request', '1');
INSERT INTO `rf_department_module`(module_name, department_id, segment_name, is_active)
VALUES('Delivery', '33', 'delivery', '1');
INSERT INTO `rf_department_module`(module_name, department_id, segment_name, is_active)
VALUES('Inventory', '33', 'inventory', '1');
INSERT INTO `rf_department_module`(module_name, department_id, segment_name, is_active)
VALUES('Branch Transactions', '33', 'branch_transactions', '1');
INSERT INTO `rf_department_module`(module_name, department_id, segment_name, is_active)
VALUES('Reports', '33', 'reports', '1');
INSERT INTO `rf_department_module`(module_name, department_id, segment_name, is_active)
VALUES('Maintenance', '33', 'maintenance', '1');

CREATE TABLE `rf_department_module_submodule` (
  `department_module_submodule_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_module_id` int(11) NOT NULL DEFAULT '0',
  `submodule_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `submodule_url` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `priority_order` int(2) NOT NULL DEFAULT '0',
  `is_active` tinyint(2) NOT NULL DEFAULT '0',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`department_module_submodule_id`),
  KEY `department_module_id` (`department_module_id`),
  KEY `submodule_name` (`submodule_name`),
  KEY `submodule_url` (`submodule_url`),
  KEY `priority_order` (`priority_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `rf_department_module_submodule`(department_module_id, submodule_name, submodule_url, priority_order, is_active)
VALUES ('1', 'Accountable Forms', '/accountables', '1', '1');
INSERT INTO `rf_department_module_submodule`(department_module_id, submodule_name, submodule_url, priority_order, is_active)
VALUES ('1', 'Non-Accountable Forms', '/non_accountables', '2', '1');

INSERT INTO `rf_department_module_submodule`(department_module_id, submodule_name, submodule_url, priority_order, is_active)
VALUES ('1', 'Accountable Forms', '/accountables', '1', '1');
INSERT INTO `rf_department_module_submodule`(department_module_id, submodule_name, submodule_url, priority_order, is_active)
VALUES ('1', 'Non-Accountable Forms', '/non_accountables', '2', '1');
