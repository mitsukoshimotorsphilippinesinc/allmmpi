CREATE TABLE `po_member_adjustments` (
  `member_adjustment_id` int(11) NOT NULL AUTO_INCREMENT,
  `adjustment_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `adjusted_amount` decimal(10,2) NOT NULL,
  `payout_id` int(11) NOT NULL,
  `gross` decimal(10,2) DEFAULT '0.00',
  `gcep` decimal(10,2) DEFAULT '0.00',
  `net_of_gcep` decimal(10,2) DEFAULT '0.00',
  `witholding_tax` decimal(10,2) DEFAULT '0.00',
  `net_of_tax` decimal(10,2) DEFAULT '0.00',
  `final_commission` decimal(10,2) DEFAULT '0.00',
  `last_commission` decimal(10,2) DEFAULT '0.00',
  `cash_card` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remarks` text COLLATE utf8_unicode_ci,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`member_adjustment_id`),
  KEY `member_id` (`member_id`),
  KEY `start_date` (`start_date`),
  KEY `end_date` (`end_date`),
  KEY `start_date_2` (`start_date`,`end_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- MARCH 16 - 22, 2013
INSERT INTO `po_member_adjustments` (`adjustment_id`, `member_id`, `start_date`, `end_date`, `adjusted_amount`, `payout_id`, `gross`, `gcep`, `net_of_gcep`, `witholding_tax`, `net_of_tax`, `final_commission`, `insert_timestamp`, `cash_card`, `remarks`) 
VALUES
(0, 23072, '2013-03-16', '2013-03-22', 0.00, 0, 24000.00, 2400.00, 21600.00, 2400.00, 19200.00, 7200.00, now(), '5049460410650871000', 'System Error: The system did not activate the following accounts despite their maintenance. Made necessary adjustments for pay-out period 03/09/2013 - 03/15/2013.');

INSERT INTO `po_member_adjustments` (`adjustment_id`, `member_id`, `start_date`, `end_date`, `adjusted_amount`, `payout_id`, `gross`, `gcep`, `net_of_gcep`, `witholding_tax`, `net_of_tax`, `final_commission`, `insert_timestamp`, `cash_card`, `remarks`) 
VALUES
(0, 41133, '2013-03-16', '2013-03-22', 0.00, 0, 10000.00, 1000.00, 9000.00, 1000.00, 8000.00, 4000.00, now(), '5049460280143874000', 'System Error: The system did not activate the following accounts despite their maintenance. Made necessary adjustments for pay-out period 03/09/2013 - 03/15/2013.');

INSERT INTO `po_member_adjustments` (`adjustment_id`, `member_id`, `start_date`, `end_date`, `adjusted_amount`, `payout_id`, `gross`, `gcep`, `net_of_gcep`, `witholding_tax`, `net_of_tax`, `final_commission`, `insert_timestamp`, `cash_card`, `remarks`) 
VALUES
(0, 48022, '2013-03-16', '2013-03-22', 0.00, 0, 8000.00, 800.00, 7200.00, 800.00, 6400.00, 6400.00, now(), '5049460280152156000', 'System Error: The system did not activate the following accounts despite their maintenance. Made necessary adjustments for pay-out period 03/09/2013 - 03/15/2013.');

INSERT INTO `po_member_adjustments` (`adjustment_id`, `member_id`, `start_date`, `end_date`, `adjusted_amount`, `payout_id`, `gross`, `gcep`, `net_of_gcep`, `witholding_tax`, `net_of_tax`, `final_commission`, `insert_timestamp`, `cash_card`, `remarks`) 
VALUES
(0, 2668, '2013-03-16', '2013-03-22', 0.00, 0, 15000.00, 1500.00, 13500.00, 1500.00, 12000.00, 11100.00, now(), '5049460280140466000', 'System Error: The system did not activate the following accounts despite their maintenance. Made necessary adjustments for pay-out period 03/09/2013 - 03/15/2013.');

INSERT INTO `po_member_adjustments` (`adjustment_id`, `member_id`, `start_date`, `end_date`, `adjusted_amount`, `payout_id`, `gross`, `gcep`, `net_of_gcep`, `witholding_tax`, `net_of_tax`, `final_commission`, `insert_timestamp`, `cash_card`, `remarks`) 
VALUES
(0, 23175, '2013-03-16', '2013-03-22', 0.00, 0, 1000.00, 0.00, 1000.00, 100.00, 900.00, 900.00, now(), 'TO FUNDS', 'System Error: The system did not activate the following accounts despite their maintenance. Made necessary adjustments for pay-out period 03/09/2013 - 03/15/2013.');


-- MARCH 23 - 29, 2013
INSERT INTO `po_member_adjustments` (`adjustment_id`, `member_id`, `start_date`, `end_date`, `adjusted_amount`, `payout_id`, `gross`, `gcep`, `net_of_gcep`, `witholding_tax`, `net_of_tax`, `final_commission`, `insert_timestamp`, `cash_card`, `remarks`) 
VALUES
(0, 56393, '2013-03-23', '2013-03-29', 0.00, 0, 4000.00, 0.00, 4000.00, 400.00, 3600.00, 3600.00, now(), '5049460410611949000', 'System Error: The system did not activate the following accounts despite their maintenance. Made necessary adjustments for pay-out period 03/09/2013 - 03/15/2013 & 03/16/2013 - 03/22/2013.');

INSERT INTO `po_member_adjustments` (`adjustment_id`, `member_id`, `start_date`, `end_date`, `adjusted_amount`, `payout_id`, `gross`, `gcep`, `net_of_gcep`, `witholding_tax`, `net_of_tax`, `final_commission`, `insert_timestamp`, `cash_card`, `remarks`) 
VALUES
(0, 40706, '2013-03-23', '2013-03-29', 0.00, 0, 1000.00, 0.00, 1000.00, 100.00, 900.00, 900.00, now(), '5049460410684698000', 'System Error: The system did not activate the following accounts despite their maintenance. Made necessary adjustments for pay-out period 03/09/2013 - 03/15/2013 & 03/16/2013 - 03/22/2013.');

INSERT INTO `po_member_adjustments` (`adjustment_id`, `member_id`, `start_date`, `end_date`, `adjusted_amount`, `payout_id`, `gross`, `gcep`, `net_of_gcep`, `witholding_tax`, `net_of_tax`, `final_commission`, `insert_timestamp`, `cash_card`, `remarks`) 
VALUES
(0, 12813, '2013-03-23', '2013-03-29', 0.00, 0, 1000.00, 0.00, 1000.00, 100.00, 900.00, 900.00, now(), 'TO FUNDS', 'System Error: The system did not activate the following accounts despite their maintenance. Made necessary adjustments for pay-out period 03/09/2013 - 03/15/2013 & 03/16/2013 - 03/22/2013.');

INSERT INTO `po_member_adjustments` (`adjustment_id`, `member_id`, `start_date`, `end_date`, `adjusted_amount`, `payout_id`, `gross`, `gcep`, `net_of_gcep`, `witholding_tax`, `net_of_tax`, `final_commission`, `insert_timestamp`, `cash_card`, `remarks`) 
VALUES
(0, 44470, '2013-03-23', '2013-03-29', 0.00, 0, 5300.00, 530.00, 4770.00, 530.00, 4240.00, 4240.00, now(), '5049460410675373000', 'System Error: The system did not activate the following accounts despite their maintenance. Made necessary adjustments for pay-out period 03/09/2013 - 03/15/2013 & 03/16/2013 - 03/22/2013.');


INSERT INTO `po_member_adjustments` (`adjustment_id`, `member_id`, `start_date`, `end_date`, `adjusted_amount`, `payout_id`, `gross`, `gcep`, `net_of_gcep`, `witholding_tax`, `net_of_tax`, `final_commission`, `insert_timestamp`, `cash_card`, `remarks`) 
VALUES
(0, 56673, '2013-03-23', '2013-03-29', 0.00, 0, 4000.00, 0.00, 4000.00, 400.00, 3600.00, 3600.00, now(), '5049460410681249000', 'System Error: The system did not activate the following accounts despite their maintenance. Made necessary adjustments for pay-out period 03/09/2013 - 03/15/2013 & 03/16/2013 - 03/22/2013.');


-- MARCH 30 - APRIL 5, 2013
INSERT INTO `po_member_adjustments` (`adjustment_id`, `member_id`, `start_date`, `end_date`, `adjusted_amount`, `payout_id`, `gross`, `gcep`, `net_of_gcep`, `witholding_tax`, `net_of_tax`, `final_commission`, `insert_timestamp`, `cash_card`, `remarks`) 
VALUES
(0, 43706, '2013-03-30', '2013-04-05', 0.00, 0, 1300.00, 0.00, 1300.00, 130.00, 1170.00, 1170.00, now(), '5049460410701104000', 'System Error: The system did not activate the following accounts despite their maintenance. Made necessary adjustments for pay-out period 03/09/2013 - 03/15/2013 & 03/16/2013 - 03/22/2013.');

INSERT INTO `po_member_adjustments` (`adjustment_id`, `member_id`, `start_date`, `end_date`, `adjusted_amount`, `payout_id`, `gross`, `gcep`, `net_of_gcep`, `witholding_tax`, `net_of_tax`, `final_commission`, `insert_timestamp`, `cash_card`, `remarks`) 
VALUES
(0, 31491, '2013-03-30', '2013-04-05', 0.00, 0, 1000.00, 0.00, 1000.00, 100.00, 900.00, 900.00, now(), '5049460280155423000', 'System Error: The system did not activate the following accounts despite their maintenance. Made necessary adjustments for pay-out period 03/09/2013 - 03/15/2013 & 03/16/2013 - 03/22/2013.');

INSERT INTO `po_member_adjustments` (`adjustment_id`, `member_id`, `start_date`, `end_date`, `adjusted_amount`, `payout_id`, `gross`, `gcep`, `net_of_gcep`, `witholding_tax`, `net_of_tax`, `final_commission`, `insert_timestamp`, `cash_card`, `remarks`) 
VALUES
(0, 22019, '2013-03-30', '2013-04-05', 0.00, 0, 2000.00, 0.00, 2000.00, 200.00, 1800.00, 1800.00, now(), '5049460410671711000', 'System Error: The system did not activate the following accounts despite their maintenance. Made necessary adjustments for pay-out period 03/09/2013 - 03/15/2013 & 03/16/2013 - 03/22/2013.');

INSERT INTO `po_member_adjustments` (`adjustment_id`, `member_id`, `start_date`, `end_date`, `adjusted_amount`, `payout_id`, `gross`, `gcep`, `net_of_gcep`, `witholding_tax`, `net_of_tax`, `final_commission`, `insert_timestamp`, `cash_card`, `remarks`) 
VALUES
(0, 40957, '2013-03-30', '2013-04-05', 0.00, 0, 3000.00, 0.00, 3000.00, 300.00, 2700.00, 2700.00, now(), '5049460410667925000', 'System Error: The system did not activate the following accounts despite their maintenance. Made necessary adjustments for pay-out period 03/09/2013 - 03/15/2013 & 03/16/2013 - 03/22/2013.');

INSERT INTO `po_member_adjustments` (`adjustment_id`, `member_id`, `start_date`, `end_date`, `adjusted_amount`, `payout_id`, `gross`, `gcep`, `net_of_gcep`, `witholding_tax`, `net_of_tax`, `final_commission`, `insert_timestamp`, `cash_card`, `remarks`) 
VALUES
(0, 27529, '2013-03-30', '2013-04-05', 0.00, 0, 1000.00, 0.00, 1000.00, 100.00, 900.00, 900.00, now(), '5049460410668451000', 'System Error: The system did not activate the following accounts despite their maintenance. Made necessary adjustments for pay-out period 03/09/2013 - 03/15/2013 & 03/16/2013 - 03/22/2013.');

INSERT INTO `po_member_adjustments` (`adjustment_id`, `member_id`, `start_date`, `end_date`, `adjusted_amount`, `payout_id`, `gross`, `gcep`, `net_of_gcep`, `witholding_tax`, `net_of_tax`, `final_commission`, `insert_timestamp`, `cash_card`, `remarks`) 
VALUES
(0, 23279, '2013-03-30', '2013-04-05', 0.00, 0, 3000.00, 300.00, 2700.00, 270.00, 2430.00, 2430.00, now(), '5049460280149590000', 'System Error: The system did not activate the following accounts despite their maintenance. Made necessary adjustments for pay-out period 03/09/2013 - 03/15/2013 & 03/16/2013 - 03/22/2013.');

INSERT INTO `po_member_adjustments` (`adjustment_id`, `member_id`, `start_date`, `end_date`, `adjusted_amount`, `payout_id`, `gross`, `gcep`, `net_of_gcep`, `witholding_tax`, `net_of_tax`, `final_commission`, `insert_timestamp`, `cash_card`, `remarks`) 
VALUES
(0, 52893, '2013-03-30', '2013-04-05', 0.00, 0, 3600.00, 0.00, 3600.00, 360.00, 3240.00, 3240.00, now(), '5049460410685125000', 'System Error: The system did not activate the following accounts despite their maintenance. Made necessary adjustments for pay-out period 03/09/2013 - 03/15/2013 & 03/16/2013 - 03/22/2013.');



