# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.1.44)
# Database: vitalc_20130524_235959
# Generation Time: 2013-08-28 07:47:43 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table rf_payout_download_sheets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rf_payout_download_sheets`;

CREATE TABLE `rf_payout_download_sheets` (
  `sheet_id` int(11) NOT NULL AUTO_INCREMENT,
  `sheet_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `sheet_method` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `file_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sheet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `rf_payout_download_sheets` WRITE;
/*!40000 ALTER TABLE `rf_payout_download_sheets` DISABLE KEYS */;

INSERT INTO `rf_payout_download_sheets` (`sheet_id`, `sheet_name`, `sheet_method`, `file_name`, `insert_timestamp`)
VALUES
	(1,'Members Payout','segmented_download_member_payout','_member_payout_','2013-02-08 05:01:55'),
	(2,'Commission per Account','segmented_download_commission_per_account','_commission_per_account_','2013-02-08 05:05:31'),
	(3,'3 Month Old per Account','segmented_download_3_month_old_per_account','_3_month_old_per_account_','2013-02-08 05:05:31'),
	(4,'3 Month Old per Member','segmented_download_3_month_old_per_member','_3_month_old_per_member_','2013-02-08 05:07:30'),
	(5,'Gift Cheques per Account','segmented_download_gift_cheques_per_account','_gift_cheques_per_account_','2013-02-08 05:07:30'),
	(6,'Gift Cheques per Member','segmented_download_gift_cheques_per_member','_gift_cheques_per_member_','2013-08-28 15:15:09'),
	(7,'Transferred Funds','segmented_download_transferred_funds','_transferred_funds_','2013-02-08 05:09:16'),
	(8,'Transferred Gift Cheques','segmented_download_transferred_gift_cheques','_transferred_gift_cheques_','2013-02-08 05:09:16'),
	(9,'Transaction Logs','segmented_transaction_logs','_transaction_logs_','2013-02-11 03:44:29'),
	(10,'GC Transaction Logs','segmented_gc_transaction_logs','_gc_transaction_logs_','2013-03-21 13:50:08');

/*!40000 ALTER TABLE `rf_payout_download_sheets` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
