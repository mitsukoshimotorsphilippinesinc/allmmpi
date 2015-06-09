DROP TABLE IF EXISTS `tr_member_transfers`;
CREATE TABLE IF NOT EXISTS `tr_member_transfers` (
  `member_transfer_id` int(20) NOT NULL AUTO_INCREMENT,
  `from_member_id` int(11) NOT NULL DEFAULT 0,
  `to_member_id` int(11) NOT NULL DEFAULT 0,
  `type` varchar(32) collate utf8_unicode_ci NOT NULL default '',
  `amount` decimal(10,2),
  `status` varchar(20) NOT NULL default 'PENDING',
  `confirmation_code` 	varchar(64),
  `update_timestamp` timestamp NOT NULL default '000-00-00 00:00:00',
  `insert_timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`member_transfer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
