DROP TABLE IF EXISTS `rf_setting`;
CREATE TABLE `rf_setting` (  
  `slug` 						varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` 						text COLLATE utf8_unicode_ci NOT NULL,
  `default` 					text COLLATE utf8_unicode_ci NOT NULL,  
  `department_id` 				int(11) NOT NULL DEFAULT 0,  
  `is_locked` 					tinyint(4) NOT NULL DEFAULT '0',
  `insert_timestamp` 			timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`slug`),
  KEY `department_id` (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `rf_setting`(`slug`, `value`, `default`, `department_id`, `is_locked`)
VALUES ('series_per_booklet', '50', '50', '33', '1');


DROP TABLE IF EXISTS `rf_job_type`;
CREATE TABLE `rf_job_type` (
  `job_type_id` 				int(11) NOT NULL AUTO_INCREMENT,
  `job_code` 					varchar(16) NOT NULL DEFAULT '',
  `department_id` 				int(11) NOT NULL DEFAULT 0,
  `module_id`					int(11) NOT NULL DEFAULT 0,
  `submodule_id`				int(11) NOT NULL DEFAULT 0,
  `scripts` 					text,
  `insert_timestamp` 			timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`job_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8  COLLATE=utf8_unicode_ci;

INSERT INTO rf_job_type(job_code, scripts, department_id, module_id, submodule_id)
VALUES('generate_booklet', '/jobs/dpr/generate_booklet', 33, 2, 0);

DROP TABLE IF EXISTS `et_job`;	
CREATE TABLE `et_job` (
  `job_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `job_type_id` int(11) unsigned NOT NULL DEFAULT '0',
  `parameters` text,
  `status` varchar(30) NOT NULL DEFAULT 'PENDING',
  `exceptions` text,
  `processing_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `completed_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8  COLLATE=utf8_unicode_ci;

DROP VIEW IF EXISTS `et_job_view`;
CREATE VIEW `et_job_view` 
AS select 
`a`.`job_id` AS `job_id`,
`a`.`job_type_id` AS `job_type_id`,
`b`.`job_code` AS `job_code`,
`b`.`department_id` AS `department_id`,
`b`.`module_id` AS `module_id`,
`b`.`submodule_id` AS `submodule_id`,
`b`.`scripts` AS `scripts`,
`a`.`parameters` AS `parameters`,
`a`.`status` AS `status`,
`a`.`exceptions` AS `exceptions`,
`a`.`processing_timestamp` AS `processing_timestamp`,
`a`.`completed_timestamp` AS `completed_timestamp`,
`a`.`insert_timestamp` AS `insert_timestamp` 
FROM (`et_job` `a` 
LEFT JOIN `rf_job_type` `b` ON((`a`.`job_type_id` = `b`.`job_type_id`)));
