-- ----------------------------
-- Table structure for `po_payout_periods`
-- ----------------------------
DROP TABLE IF EXISTS `po_payout_periods`;
CREATE TABLE `po_payout_periods` (
  `payout_period_id` int(11) NOT NULL AUTO_INCREMENT,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payout_type` varchar(16) COLLATE utf8_unicode_ci DEFAULT 'IGPSM',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`payout_period_id`),
  KEY `start_date` (`start_date`,`end_date`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of po_payout_periods
-- ----------------------------
INSERT INTO `po_payout_periods` VALUES ('1', '2012-12-08', '2012-12-07', 'COMPLETED', 'IGPSM', '2013-02-28 09:16:39');
INSERT INTO `po_payout_periods` VALUES ('2', '2012-12-18', '2012-12-21', 'COMPLETED', 'IGPSM', '2013-02-28 09:16:39');
INSERT INTO `po_payout_periods` VALUES ('3', '2012-12-22', '2012-12-28', 'COMPLETED', 'IGPSM', '2013-02-28 09:16:39');
INSERT INTO `po_payout_periods` VALUES ('4', '2012-12-01', '2012-12-31', 'COMPLETED', 'UNILEVEL', '2013-02-28 09:16:39');
INSERT INTO `po_payout_periods` VALUES ('5', '2012-12-29', '2013-01-04', 'COMPLETED', 'IGPSM', '2013-02-28 09:16:39');
INSERT INTO `po_payout_periods` VALUES ('6', '2013-01-05', '2013-01-11', 'COMPLETED', 'IGPSM', '2013-02-28 09:16:39');
INSERT INTO `po_payout_periods` VALUES ('7', '2013-01-12', '2013-01-18', 'COMPLETED', 'IGPSM', '2013-02-28 09:16:39');
INSERT INTO `po_payout_periods` VALUES ('8', '2013-01-19', '2013-01-25', 'COMPLETED', 'IGPSM', '2013-02-28 09:16:39');
INSERT INTO `po_payout_periods` VALUES ('9', '2013-01-01', '2013-01-31', 'COMPLETED', 'UNILEVEL', '2013-02-28 09:16:39');
INSERT INTO `po_payout_periods` VALUES ('10', '2013-01-26', '2013-02-01', 'COMPLETED', 'IGPSM', '2013-02-28 09:16:39');
INSERT INTO `po_payout_periods` VALUES ('11', '2013-02-02', '2013-02-08', 'COMPLETED', 'IGPSM', '2013-02-28 09:16:39');
INSERT INTO `po_payout_periods` VALUES ('12', '2013-02-09', '2013-02-15', 'COMPLETED', 'IGPSM', '2013-02-28 09:16:39');
INSERT INTO `po_payout_periods` VALUES ('13', '2013-02-16', '2013-02-22', 'COMPLETED', 'IGPSM', '2013-02-28 09:16:39');
INSERT INTO `po_payout_periods` VALUES ('14', '2013-02-01', '2013-02-28', 'COMPLETED', 'UNILEVEL', '2013-02-28 09:16:39');
INSERT INTO `po_payout_periods` VALUES ('15', '2013-02-23', '2013-03-01', 'COMPLETED', 'IGPSM', '2013-02-28 09:16:39');
INSERT INTO `po_payout_periods` VALUES ('16', '2013-03-02', '2013-03-08', 'COMPLETED', 'IGPSM', '2013-02-28 09:16:39');
INSERT INTO `po_payout_periods` VALUES ('17', '2013-03-09', '2013-03-15', 'COMPLETED', 'IGPSM', '2013-02-28 09:16:39');
INSERT INTO `po_payout_periods` VALUES ('18', '2013-03-16', '2013-03-22', 'ACTIVE', 'IGPSM', '2013-02-28 09:16:39');