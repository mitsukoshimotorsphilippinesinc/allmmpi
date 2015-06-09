CREATE TABLE `et_jobs` (
  `job_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `job_type_id` int(11) unsigned NOT NULL DEFAULT '0',
  `parameters` text,
  `status` varchar(16) NOT NULL DEFAULT 'pending',
  `exceptions` text,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

CREATE TABLE `rf_job_types` (
  `job_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_code` varchar(16) NOT NULL DEFAULT '',
  `scripts` text,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`job_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `rf_job_types` (`job_type_id`, `job_code`, `scripts`, `insert_timestamp`)
VALUES
	(1, 'encode_rs', 'jobs/encoding/process|jobs/commissions/credit_points|jobs/commissions/credit_repeat_sales_commission|jobs/raffle/process', '2013-01-16 12:56:23');

DROP VIEW IF EXISTS `et_jobs_view`;
CREATE VIEW `et_jobs_view`
AS select
   `a`.`job_id` AS `job_id`,
   `a`.`job_type_id` AS `job_type_id`,
   `b`.`job_code` AS `job_code`,
   `b`.`scripts` AS `scripts`,
   `a`.`parameters` AS `parameters`,
   `a`.`status` AS `status`,
   `a`.`exceptions` AS `exceptions`,
   `a`.`insert_timestamp` AS `insert_timestamp`
from (`et_jobs` `a` left join `rf_job_types` `b` on((`a`.`job_type_id` = `b`.`job_type_id`)));


INSERT INTO `rf_job_types` (`job_type_id`, `job_code`, `scripts`, `insert_timestamp`)
VALUES
  (2, 'card_series', 'jobs/cards/create_series', '2013-01-18 17:29:41');

INSERT INTO `rf_job_types` (`job_type_id`, `job_code`, `scripts`, `insert_timestamp`)
VALUES
  (3, 'registration', 'jobs/register/process', '2013-01-30 16:07:11');

