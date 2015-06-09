DROP TABLE IF EXISTS `cm_non_members`;
CREATE TABLE `cm_non_members` (
 `non_member_id` INT(11) NOT NULL AUTO_INCREMENT,
 `temp_account_id` VARCHAR(20) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
 `last_name` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
 `first_name` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
 `middle_name` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
 `email` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
 `contact_number` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
 `address` TEXT NULL COLLATE 'utf8_unicode_ci',
 `referror` TEXT NULL COLLATE 'utf8_unicode_ci',
 `insert_timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
 PRIMARY KEY (`non_member_id`),
 INDEX `temp_account_id` (`temp_account_id`),
 INDEX `last_name` (`last_name`),
 INDEX `first_name` (`first_name`),
 INDEX `middle_name` (`middle_name`),
 INDEX `email` (`email`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;