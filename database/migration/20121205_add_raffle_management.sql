CREATE TABLE IF NOT EXISTS `rm_raffles` (
  `raffle_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `raffle_code` varchar(32) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` text,
  `status` varchar(16) NOT NULL DEFAULT 'INACTIVE',
  `raffle_trigger` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '0 - none; 1 - all; 2 - period only; 3 - quantity only',
  `is_active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `with_active_period` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `with_active_quantity` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `active_quantity` decimal(10,2) NOT NULL DEFAULT '0.00',
  `active_start` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `active_end` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `process_method` varchar(255) NOT NULL DEFAULT '',
  `process_params` varchar(255) NOT NULL DEFAULT '',
  `post_process_method` varchar(255) NOT NULL DEFAULT '',
  `post_process_params` varchar(255) NOT NULL DEFAULT '',
  `draw_order` varchar(16) NOT NULL DEFAULT 'DESC',
  `draw_quantity` int(11) unsigned NOT NULL DEFAULT '1',
  `countdown_render_method` varchar(64) NOT NULL DEFAULT 'default',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`raffle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `rm_raffle_group` (
  `raffle_group_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `raffle_id` int(11) unsigned NOT NULL DEFAULT '0',
  `group` varchar(64) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` text,
  `parent_group_id` int(11) unsigned NOT NULL DEFAULT '0',
  `parent_group` varchar(64) NOT NULL DEFAULT '',
  `group_count` int(11) unsigned NOT NULL DEFAULT '0',
  `child_group_count` int(11) unsigned NOT NULL DEFAULT '0',
  `update_timestamp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `goal_reached_timestamp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`raffle_group_id`),
  KEY `raffle_group` (`raffle_id`,`group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `rm_raffle_entries` (
  `raffle_entry_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `raffle_id` int(11) NOT NULL DEFAULT '0',
  `raffle_number` varchar(64) NOT NULL DEFAULT '',
  `group` varchar(32) NOT NULL DEFAULT '',
  `sub_group` varchar(64) NOT NULL DEFAULT '',
  `member_id` int(11) unsigned NOT NULL DEFAULT '0',
  `account_id` varchar(64) NOT NULL DEFAULT '',
  `sponsor_member_id` int(11) unsigned NOT NULL DEFAULT '0',
  `sponsor_account_id` varchar(64) NOT NULL DEFAULT '',
  `upline_member_id` int(11) unsigned NOT NULL DEFAULT '0',
  `upline_account_id` varchar(64) NOT NULL DEFAULT '',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`raffle_entry_id`),
  KEY `raffle_entry` (`raffle_id`,`raffle_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `rm_raffle_winners` (
  `raffle_winner_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `raffle_entry_id` int(11) unsigned NOT NULL DEFAULT '0',
  `raffle_id` int(11) unsigned NOT NULL DEFAULT '0',
  `raffle_number` varchar(64) NOT NULL DEFAULT '',
  `group` varchar(64) NOT NULL DEFAULT '',
  `sub_group` varchar(64) NOT NULL DEFAULT '',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`raffle_winner_id`),
  KEY `raffle_entry` (`raffle_entry_id`,`raffle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;