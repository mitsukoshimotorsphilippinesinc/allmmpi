CREATE TABLE `rf_member_achievements` (
  `member_achievement_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `achievement_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `max_pairs` int(20) NOT NULL DEFAULT '0',
  `earnings_to_upgrade` int(20) NOT NULL DEFAULT '0',
  `earnings_maintenance` int(20) NOT NULL DEFAULT '0',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`member_achievement_id`),
  KEY `last_name` (`achievement_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `rf_member_achievements` (achievement_name, max_pairs, earnings_to_upgrade, earnings_maintenance)
VALUES ('GRANDMASTER', '25', '15000000', '7500000');
INSERT INTO `rf_member_achievements` (achievement_name, max_pairs, earnings_to_upgrade, earnings_maintenance)
VALUES ('PRESIDENT', '20', '5000000', '2500000');
INSERT INTO `rf_member_achievements` (achievement_name, max_pairs, earnings_to_upgrade, earnings_maintenance)
VALUES ('MILLIONAIRE', '15', '1000000', '500000');
INSERT INTO `rf_member_achievements` (achievement_name, max_pairs, earnings_to_upgrade, earnings_maintenance)
VALUES ('SUPERSTAR', '10', '500000', '0');
INSERT INTO `rf_member_achievements` (achievement_name, max_pairs, earnings_to_upgrade, earnings_maintenance)
VALUES ('RISING STAR', '10', '100000', '0');


ALTER TABLE sm_featured_members ADD COLUMN `member_id` INT(10) NOT NULL DEFAULT '0' AFTER `featured_member_id`;
ALTER TABLE sm_featured_members ADD INDEX(`member_id`);
