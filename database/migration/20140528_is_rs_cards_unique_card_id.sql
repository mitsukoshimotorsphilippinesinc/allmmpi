-- create backup table similar to is_rs_cards
CREATE TABLE `backup_is_rs_cards` (
  `rs_card_id` int(11) NOT NULL AUTO_INCREMENT,
  `card_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `card_code` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `type` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `member_id` int(11) NOT NULL DEFAULT '0',
  `account_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `released_to` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `issued_to` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `use_type` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `used_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `released_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `issued_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activate_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rs_card_id`),
  KEY `card_id` (`card_id`),
  KEY `card_code` (`card_code`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- alter card_id as UNIQUE
ALTER IGNORE TABLE backup_is_rs_cards ADD UNIQUE (card_id);

-- copy is_rs_cards without removing the duplicates
INSERT IGNORE INTO backup_is_rs_cards (SELECT* FROM is_rs_cards);

-- rename is_rs_cards to is_rs_cards_backup_<date>
RENAME TABLE `is_rs_cards` TO `is_rs_cards_backup_<date>`;

-- rename backup_is_rs_cards to is_rs_cards
RENAME TABLE `backup_is_rs_cards` TO `is_rs_cards`;