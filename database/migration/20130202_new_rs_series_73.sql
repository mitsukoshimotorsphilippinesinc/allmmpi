INSERT INTO `rf_settings` (`slug`, `value`, `default`, `system_code`, `is_locked`, `insert_timestamp`) 
VALUES ('ms_annual_maintenance', '4', '4', 'network', '0', CURRENT_TIMESTAMP);

INSERT INTO `rf_settings` (`slug`, `value`, `default`, `system_code`, `is_locked`, `insert_timestamp`) 
VALUES ('ms_monthly_maintenance', '2', '2', 'network', '0', CURRENT_TIMESTAMP);


ALTER TABLE `cm_member_accounts` ADD `ms_monthly_maintenance_ctr` INT( 11 ) UNSIGNED 
NOT NULL DEFAULT '0' AFTER `annual_maintenance_ctr`;

ALTER TABLE `cm_member_accounts` ADD `ms_annual_maintenance_ctr` INT( 11 ) UNSIGNED 
NOT NULL DEFAULT '0' AFTER `ms_monthly_maintenance_ctr`;
