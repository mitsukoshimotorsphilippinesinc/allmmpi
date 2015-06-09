# ************************************************************
# Sequel Pro SQL dump
# Version 3408
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.1.44)
# Database: vitalc_clean
# Generation Time: 2012-10-16 06:23:35 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table ad_navigations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ad_navigations`;

CREATE TABLE `ad_navigations` (
  `navigation_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `system_code` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `code` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ordering` tinyint(4) NOT NULL DEFAULT '0',
  `parent_id` int(11) unsigned NOT NULL,
  `is_active` tinyint(4) DEFAULT '0',
  `type` enum('LINK','HEADER') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'LINK',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`navigation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `ad_navigations` WRITE;
/*!40000 ALTER TABLE `ad_navigations` DISABLE KEYS */;

INSERT INTO `ad_navigations` (`navigation_id`, `system_code`, `code`, `title`, `url`, `ordering`, `parent_id`, `is_active`, `type`, `insert_timestamp`) VALUES
(1, 'system', 'dashboard', 'Dashboard', '/admin/systems', 1, 0, 1, 'LINK', '2012-04-06 09:11:14'),
(2, 'system', 'users', 'Users', '/admin/users', 2, 0, 1, 'LINK', '2012-04-06 09:12:25'),
(3, 'system', '', 'Settings', '#', 3, 0, 1, 'HEADER', '2012-04-06 09:12:43'),
(4, 'system', 'settings', 'Core Settings', '/admin/setting', 4, 3, 1, 'LINK', '2012-04-06 09:14:06'),
(5, 'system', 'privileges', 'Privileges', '/admin/privileges', 5, 3, 1, 'LINK', '2012-04-06 09:15:44'),
(7, 'network', 'dashboard', 'Dashboard', '/network', 1, 0, 1, 'LINK', '2012-04-06 23:08:36'),
(8, 'system', 'contents', 'Contents', '/admin/contents', 7, 3, 1, 'LINK', '2012-04-13 01:10:13'),
(9, 'inventory', 'dashboard', 'Dashboard', '/inventory', 1, 0, 1, 'LINK', '2012-04-06 23:07:44'),
(11, 'inventory', 'items', 'Items', '/inventory/items', 11, 23, 1, 'LINK', '2012-04-07 02:53:15'),
(12, 'inventory', 'item_types', 'Item Types', '/inventory/item_types', 12, 23, 1, 'LINK', '2012-04-07 02:56:35'),
(13, 'inventory', 'item_sub_types', 'Item Sub-Types', '/inventory/item_sub_types', 14, 23, 1, 'LINK', '2012-04-07 02:56:35'),
(14, 'inventory', 'conversion', 'Unit Conversion', '/inventory/unit_conversion', 16, 23, 1, 'LINK', '2012-04-07 01:19:56'),
(15, 'inventory', '', 'Forms', '', 4, 0, 0, 'HEADER', '0000-00-00 00:00:00'),
(16, 'inventory', 'orders', 'Purchase Orders', '/inventory/orders', 5, 15, 1, 'LINK', '2012-04-12 21:44:47'),
(17, 'inventory', 'transfers', 'Stocks Transfers', '/inventory/transfers', 6, 15, 1, 'LINK', '2012-04-12 21:46:45'),
(18, 'inventory', 'receiving', 'Stocks Receiving', '/inventory/receiving', 7, 15, 1, 'LINK', '2012-04-12 21:47:35'),
(19, 'inventory', 'requisition', 'Requisition', '/inventory/requisition', 8, 15, 1, 'LINK', '2012-04-12 21:48:09'),
(21, 'inventory', 'defaults', 'Workflow Defaults', '/inventory/workflow_defaults', 18, 23, 1, 'LINK', '2012-04-18 19:04:17'),
(22, 'inventory', 'workflow_status', 'Workflow Statuses', '/inventory/workflow_status', 19, 23, 1, 'LINK', '2012-04-18 19:05:01'),
(23, 'inventory', '', 'Settings', '#', 10, 0, 1, 'HEADER', '0000-00-00 00:00:00'),
(24, 'inventory', 'facilities', 'Facilities', '/inventory/facilities', 15, 23, 1, 'LINK', '2012-04-07 01:19:56'),
(25, 'inventory', 'suppliers', 'Suppliers', '/inventory/suppliers', 17, 23, 1, 'LINK', '2012-04-07 01:19:56'),
(26, 'inventory', 'units', 'Units', '/inventory/units', 20, 23, 1, 'LINK', '2012-04-07 01:19:56'),
(27, 'inventory', 'shipping', 'Shipping Methods', '/inventory/shipping_methods', 21, 23, 1, 'LINK', '2012-04-18 19:03:15'),
(28, 'inventory', 'work_orders', 'Work Orders', '/inventory/work_orders', 2, 0, 1, 'LINK', '2012-04-18 19:03:15'),
(29, 'inventory', 'facility_items', 'Facility Items', '/inventory/facility_items', 3, 0, 1, 'LINK', '2012-05-25 11:50:28'),
(30, 'system', 'navigations', 'Navigation', '/admin/navigations', 6, 3, 1, 'LINK', '2012-05-26 14:04:31'),
(32, 'system', 'products', 'Products', '/admin/products', 8, 0, 1, 'LINK', '2012-05-30 03:06:56'),
(36, 'inventory', 'pending', 'Pending', '/inventory/pending', 9, 0, 1, 'LINK', '2012-06-16 06:58:17'),
(45, 'cms', 'dashboard', 'Dashboard', '/cms', 1, 0, 1, 'LINK', '2012-07-06 10:24:19'),
(46, 'cms', 'content_header', 'Contents', '#', 2, 0, 1, 'HEADER', '2012-07-06 11:01:40'),
(47, 'cms', 'news', 'News', '/cms/news', 4, 46, 1, 'LINK', '2012-07-06 11:02:41'),
(48, 'cms', 'pages', 'Pages', '/cms/pages', 6, 46, 1, 'LINK', '2012-07-06 11:03:32'),
(49, 'cms', 'testimonials', 'Testimonials', '/cms/testimonials', 7, 46, 1, 'LINK', '2012-07-06 11:04:46'),
(50, 'cms', 'promos', 'Featured Promos', '/cms/promos', 9, 46, 1, 'LINK', '2012-07-11 04:07:49'),
(51, 'cms', 'faqs', 'FAQs', '/cms/faqs', 12, 46, 1, 'LINK', '2012-07-11 06:21:21'),
(53, 'cms', 'members', 'Featured Members', '/cms/members', 8, 46, 1, 'LINK', '2012-07-13 22:39:24'),
(55, 'cms', 'products', 'Products', '/cms/products', 10, 46, 1, 'LINK', '2012-07-16 19:18:40'),
(68, 'cms', 'galleries', 'Galleries', '/cms/galleries', 13, 46, 1, 'LINK', '2012-07-19 17:05:43'),
(69, 'cms', 'results', 'Results', '/cms/results', 15, 46, 1, 'LINK', '2012-07-19 22:11:01'),
(72, 'system', 'payout_header', 'Payout', '#', 9, 0, 1, 'HEADER', '2012-07-26 18:34:19'),
(73, 'system', 'withdrawals', 'Withdraw Funds', '/admin/withdraw_funds', 10, 72, 1, 'LINK', '2012-07-26 18:34:56'),
(74, 'inventory', 'reports', 'Reports', '#', 13, 0, 1, 'HEADER', '2012-10-05 10:46:43'),
(75, 'inventory', 'reports_dashboard', 'Dashboard', '/inventory/reports', 22, 74, 1, 'LINK', '2012-10-11 22:51:06'),
(76, 'inventory', 'generate_reports', 'Generate Reports', '/inventory/reports/generate', 23, 74, 1, 'LINK', '2012-10-11 22:51:06'),
(77, 'cms', 'earners', 'Top Earners', '/cms/earners', 14, 46, 1, 'LINK', '2012-11-16 03:42:57'),
(78, 'cms', 'events', 'Events', '/cms/event', 5, 46, 1, 'LINK', '2012-11-22 03:47:37'),
(79, 'cms', 'packages', 'Packages', '/cms/packages', 11, 46, 1, 'LINK', '2012-11-22 03:53:11'),
(80, 'network', 'members', 'Members', '/network/members', 2, 0, 1, 'LINK', '2012-11-22 04:04:37'),
(81, 'cms', 'announcements', 'Announcements', '/cms/announcements', 3, 46, 1, 'LINK', '2012-11-22 04:09:30'),
(82, 'cms', 'uploads', 'Image Uploads', '/cms/uploads', 16, 46, 1, 'LINK', '2012-11-23 06:40:20');
	

/*!40000 ALTER TABLE `ad_navigations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ad_privileges
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ad_privileges`;

CREATE TABLE `ad_privileges` (
  `privilege_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `privilege_code` varchar(65) COLLATE utf8_unicode_ci NOT NULL,
  `privilege_description` text COLLATE utf8_unicode_ci NOT NULL,
  `privilege_uri` text COLLATE utf8_unicode_ci NOT NULL,
  `system_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `menu_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`privilege_id`),
  KEY `privilege_code` (`privilege_code`),
  KEY `system_code` (`system_code`),
  KEY `menu_code` (`menu_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `ad_privileges` WRITE;
/*!40000 ALTER TABLE `ad_privileges` DISABLE KEYS */;

INSERT INTO `ad_privileges` (`privilege_id`, `privilege_code`, `privilege_description`, `privilege_uri`, `system_code`, `menu_code`)
VALUES
	(1,'Admin','Admin','[\"admin\",\"admin\\/select_facility\",\"admin\\/systems\",\"admin\\/systems\\/noaccess\",\"admin\\/signin\\/signout\"]','system',NULL),
	(2,'Admin Users','Admin Users','[\"admin\\/users\",\"admin\\/users\\/$\"]','system',NULL),
	(3,'Admin Navigation','Admin Navigation','[\"admin\\/navigations\",\"admin\\/navigations\\/add\",\"admin\\/navigations\\/edit\\/$\",\"admin\\/navigations\\/delete\\/$\",\"admin\\/navigations\\/order\\/$\",\"admin\\/navigations\\/get_headers\",\"admin\\/navigations\\/index\\/$\"]','system',NULL),
	(4,'Admin Privileges','Admin Privileges','[\"admin\\/privileges\",\"admin\\/privileges\\/add\",\"admin\\/privileges\\/edit\\/$\",\"admin\\/privileges\\/delete\\/$\",\"admin\\/privileges\\/view\\/$\",\"admin\\/privileges\\/index\\/$\"]','system',NULL),
	(5,'Inventory','Inventory','[\"inventory\"]','inventory',NULL),
	(6,'Inventory Item Management','Inventory Item Management','[\"inventory\\/items\\/$\",\"inventory\\/item_types\\/$\",\"inventory\\/item_sub_types\\/$\"]','inventory',NULL),
	(7,'Inventory Unit Management','Inventory Unit Management','[\"inventory\\/units\",\"inventory\\/units\\/add\",\"inventory\\/units\\/edit\\/$\",\"inventory\\/units\\/delete\\/$\",\"inventory\\/units\\/view\\/$\",\"inventory\\/units\\/$\",\"inventory\\/unit_conversion\\/\",\"inventory\\/unit_conversion\\/add\",\"inventory\\/unit_conversion\\/edit\\/$\",\"inventory\\/unit_conversion\\/delete\\/$\",\"inventory\\/unit_conversion\\/view\\/$\",\"inventory\\/unit_conversion\\/$\"]','inventory',NULL),
	(8,'Inventory Facility Items','Inventory Facility Items','[\"inventory\\/facility_items\",\"inventory\\/facility_items\\/add_facility_item_form\",\"inventory\\/facility_items\\/update_facility_item_form\",\"inventory\\/facility_items\\/update_facility_items\",\"inventory\\/facility_items\\/get_item_history\",\"inventory\\/facility_items\\/view\\/$\",\"inventory\\/facility_items\\/$\"]','inventory',NULL),
	(9,'Inventory Pending Approvals','Inventory Pending Approvals','[\"inventory\\/pending\",\"inventory\\/pending\\/action\",\"inventory\\/pending\\/view\\/$\",\"inventory\\/pending\\/index\\/$\",\"inventory\\/pending\\/$\",\"inventory\\/work_orders\\/get_work_orders\"]','inventory',NULL),
	(10,'Inventory Work Orders','Inventory Work Orders','[\"inventory\\/work_orders\",\"inventory\\/work_orders\\/create_work_order_form\",\"inventory\\/work_orders\\/create_tracking_number\",\"inventory\\/work_orders\\/insert_work_order\",\"inventory\\/work_orders\\/update_process_status\",\"inventory\\/work_orders\\/close_work_order\",\"inventory\\/work_orders\\/search_tracking\",\"inventory\\/work_orders\\/get_work_orders\",\"inventory\\/work_orders\\/modal_info\",\"inventory\\/work_orders\\/view\\/$\",\"inventory\\/work_orders\\/$\"]','inventory',NULL),
	(11,'Inventory - Purchase Orders','Inventory - Purchase Orders','[\"inventory\\/orders\\/$\"]','inventory',NULL),
	(12,'Inventory - Stock Transfers','Inventory - Stock Transfers','[\"inventory\\/transfers\\/$\"]','inventory',NULL),
	(13,'Inventory - Stocks Receiving','Inventory - Stocks Receiving','[\"inventory\\/receiving\\/$\"]','inventory',NULL),
	(14,'Inventory - Requisition','Inventory - Requisition','[\"inventory\\/requisition\\/$\"]','inventory',NULL),
	(16,'Inventory - Reports','Inventory - Reports','[\"inventory\\/reports\",\"inventory\\/reports\\/get_reports\",\"inventory\\/reports\\/all_reports\\/$\",\"inventory\\/reports\\/issuance_report\\/$\",\"inventory\\/reports\\/work_orders\\/reports\\/$\"]','inventory',NULL),
	(17,'Inventory - Facilities','Inventory - Facilities','[\"inventory\\/facilities\",\"inventory\\/facilities\\/add\",\"inventory\\/facilities\\/edit\\/$\",\"inventory\\/facilities\\/delete\\/$\",\"inventory\\/facilities\\/pdf_view\",\"inventory\\/facilities\\/excel_view\",\"inventory\\/facilities\\/view\\/$\"]','inventory',NULL),
	(18,'CMS - News','CMS - News','[\"cms\\/news\\/$\"]','cms',NULL),
	(19,'CMs - Pages','CMS - Pages','[\"cms\\/pages\\/$\"]','cms',NULL),
	(20,'CMS - Promos','CMS - Promos','[\"cms\\/promos\\/$\"]','cms',NULL),
	(21,'CMS - Testimonials','CMS - Testimonials','[\"cms\\/testimonials\\/$\"]','cms',NULL),
	(22,'Admin - Products','Admin - Products','[\"admin\\/products\\/$\"]','system',NULL),
	(23,'Admin - Packages','Admin - Packages','[\"admin\\/packages\",\"admin\\/packages\\/$\"]','system',NULL),
	(24,'Admin - Contents','Admin - Contents','[\"admin\\/contents\",\"admin\\/contents\\/add\",\"admin\\/contents\\/edit\\/$\",\"admin\\/contents\\/delete\\/$\",\"admin\\/contents\\/view\\/$\"]','system',NULL),
	(25,'Admin - Withdraw Funds','Admin - Withdraw Funds','[\"admin\\/withdraw_funds\",\"admin\\/withdraw_funds\\/view_transaction\",\"admin\\/withdraw_funds\\/execute\",\"admin\\/withdraw_funds\\/download_check\",\"admin\\/withdraw_funds\\/download_proceed\",\"admin\\/withdraw_funds\\/download_update_user_action\",\"admin\\/withdraw_funds\\/export_xls\\/$\",\"admin\\/withdraw_funds\\/upload\"]','system',NULL),
	(26,'CMS - Dashboard','CMS - Dashboard','[\"cms\"]','cms',NULL),
	(27,'CMS - FAQs','CMS - FAQs','[\"cms\\/faqs\\/$\"]','cms',NULL),
	(28,'Members','Members','[\"members\"]','site',NULL),
	(29,'Members - Earnings','Members - Earnings','[\"members\\/earnings\",\"members\\/earnings\\/get_account_earnings\",\"members\\/earnings\\/get_account_transactions\",\"members\\/earnings\\/excel_earnings\\/$\",\"members\\/earnings\\/update_points\"]','site',NULL),
	(30,'Network','Network','[\"network\"]','network',NULL),
	(31,'Network - Concerns','Network - Concerns','[\"network\\/concerns\",\"network\\/concerns\\/page\",\"network\\/concerns\\/check_concern\",\"network\\/concerns\\/add_concern\",\"network\\/concerns\\/edit_concern\",\"network\\/concerns\\/update_concern\",\"network\\/concerns\\/view\\/$\"]','network',NULL),
	(32,'Network - Members','Network - Members','[\"network\\/members\",\"network\\/members\\/listing\",\"network\\/members\\/view\\/$\"]','network',NULL),
	(33,'Network - Orders','Network - Orders','[\"network\\/orders\",\"network\\/orders\\/view\\/$\",\"network\\/orders\\/page\"]','network',NULL),
	(34,'Network - Profile','Network - Profile','[\"network\\/profile\",\"network\\/profile\\/load_edit\",\"network\\/profile\\/personal\",\"network\\/profile\\/contacts\",\"network\\/profile\\/payout\",\"network\\/profile\\/accounts\",\"network\\/profile\\/view\\/$\"]','network',NULL),
	(35,'Network - Vouchers','Network - Vouchers','[\"network\\/vouchers\",\"network\\/vouchers\\/view\\/$\",\"network\\/vouchers\\/page\",\"network\\/vouchers\\/index\\/$\"]','network',NULL),
	(36,'Network - Main','Network - Main','[\"network\\/main\",\"network\\/main\\/listing\",\"network\\/main\\/product_list\",\"network\\/main\\/view\\/$\",\"network\\/main\\/update_cart\",\"network\\/main\\/verify_accountid\",\"network\\/main\\/confirm\"]','network',NULL),
	(38,'Admin - Core Settings','Admin - Core Settings','[\"admin\\/setting\",\"admin\\/setting\\/index\",\"admin\\/setting\\/add\",\"admin\\/setting\\/edit\\/$\",\"admin\\/setting\\/delete\\/$\"]','system',NULL),
	(39,'Point of Issuance','Point of Issuance','[\"webpoi\",\"webpoi\\/$\"]','webpoi',NULL),
	(40,'CMS - Contest Results','CMS - Contest Results','[\"cms\\/results\\/$\"]','cms',NULL),
	(41,'CMS - Galleries','CMS - Galleries','[\"cms\\/galleries\\/$\"]','cms',NULL),
	(42,'CMS - Featured Members','CMS - Featured Members','[\"cms\\/members\\/$\"]','cms',NULL),
	(43,'CMS - Products','CMS - Products','[\"cms\\/products\\/$\"]','cms',NULL),
	(44,'CMS - Packages','CMS - Packages','[\"cms\\/packages\\/$\"]','cms',NULL),
	(45,'CMS - General Uploads','CMS - General Uploads','[\"\\/cms\\/uploads\\/$\"]','cms',NULL),
	(46,'Admin - User Roles','Admin - User Roles','[\"admin\\/roles\\/$\"]','system',NULL),
	(47,'Inventory - Shipping Methods','Inventory - Shipping Methods','[\"inventory\\/shipping_methods\",\"inventory\\/shipping_methods\\/index\\/$\",\"inventory\\/shipping_methods\\/view\",\"inventory\\/shipping_methods\\/add\",\"inventory\\/shipping_methods\\/edit\\/$\",\"inventory\\/shipping_methods\\/delete\\/$\",\"inventory\\/shipping_methods\\/pdf_view\",\"inventory\\/shipping_methods\\/excel_view\"]','inventory',NULL),
	(48,'Inventory - Suppliers','Inventory - Suppliers','[\"inventory\\/suppliers\\/$\",\"inventory\\/suppliers\\/index\\/$\",\"inventory\\/suppliers\\/suppliers\\/$\",\"inventory\\/suppliers\\/add\",\"inventory\\/suppliers\\/edit\\/$\",\"inventory\\/suppliers\\/delete\\/$\",\"inventory\\/suppliers\\/view\\/$\",\"inventory\\/suppliers\\/pdf_view\",\"inventory\\/suppliers\\/excel_view\"]','inventory',NULL),
	(49,'Inventory - Workflow Defaults','Inventory - Workflow Defaults','[\"inventory\\/workflow_defaults\",\"inventory\\/workflow_defaults\\/index\\/$\",\"inventory\\/workflow_defaults\\/view\\/$\",\"inventory\\/workflow_defaults\\/add\",\"inventory\\/workflow_defaults\\/edit\\/$\",\"inventory\\/workflow_defaults\\/delete\\/$\",\"inventory\\/workflow_defaults\\/pdf_view\",\"inventory\\/workflow_defaults\\/excel_view\"]','inventory',NULL),
	(50,'Inventory - Workflow Status','Inventory - Workflow Status','[\"inventory\\/workflow_status\",\"inventory\\/workflow_status\\/index\\/$\",\"inventory\\/workflow_status\\/view\\/$\",\"inventory\\/workflow_status\\/add\",\"inventory\\/workflow_status\\/edit\\/$\",\"inventory\\/workflow_status\\/delete\\/$\",\"inventory\\/workflow_status\\/pdf_view\",\"inventory\\/workflow_status\\/excel_view\"]','inventory',NULL),
	(51,'Inventory - Viewing and Printing','Inventory - Viewing and Printing','[\"inventory\\/facility_items\",\"inventory\\/facility_items\\/index\\/$\",\"inventory\\/facility_items\\/items\\/$\",\"inventory\\/facility_items\\/excel_view\",\"inventory\\/facility_items\\/get_item_history\",\"inventory\\/items\",\"inventory\\/items\\/index\\/$\",\"inventory\\/items\\/view\\/$\",\"inventory\\/items\\/pdf_view\",\"inventory\\/items\\/excel_view\",\"inventory\\/item_types\",\"inventory\\/item_types\\/index\\/$\",\"inventory\\/item_types\\/view\\/$\",\"inventory\\/item_types\\/pdf_view\",\"inventory\\/item_types\\/excel_view\",\"inventory\\/item_sub_types\",\"inventory\\/item_sub_types\\/index\\/$\",\"inventory\\/item_sub_types\\/view\\/$\",\"inventory\\/item_sub_types\\/pdf_view\",\"inventory\\/item_sub_types\\/excel_view\",\"inventory\\/unit_conversion\",\"inventory\\/unit_conversion\\/index\\/$\",\"inventory\\/unit_conversion\\/view\\/$\",\"inventory\\/orders\",\"inventory\\/orders\\/index\\/$\",\"inventory\\/orders\\/view\\/$\",\"inventory\\/orders\\/view_po\\/$\",\"inventory\\/orders\\/modal_view\",\"inventory\\/orders\\/pdf_view\\/$\",\"inventory\\/orders\\/search_tracking\",\"inventory\\/orders\\/get_work_orders\",\"inventory\\/orders\\/modal_info\",\"inventory\\/transfers\",\"inventory\\/transfers\\/index\\/$\",\"inventory\\/transfers\\/view\\/$\",\"inventory\\/transfers\\/view_st\\/$\",\"inventory\\/transfers\\/modal_view\",\"inventory\\/transfers\\/pdf_view\\/$\",\"inventory\\/transfers\\/search_tracking\",\"inventory\\/transfers\\/get_work_orders\",\"inventory\\/transfers\\/modal_info\",\"inventory\\/receiving\",\"inventory\\/receiving\\/index\\/$\",\"inventory\\/receiving\\/view\\/$\",\"inventory\\/receiving\\/view_sr\\/$\",\"inventory\\/receiving\\/modal_view\",\"inventory\\/receiving\\/search_tracking\",\"inventory\\/receiving\\/get_work_orders\",\"inventory\\/receiving\\/modal_info\",\"inventory\\/receiving\\/pdf_view\\/$\",\"inventory\\/requisition\",\"inventory\\/requisition\\/index\\/$\",\"inventory\\/requisition\\/view\\/$\",\"inventory\\/requisition\\/view_rf\\/$\",\"inventory\\/requisition\\/modal_view\",\"inventory\\/requisition\\/search_tracking\",\"inventory\\/requisition\\/get_work_orders\",\"inventory\\/requisition\\/modal_info\",\"inventory\\/requisition\\/pdf_view\\/$\",\"inventory\\/workflow_defaults\",\"inventory\\/workflow_defaults\\/index\\/$\",\"inventory\\/workflow_defaults\\/view\\/$\",\"inventory\\/workflow_defaults\\/pdf_view\",\"inventory\\/workflow_defaults\\/excel_view\",\"inventory\\/workflow_status\",\"inventory\\/workflow_status\\/index\\/$\",\"inventory\\/workflow_status\\/view\\/$\",\"inventory\\/workflow_status\\/pdf_view\",\"inventory\\/workflow_status\\/excel_view\",\"inventory\\/facilities\",\"inventory\\/facilities\\/index\\/$\",\"inventory\\/facilities\\/view\\/$\",\"inventory\\/facilities\\/pdf_view\",\"inventory\\/facilities\\/excel_view\",\"inventory\\/suppliers\",\"inventory\\/suppliers\\/index\\/$\",\"inventory\\/suppliers\\/suppliers\\/$\",\"inventory\\/suppliers\\/view\\/$\",\"inventory\\/suppliers\\/pdf_view\",\"inventory\\/suppliers\\/excel_view\",\"inventory\\/units\",\"inventory\\/units\\/index\\/$\",\"inventory\\/units\\/view\\/$\",\"inventory\\/units\\/pdf_view\",\"inventory\\/units\\/excel_view\",\"inventory\\/shipping_methods\",\"inventory\\/shipping_methods\\/index\\/$\",\"inventory\\/shipping_methods\\/view\\/$\",\"inventory\\/shipping_methods\\/pdf_view\",\"inventory\\/shipping_methods\\/excel_view\",\"inventory\\/work_orders\",\"inventory\\/work_orders\\/index\\/$\",\"inventory\\/work_orders\\/orders\\/$\",\"inventory\\/work_orders\\/search_tracking\",\"inventory\\/work_orders\\/get_work_orders\",\"inventory\\/work_orders\\/modal_info\",\"inventory\\/pending\",\"inventory\\/pending\\/index\\/$\"]','inventory',NULL),
	(52,'CARDS','CARD MODULES','[\"admin\\/card_types\\/$\",\"admin\\/card_series\\/$\",\"admin\\/encoding\\/$\"]','inventory',NULL),
	(53,'VOUCHER_REDEMPTION','VOUCHER REDEMPTION','[\"admin\\/redemption\\/$\"]','SYSTEM',NULL),
	(54,'Admin - Vouchers','Admin - Vouchers','[\"admin\\/vouchers\\/$\"]','system',NULL);

/*!40000 ALTER TABLE `ad_privileges` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ad_systems
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ad_systems`;

CREATE TABLE `ad_systems` (
  `code` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pretty_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ordering` tinyint(4) NOT NULL DEFAULT '0',
  `is_visible` tinyint(4) NOT NULL DEFAULT '0',
  `is_locked` tinyint(4) NOT NULL DEFAULT '0',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`code`),
  UNIQUE KEY `unique - code` (`code`),
  KEY `index - code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `ad_systems` WRITE;
/*!40000 ALTER TABLE `ad_systems` DISABLE KEYS */;

INSERT INTO `ad_systems` (`code`, `name`, `pretty_name`, `url`, `ordering`, `is_visible`, `is_locked`, `insert_timestamp`)
VALUES
	('cms','CMS','Content Management','/cms',5,1,0,'2012-07-05 22:00:15'),
	('inventory','Inventory','Inventory','/inventory',1,1,0,'2012-04-04 02:40:20'),
	('network','Network','MLM Network','/network',2,1,0,'2012-04-04 02:41:25'),
	('site','Site','Site','/',0,0,0,'2012-04-05 11:09:31'),
	('system','System','System','/admin/systems',4,1,0,'2012-04-04 02:40:00'),
	('webpoi','WebPOI','Web-POI','/webpoi',3,1,0,'2012-04-04 02:40:51');

/*!40000 ALTER TABLE `ad_systems` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ad_user_facilities
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ad_user_facilities`;

CREATE TABLE `ad_user_facilities` (
  `user_facility_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `facility_id` int(11) DEFAULT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_facility_id`),
  KEY `user_id` (`user_id`,`facility_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `ad_user_facilities` WRITE;
/*!40000 ALTER TABLE `ad_user_facilities` DISABLE KEYS */;

INSERT INTO `ad_user_facilities` (`user_facility_id`, `user_id`, `facility_id`, `is_default`)
VALUES
	(1,1,1,1),
	(2,1,2,0),
	(3,1,3,0),
	(4,1,4,0),
	(5,1,5,0),
	(9,4,2,1),
	(10,5,2,1),
	(16,2,1,0),
	(17,2,2,1),
	(18,2,3,0),
	(19,2,4,0),
	(20,2,5,0),
	(21,7,2,1),
	(22,8,2,1),
	(24,9,1,1),
	(25,9,2,0),
	(26,6,2,1),
	(27,6,1,0),
	(28,10,1,1),
	(29,10,2,0),
	(30,3,2,1),
	(31,12,1,1),
	(32,13,1,1),
	(33,14,1,1),
	(34,15,1,1),
	(35,16,1,1),
	(36,17,1,1),
	(37,18,1,1),
	(38,19,1,1),
	(39,20,1,1),
	(40,21,1,1),
	(41,22,1,1),
	(42,23,1,1),
	(43,24,1,1),
	(44,25,1,1),
	(45,26,1,1),
	(46,27,1,1),
	(47,28,1,1),
	(48,29,1,1),
	(49,30,1,1),
	(50,31,1,1),
	(51,32,1,1),
	(52,33,1,1),
	(53,34,1,1);

/*!40000 ALTER TABLE `ad_user_facilities` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ad_user_facilities_view
# ------------------------------------------------------------

DROP VIEW IF EXISTS `ad_user_facilities_view`;



# Dump of table ad_user_privileges
# ------------------------------------------------------------

#DROP TABLE IF EXISTS `ad_user_privileges`;
#
#CREATE TABLE `ad_user_privileges` (
#  `user_id` int(10) unsigned NOT NULL,
#  `privilege_id` int(10) unsigned NOT NULL,
#  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
#  PRIMARY KEY (`user_id`,`privilege_id`),
#  KEY `user_id` (`user_id`)
#) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
#
#LOCK TABLES `ad_user_privileges` WRITE;
#/*!40000 ALTER TABLE `ad_user_privileges` DISABLE KEYS */;
#
#INSERT INTO `ad_user_privileges` (`user_id`, `privilege_id`, `insert_timestamp`)
#VALUES
#	(1,1,'2012-09-27 19:44:06'),
#	(1,2,'2012-09-27 19:44:06'),
#	(1,3,'2012-09-27 19:44:06'),
#	(1,4,'2012-09-27 19:44:06'),
#	(1,5,'2012-09-27 19:44:06'),
#	(1,6,'2012-09-27 19:44:06'),
#	(1,7,'2012-09-27 19:44:06'),
#	(1,8,'2012-09-27 19:44:06'),
#	(1,9,'2012-09-27 19:44:06'),
#	(1,10,'2012-09-27 19:44:06'),
#	(1,11,'2012-09-27 19:44:06'),
#	(1,12,'2012-09-27 19:44:06'),
#	(1,13,'2012-09-27 19:44:06'),
#	(1,14,'2012-09-27 19:44:06'),
#	(1,16,'2012-09-27 19:44:06'),
#	(1,17,'2012-09-27 19:44:06'),
#	(1,18,'2012-09-27 19:44:06'),
#	(1,19,'2012-09-27 19:44:06'),
#	(1,20,'2012-09-27 19:44:06'),
#	(1,21,'2012-09-27 19:44:06'),
#	(1,22,'2012-09-27 19:44:06'),
#	(1,23,'2012-09-27 19:44:06'),
#	(1,24,'2012-09-27 19:44:06'),
#	(1,25,'2012-09-27 19:44:06'),
#	(1,26,'2012-09-27 19:44:06'),
#	(1,27,'2012-09-27 19:44:06'),
#	(1,28,'2012-09-27 19:44:06'),
#	(1,29,'2012-09-27 19:44:06'),
#	(1,30,'2012-09-27 19:44:06'),
#	(1,31,'2012-09-27 19:44:06'),
#	(1,32,'2012-09-27 19:44:06'),
#	(1,33,'2012-09-27 19:44:06'),
#	(1,34,'2012-09-27 19:44:06'),
#	(1,35,'2012-09-27 19:44:06'),
#	(1,36,'2012-09-27 19:44:06'),
#	(1,38,'2012-09-27 19:44:06'),
#	(1,39,'2012-09-27 19:44:06'),
#	(1,40,'2012-09-27 19:44:06'),
#	(1,41,'2012-09-27 19:44:06'),
#	(1,42,'2012-09-27 19:44:06'),
#	(1,43,'2012-09-27 19:44:06'),
#	(1,44,'2012-09-27 19:44:06'),
#	(1,45,'2012-09-27 19:44:06'),
#	(1,46,'2012-09-27 19:44:06'),
#	(1,47,'2012-09-27 19:44:06'),
#	(1,48,'2012-09-27 19:44:06'),
#	(1,49,'2012-09-27 19:44:06'),
#	(1,50,'2012-09-27 19:44:06'),
#	(1,51,'2012-09-27 19:44:06'),
#	(1,52,'2012-09-27 19:44:06'),
#	(1,53,'2012-09-27 19:44:06'),
#	(1,54,'2012-09-27 19:44:06'),
#	(2,1,'2012-09-26 19:32:19'),
#	(2,5,'2012-09-26 19:32:19'),
#	(2,6,'2012-09-26 19:32:19'),
#	(2,7,'2012-09-26 19:32:19'),
#	(2,8,'2012-09-26 19:32:19'),
#	(2,9,'2012-09-26 19:32:19'),
#	(2,10,'2012-09-26 19:32:19'),
#	(2,11,'2012-09-26 19:32:19'),
#	(2,12,'2012-09-26 19:32:19'),
#	(2,13,'2012-09-26 19:32:19'),
#	(2,14,'2012-09-26 19:32:19'),
#	(2,16,'2012-09-26 19:32:19'),
#	(2,17,'2012-09-26 19:32:19'),
#	(2,47,'2012-09-26 19:32:19'),
#	(2,48,'2012-09-26 19:32:19'),
#	(2,49,'2012-09-26 19:32:19'),
#	(2,50,'2012-09-26 19:32:19'),
#	(2,52,'2012-09-26 19:32:19'),
#	(3,1,'2012-09-26 19:59:06'),
#	(3,39,'2012-09-26 19:59:06'),
#	(3,52,'2012-09-26 19:59:06'),
#	(4,1,'2012-08-22 22:34:26'),
#	(4,5,'2012-08-22 22:34:26'),
#	(4,10,'2012-08-22 22:34:26'),
#	(4,13,'2012-08-22 22:34:26'),
#	(4,39,'2012-08-22 22:34:26'),
#	(5,1,'2012-08-05 22:57:34'),
#	(6,1,'2012-08-06 00:37:41'),
#	(6,5,'2012-08-06 00:37:41'),
#	(6,6,'2012-08-06 00:37:41'),
#	(6,7,'2012-08-06 00:37:41'),
#	(6,8,'2012-08-06 00:37:41'),
#	(6,9,'2012-08-06 00:37:41'),
#	(6,10,'2012-08-06 00:37:41'),
#	(6,11,'2012-08-06 00:37:41'),
#	(6,12,'2012-08-06 00:37:41'),
#	(6,13,'2012-08-06 00:37:41'),
#	(6,14,'2012-08-06 00:37:41'),
#	(6,16,'2012-08-06 00:37:41'),
#	(6,17,'2012-08-06 00:37:41'),
#	(6,39,'2012-08-06 00:37:41'),
#	(6,47,'2012-08-06 00:37:41'),
#	(6,48,'2012-08-06 00:37:41'),
#	(6,49,'2012-08-06 00:37:41'),
#	(6,50,'2012-08-06 00:37:41'),
#	(7,1,'2012-08-06 00:28:54'),
#	(7,10,'2012-08-06 00:28:54'),
#	(7,11,'2012-08-06 00:28:54'),
#	(8,1,'2012-08-06 00:27:39'),
#	(8,39,'2012-08-06 00:27:39'),
#	(9,1,'2012-08-06 01:56:31'),
#	(9,5,'2012-08-06 01:56:31'),
#	(9,51,'2012-08-06 01:56:31'),
#	(10,1,'2012-08-05 23:22:05'),
#	(10,2,'2012-08-05 23:22:05'),
#	(10,3,'2012-08-05 23:22:05'),
#	(10,4,'2012-08-05 23:22:05'),
#	(10,5,'2012-08-05 23:22:05'),
#	(10,6,'2012-08-05 23:22:05'),
#	(10,7,'2012-08-05 23:22:05'),
#	(10,8,'2012-08-05 23:22:05'),
#	(10,9,'2012-08-05 23:22:05'),
#	(10,10,'2012-08-05 23:22:05'),
#	(10,11,'2012-08-05 23:22:05'),
#	(10,12,'2012-08-05 23:22:05'),
#	(10,13,'2012-08-05 23:22:05'),
#	(10,14,'2012-08-05 23:22:05'),
#	(10,16,'2012-08-05 23:22:05'),
#	(10,17,'2012-08-05 23:22:05'),
#	(10,18,'2012-08-05 23:22:05'),
#	(10,19,'2012-08-05 23:22:05'),
#	(10,20,'2012-08-05 23:22:05'),
#	(10,21,'2012-08-05 23:22:05'),
#	(10,22,'2012-08-05 23:22:05'),
#	(10,23,'2012-08-05 23:22:05'),
#	(10,24,'2012-08-05 23:22:05'),
#	(10,25,'2012-08-05 23:22:05'),
#	(10,26,'2012-08-05 23:22:05'),
#	(10,27,'2012-08-05 23:22:05'),
#	(10,28,'2012-08-05 23:22:05'),
#	(10,29,'2012-08-05 23:22:05'),
#	(10,30,'2012-08-05 23:22:05'),
#	(10,31,'2012-08-05 23:22:05'),
#	(10,32,'2012-08-05 23:22:05'),
#	(10,33,'2012-08-05 23:22:05'),
#	(10,34,'2012-08-05 23:22:05'),
#	(10,35,'2012-08-05 23:22:05'),
#	(10,36,'2012-08-05 23:22:05'),
#	(10,38,'2012-08-05 23:22:05'),
#	(10,39,'2012-08-05 23:22:05'),
#	(10,40,'2012-08-05 23:22:05'),
#	(10,41,'2012-08-05 23:22:05'),
#	(10,42,'2012-08-05 23:22:05'),
#	(10,43,'2012-08-05 23:22:05'),
#	(10,44,'2012-08-05 23:22:05'),
#	(10,45,'2012-08-05 23:22:05'),
#	(10,46,'2012-08-05 23:22:05'),
#	(10,47,'2012-08-05 23:22:05'),
#	(10,48,'2012-08-05 23:22:05'),
#	(10,49,'2012-08-05 23:22:05'),
#	(10,50,'2012-08-05 23:22:05'),
#	(12,1,'2012-09-27 23:08:44'),
#	(12,54,'2012-09-27 23:08:44'),
#	(13,1,'2012-09-27 23:09:52'),
#	(13,54,'2012-09-27 23:09:52'),
#	(14,1,'2012-09-27 23:10:33'),
#	(14,54,'2012-09-27 23:10:33'),
#	(15,1,'2012-09-27 23:11:01'),
#	(15,54,'2012-09-27 23:11:01'),
#	(16,1,'2012-09-27 23:12:07'),
#	(16,54,'2012-09-27 23:12:07'),
#	(17,1,'2012-09-27 23:13:05'),
#	(17,54,'2012-09-27 23:13:05'),
#	(18,1,'2012-09-27 23:13:49'),
#	(18,54,'2012-09-27 23:13:49'),
#	(19,1,'2012-09-27 23:15:01'),
#	(19,54,'2012-09-27 23:15:01'),
#	(20,1,'2012-09-27 23:17:31'),
#	(20,54,'2012-09-27 23:17:31'),
#	(21,1,'2012-09-27 23:21:22'),
#	(21,54,'2012-09-27 23:21:22'),
#	(22,1,'2012-09-27 23:22:18'),
#	(22,54,'2012-09-27 23:22:18'),
#	(23,1,'2012-09-27 23:23:37'),
#	(23,54,'2012-09-27 23:23:37'),
#	(24,1,'2012-09-27 23:23:50'),
#	(24,54,'2012-09-27 23:23:50'),
#	(25,1,'2012-09-27 23:24:14'),
#	(25,54,'2012-09-27 23:24:14'),
#	(26,1,'2012-09-27 23:24:50'),
#	(26,54,'2012-09-27 23:24:50'),
#	(27,1,'2012-09-27 23:43:02'),
#	(27,54,'2012-09-27 23:43:02'),
#	(28,1,'2012-09-27 23:25:23'),
#	(28,54,'2012-09-27 23:25:23'),
#	(29,1,'2012-09-27 23:26:07'),
#	(29,54,'2012-09-27 23:26:07'),
#	(30,1,'2012-09-27 23:26:54'),
#	(30,54,'2012-09-27 23:26:54'),
#	(31,1,'2012-09-27 23:28:20'),
#	(31,54,'2012-09-27 23:28:20'),
#	(32,1,'2012-09-27 23:28:41'),
#	(32,54,'2012-09-27 23:28:41'),
#	(33,1,'2012-09-27 23:29:04'),
#	(33,54,'2012-09-27 23:29:04'),
#	(34,1,'2012-09-27 23:29:21'),
#	(34,54,'2012-09-27 23:29:21');
#
#/*!40000 ALTER TABLE `ad_user_privileges` ENABLE KEYS */;
#UNLOCK TABLES;


# Dump of table ad_user_privileges_view
# ------------------------------------------------------------

DROP VIEW IF EXISTS `ad_user_privileges_view`;

CREATE TABLE `ad_user_privileges_view` (
   `user_id` INT(10) UNSIGNED NOT NULL,
   `privilege_id` INT(10) UNSIGNED NOT NULL,
   `privilege_code` VARCHAR(65) DEFAULT NULL,
   `privilege_description` TEXT DEFAULT NULL,
   `privilege_uri` TEXT DEFAULT NULL,
   `insert_timestamp` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM;



# Dump of table ad_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ad_users`;

CREATE TABLE `ad_users` (
  `user_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `first_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `designation` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'User',
  `mobile_number` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `role_id` int(11) NOT NULL,
  `is_active` smallint(6) NOT NULL DEFAULT '0',
  `default_page` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '/admin',
  `last_login` int(11) unsigned NOT NULL DEFAULT '0',
  `login_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  KEY `IS_USERS_IS_USER_ROLES_FK` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `ad_users` WRITE;
/*!40000 ALTER TABLE `ad_users` DISABLE KEYS */;

INSERT INTO `ad_users` (`user_id`, `username`, `email`, `password`, `first_name`, `last_name`, `designation`, `mobile_number`, `role_id`, `is_active`, `default_page`, `last_login`, `login_hash`, `insert_timestamp`)
VALUES
	(1,'admin','admin@vitalc.com','e6e061838856bf47e1de730719fb2609','Super','Admin','User','',0,1,'/admin',0,'f4286765793d928bccacb2bb79c2dc2bfcbb6d12','2012-10-03 01:18:33'),
	(2,'office','central@vitalc.com','87b0dad8b21a06750a3c442f60df1b8f','Central','Office','User','',0,1,'/admin',0,'b89e985c9a8a85e72ac5bbaa0cdf683ff966c7f5','2012-08-05 23:20:56'),
	(3,'cashier','cashier@vitalc.com','edaf6ef136e32cbc4f3c8885a49497c4','Cashier','','User','',0,1,'/admin',0,'7d88520a65ec5799059ab41b65cd5d774f422142','2012-09-26 21:44:51'),
	(4,'btaroc','belletaroc@yahoo.com','f70063ce7d42d794c271ecc63744fb5c','Belleza','Taroc','User','',0,1,'/admin',0,'f9854d1c42839efd497e27b440cce86e2aae33fd','2012-08-05 23:52:50'),
	(5,'avillahermosa','villahermosaalvin@yahoo.com','f3c173b5c09c1521ed975b4dce13ccd2','Alvin','Villahermosa','User','',0,1,'/admin',0,'','2012-08-05 22:57:15'),
	(6,'wlim','wingard_vitalc@yahoo.com','011733cf6dbb9d0ac547798b01ecfb53','Wingard','Lim','User','',0,1,'/admin',0,'0ebed15565e30f7dc5d194a1f01663927d997596','2012-08-06 00:22:54'),
	(7,'mbaste','mfb_luv@yahoo.com','2d860c469f99890cdb09741cdf1ab82d','Michele','Baste','User','',0,1,'/admin',0,'','2012-08-05 23:01:02'),
	(8,'jyuson','jocelyn_yuson@yahoo.com.ph','94e4e4b51b6214a71f5d539ffb3e14b9','Jocelyn','Yuson','User','',0,1,'/admin',0,'','2012-08-05 23:11:29'),
	(9,'ldizon','vital_laurencedizon@yahoo.com','20b55622c53e0ed5b75faaf51263d4de','Laurence','Dizon','User','',0,1,'/admin',0,'60fa90e9bb8143e55c30bdbf019818d862c827c5','2012-08-06 19:10:09'),
	(10,'esison','edwinsison@yahoo.com','2b5eebcacee3a339b0d3cfb58e579a45','Edwin','Sison','User','',0,1,'/admin',0,'','2012-08-05 23:21:54'),
	(11,'pvillanueva','patrickeva01@gmail.com','5d619ae13fa78aad3368171ac460fc50','Patrick','Villanueva','User','',0,1,'/admin',0,'19f7191e78b4cf4da8332e977caa6cbeacc05ba3','2012-08-21 22:27:05'),
	(12,'vitalc_ortigas','vitalc_ortigas@l.com','d7d1a889cce744f70e20cdf09bc61542','Vital C','Ortigas Depot','User','0',0,1,'/admin/redemption',0,'0e706e9cd232c3f35e8a0f2a5753906d7f8b5292','2012-10-09 02:34:31'),
	(13,'vitalc_quezon','vitalc_quezon@l.com','99ab86e41143cf1656edc9eec1479ebf','Vital C','Quezon Depot','User','0',0,1,'/admin/redemption',0,'bb749c2871002e80b977a21735a1ab5cd61b74f8','2012-10-04 20:40:45'),
	(14,'vitalc_cebu','vitalc_cebu@l.com','db8252bc6d0adfe95b9f359990ab263c','Vital C ','Cebu Depot','User','0',0,1,'/admin/redemption',0,'9b53d84eaae142b26323a1e4f0f09b4365a81829','2012-10-14 22:27:58'),
	(15,'vitalc_davao','vitalc_davao@l.com','4741136252ee35bc3afaeb0636902728','Vital C ','Davao Depot','User','0',0,1,'/admin/redemption',0,'adad35cd962ec5a0c6b7adc84b9f05481debae5e','2012-10-10 19:39:49'),
	(16,'vch_manila','vch_manila@l.com','0c1cef3810c145444439a9726cd2a345','VCH-Manila ','Front Office','User','0',0,1,'/admin/redemption',0,'708d25711fe73d0be33ad837f2b2688d46259824','2012-10-04 20:40:14'),
	(17,'ms_ortigas','ms_ortigas@l.com','ebeee5892cb62f10b87615c6b006ffbe','MS-Ortigas ','Front Office','User','0',0,1,'/admin/redemption',0,'91993b2d9809078e0a16c3fec036b66e981a389d','2012-10-04 20:40:03'),
	(18,'crh_makati','crh_makati@l.com','99d4df949fdcc92bbbcebac26eeb2b65','CRH-Makati','Front Office','User','',0,1,'/admin/redemption',0,'468e452c7711c03ebe7c807a7a6035658d5436a8','2012-10-09 18:12:58'),
	(19,'crht_cebu','crht_cebu@l.com','1132c5084c2b3d0bac443a4a41f08191','CRHT-Cebu ','Front Office','User','0',0,1,'/admin/redemption',0,'de43e8071e12ed96c9ae5a27f77b87663dc55053','2012-10-15 19:22:38'),
	(20,'cs_fuente','cs_fuente@l.com','89131e3940bd1d9410754536a9852a0c','CS-Fuente, ','Cebu Front Office','User','0',0,1,'/admin/redemption',0,'ee8c926e1fa43da21fe974f4861cf18422720e42','2012-10-04 20:39:03'),
	(21,'cs_ramos','cs_ramos@l.com','962ab93d0a0e65e081cab076df5a0f2c','CS-Ramos, ','Cebu Front Office','User','0',0,1,'/admin/redemption',0,'9ea9342ce43d8bc2a1c01c27a5ba173fd0904d93','2012-10-04 20:38:52'),
	(22,'crsr_mactan','crsr_mactan@l.com','250bdb38f91e38078ca0917d40dfb53e','CRSR-Mactan ','Front Office','User','0',0,1,'/admin/redemption',0,'23820d0faff2437a19439ddab6c81546ad18386b','2012-10-04 20:38:41'),
	(23,'crr_cebu','crr_cebu@l.com','bb56bec12179543b10309ce4ac9d8ad2','CRR-Cebu ','Front Office','User','0',0,1,'/admin/redemption',0,'595b3feb4e1cc58876a5c39ba0998f664deb50e8','2012-10-04 20:38:30'),
	(24,'crr_davao','crr_davao@l.com','7695c0ec4f01be9bc39ed5b1c1b515cb','CRR-Davao ','Front Office','User','0',0,1,'/admin/redemption',0,'c306b2e4fb16f3724d4e59fb164bedcfafc74a97','2012-10-12 17:32:52'),
	(25,'crpr_boracay','crpr_boracay@l.com','e5b189e3c537417cb32339fc6d711eb3','CRPR-Boracay ','Front Office','User','0',0,1,'/admin/redemption',0,'10fcbaec261288c52642d7e9ec744fab6942eecf','2012-10-04 20:37:52'),
	(26,'crbr_boracay','crbr_boracay@l.com','0989c10f222e243ea7f610e49cd4b630','CRBR-Boracay ','Front Office','User','0',0,1,'/admin/redemption',0,'dfbf31f8d78d27a5c7fb02f8b6bda7b3667ba0df','2012-10-04 20:37:36'),
	(27,'crrcc_boracay','crrcc_boracay@l.com','f9e6ce184c4a49b81fcc4fe482904e32','CRRCC-Boracay ','Front Office','User','0',0,1,'/admin/redemption',0,'8eb28d0f26a311a38893df690919418d851e92d2','2012-10-04 20:37:24'),
	(28,'sea_cashier','sea_cashier@l.com','6fb23095ba5f249563cf09bff5e62c03','SEA ','Cashier (Sky Experience Adventure)','User','0',0,1,'/admin/redemption',0,'dde24ba7d49db4f7775cfc68942c0f8e9166dbac','2012-10-09 03:06:34'),
	(29,'cu_cashier','cu_cashier@l.com','45e591d11d13cd6efc8c2c8583384bf8','CU ','Cashier (Club Ultima)','User','0',0,1,'/admin/redemption',0,'b7d14b84e5ec74087d3ba1d6d1dc0e1fe5930697','2012-10-10 20:18:27'),
	(30,'ussc_cashier','ussc_cashier@l.com','0875ca70cd52b6bba47d79b449b872b8','USSC ','Cashier (Ultima Sharp Shooters Club)','User','0',0,1,'/admin/redemption',0,'b9797f2d0f8e2ada572a02483833406d549ed597','2012-10-04 20:36:41'),
	(31,'sisr_cashier','sisr_cashier@l.com','d6b098f13459c7952a8837139c969593','SISR ','Cashier (Splash Island Spa & Resort)','User','0',0,1,'/admin/redemption',0,'a9e14abe1201204647c2deffcdba305a070f0414','2012-10-04 20:36:24'),
	(32,'dcp_cashier','dcp_cashier@l.com','5f69263a5c48a66f7d1e38a9c1a89b48','DCP ','Cashier (Davao Crocodile Park)','User','0',0,1,'/admin/redemption',0,'234ede8604256fe7533353fe43c7c75172af67ee','2012-10-04 20:36:11'),
	(33,'mop_cashier','mop_cashier@l.com','85d65a06bc913e8ea36f9db25351deef','MOP ','Cashier (Manila Ocean Park)','User','0',0,1,'/admin/redemption',0,'d45109de7766c36656c9ecc6d3d0b74e26f684fb','2012-10-04 20:35:57'),
	(34,'cln_reservations','cln_reservations@l.com','a98abe16f8150a18aba6a317761158b5','CrownLifestyle.NET ','Reservations','User','0',0,1,'/admin/redemption',0,'b8708a1090cf2eed752e352302e8d427abc6236f','2012-10-15 18:41:37');

/*!40000 ALTER TABLE `ad_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cm_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cm_groups`;

CREATE TABLE `cm_groups` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_leader_member_id` int(11) DEFAULT NULL,
  `node_address` text COLLATE utf8_unicode_ci,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table cm_member_accounts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cm_member_accounts`;
CREATE TABLE `cm_member_accounts` (
  `member_account_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `member_user_account_id` int(11) DEFAULT NULL,
  `account_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sponsor_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `upline_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_type_id` int(11) DEFAULT NULL,
  `account_status_id` int(11) DEFAULT NULL,
  `left_sp` decimal(10,2) NOT NULL DEFAULT 0,
  `right_sp` decimal(10,2) NOT NULL DEFAULT 0,
  `pairs_sp` int(11) NOT NULL DEFAULT 0,
  `gc_sp` INT NOT NULL DEFAULT 0, 
  `flushout_sp` INT NOT NULL DEFAULT 0, 
  `gc_pair_ctr_sp` INT NOT NULL DEFAULT 0,
  `left_vp` decimal(10,2) NOT NULL DEFAULT 0,
  `right_vp` decimal(10,2) NOT NULL DEFAULT 0,
  `pairs_vp` int(11) NOT NULL DEFAULT 0,
  `gc_vp` INT NOT NULL DEFAULT 0, 
  `flushout_vp` INT NOT NULL DEFAULT 0, 
  `gc_pair_ctr_vp` INT NOT NULL DEFAULT 0,
  `left_rs` decimal(10,2)  NOT NULL DEFAULT 0,
  `right_rs` decimal(10,2)  NOT NULL DEFAULT 0,
  `pairs_rs` int(11)  NOT NULL DEFAULT 0,
  `gc_rs` INT NOT NULL DEFAULT 0, 
  `flushout_rs` INT NOT NULL DEFAULT 0, 
  `gc_pair_ctr_rs` INT NOT NULL DEFAULT 0,
  `node_address` text COLLATE utf8_unicode_ci,
  `uni_node` text COLLATE utf8_unicode_ci,
  `monthly_maintenance_ctr` INT NOT NULL DEFAULT 0,
  `annual_maintenance_ctr` INT NOT NULL DEFAULT 0,
  `cd_amount` DECIMAL(10,2) NOT NULL DEFAULT 0,
  `update_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`member_account_id`),
  UNIQUE KEY `account_id` (`account_id`),
  KEY `member_id` (`member_id`),
  KEY `sponsor_id` (`sponsor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


# Dump of table cm_member_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cm_member_groups`;

CREATE TABLE `cm_member_groups` (
  `member_id` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '0',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`member_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table cm_member_payouts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cm_member_payouts`;

CREATE TABLE `cm_member_payouts` (
  `transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `gross_amount` decimal(10,2) DEFAULT NULL,
  `tax` decimal(10,2) DEFAULT NULL,
  `net_amount` decimal(10,2) DEFAULT NULL,
  `additional_tax` decimal(10,2) DEFAULT '0.00',
  `total_amount` decimal(10,2) DEFAULT '0.00',
  `type` VARCHAR( 20 ) NOT NULL DEFAULT '',
  `status` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `remarks` text COLLATE utf8_unicode_ci,
  `update_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table cm_member_shopping_cart_products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cm_member_shopping_cart_products`;

CREATE TABLE `cm_member_shopping_cart_products` (
  `cart_products_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_cart_products_id` int(11) unsigned NOT NULL,
  `member_id` int(11) unsigned NOT NULL,
  `package_product_id` int(11) unsigned NOT NULL DEFAULT '0',
  `product_id` int(11) unsigned NOT NULL DEFAULT '0',
  `quantity` int(11) unsigned NOT NULL DEFAULT '0',
  `is_product_rebate` tinyint(1) NOT NULL DEFAULT '0',
  `remarks` text,
  `update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cart_products_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table cm_member_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cm_member_types`;

CREATE TABLE `cm_member_types` (
  `member_id` int(11) NOT NULL DEFAULT '0',
  `member_type_id` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`member_id`,`member_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table cm_member_user_accounts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cm_member_user_accounts`;

CREATE TABLE `cm_member_user_accounts` (
  `member_user_account_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `primary_account_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login_hash` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`member_user_account_id`),
  KEY `member_id` (`member_id`),
  KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


# Dump of table cm_member_voucher_products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cm_member_voucher_products`;

CREATE TABLE `cm_member_voucher_products` (
  `voucher_product_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `voucher_product_name` text COLLATE utf8_unicode_ci NOT NULL,
  `voucher_type_id` int(11) NOT NULL DEFAULT '0',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`voucher_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table cm_member_voucher_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cm_member_voucher_types`;

CREATE TABLE `cm_member_voucher_types` (
  `voucher_type_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`voucher_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table cm_member_vouchers
# ------------------------------------------------------------

# DROP TABLE IF EXISTS `cm_member_vouchers`;
# 
# CREATE TABLE `cm_member_vouchers` (
#   `voucher_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
#   `voucher_type_id` int(11) NOT NULL DEFAULT '0',
#   `voucher_product_id` int(11) unsigned NOT NULL DEFAULT '0',
#   `voucher_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
#   `confirmation_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
#   `redemption_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
#   `member_id` int(11) DEFAULT '0',
#   `member_code` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
#   `product_id` int(11) DEFAULT '0',
#   `product_text` text COLLATE utf8_unicode_ci NOT NULL,
#   `last_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
#   `first_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
#   `middle_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
#   `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
#   `mobile_number` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
#   `user_id` int(11) NOT NULL DEFAULT '0',
#   `status` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ACTIVE',
#   `remarks` text COLLATE utf8_unicode_ci,
#   `start_timestamp` timestamp NULL DEFAULT '0000-00-00 00:00:00',
#   `end_timestamp` timestamp NULL DEFAULT '0000-00-00 00:00:00',
#   `update_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
#   `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
#   PRIMARY KEY (`voucher_id`),
#   UNIQUE KEY `voucher_code` (`voucher_code`),
#   KEY `from_member_id` (`member_id`)
# ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table cm_member_vouchers_view
# ------------------------------------------------------------

DROP VIEW IF EXISTS `cm_member_vouchers_view`;

CREATE TABLE `cm_member_vouchers_view` (
   `voucher_id` INT(11) UNSIGNED NOT NULL DEFAULT '0',
   `voucher_type_id` INT(11) NOT NULL DEFAULT '0',
   `voucher_code` VARCHAR(100) DEFAULT NULL,
   `confirmation_code` VARCHAR(10) DEFAULT NULL,
   `redemption_code` VARCHAR(10) DEFAULT NULL,
   `member_id` INT(11) DEFAULT '0',
   `member_code` VARCHAR(64) DEFAULT NULL,
   `product_id` INT(11) DEFAULT '0',
   `product_text` TEXT NOT NULL,
   `last_name` VARCHAR(100) DEFAULT NULL,
   `first_name` VARCHAR(100) DEFAULT NULL,
   `middle_name` VARCHAR(100) DEFAULT NULL,
   `email` VARCHAR(100) DEFAULT NULL,
   `mobile_number` VARCHAR(100) DEFAULT NULL,
   `home_address` TEXT DEFAULT NULL,
   `birthdate` DATE DEFAULT NULL,
   `sex` VARCHAR(1) DEFAULT NULL,
   `nationality` VARCHAR(64) DEFAULT NULL,
   `marital_status` VARCHAR(64) DEFAULT NULL,
   `tin` VARCHAR(64) DEFAULT NULL,
   `beneficiary1` TEXT DEFAULT NULL,
   `beneficiary2` TEXT DEFAULT NULL,
   `user_id` INT(11) NOT NULL DEFAULT '0',
   `status` VARCHAR(64) NOT NULL DEFAULT 'ACTIVE',
   `remarks` TEXT DEFAULT NULL,
   `start_timestamp` TIMESTAMP DEFAULT '0000-00-00 00:00:00',
   `end_timestamp` TIMESTAMP DEFAULT '0000-00-00 00:00:00',
   `update_timestamp` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
   `insert_timestamp` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM;



DROP TABLE IF EXISTS `cm_members`;

CREATE TABLE `cm_members` (
  `member_id` int(11) NOT NULL AUTO_INCREMENT,
  `last_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `middle_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `secondary_email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile_number` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `secondary_mobile_number` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_filename` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `home_address` text COLLATE utf8_unicode_ci,
  `home_address_street` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `home_address_city` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `home_address_province` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `home_address_country` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `home_address_zip_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `sex` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nationality` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `marital_status` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tin` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `beneficiary1` text COLLATE utf8_unicode_ci,
  `beneficiary2` text COLLATE utf8_unicode_ci,
  `id_number` VARCHAR(64) NULL, 
  `rf_id` VARCHAR(20) NULL,
  `metrobank_paycard_number` VARCHAR(20) NULL,
  `is_email_verified` TINYINT( 1 ) NOT NULL DEFAULT '0',
  `is_auto_payout` TINYINT( 1 ) NOT NULL DEFAULT '1',
  `funds` DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  `gift_cheques` DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  `session_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `update_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `completed_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`member_id`),
  KEY `last_name` (`last_name`),
  KEY `first_name` (`first_name`),
  KEY `middle_name` (`middle_name`),
  KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


# Dump of table cm_purchase_order_products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cm_purchase_order_products`;

CREATE TABLE `cm_purchase_order_products` (
  `purchase_order_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL,
  `package_quantity` int(10) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `unit_price` decimal(11,2) unsigned NOT NULL DEFAULT '0.00',
  `is_swappable` int(1) NOT NULL DEFAULT '0',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`purchase_order_id`,`package_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table cm_purchase_orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cm_purchase_orders`;

CREATE TABLE `cm_purchase_orders` (
  `purchase_order_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order_status` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_amount` decimal(11,2) unsigned DEFAULT NULL,
  `remarks` text COLLATE utf8_unicode_ci,
  `update_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`purchase_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table is_facilities
# ------------------------------------------------------------

#DROP TABLE IF EXISTS `is_facilities`;
#
#CREATE TABLE `is_facilities` (
#  `facility_id` int(11) NOT NULL AUTO_INCREMENT,
#  `facility_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
#  `facility_description` text COLLATE utf8_unicode_ci,
#  `facility_type_id` int(11) DEFAULT NULL,
#  `facility_address` text COLLATE utf8_unicode_ci,
#  `facility_contact_details` text COLLATE utf8_unicode_ci,
#  PRIMARY KEY (`facility_id`)
#) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
#
#LOCK TABLES `is_facilities` WRITE;
#/*!40000 ALTER TABLE `is_facilities` DISABLE KEYS */;
#
#INSERT INTO `is_facilities` (`facility_id`, `facility_name`, `facility_description`, `facility_type_id`, `facility_address`, `facility_contact_details`)
#VALUES
#	(1,'Ortigas Warehouse','Ortigas Warehouse',1,'Ortigas',''),
#	(2,'Ortigas Depot','Ortigas Depot',2,'Ortigas',''),
#	(3,'Cebu Warehouse','Cebu Warehouse',1,'Cebu','123456'),
#	(4,'Cebu Depot','Cebu Depot',2,'Cebu','123456'),
#	(5,'Davao Depot','Davao Depot',2,'Davao',''),
#	(6,'Euro Pharma','Euro Pharma',3,'Muntilupa','5551234');
#
#/*!40000 ALTER TABLE `is_facilities` ENABLE KEYS */;
#UNLOCK TABLES;


# Dump of table is_facility_items
# ------------------------------------------------------------

#DROP TABLE IF EXISTS `is_facility_items`;
#
#CREATE TABLE `is_facility_items` (
#  `facility_item_id` int(11) NOT NULL AUTO_INCREMENT,
#  `facility_id` int(11) DEFAULT NULL,
#  `item_id` int(11) DEFAULT NULL,
#  `qty` int(11) DEFAULT NULL,
#  `unit_id` int(11) DEFAULT NULL,
#  `critical_qty` int(11) DEFAULT NULL,
#  `update_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
#  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
#  PRIMARY KEY (`facility_item_id`),
#  UNIQUE KEY `facility_id` (`facility_id`,`item_id`),
#  KEY `facility_id_2` (`facility_id`),
#  KEY `item_id` (`item_id`)
#) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
#
#LOCK TABLES `is_facility_items` WRITE;
#/*!40000 ALTER TABLE `is_facility_items` DISABLE KEYS */;
#
#INSERT INTO `is_facility_items` (`facility_item_id`, `facility_id`, `item_id`, `qty`, `unit_id`, `critical_qty`, `update_timestamp`, `insert_timestamp`)
#VALUES
#	(1,1,197,0,1,204,'2012-09-26 22:36:25','2012-08-05 11:56:58'),
#	(2,1,182,0,1,204,'2012-09-24 21:40:27','2012-08-05 12:01:22'),
#	(3,1,183,0,1,0,'2012-08-05 12:07:34','2012-08-05 12:07:34'),
#	(4,1,177,0,1,0,'2012-08-05 12:09:04','2012-08-05 12:09:04'),
#	(5,1,126,0,1,0,'2012-08-05 12:11:31','2012-08-05 12:11:31'),
#	(6,1,198,0,1,0,'2012-08-05 12:17:12','2012-08-05 12:17:12'),
#	(7,1,107,0,1,0,'2012-08-05 12:34:26','2012-08-05 12:34:26'),
#	(8,1,45,0,1,0,'2012-08-05 12:35:25','2012-08-05 12:35:25'),
#	(9,1,196,0,1,0,'2012-08-05 12:36:19','2012-08-05 12:36:19'),
#	(10,1,30,0,1,0,'2012-08-05 13:15:49','2012-08-05 13:15:49'),
#	(11,1,1,0,1,0,'2012-09-26 01:53:24','2012-08-07 23:44:05'),
#	(12,1,199,0,1,1,'2012-09-26 01:53:24','2012-08-07 23:44:19'),
#	(13,1,201,0,1,1,'2012-09-26 01:53:23','2012-08-07 23:44:33'),
#	(14,1,200,0,1,1,'2012-09-26 01:53:24','2012-08-07 23:44:48'),
#	(15,1,202,0,1,1,'2012-09-26 01:53:23','2012-08-07 23:44:59'),
#	(16,1,180,0,1,0,'2012-08-07 23:46:19','2012-08-07 23:46:19'),
#	(17,1,194,0,1,0,'2012-08-07 23:54:51','2012-08-07 23:54:51'),
#	(18,1,65,0,1,0,'2012-08-08 00:06:46','2012-08-08 00:06:46'),
#	(19,1,187,0,1,0,'2012-08-08 20:08:57','2012-08-08 00:08:14'),
#	(20,1,193,0,1,0,'2012-08-08 00:09:15','2012-08-08 00:09:15'),
#	(21,1,179,0,1,0,'2012-08-08 00:13:37','2012-08-08 00:13:37'),
#	(22,1,29,0,1,0,'2012-08-08 00:19:40','2012-08-08 00:19:40'),
#	(23,1,186,0,1,0,'2012-08-08 00:26:33','2012-08-08 00:26:33'),
#	(24,1,64,0,1,0,'2012-08-08 00:27:18','2012-08-08 00:27:18'),
#	(25,1,12,0,1,0,'2012-08-08 00:27:50','2012-08-08 00:27:50'),
#	(26,1,13,0,1,0,'2012-08-08 00:31:25','2012-08-08 00:31:25'),
#	(27,1,14,0,1,0,'2012-08-08 00:31:46','2012-08-08 00:31:46'),
#	(28,1,9,0,1,0,'2012-08-08 00:35:01','2012-08-08 00:35:01'),
#	(29,1,10,0,1,13,'2012-09-24 22:36:30','2012-08-08 00:35:27'),
#	(30,1,16,0,1,0,'2012-08-08 18:59:47','2012-08-08 18:59:47'),
#	(31,1,15,0,1,0,'2012-08-08 19:00:08','2012-08-08 19:00:08'),
#	(32,1,11,0,1,0,'2012-08-08 19:05:10','2012-08-08 19:05:10'),
#	(33,1,4,0,1,0,'2012-08-08 19:09:57','2012-08-08 19:09:57'),
#	(34,1,5,0,1,0,'2012-08-08 19:10:27','2012-08-08 19:10:27'),
#	(35,1,6,0,1,0,'2012-08-08 19:10:46','2012-08-08 19:10:46'),
#	(36,1,2,0,1,0,'2012-08-08 19:23:32','2012-08-08 19:23:32'),
#	(37,1,8,0,1,0,'2012-08-08 19:23:52','2012-08-08 19:23:52'),
#	(38,1,7,0,1,0,'2012-08-08 19:31:01','2012-08-08 19:31:01'),
#	(39,1,3,0,1,0,'2012-08-08 19:31:19','2012-08-08 19:31:19'),
#	(40,1,84,0,1,0,'2012-08-08 19:32:23','2012-08-08 19:32:23'),
#	(41,1,116,0,1,0,'2012-08-08 19:41:07','2012-08-08 19:41:07'),
#	(42,1,79,0,1,0,'2012-09-26 01:53:24','2012-08-08 20:21:17'),
#	(43,1,113,0,1,0,'2012-08-08 20:21:43','2012-08-08 20:21:43'),
#	(44,1,19,0,1,1,'2012-09-26 01:53:24','2012-08-08 20:22:06'),
#	(45,1,203,0,1,0,'2012-08-08 20:26:26','2012-08-08 20:26:26'),
#	(46,1,204,0,1,0,'2012-08-08 20:28:43','2012-08-08 20:28:43'),
#	(47,1,18,0,1,0,'2012-08-08 20:29:15','2012-08-08 20:29:15'),
#	(48,1,47,0,1,0,'2012-08-08 20:29:43','2012-08-08 20:29:43'),
#	(49,1,49,0,1,0,'2012-08-08 20:30:50','2012-08-08 20:30:50'),
#	(50,1,70,0,1,0,'2012-08-08 21:11:19','2012-08-08 21:11:19'),
#	(51,1,205,0,1,0,'2012-08-08 21:11:43','2012-08-08 21:11:43'),
#	(52,1,206,0,1,0,'2012-08-08 21:18:25','2012-08-08 21:18:25'),
#	(53,1,207,0,1,0,'2012-08-08 21:20:54','2012-08-08 21:20:54'),
#	(54,1,208,0,1,0,'2012-08-08 23:01:10','2012-08-08 23:01:10'),
#	(55,1,209,0,1,0,'2012-08-08 23:01:28','2012-08-08 23:01:28'),
#	(56,1,210,0,1,0,'2012-08-08 23:03:13','2012-08-08 23:03:13'),
#	(57,1,114,0,1,0,'2012-08-08 23:05:27','2012-08-08 23:05:27'),
#	(58,1,190,0,1,0,'2012-08-08 23:30:22','2012-08-08 23:30:22'),
#	(59,1,211,0,1,0,'2012-08-08 23:31:03','2012-08-08 23:31:03'),
#	(60,1,212,0,1,0,'2012-08-08 23:31:59','2012-08-08 23:31:59'),
#	(61,1,213,0,1,0,'2012-08-08 23:32:15','2012-08-08 23:32:15'),
#	(62,1,214,0,1,0,'2012-08-08 23:32:33','2012-08-08 23:32:33'),
#	(63,1,215,0,1,0,'2012-08-08 23:32:55','2012-08-08 23:32:55'),
#	(64,1,32,0,1,0,'2012-08-08 23:33:22','2012-08-08 23:33:22'),
#	(65,1,159,0,1,0,'2012-08-08 23:36:38','2012-08-08 23:36:38'),
#	(66,1,118,0,1,0,'2012-08-08 23:40:36','2012-08-08 23:40:36'),
#	(67,1,106,0,1,0,'2012-08-08 23:46:14','2012-08-08 23:46:14'),
#	(68,1,52,0,1,0,'2012-08-08 23:50:12','2012-08-08 23:50:12'),
#	(69,1,54,0,1,0,'2012-08-08 23:51:04','2012-08-08 23:51:04'),
#	(70,1,216,0,1,0,'2012-08-08 23:55:29','2012-08-08 23:55:29'),
#	(71,1,59,0,1,0,'2012-08-08 23:57:07','2012-08-08 23:57:07'),
#	(72,1,217,0,1,0,'2012-08-08 23:57:20','2012-08-08 23:57:20'),
#	(73,1,129,0,1,0,'2012-08-08 23:58:32','2012-08-08 23:58:32'),
#	(74,1,60,0,1,0,'2012-08-08 23:59:55','2012-08-08 23:59:55'),
#	(75,1,218,0,1,0,'2012-08-09 00:00:13','2012-08-09 00:00:13'),
#	(76,1,40,0,1,0,'2012-08-09 00:00:48','2012-08-09 00:00:48'),
#	(77,1,48,0,1,0,'2012-08-09 00:02:11','2012-08-09 00:02:11'),
#	(78,1,154,0,1,0,'2012-08-09 00:05:48','2012-08-09 00:05:48'),
#	(79,1,105,0,1,0,'2012-08-09 00:06:25','2012-08-09 00:06:25'),
#	(80,1,219,0,1,0,'2012-08-09 00:19:09','2012-08-09 00:19:09'),
#	(81,1,173,0,1,0,'2012-08-09 00:20:16','2012-08-09 00:20:16'),
#	(82,1,174,0,1,0,'2012-08-09 00:20:32','2012-08-09 00:20:32'),
#	(83,1,176,0,1,0,'2012-08-09 00:21:14','2012-08-09 00:21:14'),
#	(84,1,17,0,1,0,'2012-08-09 00:22:20','2012-08-09 00:22:20'),
#	(85,1,28,0,1,0,'2012-08-09 00:22:33','2012-08-09 00:22:33'),
#	(86,1,35,0,1,0,'2012-08-09 00:23:08','2012-08-09 00:23:08'),
#	(87,1,220,0,1,0,'2012-08-09 00:24:05','2012-08-09 00:24:05'),
#	(88,1,21,0,1,0,'2012-08-09 00:24:20','2012-08-09 00:24:20'),
#	(89,1,44,0,1,0,'2012-08-09 00:25:05','2012-08-09 00:25:05'),
#	(90,1,158,0,1,1,'2012-09-26 01:53:24','2012-08-09 00:26:59'),
#	(91,1,110,0,1,0,'2012-08-09 00:27:29','2012-08-09 00:27:29'),
#	(92,1,128,0,1,0,'2012-08-09 00:29:49','2012-08-09 00:29:49'),
#	(93,1,223,0,1,0,'2012-08-09 00:30:14','2012-08-09 00:30:14'),
#	(94,1,162,0,1,0,'2012-08-09 00:30:39','2012-08-09 00:30:39'),
#	(95,1,97,0,1,0,'2012-08-09 00:35:07','2012-08-09 00:35:07'),
#	(96,1,96,0,1,0,'2012-08-09 00:35:24','2012-08-09 00:35:24'),
#	(97,1,95,0,1,0,'2012-08-09 00:35:42','2012-08-09 00:35:42'),
#	(98,1,224,0,1,0,'2012-08-09 00:36:01','2012-08-09 00:36:01'),
#	(99,1,94,0,1,0,'2012-08-09 00:36:25','2012-08-09 00:36:25'),
#	(100,1,155,0,1,0,'2012-08-09 00:37:15','2012-08-09 00:37:15'),
#	(101,1,225,0,1,0,'2012-08-09 00:38:40','2012-08-09 00:38:40'),
#	(102,1,191,0,1,0,'2012-09-26 01:53:24','2012-08-09 00:39:10'),
#	(103,1,226,0,1,0,'2012-08-09 00:40:39','2012-08-09 00:40:39'),
#	(104,1,227,0,1,0,'2012-08-09 00:41:40','2012-08-09 00:41:40'),
#	(105,1,228,0,1,0,'2012-08-09 00:42:34','2012-08-09 00:42:34'),
#	(106,1,229,0,1,0,'2012-08-09 00:43:39','2012-08-09 00:43:39'),
#	(107,2,197,0,1,15000,'2012-08-15 02:58:27','2012-08-15 02:58:27'),
#	(108,2,191,0,1,350,'2012-08-15 03:00:45','2012-08-15 03:00:45'),
#	(109,2,182,0,1,300,'2012-08-15 03:15:51','2012-08-15 03:15:51'),
#	(110,2,183,0,1,300,'2012-08-15 03:16:19','2012-08-15 03:16:19'),
#	(111,2,184,0,1,300,'2012-08-15 03:26:04','2012-08-15 03:26:04'),
#	(112,2,232,0,1,350,'2012-08-15 04:15:41','2012-08-15 04:15:41'),
#	(113,2,30,0,1,700,'2012-08-15 04:19:23','2012-08-15 04:18:32'),
#	(114,2,180,0,1,700,'2012-08-15 04:23:08','2012-08-15 04:23:08'),
#	(115,2,65,0,1,700,'2012-08-15 04:28:34','2012-08-15 04:28:34'),
#	(116,2,187,0,1,700,'2012-08-15 04:29:04','2012-08-15 04:29:04'),
#	(117,2,194,0,1,700,'2012-08-15 04:29:46','2012-08-15 04:29:46'),
#	(118,2,29,0,1,500,'2012-08-15 04:50:21','2012-08-15 04:50:21'),
#	(119,2,179,0,1,500,'2012-08-15 04:50:46','2012-08-15 04:50:46'),
#	(120,2,64,0,1,500,'2012-08-15 04:51:27','2012-08-15 04:51:27'),
#	(121,2,186,0,1,500,'2012-08-15 04:51:50','2012-08-15 04:51:50'),
#	(122,2,193,0,1,500,'2012-08-15 04:52:15','2012-08-15 04:52:15'),
#	(123,2,9,0,1,500,'2012-08-15 04:52:51','2012-08-15 04:52:51'),
#	(124,2,10,0,1,500,'2012-08-15 04:53:40','2012-08-15 04:53:40'),
#	(125,2,11,0,1,500,'2012-08-15 04:54:10','2012-08-15 04:54:10'),
#	(126,2,12,0,1,500,'2012-08-15 04:54:46','2012-08-15 04:54:46'),
#	(127,2,13,0,1,500,'2012-08-15 04:55:06','2012-08-15 04:55:06'),
#	(128,2,14,0,1,500,'2012-08-15 04:55:39','2012-08-15 04:55:39'),
#	(129,2,15,0,1,500,'2012-08-15 04:55:58','2012-08-15 04:55:58'),
#	(130,2,16,0,1,500,'2012-08-15 04:56:18','2012-08-15 04:56:18'),
#	(131,2,1,0,1,300,'2012-08-15 06:35:27','2012-08-15 06:35:27'),
#	(132,2,2,0,1,300,'2012-08-15 06:37:55','2012-08-15 06:37:55'),
#	(133,2,3,0,1,300,'2012-08-15 06:38:21','2012-08-15 06:38:21'),
#	(134,2,4,0,1,300,'2012-08-15 06:38:39','2012-08-15 06:38:39'),
#	(135,2,5,0,1,300,'2012-08-15 06:38:57','2012-08-15 06:38:57'),
#	(136,2,6,0,1,300,'2012-08-15 06:39:17','2012-08-15 06:39:17'),
#	(137,2,7,0,1,300,'2012-08-15 06:39:35','2012-08-15 06:39:35'),
#	(138,2,8,0,1,300,'2012-08-15 06:39:51','2012-08-15 06:39:51'),
#	(139,2,79,0,1,300,'2012-08-15 06:40:16','2012-08-15 06:40:16'),
#	(140,2,84,0,1,300,'2012-08-15 06:40:42','2012-08-15 06:40:42'),
#	(141,2,113,0,1,300,'2012-08-15 06:41:01','2012-08-15 06:41:01'),
#	(142,2,116,0,1,300,'2012-08-15 06:41:32','2012-08-15 06:41:32'),
#	(143,2,19,0,1,300,'2012-08-15 06:46:35','2012-08-15 06:46:35'),
#	(144,2,202,0,1,1000,'2012-08-15 08:19:08','2012-08-15 08:19:08'),
#	(145,2,201,0,1,1000,'2012-08-15 08:19:31','2012-08-15 08:19:31'),
#	(146,2,199,0,1,1000,'2012-08-15 08:20:18','2012-08-15 08:20:18'),
#	(147,2,231,0,1,1000,'2012-08-15 08:20:35','2012-08-15 08:20:35'),
#	(148,2,200,0,1,1000,'2012-08-15 08:20:55','2012-08-15 08:20:55'),
#	(149,2,18,0,1,0,'2012-08-15 08:21:20','2012-08-15 08:21:20'),
#	(150,2,207,0,1,0,'2012-08-15 21:38:56','2012-08-15 21:38:56'),
#	(151,2,233,0,1,0,'2012-08-15 22:46:45','2012-08-15 22:46:45'),
#	(152,2,227,0,1,0,'2012-08-15 22:49:24','2012-08-15 22:49:24'),
#	(153,2,36,0,1,0,'2012-08-15 22:51:15','2012-08-15 22:51:15'),
#	(154,2,38,0,1,0,'2012-08-15 22:55:17','2012-08-15 22:55:17'),
#	(155,2,52,0,1,0,'2012-08-15 22:56:24','2012-08-15 22:56:24'),
#	(156,2,53,0,1,0,'2012-08-15 22:56:51','2012-08-15 22:56:51'),
#	(157,2,54,0,1,0,'2012-08-15 22:57:38','2012-08-15 22:57:38'),
#	(158,2,55,0,1,0,'2012-08-15 22:57:56','2012-08-15 22:57:56'),
#	(159,2,56,0,1,0,'2012-08-15 22:58:09','2012-08-15 22:58:09'),
#	(160,2,58,0,1,0,'2012-08-15 23:06:21','2012-08-15 23:06:21'),
#	(161,2,59,0,1,0,'2012-08-15 23:07:33','2012-08-15 23:07:33'),
#	(162,2,217,0,1,0,'2012-08-15 23:08:00','2012-08-15 23:08:00'),
#	(163,2,129,0,1,0,'2012-08-15 23:08:22','2012-08-15 23:08:22'),
#	(164,2,61,0,1,0,'2012-08-15 23:09:52','2012-08-15 23:09:52'),
#	(165,2,104,0,1,0,'2012-08-15 23:11:03','2012-08-15 23:11:03'),
#	(166,2,105,0,1,0,'2012-08-15 23:14:46','2012-08-15 23:13:54'),
#	(167,2,118,0,1,0,'2012-08-15 23:18:39','2012-08-15 23:18:39'),
#	(168,2,87,0,1,0,'2012-08-15 23:29:34','2012-08-15 23:29:34'),
#	(169,2,154,0,1,0,'2012-08-15 23:44:09','2012-08-15 23:44:09'),
#	(170,2,160,0,1,0,'2012-08-16 00:14:33','2012-08-16 00:14:33'),
#	(171,2,234,0,1,0,'2012-08-16 00:14:50','2012-08-16 00:14:50'),
#	(172,2,235,0,1,0,'2012-08-16 00:15:00','2012-08-16 00:15:00'),
#	(173,2,219,0,1,0,'2012-08-16 00:33:10','2012-08-16 00:33:10'),
#	(174,2,164,0,1,0,'2012-08-16 00:33:25','2012-08-16 00:33:25'),
#	(175,2,163,0,1,0,'2012-08-16 00:33:45','2012-08-16 00:33:45'),
#	(176,2,130,0,1,0,'2012-08-16 00:42:56','2012-08-16 00:42:56'),
#	(177,2,132,0,1,0,'2012-08-16 00:43:43','2012-08-16 00:43:43'),
#	(178,2,133,0,1,0,'2012-08-16 00:46:35','2012-08-16 00:46:35'),
#	(179,2,134,0,1,0,'2012-08-16 00:46:49','2012-08-16 00:46:49'),
#	(180,2,135,0,1,0,'2012-08-16 00:47:01','2012-08-16 00:47:01'),
#	(181,2,139,0,1,0,'2012-08-16 01:09:14','2012-08-16 01:09:14'),
#	(182,2,140,0,1,0,'2012-08-16 01:10:11','2012-08-16 01:10:11'),
#	(183,2,143,0,1,0,'2012-08-16 01:10:27','2012-08-16 01:10:27'),
#	(184,2,144,0,1,0,'2012-08-16 01:10:38','2012-08-16 01:10:38'),
#	(185,2,145,0,1,0,'2012-08-16 01:10:56','2012-08-16 01:10:56'),
#	(186,2,146,0,1,0,'2012-08-16 01:12:56','2012-08-16 01:12:56'),
#	(187,2,148,0,1,0,'2012-08-16 01:13:13','2012-08-16 01:13:13'),
#	(188,2,152,0,1,0,'2012-08-16 01:28:51','2012-08-16 01:28:51'),
#	(189,2,153,0,1,0,'2012-08-16 01:30:00','2012-08-16 01:30:00'),
#	(190,2,236,0,1,0,'2012-08-16 01:32:05','2012-08-16 01:32:05'),
#	(191,2,237,0,1,0,'2012-08-16 01:40:59','2012-08-16 01:40:59'),
#	(192,2,238,0,1,0,'2012-08-16 01:41:13','2012-08-16 01:41:13'),
#	(193,2,239,0,1,0,'2012-08-16 01:41:26','2012-08-16 01:41:26'),
#	(194,2,166,0,1,0,'2012-08-16 01:43:38','2012-08-16 01:43:38'),
#	(195,2,167,0,1,0,'2012-08-16 01:43:53','2012-08-16 01:43:53'),
#	(196,2,168,0,1,0,'2012-08-16 01:44:04','2012-08-16 01:44:04'),
#	(197,2,169,0,1,0,'2012-08-16 01:44:14','2012-08-16 01:44:14'),
#	(198,2,171,0,1,0,'2012-08-16 01:44:25','2012-08-16 01:44:25'),
#	(199,2,172,0,1,0,'2012-08-16 01:44:44','2012-08-16 01:44:44'),
#	(200,2,173,0,1,0,'2012-08-16 01:45:02','2012-08-16 01:45:02'),
#	(201,2,174,0,1,0,'2012-08-16 01:45:27','2012-08-16 01:45:27'),
#	(202,2,50,0,1,0,'2012-08-16 01:51:50','2012-08-16 01:51:50'),
#	(203,2,176,0,1,0,'2012-08-16 01:52:11','2012-08-16 01:52:11'),
#	(204,2,17,0,1,0,'2012-08-16 01:53:50','2012-08-16 01:53:50'),
#	(205,2,28,0,1,0,'2012-08-16 01:54:05','2012-08-16 01:54:05'),
#	(206,2,35,0,1,0,'2012-08-16 01:54:17','2012-08-16 01:54:17'),
#	(207,2,220,0,1,0,'2012-08-16 01:54:26','2012-08-16 01:54:26'),
#	(208,2,206,0,1,0,'2012-08-21 21:34:49','2012-08-21 21:34:49'),
#	(209,2,158,0,1,0,'2012-08-21 21:40:27','2012-08-21 21:40:27'),
#	(210,2,88,0,1,0,'2012-08-21 21:41:37','2012-08-21 21:41:37'),
#	(211,2,225,0,1,0,'2012-08-21 21:43:53','2012-08-21 21:43:53'),
#	(212,2,44,0,1,0,'2012-08-21 21:45:41','2012-08-21 21:45:41'),
#	(213,2,150,0,1,0,'2012-08-21 21:48:10','2012-08-21 21:48:10'),
#	(214,1,57,0,1,0,'2012-08-21 21:49:39','2012-08-21 21:49:39'),
#	(215,2,241,0,1,0,'2012-08-21 21:50:44','2012-08-21 21:50:44'),
#	(216,1,80,0,1,1,'2012-09-26 01:53:24','2012-09-26 01:53:07');
#
#/*!40000 ALTER TABLE `is_facility_items` ENABLE KEYS */;
#UNLOCK TABLES;


# Dump of table is_facility_items_view
# ------------------------------------------------------------

DROP VIEW IF EXISTS `is_facility_items_view`;

CREATE TABLE `is_facility_items_view` (
   `facility_item_id` INT(11) NOT NULL DEFAULT '0',
   `facility_id` INT(11) DEFAULT NULL,
   `item_id` INT(11) DEFAULT NULL,
   `item_name` VARCHAR(100) DEFAULT NULL,
   `item_description` TEXT DEFAULT NULL,
   `qty` INT(11) DEFAULT NULL,
   `unit_id` INT(11) DEFAULT NULL,
   `unit_name` VARCHAR(100) DEFAULT NULL,
   `critical_qty` INT(11) DEFAULT NULL,
   `update_timestamp` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
   `insert_timestamp` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM;



# Dump of table is_item_builds
# ------------------------------------------------------------

DROP TABLE IF EXISTS `is_item_builds`;

CREATE TABLE `is_item_builds` (
  `item_id` int(11) DEFAULT NULL,
  `child_item_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table is_item_materials
# ------------------------------------------------------------

DROP TABLE IF EXISTS `is_item_materials`;

CREATE TABLE `is_item_materials` (
  `item_material_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `material_item_id` int(11) DEFAULT NULL,
  `quantity` decimal(10,2) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`item_material_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table is_items
# ------------------------------------------------------------

#DROP TABLE IF EXISTS `is_items`;

#CREATE TABLE `is_items` (
#  `item_id` int(11) NOT NULL AUTO_INCREMENT,
#  `item_code` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
#  `item_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
#  `item_description` text COLLATE utf8_unicode_ci,
#  `unit_id` int(11) NOT NULL,
#  `item_type_id` int(10) unsigned NOT NULL DEFAULT '0',
#  `item_sub_type_id` int(11) NOT NULL DEFAULT '0',
#  `sub_category` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
#  PRIMARY KEY (`item_id`),
#  KEY `item_type_id` (`item_type_id`)
#) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#LOCK TABLES `is_items` WRITE;
/*!40000 ALTER TABLE `is_items` DISABLE KEYS */;

#INSERT INTO `is_items` (`item_id`, `item_code`, `item_name`, `item_description`, `unit_id`, `item_type_id`, `item_sub_type_id`, `sub_category`)
#VALUES
#	(1,'FP000001','200ML COTTON BREEZE','PURE TOUCH HAND SANITIZER CB',1,2,5,'PURE TOUCH HAND SANITIZER'),
#	(2,'FP000002','200ML ISLAND KISS','PURE TOUCH HAND SANITIZER IK',1,2,5,'PURE TOUCH HAND SANITIZER'),
#	(3,'FP000003','200ML MOON SHADOW','PURE TOUCH HAND SANITIZER MS',1,2,5,'PURE TOUCH HAND SANITIZER'),
#	(4,'FP000004','200ML ORANGE CRUSH','PURE TOUCH HAND SANITIZER OC',1,2,5,'PURE TOUCH HAND SANITIZER'),
#	(5,'FP000005','200ML PACIFICA','PURE TOUCH HAND SANITIZER P',1,2,5,'PURE TOUCH HAND SANITIZER'),
#	(6,'FP000006','200ML SATIN BLOOM','PURE TOUCH HAND SANITIZER SB',1,2,5,'PURE TOUCH HAND SANITIZER'),
#	(7,'FP000007','200ML SECRET WHISPER','PURE TOUCH HAND SANITIZER SW',1,2,5,'PURE TOUCH HAND SANITIZER'),
#	(8,'FP000008','200ML SILK CHIFFON','PURE TOUCH HAND SANITIZER SC',1,2,5,'PURE TOUCH HAND SANITIZER'),
#	(9,'FP000009','30ML COTTON BREEZE','PURE TOUCH HAND SANITIZER CB30',1,2,5,'PURE TOUCH HAND SANITIZER'),
#	(10,'FP000010','30ML ISLAND KISS','PURE TOUCH HAND SANITIZER IK30',1,2,5,'PURE TOUCH HAND SANITIZER'),
#	(11,'FP000011','30ML MOON SHADOW','PURE TOUCH HAND SANITIZER MS30',1,2,5,'PURE TOUCH HAND SANITIZER'),
#	(12,'FP000012','30ML ORANGE CRUSH','PURE TOUCH HAND SANITIZER OC30',1,2,5,'PURE TOUCH HAND SANITIZER'),
#	(13,'FP000013','30ML PACIFICA','PURE TOUCH HAND SANITIZER P30',1,2,5,'PURE TOUCH HAND SANITIZER'),
#	(14,'FP000014','30ML SATIN BLOOM','PURE TOUCH HAND SANITIZER SB30',1,2,5,'PURE TOUCH HAND SANITIZER'),
#	(15,'FP000015','30ML SECRET WHISPER','PURE TOUCH HAND SANITIZER SW30',1,2,5,'PURE TOUCH HAND SANITIZER'),
#	(16,'FP000016','30ML SILK CHIFFON','PURE TOUCH HAND SANITIZER SC30',1,2,5,'PURE TOUCH HAND SANITIZER'),
#	(17,'MM000017','ALKALINE 60ML','ALKALINE 60ML',1,4,16,'MARKETING MATERIAL'),
#	(18,'MM000018','APPLICATION FORM','APPLICATION',1,4,18,'MARKETING MATERIAL'),
#	(19,'FP000019','BABY FRESH COLOGNE','BABY FRESH BABY COLOGNE 100ML',1,2,5,'BABY FRESH BABY COLOGNE'),
#	(20,'MM000020','BAG TAG','BAG TAG',1,4,14,'MARKETING MATERIAL'),
#	(21,'MM000021','BALLPEN','BALLPEN WITH VITAL C LOGO',1,4,23,'MARKETING MATERIAL'),
#	(22,'PM000022','BARCODE STICKERS','BARCODE STICKERS FOR SANITIZER BARCODE 01 TO 08.',1,3,9,'PACKAGING MATERIAL'),
#	(23,'PM000023','BBOX CHOCO MORINGA','CHOCO MORINGA BLISTER BOX',1,3,7,'SO FRESH JUICE'),
#	(24,'PM000024','BBOX GUAVA DALANDAN','GUAVA DALANDAN BLISTER BOX',1,3,7,'SO FRESH JUICE'),
#	(25,'PM000025','BBOX MANGO CARROT','MANGO CARROT BLISTER BOX',1,3,7,'SO FRESH JUICE'),
#	(26,'PM000026','BBOX SUGARCANE','SUGARCANE BLISTER BOX',1,3,7,'SO FRESH JUICE'),
#	(27,'PM000027','BBOX TOMATO CALAMANS','TOMATO CALAMANS BLISTER BOX',1,3,7,'SO FRESH JUICE'),
#	(28,'MM000028','BETADINE 60ML','BETADINE 60ML',1,4,16,'MARKETING MATERIAL'),
#	(29,'RM000029','BIO SKIN SOAP 15G','BIO SKIN SOAP 15G',1,1,4,'SOAP'),
#	(30,'RM000030','BIO SKIN SOAP 90G','BIO SKIN SOAP 90G',1,1,4,'SOAP'),
#	(31,'PM000031','BIO SKIN SOAP BOX','BIO SKIN SOAP BOX',1,3,7,'PACKAGING MATERIAL'),
#	(32,'PM000032','Blister Vital White (Pad)','Blister Vital White (Pad)',1,3,26,'MARKETING MATERIAL'),
#	(33,'MM000033','BROCH 4 FOLDS','BROCHURE 4 FOLDS 5 PANELS',1,4,15,'MARKETING MATERIAL'),
#	(34,'MM000034','BROCH 5 FOLDS 6 PANE','BROCHURES 5 FOLDS 6 PANELS',1,4,15,'MARKETING MATERIAL'),
#	(35,'MM000035','BULB TEST BASE','BULB TESTER BASE',1,4,16,'MARKETING MATERIAL'),
#	(36,'MM000036','BUSINESS PLAN BROCH.','BUSINESS PLAN BROCH 5 folds',1,4,15,'MARKETING MATERIAL'),
#	(37,'MM000037','CAR STICKER CLEAR','CAR STICKER CLEAR-LONG FOR CAR',1,4,23,'MARKETING MATERIAL'),
#	(38,'MM000038','CATALOGUE Vol 1','CATALOG C2S 100 PLASTIC LAM(COVER) c2s 70 (INSIDE) 30 CM X 21 CM',1,4,15,'MARKETING MATERIAL'),
#	(39,'MM000039','CD ENVELOPE','CD ENVELOPE',1,4,23,'MARKETING MATERIAL'),
#	(40,'MM000040','CHAIRMANS MESSAGE','CHAIRMANS MESSAGE',1,4,12,'MARKETING MATERIAL'),
#	(41,'RM000041','COFFEE 14G 6-IN-1','COFFEE 14G 16-IN-1',1,1,1,'COFFEE'),
#	(42,'PM000042','COFFEE ADHESIVE TPS','COFFEE ADHESIVE TPS',1,3,9,'PACKAGING MATERIAL'),
#	(43,'PM000043','COFFEE BOX','VITAL C COFFE BOX',1,3,7,'PACKAGING MATERIAL'),
#	(44,'MM000044','COFFEE MUG IPOH','COFFEE MUG IPOH',1,4,23,'MARKETING MATERIAL'),
#	(45,'PM000045','CORROGATED BOX','CORROGATED BOX',1,3,7,'PACKAGING MATERIAL'),
#	(46,'MM000046','DEMO KIT','DEMO KIT',1,4,16,'MARKETING MATERIAL'),
#	(47,'MM000047','DISTRIBUTOR FORM','DISTRIBUTOR FORM',1,4,18,'MARKETING MATERIAL'),
#	(48,'MM000048','DR. OCLARITS ARTICLE/INSERTS','DR. OCLARITS ARTICLE/INSERTS',1,4,12,'MARKETING MATERIAL'),
#	(49,'MM000049','DTI Sec Reg Cert.','DTI Sec Reg Cert.',1,4,18,'MARKETING MATERIAL'),
#	(50,'MM000050','DVD UNANG PALABAS','DVD UNANG PALABAS',1,4,13,'MARKETING MATERIAL'),
#	(51,'MM000051','EDT LABEL','EAU DE TOILETTE LABELS',1,4,9,'MARKETING MATERIAL'),
#	(52,'MM000052','FLYER IPOH COFFEE/GENTLE','FLYER IPOH COFFEE/GENTLE',1,4,17,'MARKETING MATERIAL'),
#	(53,'MM000053','FLYER INSERTS','FLYER INSERTS NEW PRODUCTS',1,4,17,'MARKETING MATERIAL'),
#	(54,'MM000054','FLYER JUICES 4 in 1','FLYER JUICES 4 in 1',1,4,17,'MARKETING MATERIAL'),
#	(55,'MM000055','FLYER LIFE','FLYER VITAL LIFE',1,4,17,'MARKETING MATERIAL'),
#	(56,'MM000056','FLYER P PLUS','FLYER VITAL P PLUS',1,4,17,'MARKETING MATERIAL'),
#	(57,'MM000057','FLYER PRICE LIST','PRICE LIST FLYER',1,4,17,'MARKETING MATERIAL'),
#	(58,'MM000058','FLYER SOAPS','FLYER OF ALL SOAPS',1,4,17,'MARKETING MATERIAL'),
#	(59,'MM000059','FLYER STARTER PACK (OLD)','STARTER PACK FLYER (OLD)',1,4,17,'MARKETING MATERIAL'),
#	(60,'MM000060','FLYER VITAL C (OLD)','FLYER VITAL C (OLD)',1,4,17,'MARKETING MATERIAL'),
#	(61,'MM000061','FLYER WHITE','FLYER VITAL WHITE',1,4,17,'MARKETING MATERIAL'),
#	(62,'PM000062','FOIL KG','FOIL PER KG',1,3,10,'PACKAGING MATERIAL'),
#	(64,'FP000064','VITAL GENTLE 15G','GENTLE BABY SOAP 15G',1,2,4,'SOAP'),
#	(65,'FP000065','VITAL GENTLE 90G','GENTLE BABY SOAP 90G',1,2,4,'SOAP'),
#	(66,'PM000066','GENTLE SOAP BOX','VITAL GENTLE SOAP 90G BOX',1,3,7,'PACKAGING MATERIAL'),
#	(67,'MM000067','GIFT CERT. 250','GIFT CERT 250',1,4,19,'MARKETING MATERIAL'),
#	(68,'MM000068','GIFT CERT. 750','GIFT CERT 750',1,4,19,'MARKETING MATERIAL'),
#	(69,'MM000069','GV5000','GIFT VOUCHER 5000',1,4,20,'MARKETING MATERIAL'),
#	(70,'MM000070','HALAL CERTIFICATE (2012 January)','HALAL CERTIFICATE (2012 January)',1,4,18,'MARKETING MATERIAL'),
#	(71,'FP000071','Eau De Toilette 55mL Women - Harmony','EAU DE TOILETTE',1,2,5,'EAU DE TOILETTE'),
#	(72,'FP000072','Eau De Toilette 55mL Women - Heartfelt','EAU DE TOILETTE',1,2,5,'EAU DE TOILETTE'),
#	(73,'FP000073','Eau De Toilette 55mL Women - Heatwave','EAU DE TOILETTE',1,2,5,'EAU DE TOILETTE'),
#	(74,'FP000074','Eau De Toilette 55mL Women - Heaven','EAU DE TOILETTE',1,2,5,'EAU DE TOILETTE'),
#	(75,'MM000075','ID DISTRIBUTOR','ID DISTRIBUTOR',1,4,18,'MARKETING MATERIAL'),
#	(76,'MM000076','KEYCHAIN','VITAL C KEYCHAIN',1,4,23,'MARKETING MATERIAL'),
#	(78,'MM000078','LTO CERTIFICATE','LTO CERTIFICATE FOR SALES KIT',1,4,18,'MARKETING MATERIAL'),
#	(79,'FP000079','LUSH VELVET LOTION','TRUE TOUCH HAND & BODY LOTION',1,2,5,'TRUE TOUCH HAND & BODY LOTION'),
#	(80,'FP000080','Eau De Toilette 55mL Men - Manuelle','EAU DE TOILETTE',1,2,5,'EAU DE TOILETTE'),
#	(81,'PM000081','MFG/EXP COFFEE STICK','MFG/EXP COFFEE STICKER',1,3,9,'PACKAGING MATERIAL'),
#	(82,'PM000082','MFG/EXP COFFEE STICK 2','MFG/EXP COFFEE STICKER 2',1,3,9,'PACKAGING MATERIAL'),
#	(83,'PM000083','MFG/EXP COFFEE STICK 3','MFG/EXP COFFEE STICKER 3',1,3,9,'PACKAGING MATERIAL'),
#	(84,'FP000084','MIRABELLA LOTION','TRUE TOUCH HAND & BODY LOTION',1,2,5,'TRUE TOUCH HAND & BODY LOTION'),
#	(85,'FP000085','Eau De Toilette 55mL Men - Momentum','EAU DE TOILETTE',1,2,5,'EAU DE TOILETTE'),
#	(86,'MM000086','MOTOR STICKER','CAR STICKER - SMALL FOR MOTOR',1,4,23,'MARKETING MATERIAL'),
#	(87,'MM000087','NEWSPAPER','NEWSPAPER',1,4,12,'MARKETING MATERIAL'),
#	(88,'MM000088','VITAL C NOTEPAD','VITAL C NOTEPAD',1,4,23,'MARKETING MATERIAL'),
#	(89,'MM000089','PLAN BLACK','PLANNER BLACK',1,4,23,'MARKETING MATERIAL'),
#	(90,'MM000090','PLAN GREEN','PLANNER GREEN',1,4,23,'MARKETING MATERIAL'),
#	(91,'MM000091','PLANNER 2011','PLANNER 2011',1,4,23,'MARKETING MATERIAL'),
#	(92,'MM000092','PLANNER BROWN 2012','PLANNER BROWN 2012 13X18cm',1,4,23,'MARKETING MATERIAL'),
#	(93,'MM000093','PLANNER GREEN 2012','PLANNER GREEN 2012 13X18cm',1,4,23,'MARKETING MATERIAL'),
#	(94,'PM000094','PLASTIC L','PLASTIC LARGE',1,3,21,'MARKETING MATERIAL'),
#	(95,'PM000095','PLASTIC M (x500)','PLASTIC M (x500)',1,3,21,'MARKETING MATERIAL'),
#	(96,'PM000096','PLASTIC S','PLASTIC SMALL',1,3,21,'MARKETING MATERIAL'),
#	(97,'PM000097','PLASTIC XS','PLASTIC EXTRA SMALL',1,3,21,'MARKETING MATERIAL'),
#	(99,'RM000099','POWDER CHOCO MORINGA','POWDER SACHET CHOCO MORINGA',1,1,1,'RAW MATERIALS'),
#	(100,'RM000100','POWDER DALANDAN GUAV','POWDER SACHET DALANDAN GUAVA',1,1,1,'RAW MATERIALS'),
#	(101,'RM000101','POWDER MANGO CARROT','POWDER SACHET MANGO CARROT',1,1,1,'RAW MATERIALS'),
#	(102,'RM000102','POWDER SUGARCANE','POWDER SACHET SUGARCANE',1,1,1,'RAW MATERIALS'),
#	(103,'RM000103','POWDER TOMATO CALAMA','POWDER SACHET TOMATO CALAMANSI',1,1,1,'RAW MATERIALS'),
#	(104,'MM000104','FLYER PRODUCT OLD','FLYER PRODUCT OLD',1,4,17,'MARKETING MATERIAL'),
#	(105,'MM000105','PRODUCT MANUAL','PRODUCT MANUAL',1,4,12,'MARKETING MATERIAL'),
#	(106,'MM000106','PRODUCT SAMPLER (See the difference)','PRODUCT SAMPLER (See the difference)',1,4,23,'MARKETING MATERIAL'),
#	(107,'PM000107','PVC KG','PVC PER KG',1,3,10,'PACKAGING MATERIAL'),
#	(108,'FP000108','Eau De Toilette 55mL Men - Rapture','EAU DE TOILETTE',1,2,5,'EAU DE TOILETTE'),
#	(109,'MM000109','REF MAGNET','VITAL C REF MAGNET',1,4,23,'MARKETING MATERIAL'),
#	(110,'MM000110','REPEAT SALES CARD','REPEAT SALES CARD',1,4,22,'MARKETING MATERIAL'),
#	(111,'MM000111','REUSABLE BAG','REUSABLE BAG',1,4,14,'MARKETING MATERIAL'),
#	(112,'FP000112','Eau De Toilette 55mL Men - Reveal','EAU DE TOILETTE',1,2,5,'EAU DE TOILETTE'),
#	(113,'FP000113','ROYAL MANDARIN LOTION','TRUE TOUCH HAND &amp; BODY LOTION',1,2,5,'TRUE TOUCH HAND & BODY LOTION'),
#	(114,'MM000114','BAG Sales KIT (OLD)','BAG Sales KIT (OLD)',1,4,14,'MARKETING MATERIAL'),
#	(115,'MM000115','SEE THE DIFF 2 FOLDS','SEE THE DIFFERENCE 2 FOLDS',1,4,15,'MARKETING MATERIAL'),
#	(116,'FP000116','SERENE HIGHNESS LOTION','TRUE TOUCH HAND &amp; BODY LOTION',1,2,5,'TRUE TOUCH HAND & BODY LOTION'),
#	(117,'MM000117','SHIRT','SHIRT',1,4,23,'MARKETING MATERIAL'),
#	(118,'MM000118','SKIN SENSE BROCHURE','BROCHURE SKIN SENSE',1,4,15,'MARKETING MATERIAL'),
#	(119,'PM000119','SO FRESH LABEL','JUICE LABEL 40% 5.6cm x 3.2cm',1,3,9,'PACKAGING MATERIAL'),
#	(120,'PM000120','SOAP BOX 4IN1','SOAP BOX 4IN1',1,3,7,'PACKAGING MATERIAL'),
#	(121,'PM000121','SOAP LABEL BIO 15G','SOAP LABEL BIO SKIN 15G',1,3,9,'PACKAGING MATERIAL'),
#	(122,'PM000122','SOAP LABEL CLEAR 15G','SOAP LABEL VITAL CLEAR 15G',1,3,9,'PACKAGING MATERIAL'),
#	(123,'PM000123','SOAP LABEL GENTLE15G','SOAP LABEL GENTLE BABY SOAP15G',1,3,9,'PACKAGING MATERIAL'),
#	(124,'PM000124','SOAP LABEL R5 15G','SOAP LABEL VITAL R5 15G',1,3,9,'PACKAGING MATERIAL'),
#	(125,'PM000125','SOAP LABEL WHITE 15G','SOAP LABEL GLUTA WHITE 15G',1,3,9,'PACKAGING MATERIAL'),
#	(126,'RM000126','SODIUM ASCORBATE KG','SODIUM ASCORBATE IN KG',1,1,3,'RAW MATERIALS'),
#	(127,'MM000127','SOFT CASE','SOFT/PENCIL CASE',1,4,14,'MARKETING MATERIAL'),
#	(128,'MM000128','STARTER PACK CARD (OLD)','STARTER PACK CARD (OLD)',1,4,22,'MARKETING MATERIAL'),
#	(129,'MM000129','FLYER SWINE FLU','FLYER SWINE FLU',1,4,17,'MARKETING MATERIAL'),
#	(130,'MM000130','TARP AUTHORIZEDEALER','TARP 1.7X2.5 VITAL C AUTHORIZE',1,4,24,'MARKETING MATERIAL'),
#	(131,'MM000131','TARP BEVERAGES','TARP BEVERAGES 2 X 5 FT',1,4,24,'MARKETING MATERIAL'),
#	(132,'MM000132','TARP BILI NA','TARPAULINE BILI NA',1,4,24,'MARKETING MATERIAL'),
#	(133,'MM000133','TARP BIO SOAP','TARP BIO SOAP',1,4,24,'MARKETING MATERIAL'),
#	(134,'MM000134','TARP BUSINESS ORIENT','TARPAULINE BUSINES ORIENTATION',1,4,24,'MARKETING MATERIAL'),
#	(135,'MM000135','TARP CLEAR SOAP','TARP CLEAR SOAP',1,4,24,'MARKETING MATERIAL'),
#	(136,'MM000136','TARP ISABEL BEVERAGE','TARP ISABEL BEVERAGES 2X5 FT.',1,4,24,'MARKETING MATERIAL'),
#	(137,'MM000137','TARP ISABELLE','TARP ISABELLE',1,4,24,'MARKETING MATERIAL'),
#	(138,'MM000138','TARP ISABELLE 2 X 5','TARP ISABELLE 2 X 5  FT',1,4,24,'MARKETING MATERIAL'),
#	(139,'MM000139','TARP MENU','TARP MENU',1,4,24,'MARKETING MATERIAL'),
#	(140,'MM000140','TARP MILLIONAIRES','TARP MILLIONAIRES',1,4,24,'MARKETING MATERIAL'),
#	(141,'MM000141','TARP PERSONAL CARE','TARP PERSONAL CARE 2X5 FT.',1,4,24,'MARKETING MATERIAL'),
#	(142,'MM000142','TARP PROMATS','TARP PROMATS',1,4,24,'MARKETING MATERIAL'),
#	(143,'MM000143','TARP R5 POWDER','TARP R5 POWDER',1,4,24,'MARKETING MATERIAL'),
#	(144,'MM000144','TARP R5 SOAP','TARP R5 SOAP',1,4,24,'MARKETING MATERIAL'),
#	(145,'MM000145','TARP RETAIL OUTLET','TARP RETAIL OUTLET',1,4,24,'MARKETING MATERIAL'),
#	(146,'MM000146','TARP 5 KINDS SOAP','TARP SARI-SARI SOAP',1,4,24,'MARKETING MATERIAL'),
#	(147,'MM000147','TARP SKIN','TARP VITAL C SKIN 2 X 5 FT',1,4,24,'MARKETING MATERIAL'),
#	(148,'MM000148','TARP SO FRESH','TARP SO FRESH',1,4,24,'MARKETING MATERIAL'),
#	(149,'MM000149','TARP SUPPLEMENTS','TARP SUPPLEMENTS 2 X 5 FT',1,4,24,'MARKETING MATERIAL'),
#	(150,'MM000150','TARP Vital C 10x12','TARP VITAL C PER BOX',1,4,24,'MARKETING MATERIAL'),
#	(151,'MM000151','TARP VITALITY (CATA)','CATALOGUE TARP 3FT X 4.2 FT',1,4,24,'MARKETING MATERIAL'),
#	(152,'MM000152','TARP VITAL WHITE','TARP VITAL WHITE',1,4,24,'MARKETING MATERIAL'),
#	(153,'MM000153','TARP WHITE SOAP','TARP WHITE SOAP',1,4,24,'MARKETING MATERIAL'),
#	(154,'MM000154','PRODUCT TESTIMONIAL BOOKLET','PRODUCT TESTIMONIAL BOOKLET',1,4,12,'MARKETING MATERIAL'),
#	(155,'MM000155','BAG TRANSPARENT ASSORTED','BAG TRANSPARENT ASSORTED',1,4,14,'MARKETING MATERIAL'),
#	(156,'MM000156','TRAVELLING BAG','TRAVELLING LADIES & MENS BAG',1,4,14,'MARKETING MATERIAL'),
#	(157,'MM000157','T-SHIRT PINOY -BLACK','T-SHIRT PINOY - BLACK',1,4,23,'MARKETING MATERIAL'),
#	(158,'MM000158','TUMBLER','TUMBLER',1,4,23,'MARKETING MATERIAL'),
#	(159,'MM000159','TUMBLER INSERT COFFEE','TUMBLER INSERT COFFEE',1,4,23,'MARKETING MATERIAL'),
#	(160,'MM000160','ULTIMATTER YR. 2010','ULTIMATTER YR. 2010',1,4,12,'MARKETING MATERIAL'),
#	(161,'MM000161','UMBRELLA','UMBRELLA',1,4,23,'MARKETING MATERIAL'),
#	(162,'MM000162','VALUE PACK CARD','VALUE PACK CARD',1,4,22,'MARKETING MATERIAL'),
#	(163,'MM000163','V-BLOG 2011','V-BLOG NEWSLETTER NEW',1,4,12,'MARKETING MATERIAL'),
#	(164,'MM000164','V-BLOG 2010','V-BLOG NEWSLETTER OLD',1,4,12,'MARKETING MATERIAL'),
#	(165,'MM000165','VCD ANNIVERSARY','VCD VITAL C 3RD ANNIVERSARY VI',1,4,13,'MARKETING MATERIAL'),
#	(166,'MM000166','VCD BIG TIME','VCD BIG TIME',1,4,13,'MARKETING MATERIAL'),
#	(167,'MM000167','VCD BORACAY','VCD BORACAY',1,4,13,'MARKETING MATERIAL'),
#	(168,'MM000168','VCD BUSINESS PLAN','VCD BUSINESS PLAN',1,4,13,'MARKETING MATERIAL'),
#	(169,'MM000169','VCD INSIGHTS','VCD INSIGHTS',1,4,13,'MARKETING MATERIAL'),
#	(170,'MM000170','VCD LUPANG HINIRANG','VCD LUPANG HINIRANG AND JINGLE',1,4,13,'MARKETING MATERIAL'),
#	(171,'MM000171','VCD OUR TRAVEL','VCD OUR TRAVEL',1,4,13,'MARKETING MATERIAL'),
#	(172,'MM000172','VCD PINOY AKO','VCD MILLIONAIRES (PINOY AKO)',1,4,13,'MARKETING MATERIAL'),
#	(173,'MM000173','VCD PRODUCT FOCUS','VCD PROD. FOCUS/PROD. DEMO',1,4,13,'MARKETING MATERIAL'),
#	(174,'MM000174','VCD SALES KIT','VCD SALES KIT',1,4,13,'MARKETING MATERIAL'),
#	(175,'MM000175','VCD SINGAPORE TRAVEL','VCD SINGAPORE TRAVEL',1,4,13,'MARKETING MATERIAL'),
#	(176,'MM000176','VCD VSO','VCD VSO (VOICE OVER)',1,4,13,'MARKETING MATERIAL'),
#	(177,'RM000177','VEGGIE CAPS PCS','VEGGIE CAPS IN PIECES',1,1,2,'RAW MATERIALS'),
#	(178,'PM000178','VITAL C INSERTS PCS','VITAL C INSERTS PCS',1,3,11,'PACKAGING MATERIAL'),
#	(179,'RM000179','VITAL CLEAR SOAP 15G','VITAL CLEAR SOAP 15G',1,1,4,'SOAP'),
#	(180,'RM000180','VITAL CLEAR SOAP 90G','VITAL CLEAR SOAP 90G',1,1,4,'SOAP'),
#	(181,'PM000181','VITAL CLEAR SOAP BOX','VITAL CLEAR SOAP BOX',1,3,7,'PACKAGING MATERIAL'),
#	(182,'FP000182','VITAL LIFE','VITAL LIFE 220MG 60TABLETS',1,2,6,'FOOD SUPPLEMENT'),
#	(183,'FP000183','VITAL P PLUS','VITAL P PLUS 350MG 60TABLETS',1,2,6,'FOOD SUPPLEMENT'),
#	(184,'FP000184','VITAL R5 200MG','VITAL R5 200MG',1,2,6,'FOOD SUPPLEMENT'),
#	(185,'FP000185','VITAL R5 100MG','VITAL R5 100 GRAMS',1,2,6,'FOOD SUPPLEMENT'),
#	(186,'RM000186','VITAL R5 SOAP 15G','VITAL R5 SOAP 15G',1,1,4,'SOAP'),
#	(187,'RM000187','VITAL R5 SOAP 90G','VITAL R5 SOAP 90G',1,1,4,'SOAP'),
#	(188,'PM000188','VITAL R5 SOAP BOX','VITAL R5 SOAP BOX',1,3,7,'PACKAGING MATERIAL'),
#	(189,'FP000189','VITAL WHITE BAG','VITAL WHITE ( BLISTER BAG )',1,2,6,'FOOD SUPPLEMENT'),
#	(190,'PM000190','Blister Box Vital White (Bottle)','Blister Box Vital White (Bottle)',1,3,7,'PACKAGING MATERIAL'),
#	(191,'RM000191','VITAL WHITE BOTTLE','VITAL WHITE ( BOTTLE )',1,1,2,'FOOD SUPPLEMENT'),
#	(192,'MM000192','VITAL WHITE BOX 20\'S','VITAL WHITE BOX 20\'S',1,4,23,'MARKETING MATERIAL'),
#	(193,'RM000193','VITAL WHITE SOAP 15G','VITAL WHITE SOAP 15G',1,1,4,'SOAP'),
#	(194,'RM000194','VITAL WHITE SOAP 90G','VITAL WHITE SOAP 90G',1,1,4,'SOAP'),
#	(195,'PM000195','VITAL WHITE SOAP BOX','VITAL WHITE SOAP BOX',1,3,7,'PACKAGING MATERIAL'),
#	(196,'PM000196','VITALC BLIST BOX PCS','VITALC BLIST BOX PCS',1,3,7,'PACKAGING MATERIAL'),
#	(197,'FP000197','VITAL C','VITAL C',1,2,6,NULL),
#	(198,'RM000198','R5 POWDER','R5 POWDER',1,1,3,NULL),
#	(199,'FP000199','JUICE MANGO CARROT','JUICE MANGO CARROT',1,2,1,NULL),
#	(200,'FP000200','JUICE TOMATO CALAMANSI','JUICE TOMATO CALAMANSI',1,2,1,NULL),
#	(201,'FP000201','JUICE GUAVA DALANDAN','JUICE GUAVA DALANDAN',1,2,1,NULL),
#	(202,'FP000202','JUICE CHOCO MORINGA','JUICE CHOCO MORINGA',1,2,1,NULL),
#	(203,'FP000203','Vital Ipoh White Coffee','Vital Ipoh White Coffee',1,2,1,NULL),
#	(204,'MM000204','Vital C Notebook 2012','Vital C Notebook 2012',1,4,23,NULL),
#	(205,'MM000205','HALAL CERTIFICATE (2013 January)','HALAL CERTIFICATE (2013 January)',1,4,18,NULL),
#	(206,'MM000206','BFAD (LTO/IFDA)','BFAD (LTO/IFDA)',1,4,18,NULL),
#	(207,'MM000207','Folder Sales Kit','Folder Sales Kit',1,4,23,NULL),
#	(208,'MM000208','LEAD TRAINING (BROCHURES)','LEAD TRAINING (BROCHURES)',1,4,12,NULL),
#	(209,'MM000209','LEAD TRAINING (NEW)','LEAD TRAINING (NEW)',1,4,12,NULL),
#	(210,'MM000210','BAG Sales KIT (NEW)','BAG Sales KIT (NEW)',1,4,14,NULL),
#	(211,'PM000211','Blister Box 4 in 1 Soap','Blister Box 4 in 1 Soap',1,3,7,NULL),
#	(212,'PM000212','Blister Box White Glutha 90g','Blister Box White Glutha 90g',1,3,7,NULL),
#	(213,'PM000213','Blister Box Clear 90s (Soap)','Blister Box Clear 90s (Soap)',1,3,7,NULL),
#	(214,'PM000214','Blister Box Bio Skin 90g (Soap)','Blister Box Bio Skin 90g (Soap)',1,3,7,NULL),
#	(215,'PM000215','Blister Box Ipoh White w/ Divider','Blister Box Bio Ipoh White w/ Divider',1,3,7,NULL),
#	(216,'MM000216','FLYER PRICE LIST (New)','FLYER PRICE LIST (New)',1,4,17,NULL),
#	(217,'MM000217','FLYER STARTER PACK (NEW)','FLYER STARTER PACK (NEW)',1,4,17,NULL),
#	(218,'MM000218','FLYER VITAL C (NEW)','FLYER VITAL C (NEW)',1,4,17,NULL),
#	(219,'MM000219','V-BLOG 2009','V-BLOG 2009',1,4,12,NULL),
#	(220,'MM000220','BULB','BULB',1,4,16,NULL),
#	(223,'MM000223','STARTER PACK CARD (NEW)','STARTER PACK CARD (NEW)',1,4,22,NULL),
#	(224,'PM000224','PLASTIC M (x1000)','PLASTIC M (x1000)',1,3,21,NULL),
#	(225,'MM000225','Pouch Assorted Color','Pouch Assorted Color',1,4,14,NULL),
#	(226,'PM000226','Sticker (Sealed VITAL C)','Sticker (Sealed VITAL C)',1,3,9,NULL),
#	(227,'MM000227','Brochure w/ Isabel 5folds','Brochure w/ Isabel 5folds',1,4,15,NULL),
#	(228,'MM000228','NEW ISABEL Catalogue (Vitality)','NEW ISABEL Catalogue (Vitality)',1,4,15,NULL),
#	(229,'MM000229','TARPAULIN VITAL C (Retail Outlet)','TARPAULIN VITAL C (Retail Outlet)',1,4,24,NULL),
#	(230,'FP000230','Vital Denta Max 130g','Vital Denta Max 130g',1,2,27,NULL),
#	(231,'FP000231','JUICE SUGARCANE','JUICE SUGARCANE',1,2,1,NULL),
#	(232,'FP000232','4-in-1 Skin Care Soap Pack','4-in-1 Skin Care Soap Pack',1,2,4,NULL),
#	(233,'MM000233','SMART MONEY/ID APLLIC. ( T.P )','SMART MONEY/ID APLLIC. ( T.P )',1,4,18,NULL),
#	(234,'MM000234','ULTIMATTER YR. 2011','ULTIMATTER YR. 2011',1,4,12,NULL),
#	(235,'MM000235','ULTIMATTER YR. 2012','ULTIMATTER YR. 2012',1,4,12,NULL),
#	(236,'MM000236','MILLIONERS CLUB(FOR DISPLAY)','MILLIONERS CLUB(FOR DISPLAY)',1,4,24,NULL),
#	(237,'MM000237','SANITIZER-TARPAULIN','SANITIZER-TARPAULIN',1,4,24,NULL),
#	(238,'MM000238','VITALITY-TARPAULIN','VITALITY-TARPAULIN',1,4,24,NULL),
#	(239,'MM000239','ALL PRODUCTS-TARPAULIN','ALL PRODUCTS-TARPAULIN',1,4,24,NULL),
#	(241,'PM000241','PLASTIC M','PLASTIC M',1,3,21,NULL);
#
#/*!40000 ALTER TABLE `is_items` ENABLE KEYS */;
#UNLOCK TABLES;


UPDATE is_items SET item_name=UPPER(item_name);

# Dump of table is_items_temp
# ------------------------------------------------------------

DROP TABLE IF EXISTS `is_items_temp`;

CREATE TABLE `is_items_temp` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_description` text COLLATE utf8_unicode_ci,
  `item_type_id` int(10) unsigned NOT NULL DEFAULT '0',
  `item_sub_type_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table is_package_products_view
# ------------------------------------------------------------

DROP TABLE IF EXISTS `is_package_products_view`;

CREATE TABLE `is_package_products_view` (
  `package_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` bigint(21) DEFAULT NULL,
  `item_name` varchar(100) DEFAULT NULL,
  `item_description` text,
  `standard_retail_price` decimal(11,2) DEFAULT NULL,
  `member_price` decimal(11,2) DEFAULT NULL,
  `employee_price` decimal(11,2) DEFAULT NULL,
  `igpsm_points` int(11) DEFAULT NULL,
  `item_type_id` int(10) unsigned DEFAULT NULL,
  `item_sub_type_id` int(11) DEFAULT NULL,
  `sub_category` varchar(64) DEFAULT NULL,
  `is_swappable` tinyint(4) DEFAULT NULL,
  `group` int(10) unsigned DEFAULT NULL,
  `group_qty` bigint(20) DEFAULT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table is_payment_transaction_details
# ------------------------------------------------------------

DROP TABLE IF EXISTS `is_payment_transaction_details`;

CREATE TABLE `is_payment_transaction_details` (
  `transaction_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` int(11) DEFAULT NULL,
  `payment_method` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` decimal(11,2) NOT NULL DEFAULT '0.00',
  `last_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `middle_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reference_number` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reference_detail` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remarks` text COLLATE utf8_unicode_ci,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`transaction_detail_id`),
  KEY `transaction_id` (`transaction_id`),
  KEY `payment_method` (`payment_method`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table is_payment_transaction_discounts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `is_payment_transaction_discounts`;

CREATE TABLE `is_payment_transaction_discounts` (
  `transaction_discount_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` int(11) unsigned NOT NULL DEFAULT '0',
  `discount_type` varchar(32) NOT NULL DEFAULT '',
  `discount_name` varchar(32) NOT NULL DEFAULT '',
  `discount_value` decimal(10,2) NOT NULL DEFAULT '0.00',
  `amount_to_discount` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`transaction_discount_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table is_payment_transaction_products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `is_payment_transaction_products`;

CREATE TABLE `is_payment_transaction_products` (
  `transaction_id` int(11) NOT NULL DEFAULT '0',
  `package_product_id` int(11) unsigned NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0',
  `quantity` int(11) DEFAULT NULL,
  `group` int(11) unsigned NOT NULL DEFAULT '0',
  `is_product_rebate` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`transaction_id`,`product_id`,`package_product_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table is_payment_transactions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `is_payment_transactions`;

CREATE TABLE `is_payment_transactions` (
  `transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_code` VARCHAR( 32 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT  '',
  `transaction_type` VARCHAR( 32 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT  '',
  `rate_to_use` TINYINT( 2 ) UNSIGNED NOT NULL DEFAULT  '1',
  `facility_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0',
  `account_id` VARCHAR( 64 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT  '0',
  `fullname` VARCHAR( 256 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT  '',
  `status` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'PENDING',
  `subtotal_amount` decimal(11,2) NOT NULL DEFAULT '0.00',
  `vat_amount` decimal(11,2) NOT NULL DEFAULT '0.00',
  `total_amount` decimal(11,2) NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(11,2) NOT NULL DEFAULT '0.00',
  `senior_amount` decimal(11,2) NOT NULL DEFAULT '0.00',
  `pwd_amount` decimal(11,2) NOT NULL DEFAULT '0.00',
  `zero_rated_amount` decimal(11,2) NOT NULL DEFAULT '0.00',
  `amount_due` decimal(11,2) NOT NULL DEFAULT '0.00',
  `tendered_amount` decimal(11,2) NOT NULL DEFAULT '0.00',
  `change_amount` decimal(11,2) NOT NULL DEFAULT '0.00',
  `vatable_sales_amount` decimal(11,2) NOT NULL DEFAULT '0.00',
  `vat_exempt_sales_amount` decimal(11,2) NOT NULL DEFAULT '0.00',
  `deposit_amount` decimal(11,2) NOT NULL DEFAULT '0.00',
  `refunded_amount` decimal(11,2) NOT NULL DEFAULT '0.00',
  `ar_number` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ar_issued_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `completed_timestamp` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
  `remarks` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`transaction_id`),
  KEY `facility_id` (`facility_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table is_product_orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `is_product_orders`;

CREATE TABLE `is_product_orders` (
  `product_order_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_order_number` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `json_items` text COLLATE utf8_unicode_ci,
  `total_amount` decimal(11,2) DEFAULT NULL,
  `product_order_status` int(10) unsigned NOT NULL DEFAULT '0',
  `remarks` text COLLATE utf8_unicode_ci,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table is_product_products
# ------------------------------------------------------------

#DROP TABLE IF EXISTS `is_product_products`;
#
#CREATE TABLE `is_product_products` (
#  `product_id` int(11) unsigned NOT NULL DEFAULT '0',
#  `child_product_id` int(11) unsigned NOT NULL DEFAULT '0',
#  `quantity` int(11) DEFAULT '1',
#  `is_swappable` tinyint(1) NOT NULL DEFAULT '0',
#  `group` int(11) unsigned NOT NULL DEFAULT '0',
#  `group_quantity` int(11) unsigned NOT NULL DEFAULT '0',
#  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
#  PRIMARY KEY (`product_id`,`child_product_id`,`group`)
#) ENGINE=InnoDB DEFAULT CHARSET=utf8;
#
#LOCK TABLES `is_product_products` WRITE;
#/*!40000 ALTER TABLE `is_product_products` DISABLE KEYS */;
#
#INSERT INTO `is_product_products` (`product_id`, `child_product_id`, `quantity`, `is_swappable`, `group`, `group_quantity`, `insert_timestamp`)
#VALUES
#	(197,158,1,0,0,0,'2012-10-16 04:57:02'),
#	(197,191,1,0,0,0,'2012-10-16 04:57:02'),
#	(198,23,1,0,0,0,'2012-10-16 04:57:02'),
#	(198,24,1,0,0,0,'2012-10-16 04:57:02'),
#	(198,25,1,0,0,0,'2012-10-16 04:57:02'),
#	(198,26,1,0,0,0,'2012-10-16 04:57:02'),
#	(198,27,1,0,0,0,'2012-10-16 04:57:02'),
#	(198,41,1,0,0,0,'2012-10-16 04:57:02'),
#	(198,120,1,0,0,0,'2012-10-16 04:57:02'),
#	(198,182,1,0,0,0,'2012-10-16 04:57:02'),
#	(198,191,1,0,0,0,'2012-10-16 04:57:02'),
#	(198,196,2,0,0,0,'2012-10-16 04:57:02'),
#	(199,182,1,0,0,0,'2012-10-16 04:57:02'),
#	(200,65,1,0,0,0,'2012-10-16 04:57:02'),
#	(201,65,1,0,0,0,'2012-10-16 04:57:02'),
#	(202,191,1,0,0,0,'2012-10-16 04:57:02'),
#	(203,191,2,0,0,0,'2012-10-16 04:57:02'),
#	(204,194,12,0,0,0,'2012-10-16 04:57:02'),
#	(205,185,2,0,0,0,'2012-10-16 04:57:02'),
#	(206,19,1,0,0,0,'2012-10-16 04:57:02'),
#	(206,182,1,0,0,0,'2012-10-16 04:57:02'),
#	(206,187,1,0,0,0,'2012-10-16 04:57:02'),
#	(206,196,1,0,0,0,'2012-10-16 04:57:02'),
#	(207,19,1,0,0,0,'2012-10-16 04:57:02'),
#	(207,41,1,0,0,0,'2012-10-16 04:57:02'),
#	(207,65,1,0,0,0,'2012-10-16 04:57:02'),
#	(207,120,1,0,0,0,'2012-10-16 04:57:02'),
#	(207,183,1,0,0,0,'2012-10-16 04:57:02'),
#	(207,196,3,0,0,0,'2012-10-16 04:57:02'),
#	(208,23,2,0,0,0,'2012-10-16 04:57:02'),
#	(208,196,2,0,0,0,'2012-10-16 04:57:02'),
#	(209,1,1,1,3,1,'2012-10-16 04:57:02'),
#	(209,2,1,1,3,1,'2012-10-16 04:57:02'),
#	(209,3,1,1,3,1,'2012-10-16 04:57:02'),
#	(209,4,1,1,3,1,'2012-10-16 04:57:02'),
#	(209,5,1,1,3,1,'2012-10-16 04:57:02'),
#	(209,6,1,1,3,1,'2012-10-16 04:57:02'),
#	(209,7,1,1,3,1,'2012-10-16 04:57:02'),
#	(209,8,1,1,3,1,'2012-10-16 04:57:02'),
#	(209,19,1,0,0,0,'2012-10-16 04:57:02'),
#	(209,41,2,0,0,0,'2012-10-16 04:57:02'),
#	(209,71,1,1,1,3,'2012-10-16 04:57:02'),
#	(209,72,1,1,1,3,'2012-10-16 04:57:02'),
#	(209,73,1,1,1,3,'2012-10-16 04:57:02'),
#	(209,74,1,1,1,3,'2012-10-16 04:57:02'),
#	(209,79,1,1,2,1,'2012-10-16 04:57:02'),
#	(209,80,1,1,1,3,'2012-10-16 04:57:02'),
#	(209,84,1,1,2,1,'2012-10-16 04:57:02'),
#	(209,85,1,1,1,3,'2012-10-16 04:57:02'),
#	(209,108,1,1,1,3,'2012-10-16 04:57:02'),
#	(209,112,1,1,1,3,'2012-10-16 04:57:02'),
#	(209,113,1,1,2,1,'2012-10-16 04:57:02'),
#	(209,116,1,1,2,1,'2012-10-16 04:57:02'),
#	(210,1,1,1,4,1,'2012-10-16 04:57:02'),
#	(210,2,1,1,4,1,'2012-10-16 04:57:02'),
#	(210,3,1,1,4,1,'2012-10-16 04:57:02'),
#	(210,4,1,1,4,1,'2012-10-16 04:57:02'),
#	(210,5,1,1,4,1,'2012-10-16 04:57:02'),
#	(210,6,1,1,4,1,'2012-10-16 04:57:02'),
#	(210,7,1,1,4,1,'2012-10-16 04:57:02'),
#	(210,8,1,1,4,1,'2012-10-16 04:57:02'),
#	(210,71,1,1,2,1,'2012-10-16 04:57:02'),
#	(210,72,1,1,2,1,'2012-10-16 04:57:02'),
#	(210,73,1,1,2,1,'2012-10-16 04:57:02'),
#	(210,74,1,1,2,1,'2012-10-16 04:57:02'),
#	(210,79,1,1,3,1,'2012-10-16 04:57:02'),
#	(210,80,1,1,1,1,'2012-10-16 04:57:02'),
#	(210,84,1,1,3,1,'2012-10-16 04:57:02'),
#	(210,85,1,1,1,1,'2012-10-16 04:57:02'),
#	(210,108,1,1,1,1,'2012-10-16 04:57:02'),
#	(210,112,1,1,1,1,'2012-10-16 04:57:02'),
#	(210,113,1,1,3,1,'2012-10-16 04:57:02'),
#	(210,116,1,1,3,1,'2012-10-16 04:57:02'),
#	(211,183,2,0,0,0,'2012-10-16 04:57:02'),
#	(212,183,2,0,0,0,'2012-10-16 04:57:02'),
#	(213,183,2,0,0,0,'2012-10-16 04:57:02'),
#	(214,183,2,0,0,0,'2012-10-16 04:57:02');
#
#/*!40000 ALTER TABLE `is_product_products` ENABLE KEYS */;
#UNLOCK TABLES;


# Dump of table is_product_products_view
# ------------------------------------------------------------

DROP VIEW IF EXISTS `is_product_products_view`;

CREATE TABLE `is_product_products_view` (
   `product_id` INT(11) UNSIGNED NOT NULL DEFAULT '0',
   `child_product_id` INT(11) UNSIGNED NOT NULL DEFAULT '0',
   `quantity` INT(11) DEFAULT '1',
   `product_name` VARCHAR(100) NOT NULL,
   `product_type_id` INT(11) NOT NULL DEFAULT '0',
   `product_line_id` INT(11) NOT NULL DEFAULT '0',
   `item_id` INT(11) NOT NULL DEFAULT '0',
   `standard_retail_price` DECIMAL(11) NOT NULL DEFAULT '0.00',
   `member_price` DECIMAL(11) NOT NULL DEFAULT '0.00',
   `employee_price` DECIMAL(11) NOT NULL DEFAULT '0.00',
   `igpsm_points` INT(11) NOT NULL DEFAULT '1',
   `is_active` TINYINT(1) NOT NULL DEFAULT '1',
   `is_display` TINYINT(1) NOT NULL DEFAULT '1',
   `is_visible` TINYINT(1) NOT NULL DEFAULT '1',
   `is_vatable` TINYINT(1) NOT NULL DEFAULT '0',
   `image_filename` TEXT NOT NULL,
   `is_swappable` TINYINT(1) NOT NULL DEFAULT '0',
   `group` INT(11) UNSIGNED NOT NULL DEFAULT '0',
   `group_quantity` INT(11) UNSIGNED NOT NULL DEFAULT '0',
   `insert_timestamp` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM;



# Dump of table is_products
# ------------------------------------------------------------

#DROP TABLE IF EXISTS `is_products`;
#
#CREATE TABLE `is_products` (
#  `product_id` int(11) NOT NULL AUTO_INCREMENT,
#  `product_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
#  `product_type_id` int(11) NOT NULL DEFAULT '0',
#  `product_line_id` int(11) NOT NULL DEFAULT '0',
#  `product_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
#  `product_description` text COLLATE utf8_unicode_ci,
#  `item_id` int(11) NOT NULL DEFAULT '0',
#  `standard_retail_price` decimal(11,2) NOT NULL DEFAULT '0.00',
#  `member_price` decimal(11,2) NOT NULL DEFAULT '0.00',
#  `employee_price` decimal(11,2) NOT NULL DEFAULT '0.00',
#  `igpsm_points` int(11) NOT NULL DEFAULT '1',
#  `is_active` tinyint(1) NOT NULL DEFAULT '1',
#  `is_display` tinyint(1) NOT NULL DEFAULT '1',
#  `is_visible` tinyint(1) NOT NULL DEFAULT '1',
#  `is_vatable` tinyint(1) NOT NULL DEFAULT '0',
#  `is_gc_buyable` tinyint(1) NOT NULL DEFAULT '1',
#  `image_filename` text COLLATE utf8_unicode_ci NOT NULL,
#  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
#  PRIMARY KEY (`product_id`),
#  KEY `item_id` (`item_id`)
#) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
#
#LOCK TABLES `is_products` WRITE;
#/*!40000 ALTER TABLE `is_products` DISABLE KEYS */;
#
#INSERT INTO `is_products` (`product_id`, `product_name`, `product_type_id`, `product_line_id`, `product_code`, `product_description`, `item_id`, `standard_retail_price`, `member_price`, `employee_price`, `igpsm_points`, `is_active`, `is_display`, `is_visible`, `is_vatable`, `image_filename`, `insert_timestamp`)
#VALUES
#	(1,'',1,5,NULL,NULL,1,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(2,'',1,5,NULL,NULL,2,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(3,'',1,0,NULL,NULL,3,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(4,'',1,5,NULL,NULL,4,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(5,'',1,5,NULL,NULL,5,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(6,'',1,5,NULL,NULL,6,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(7,'',1,5,NULL,NULL,7,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(8,'',1,5,NULL,NULL,8,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(9,'',1,5,NULL,NULL,9,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(10,'',1,5,NULL,NULL,10,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(11,'',1,5,NULL,NULL,11,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(12,'',1,5,NULL,NULL,12,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(13,'',1,5,NULL,NULL,13,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(14,'',1,5,NULL,NULL,14,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(15,'',1,5,NULL,NULL,15,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(16,'',1,5,NULL,NULL,16,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(17,'',1,0,NULL,NULL,17,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(18,'',1,0,NULL,NULL,18,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(19,'',1,5,NULL,NULL,19,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(20,'',1,0,NULL,NULL,20,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(21,'',1,0,NULL,NULL,21,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(22,'',1,0,NULL,NULL,22,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(23,'',1,3,NULL,NULL,23,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(24,'',1,3,NULL,NULL,24,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(25,'',1,3,NULL,NULL,25,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(26,'',1,3,NULL,NULL,26,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(27,'',1,3,NULL,NULL,27,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(28,'',1,0,NULL,NULL,28,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(29,'',1,4,NULL,NULL,29,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(30,'',1,4,NULL,NULL,30,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(31,'',1,0,NULL,NULL,31,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(32,'',1,0,NULL,NULL,32,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(33,'',1,0,NULL,NULL,33,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(34,'',1,0,NULL,NULL,34,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(35,'',1,0,NULL,NULL,35,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(36,'',1,0,NULL,NULL,36,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(37,'',1,0,NULL,NULL,37,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(38,'',1,0,NULL,NULL,38,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(39,'',1,0,NULL,NULL,39,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(40,'',1,0,NULL,NULL,40,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(41,'',1,0,NULL,NULL,41,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(42,'',1,0,NULL,NULL,42,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(43,'',1,0,NULL,NULL,43,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(44,'',1,0,NULL,NULL,44,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(45,'',1,0,NULL,NULL,45,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(46,'',1,0,NULL,NULL,46,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(47,'',1,0,NULL,NULL,47,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(48,'',1,0,NULL,NULL,48,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(49,'',1,0,NULL,NULL,49,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(50,'',1,0,NULL,NULL,50,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(51,'',1,0,NULL,NULL,51,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(52,'',1,0,NULL,NULL,52,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(53,'',1,0,NULL,NULL,53,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(54,'',1,0,NULL,NULL,54,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(55,'',1,0,NULL,NULL,55,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(56,'',1,0,NULL,NULL,56,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(57,'',1,0,NULL,NULL,57,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(58,'',1,0,NULL,NULL,58,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(59,'',1,0,NULL,NULL,59,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(60,'',1,0,NULL,NULL,60,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(61,'',1,0,NULL,NULL,61,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(62,'',1,0,NULL,NULL,62,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(64,'',1,4,NULL,NULL,64,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(65,'',1,4,NULL,NULL,65,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(66,'',1,0,NULL,NULL,66,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(67,'',1,0,NULL,NULL,67,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(68,'',1,0,NULL,NULL,68,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(69,'',1,0,NULL,NULL,69,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(70,'',1,0,NULL,NULL,70,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(71,'',1,5,NULL,NULL,71,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(72,'',1,5,NULL,NULL,72,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(73,'',1,5,NULL,NULL,73,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(74,'',1,5,NULL,NULL,74,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(75,'',1,0,NULL,NULL,75,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(76,'',1,0,NULL,NULL,76,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(78,'',1,0,NULL,NULL,78,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(79,'',1,5,NULL,NULL,79,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(80,'',1,5,NULL,NULL,80,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(81,'',1,0,NULL,NULL,81,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(82,'',1,0,NULL,NULL,82,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(83,'',1,0,NULL,NULL,83,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(84,'',1,5,NULL,NULL,84,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(85,'',1,5,NULL,NULL,85,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(86,'',1,0,NULL,NULL,86,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(87,'',1,0,NULL,NULL,87,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(88,'',1,0,NULL,NULL,88,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(89,'',1,0,NULL,NULL,89,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(90,'',1,0,NULL,NULL,90,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(91,'',1,0,NULL,NULL,91,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(92,'',1,0,NULL,NULL,92,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(93,'',1,0,NULL,NULL,93,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(94,'',1,0,NULL,NULL,94,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(95,'',1,0,NULL,NULL,95,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(96,'',1,0,NULL,NULL,96,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(97,'',1,0,NULL,NULL,97,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(99,'',1,0,NULL,NULL,99,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(100,'',1,0,NULL,NULL,100,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(101,'',1,0,NULL,NULL,101,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(102,'',1,0,NULL,NULL,102,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(103,'',1,0,NULL,NULL,103,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(104,'',1,0,NULL,NULL,104,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(105,'',1,0,NULL,NULL,105,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(106,'',1,0,NULL,NULL,106,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(107,'',1,0,NULL,NULL,107,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(108,'',1,5,NULL,NULL,108,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(109,'',1,0,NULL,NULL,109,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(110,'',1,0,NULL,NULL,110,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(111,'',1,0,NULL,NULL,111,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(112,'',1,5,NULL,NULL,112,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(113,'',1,5,NULL,NULL,113,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(114,'',1,0,NULL,NULL,114,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(115,'',1,0,NULL,NULL,115,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(116,'',1,5,NULL,NULL,116,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(117,'',1,0,NULL,NULL,117,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(118,'',1,0,NULL,NULL,118,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(119,'',1,0,NULL,NULL,119,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(120,'',1,0,NULL,NULL,120,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(121,'',1,0,NULL,NULL,121,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(122,'',1,0,NULL,NULL,122,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(123,'',1,0,NULL,NULL,123,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(124,'',1,0,NULL,NULL,124,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(125,'',1,0,NULL,NULL,125,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(126,'',1,0,NULL,NULL,126,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(127,'',1,0,NULL,NULL,127,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(128,'',1,0,NULL,NULL,128,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(129,'',1,0,NULL,NULL,129,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(130,'',1,0,NULL,NULL,130,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(131,'',1,0,NULL,NULL,131,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(132,'',1,0,NULL,NULL,132,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(133,'',1,0,NULL,NULL,133,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(134,'',1,0,NULL,NULL,134,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(135,'',1,0,NULL,NULL,135,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(136,'',1,0,NULL,NULL,136,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(137,'',1,0,NULL,NULL,137,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(138,'',1,0,NULL,NULL,138,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(139,'',1,0,NULL,NULL,139,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(140,'',1,0,NULL,NULL,140,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(141,'',1,0,NULL,NULL,141,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(142,'',1,0,NULL,NULL,142,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(143,'',1,0,NULL,NULL,143,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(144,'',1,0,NULL,NULL,144,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(145,'',1,0,NULL,NULL,145,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(146,'',1,0,NULL,NULL,146,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(147,'',1,0,NULL,NULL,147,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(148,'',1,0,NULL,NULL,148,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(149,'',1,0,NULL,NULL,149,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(150,'',1,0,NULL,NULL,150,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(151,'',1,0,NULL,NULL,151,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(152,'',1,0,NULL,NULL,152,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(153,'',1,0,NULL,NULL,153,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(154,'',1,0,NULL,NULL,154,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(155,'',1,0,NULL,NULL,155,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(156,'',1,0,NULL,NULL,156,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(157,'',1,0,NULL,NULL,157,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(158,'',1,0,NULL,NULL,158,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(159,'',1,0,NULL,NULL,159,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(160,'',1,0,NULL,NULL,160,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(161,'',1,0,NULL,NULL,161,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(162,'',1,0,NULL,NULL,162,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(163,'',1,0,NULL,NULL,163,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(164,'',1,0,NULL,NULL,164,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(165,'',1,0,NULL,NULL,165,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(166,'',1,0,NULL,NULL,166,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(167,'',1,0,NULL,NULL,167,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(168,'',1,0,NULL,NULL,168,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(169,'',1,0,NULL,NULL,169,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(170,'',1,0,NULL,NULL,170,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(171,'',1,0,NULL,NULL,171,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(172,'',1,0,NULL,NULL,172,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(173,'',1,0,NULL,NULL,173,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(174,'',1,0,NULL,NULL,174,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(175,'',1,0,NULL,NULL,175,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(176,'',1,0,NULL,NULL,176,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(177,'',1,0,NULL,NULL,177,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(178,'',1,0,NULL,NULL,178,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(179,'',1,4,NULL,NULL,179,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(180,'',1,4,NULL,NULL,180,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(181,'',1,0,NULL,NULL,181,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(182,'',1,2,NULL,NULL,182,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(183,'',1,2,NULL,NULL,183,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(184,'',1,2,NULL,NULL,184,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(185,'',1,2,NULL,NULL,185,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(186,'',1,4,NULL,NULL,186,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(187,'',1,4,NULL,NULL,187,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(188,'',1,0,NULL,NULL,188,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(189,'',1,2,NULL,NULL,189,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(190,'',1,0,NULL,NULL,190,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(191,'',1,2,NULL,NULL,191,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(192,'',1,0,NULL,NULL,192,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(193,'',1,4,NULL,NULL,193,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(194,'',1,4,NULL,NULL,194,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(195,'',1,0,NULL,NULL,195,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(196,'',1,0,NULL,NULL,196,1.00,1.00,1.00,1,1,1,1,0,'[]','2012-07-05 08:35:25'),
#	(197,'Health Power',2,0,NULL,NULL,0,6944.00,6944.00,6944.00,700,1,1,1,1,'[]','2012-10-16 04:57:02'),
#	(198,'Vital Combo',2,0,NULL,NULL,0,6944.00,6944.00,6944.00,700,1,1,1,1,'[]','2012-10-16 04:57:02'),
#	(199,'Vital C &amp; Life',2,0,NULL,NULL,0,6944.00,6944.00,6944.00,700,1,1,1,1,'[]','2012-10-16 04:57:02'),
#	(200,'Everyday Package',2,0,NULL,NULL,0,6944.00,6944.00,6944.00,700,1,1,1,1,'[]','2012-10-16 04:57:02'),
#	(201,'Vital C &amp; Juice',2,0,NULL,NULL,0,6944.00,6944.00,6944.00,700,1,1,1,1,'[]','2012-10-16 04:57:02'),
#	(202,'Whiter You',2,0,NULL,NULL,0,6944.00,6944.00,6944.00,700,1,1,1,1,'[]','2012-10-16 04:57:02'),
#	(203,'Vital White',2,0,NULL,NULL,0,6944.00,6944.00,6944.00,700,1,1,1,1,'[]','2012-10-16 04:57:02'),
#	(204,'Happy New You',2,0,NULL,NULL,0,6944.00,6944.00,6944.00,700,1,1,1,1,'[]','2012-10-16 04:57:02'),
#	(205,'Daily Life Package',4,0,NULL,NULL,0,3699.00,3300.00,3300.00,350,1,1,1,1,'[]','2012-10-16 04:57:02'),
#	(206,'Daily Plus Package',4,0,NULL,NULL,0,3699.00,3300.00,3300.00,350,1,1,1,1,'[]','2012-10-16 04:57:02'),
#	(207,'Daily Essentials Package',4,0,NULL,NULL,0,3699.00,3300.00,3300.00,350,1,1,1,1,'[]','2012-10-16 04:57:02'),
#	(208,'Silky Smooth Package',4,0,NULL,NULL,0,3699.00,3300.00,3300.00,350,1,1,1,1,'[]','2012-10-16 04:57:02'),
#	(209,'Juice-C Package',4,0,NULL,NULL,0,3699.00,3300.00,3300.00,350,1,1,1,1,'[]','2012-10-16 04:57:02'),
#	(210,'Energy Booster Package',4,0,NULL,NULL,0,3699.00,3300.00,3300.00,350,1,1,1,1,'[]','2012-10-16 04:57:02'),
#	(211,'Vital C &amp; Fragrance Package',2,0,NULL,NULL,0,6944.00,6944.00,6944.00,700,1,1,1,1,'[]','2012-10-16 04:57:02'),
#	(212,'Personal Care Package',2,0,NULL,NULL,0,6944.00,6944.00,6944.00,700,1,1,1,1,'[]','2012-10-16 04:57:02'),
#	(213,'Vital C &amp; Denta Max Package',2,0,NULL,NULL,0,6944.00,6944.00,6944.00,700,1,1,1,1,'[]','2012-10-16 04:57:02'),
#	(214,'Vital C &amp; P Plus',2,0,NULL,NULL,0,6944.00,6944.00,6944.00,700,1,1,1,1,'[]','2012-10-16 04:57:02');
#
#/*!40000 ALTER TABLE `is_products` ENABLE KEYS */;
#UNLOCK TABLES;

UPDATE is_products SET product_name=UPPER(product_name);

# Dump of table is_products_view
# ------------------------------------------------------------

DROP VIEW IF EXISTS `is_products_view`;

CREATE TABLE `is_products_view` (
   `product_id` INT(11) NOT NULL DEFAULT '0',
   `product_name` VARCHAR(100) DEFAULT NULL,
   `product_type_id` INT(11) NOT NULL DEFAULT '0',
   `product_line_id` INT(11) NOT NULL DEFAULT '0',
   `product_code` VARCHAR(100) DEFAULT NULL,
   `product_description` LONGTEXT DEFAULT NULL,
   `product_line` VARCHAR(100) DEFAULT NULL,
   `item_id` INT(11) NOT NULL DEFAULT '0',
   `item_name` VARCHAR(100) DEFAULT NULL,
   `item_description` TEXT DEFAULT NULL,
   `image_filename` TEXT NOT NULL,
   `standard_retail_price` DECIMAL(11) NOT NULL DEFAULT '0.00',
   `member_price` DECIMAL(11) NOT NULL DEFAULT '0.00',
   `employee_price` DECIMAL(11) NOT NULL DEFAULT '0.00',
   `igpsm_points` INT(11) NOT NULL DEFAULT '1',
   `item_type_id` INT(10) UNSIGNED DEFAULT '0',
   `item_sub_type_id` INT(11) DEFAULT '0',
   `sub_category` VARCHAR(64) DEFAULT NULL,
   `is_active` TINYINT(1) NOT NULL DEFAULT '1',
   `is_display` TINYINT(1) NOT NULL DEFAULT '1',
   `is_visible` TINYINT(1) NOT NULL DEFAULT '1',
   `is_vatable` TINYINT(1) NOT NULL DEFAULT '0',
   `is_gc_buyable` TINYINT(1) NOT NULL DEFAULT '1',
   `insert_timestamp` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM;



# Dump of table is_purchase_order_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `is_purchase_order_items`;

CREATE TABLE `is_purchase_order_items` (
  `purchase_order_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_order_id` int(10) unsigned NOT NULL DEFAULT '0',
  `item_id` int(10) unsigned NOT NULL DEFAULT '0',
  `item_description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qty` decimal(11,2) DEFAULT NULL,
  `amount` decimal(11,2) DEFAULT NULL,
  PRIMARY KEY (`purchase_order_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table is_purchase_order_workflow
# ------------------------------------------------------------

DROP TABLE IF EXISTS `is_purchase_order_workflow`;

CREATE TABLE `is_purchase_order_workflow` (
  `purchase_order_workflow_id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `for_user_id` int(11) NOT NULL DEFAULT '0',
  `workflow_action_type_id` int(11) NOT NULL DEFAULT '0',
  `workflow_status_id` int(11) NOT NULL DEFAULT '0',
  `remarks` text COLLATE utf8_unicode_ci,
  `update_timestamp` timestamp NULL DEFAULT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`purchase_order_workflow_id`),
  KEY `user_id` (`user_id`),
  KEY `for_user_id` (`for_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table is_purchase_orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `is_purchase_orders`;

CREATE TABLE `is_purchase_orders` (
  `purchase_order_id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_order_number` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `tracking_number` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `supplier_id` int(10) unsigned NOT NULL DEFAULT '0',
  `dr_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expected_date_of_delivery` date DEFAULT NULL,
  `payment_term_id` int(10) unsigned NOT NULL DEFAULT '0',
  `shipping_method_id` int(10) unsigned NOT NULL DEFAULT '0',
  `to_facility_id` int(10) unsigned NOT NULL DEFAULT '0',
  `json_items` text COLLATE utf8_unicode_ci,
  `total_amount` decimal(11,2) DEFAULT NULL,
  `purchase_order_status_id` int(10) unsigned NOT NULL DEFAULT '0',
  `remarks` text COLLATE utf8_unicode_ci,
  `update_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`purchase_order_id`),
  KEY `user_id` (`user_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `purchase_order_number` (`purchase_order_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table is_requisition_form_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `is_requisition_form_items`;

CREATE TABLE `is_requisition_form_items` (
  `requisition_form_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `requisition_form_id` int(11) NOT NULL DEFAULT '0',
  `item_id` int(11) NOT NULL DEFAULT '0',
  `qty` decimal(11,2) NOT NULL DEFAULT '0.00',
  `amount` decimal(11,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`requisition_form_item_id`),
  KEY `requisition_form_id` (`requisition_form_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table is_requisition_form_workflow
# ------------------------------------------------------------

DROP TABLE IF EXISTS `is_requisition_form_workflow`;

CREATE TABLE `is_requisition_form_workflow` (
  `requisition_form_workflow_id` int(11) NOT NULL AUTO_INCREMENT,
  `requisition_form_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `for_user_id` int(11) NOT NULL DEFAULT '0',
  `workflow_action_type_id` int(11) NOT NULL DEFAULT '0',
  `workflow_status_id` int(11) NOT NULL DEFAULT '0',
  `remarks` text COLLATE utf8_unicode_ci,
  `update_timestamp` timestamp NULL DEFAULT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`requisition_form_workflow_id`),
  KEY `user_id` (`user_id`),
  KEY `for_user_id` (`for_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table is_requisition_forms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `is_requisition_forms`;

CREATE TABLE `is_requisition_forms` (
  `requisition_form_id` int(11) NOT NULL AUTO_INCREMENT,
  `requisition_form_number` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `tracking_number` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `purpose_of_release` text COLLATE utf8_unicode_ci,
  `from_facility_id` int(11) NOT NULL DEFAULT '0',
  `issued_to` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `requisition_form_status_id` int(10) NOT NULL DEFAULT '0',
  `json_items` text COLLATE utf8_unicode_ci,
  `remarks` text COLLATE utf8_unicode_ci,
  `update_timestamp` timestamp NULL DEFAULT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`requisition_form_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table is_stocks_receiving
# ------------------------------------------------------------

DROP TABLE IF EXISTS `is_stocks_receiving`;

CREATE TABLE `is_stocks_receiving` (
  `stocks_receiving_id` int(11) NOT NULL AUTO_INCREMENT,
  `stocks_receiving_number` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `purchase_order_id` int(11) NOT NULL DEFAULT '0',
  `stocks_transfer_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `tracking_number` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `supplier_id` int(11) NOT NULL DEFAULT '0',
  `from_facility_id` int(11) NOT NULL DEFAULT '0',
  `to_facility_id` int(11) NOT NULL DEFAULT '0',
  `stocks_receiving_status_id` int(10) NOT NULL DEFAULT '0',
  `json_items` text COLLATE utf8_unicode_ci,
  `delivered_by` text COLLATE utf8_unicode_ci,
  `remarks` text COLLATE utf8_unicode_ci,
  `update_timestamp` timestamp NULL DEFAULT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`stocks_receiving_id`),
  KEY `purchase_order_id` (`purchase_order_id`),
  KEY `stocks_transfer_id` (`stocks_transfer_id`),
  KEY `user_id` (`user_id`),
  KEY `from_facility_id` (`from_facility_id`),
  KEY `to_facility_id` (`to_facility_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table is_stocks_receiving_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `is_stocks_receiving_items`;

CREATE TABLE `is_stocks_receiving_items` (
  `stocks_receiving_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `stocks_receiving_id` int(11) NOT NULL DEFAULT '0',
  `item_id` int(11) NOT NULL DEFAULT '0',
  `qty` decimal(11,2) NOT NULL DEFAULT '0.00',
  `amount` decimal(11,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`stocks_receiving_item_id`),
  KEY `stocks_receiving_id` (`stocks_receiving_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table is_stocks_transfer_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `is_stocks_transfer_items`;

CREATE TABLE `is_stocks_transfer_items` (
  `stocks_transfer_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `stocks_transfer_id` int(11) NOT NULL DEFAULT '0',
  `item_id` int(11) NOT NULL DEFAULT '0',
  `qty` decimal(11,2) DEFAULT NULL,
  `amount` decimal(11,2) DEFAULT NULL,
  PRIMARY KEY (`stocks_transfer_item_id`),
  KEY `stocks_transfer_id` (`stocks_transfer_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table is_stocks_transfer_workflow
# ------------------------------------------------------------

DROP TABLE IF EXISTS `is_stocks_transfer_workflow`;

CREATE TABLE `is_stocks_transfer_workflow` (
  `stocks_transfer_workflow_id` int(11) NOT NULL AUTO_INCREMENT,
  `stocks_transfer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `for_user_id` int(11) NOT NULL DEFAULT '0',
  `workflow_action_type_id` int(11) NOT NULL DEFAULT '0',
  `workflow_status_id` int(11) NOT NULL DEFAULT '0',
  `remarks` text COLLATE utf8_unicode_ci,
  `update_timestamp` timestamp NULL DEFAULT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`stocks_transfer_workflow_id`),
  KEY `user_id` (`user_id`),
  KEY `for_user_id` (`for_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table is_stocks_transfers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `is_stocks_transfers`;

CREATE TABLE `is_stocks_transfers` (
  `stocks_transfer_id` int(11) NOT NULL AUTO_INCREMENT,
  `stocks_transfer_number` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `purchase_order_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `tracking_number` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `supplier_id` int(11) NOT NULL DEFAULT '0',
  `from_facility_id` int(11) NOT NULL DEFAULT '0',
  `to_facility_id` int(11) NOT NULL DEFAULT '0',
  `shipping_method_id` int(11) NOT NULL DEFAULT '0',
  `stocks_transfer_status_id` int(10) NOT NULL DEFAULT '0',
  `remarks` text COLLATE utf8_unicode_ci,
  `json_items` text COLLATE utf8_unicode_ci,
  `released_timestamp` timestamp NULL DEFAULT NULL,
  `update_timestamp` timestamp NULL DEFAULT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`stocks_transfer_id`),
  KEY `purchase_order_id` (`purchase_order_id`),
  KEY `user_id` (`user_id`),
  KEY `from_facility_id` (`from_facility_id`),
  KEY `to_facility_id` (`to_facility_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table is_suppliers
# ------------------------------------------------------------

#DROP TABLE IF EXISTS `is_suppliers`;
#
#CREATE TABLE `is_suppliers` (
#  `supplier_id` int(11) NOT NULL AUTO_INCREMENT,
#  `supplier_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
#  `supplier_description` text COLLATE utf8_unicode_ci,
#  `supplier_address` text COLLATE utf8_unicode_ci,
#  `supplier_contact_person` text COLLATE utf8_unicode_ci,
#  `supplier_email` text COLLATE utf8_unicode_ci,
#  `supplier_contact_details` text COLLATE utf8_unicode_ci,
#  PRIMARY KEY (`supplier_id`)
#) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
#
#LOCK TABLES `is_suppliers` WRITE;
#/*!40000 ALTER TABLE `is_suppliers` DISABLE KEYS */;
#
#INSERT INTO `is_suppliers` (`supplier_id`, `supplier_name`, `supplier_description`, `supplier_address`, `supplier_contact_person`, `supplier_email`, `supplier_contact_details`)
#VALUES
#	(1,'Siegranz Chemworks Corporation','Siegranz Chemworks Corporation','',NULL,NULL,'');
#
#/*!40000 ALTER TABLE `is_suppliers` ENABLE KEYS */;
#UNLOCK TABLES;


# Dump of table is_unit_conversion
# ------------------------------------------------------------

DROP TABLE IF EXISTS `is_unit_conversion`;

CREATE TABLE `is_unit_conversion` (
  `unit_conversion_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `unit_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `conversion_qty` int(11) DEFAULT NULL,
  `conversion_unit_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_price` decimal(11,2) NOT NULL DEFAULT '0.00',
  `unit_cost` decimal(11,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`unit_conversion_id`),
  KEY `unit_code` (`unit_code`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table is_units
# ------------------------------------------------------------

DROP TABLE IF EXISTS `is_units`;

CREATE TABLE `is_units` (
  `unit_id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`unit_id`),
  UNIQUE KEY `unit_code` (`unit_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `is_units` WRITE;
/*!40000 ALTER TABLE `is_units` DISABLE KEYS */;

INSERT INTO `is_units` (`unit_id`, `unit_code`, `unit_name`, `unit_description`)
VALUES
	(1,'pcs','Pieces',''),
	(2,'box','Boxes',''),
	(3,'kg','Kilograms',''),
	(4,'g','Grams',''),
	(5,'mg','Milligrams',''),
	(6,'t','Tonnes',''),
	(7,'l','Liters',''),
	(8,'ml','Milliliters',''),
	(9,'bbl','Barrels',''),
	(10,'gl','Gallons',''),
	(11,'bo','Bottles',''),
	(12,'ea','Each',''),
	(13,'bli','Blister Packs',''),
	(14,'bag','Bags',''),
	(15,'pck','Packs',''),
	(16,'bar','Bars','');

/*!40000 ALTER TABLE `is_units` ENABLE KEYS */;
UNLOCK TABLES;

UPDATE is_units SET unit_code=UPPER(unit_code),unit_name=UPPER(unit_name);


# Dump of table is_work_order_forms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `is_work_order_forms`;

CREATE TABLE `is_work_order_forms` (
  `work_order_form_id` int(11) NOT NULL AUTO_INCREMENT,
  `work_order_id` int(11) DEFAULT NULL,
  `tracking_number` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `process_type_id` int(11) DEFAULT NULL,
  `process_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `process_status` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `step` int(11) DEFAULT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`work_order_form_id`),
  KEY `work_order_id` (`work_order_id`),
  KEY `tracking_number` (`tracking_number`),
  KEY `work_order_id_2` (`work_order_id`,`process_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table is_work_orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `is_work_orders`;

CREATE TABLE `is_work_orders` (
  `work_order_id` int(11) NOT NULL AUTO_INCREMENT,
  `tracking_number` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `current_process_type_id` int(11) DEFAULT NULL,
  `current_process_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `current_process_status` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `current_step` int(11) DEFAULT NULL,
  `work_order_status` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remarks` text COLLATE utf8_unicode_ci,
  `update_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`work_order_id`),
  KEY `tracking_number` (`tracking_number`),
  KEY `current_process_id` (`current_process_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table is_workflow_defaults
# ------------------------------------------------------------

DROP TABLE IF EXISTS `is_workflow_defaults`;

CREATE TABLE `is_workflow_defaults` (
  `workflow_default_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `action` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `form_handled` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `remarks` text COLLATE utf8_unicode_ci,
  `update_timestamp` timestamp NULL DEFAULT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`workflow_default_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `is_workflow_defaults` WRITE;
/*!40000 ALTER TABLE `is_workflow_defaults` DISABLE KEYS */;

INSERT INTO `is_workflow_defaults` (`workflow_default_id`, `user_id`, `action`, `form_handled`, `remarks`, `update_timestamp`, `insert_timestamp`)
VALUES
	(1,7,'Request','orders','',NULL,'2012-09-10 21:47:40'),
	(2,6,'Check','orders','',NULL,'2012-09-10 21:48:09'),
	(3,10,'Approve','orders','',NULL,'2012-09-10 21:48:22'),
	(4,7,'Request','transfers','','2012-09-26 15:06:50','2012-09-27 02:51:36'),
	(5,6,'Check','transfers','',NULL,'2012-09-27 02:51:54'),
	(6,10,'Approve','transfers','',NULL,'2012-09-27 02:52:09'),
	(7,7,'Request','requisition','',NULL,'2012-09-27 03:07:03'),
	(8,6,'Check','requisition','',NULL,'2012-09-27 03:07:15'),
	(9,10,'Approve','requisition','',NULL,'2012-09-27 03:07:31');

/*!40000 ALTER TABLE `is_workflow_defaults` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table rf_card_series
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rf_card_series`;

CREATE TABLE `rf_card_series` (
  `card_series_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `series_number` varchar(3) NOT NULL,
  `card_type_id` int(11) NOT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`card_series_id`),
  KEY `series_number` (`series_number`),
  KEY `card_type_id` (`card_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table rf_card_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rf_card_types`;

CREATE TABLE `rf_card_types` (
  `card_type_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(16) NOT NULL,
  `name` varchar(64) NOT NULL,
  `is_package` tinyint(1) NOT NULL DEFAULT '0',
  `description` text,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`card_type_id`),
  KEY `code` (`code`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table rf_card_types_view
# ------------------------------------------------------------

DROP VIEW IF EXISTS `rf_card_types_view`;

CREATE TABLE `rf_card_types_view` (
   `card_type_id` INT(11) UNSIGNED NOT NULL DEFAULT '0',
   `code` VARCHAR(16) NOT NULL,
   `name` VARCHAR(64) NOT NULL,
   `series_number` VARCHAR(3) DEFAULT NULL,
   `is_package` TINYINT(1) NOT NULL DEFAULT '0',
   `description` TEXT DEFAULT NULL,
   `insert_timestamp` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM;



# Dump of table rf_facility_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rf_facility_types`;

CREATE TABLE `rf_facility_types` (
  `facility_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `facility_type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facility_description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`facility_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `rf_facility_types` WRITE;
/*!40000 ALTER TABLE `rf_facility_types` DISABLE KEYS */;

INSERT INTO `rf_facility_types` (`facility_type_id`, `facility_type`, `facility_description`)
VALUES
	(1,'DEPOT',NULL),
	(2,'WAREHOUSE',NULL),
	(3,'TOLL MANUFACTURER',NULL);

/*!40000 ALTER TABLE `rf_facility_types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table rf_item_sub_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rf_item_sub_types`;

CREATE TABLE `rf_item_sub_types` (
  `item_sub_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_sub_type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_sub_type_description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`item_sub_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `rf_item_sub_types` WRITE;
/*!40000 ALTER TABLE `rf_item_sub_types` DISABLE KEYS */;

INSERT INTO `rf_item_sub_types` (`item_sub_type_id`, `item_sub_type`, `item_sub_type_description`)
VALUES
	(1,'Beverages','Beverages'),
	(2,'Capsules','Capsules'),
	(3,'Powder','Powder'),
	(4,'Soap','Soap'),
	(5,'Personal Care','Personal Care'),
	(6,'Food Supplement','Food Supplement'),
	(7,'Boxes','Boxes'),
	(8,'Foil Packs','Foil Packs'),
	(9,'Sticker Label','Sticker/Label'),
	(10,'Rolls','Rolls'),
	(11,'Inserts','Inserts'),
	(12,'Articles and Manuals','Articles and Manuals'),
	(13,'Audio/Video Prod.','Audio/Video Prod'),
	(14,'Bags','Bags'),
	(15,'Brochures','Brochures'),
	(16,'Demo Kit','Demo Kit'),
	(17,'Flyers','Flyers'),
	(18,'Forms and Certificates','Forms and Certificates'),
	(19,'Gift Checks','Gift Checks'),
	(20,'Gift Vouchers','Gift Vouchers'),
	(21,'Plastic Bag','Plastic Bag'),
	(22,'PPV Cards','PPV Cards'),
	(23,'Promotional Items','Promotional Items'),
	(24,'Tarpauline','Tarpauline'),
	(25,'Wastage','Wastage'),
	(26,'Blister Pad','Blister Pad'),
	(27,'Toothpaste','Toothpaste');

/*!40000 ALTER TABLE `rf_item_sub_types` ENABLE KEYS */;
UNLOCK TABLES;

UPDATE rf_item_sub_types SET item_sub_type=UPPER(item_sub_type);



# Dump of table rf_item_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rf_item_types`;

CREATE TABLE `rf_item_types` (
  `item_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_type_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_type_description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`item_type_id`),
  KEY `item_type_code` (`item_type_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `rf_item_types` WRITE;
/*!40000 ALTER TABLE `rf_item_types` DISABLE KEYS */;

INSERT INTO `rf_item_types` (`item_type_id`, `item_type`, `item_type_code`, `item_type_description`)
VALUES
	(1,'Raw Materials','RM',NULL),
	(2,'Finished Products','FP',NULL),
	(3,'Packaging Materials','PM',NULL),
	(4,'Marketing Materials','MM',NULL),
	(5,'Wastage from Raw Materials','WR',NULL),
	(6,'Wastage from Packaging Materials','WP',NULL);

/*!40000 ALTER TABLE `rf_item_types` ENABLE KEYS */;
UNLOCK TABLES;

UPDATE rf_item_types SET item_type=UPPER(item_type);


# Dump of table rf_member_account_status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rf_member_account_status`;

CREATE TABLE `rf_member_account_status` (
  `account_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_status` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`account_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `rf_member_account_status` WRITE;
/*!40000 ALTER TABLE `rf_member_account_status` DISABLE KEYS */;

INSERT INTO `rf_member_account_status` (`account_status_id`, `account_status`)
VALUES
	(1,'ACTIVE'),
	(2,'INACTIVE'),
	(3,'COMPANY');

/*!40000 ALTER TABLE `rf_member_account_status` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table rf_member_account_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rf_member_account_types`;

CREATE TABLE `rf_member_account_types` (
  `account_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_type` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`account_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `rf_member_account_types` WRITE;
/*!40000 ALTER TABLE `rf_member_account_types` DISABLE KEYS */;

INSERT INTO `rf_member_account_types` (`account_type_id`, `account_type`, `description`)
VALUES
	(1,'SP','Starter Pack (SP)'),
	(2,'VP','Value Pack'),
	(3,'TP','Trial Pack'),
	(4,'CD','Commission Deduct (SP)'),
	(5,'FS','Free Slot'),
	(6,'UP','Ultimate Pack (SP)'),
	(7,'PP','Premium Pack (SP)');

/*!40000 ALTER TABLE `rf_member_account_types` ENABLE KEYS */;
UNLOCK TABLES;


UPDATE rf_member_account_types SET account_type=UPPER(account_type);


# Dump of table rf_member_achievements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rf_member_achievements`;

CREATE TABLE `rf_member_achievements` (
  `achievement_id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`achievement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `rf_member_achievements` WRITE;
/*!40000 ALTER TABLE `rf_member_achievements` DISABLE KEYS */;

INSERT INTO `rf_member_achievements` (`achievement_id`, `title`)
VALUES
	(1,'Grand Masters'),
	(2,'Presidents Club'),
	(3,'Millionaires Club');

/*!40000 ALTER TABLE `rf_member_achievements` ENABLE KEYS */;
UNLOCK TABLES;

UPDATE rf_member_achievements SET title=UPPER(title);


# Dump of table rf_member_commission_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rf_member_commission_types`;

CREATE TABLE `rf_member_commission_types` (
  `commission_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `commission_type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`commission_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `rf_member_commission_types` WRITE;
/*!40000 ALTER TABLE `rf_member_commission_types` DISABLE KEYS */;

INSERT INTO `rf_member_commission_types` (`commission_type_id`, `commission_type`)
VALUES
	(1,'Referral Bonus'),
	(2,'Starter Pack Pairing Bonus'),
	(3,'Value Pack Pairing Bonus'),
	(4,'Trial Pack Pairing Bonus'),
	(5,'Repeat Sales Pairing Bonus'),
	(6,'Repeat Sales Unilevel Commission');

/*!40000 ALTER TABLE `rf_member_commission_types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table rf_member_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rf_member_types`;

CREATE TABLE `rf_member_types` (
  `member_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`member_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `rf_member_types` WRITE;
/*!40000 ALTER TABLE `rf_member_types` DISABLE KEYS */;

INSERT INTO `rf_member_types` (`member_type_id`, `member_type`)
VALUES
	(1,'Member'),
	(2,'EPC'),
	(3,'Stockist'),
	(4,'Employee');

/*!40000 ALTER TABLE `rf_member_types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table rf_news_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rf_news_types`;

CREATE TABLE `rf_news_types` (
  `news_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `news_type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`news_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `rf_news_types` WRITE;
/*!40000 ALTER TABLE `rf_news_types` DISABLE KEYS */;

INSERT INTO `rf_news_types` (`news_type_id`, `news_type`)
VALUES
	(1,'news'),
	(2,'events');

/*!40000 ALTER TABLE `rf_news_types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table rf_payment_terms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rf_payment_terms`;

CREATE TABLE `rf_payment_terms` (
  `payment_term_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_term` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_term_description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`payment_term_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `rf_payment_terms` WRITE;
/*!40000 ALTER TABLE `rf_payment_terms` DISABLE KEYS */;

INSERT INTO `rf_payment_terms` (`payment_term_id`, `payment_term`, `payment_term_description`)
VALUES
	(1,'Full Payment','Full Payment'),
	(2,'Installment',NULL);

/*!40000 ALTER TABLE `rf_payment_terms` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table rf_process_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rf_process_types`;

CREATE TABLE `rf_process_types` (
  `process_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `process_type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `process_type_description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`process_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `rf_process_types` WRITE;
/*!40000 ALTER TABLE `rf_process_types` DISABLE KEYS */;

INSERT INTO `rf_process_types` (`process_type_id`, `process_type`, `process_type_description`)
VALUES
	(1,'PURCHASE ORDER','Purchase Order'),
	(2,'STOCK TRANSFER','Stock Transfer'),
	(3,'STOCK RECEIVING','Stock Receiving'),
	(4,'REQUISITION','Requistion');

/*!40000 ALTER TABLE `rf_process_types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table rf_product_lines
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rf_product_lines`;

CREATE TABLE `rf_product_lines` (
  `product_line_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_line` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `is_visible` tinyint(1) NOT NULL,
  PRIMARY KEY (`product_line_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `rf_product_lines` WRITE;
/*!40000 ALTER TABLE `rf_product_lines` DISABLE KEYS */;

INSERT INTO `rf_product_lines` (`product_line_id`, `product_line`, `is_visible`)
VALUES
	(1,'Vital C Sodium Ascorbate',1),
	(2,'Daily Supplement Line',1),
	(3,'Beverage Line',1),
	(4,'Personal Hygiene Line',1),
	(5,'Personal Care Line',1);

/*!40000 ALTER TABLE `rf_product_lines` ENABLE KEYS */;
UNLOCK TABLES;

UPDATE rf_product_lines SET product_line=UPPER(product_line);


# Dump of table rf_product_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rf_product_types`;

CREATE TABLE `rf_product_types` (
  `product_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_visible` tinyint(1) NOT NULL,
  PRIMARY KEY (`product_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `rf_product_types` WRITE;
/*!40000 ALTER TABLE `rf_product_types` DISABLE KEYS */;

INSERT INTO `rf_product_types` (`product_type_id`, `name`, `is_visible`)
VALUES
	(1,'ITEM',1),
	(2,'STARTER PACK',1),
	(3,'VALUE PACK',1),
	(4,'MAINTENANCE PACK',1),
	(5,'TRIAL PACK',1);

/*!40000 ALTER TABLE `rf_product_types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table rf_purchase_order_statuses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rf_purchase_order_statuses`;

CREATE TABLE `rf_purchase_order_statuses` (
  `purchase_order_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_order_status` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `purchase_order_status_description` text COLLATE utf8_unicode_ci,
  `status_type_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`purchase_order_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `rf_purchase_order_statuses` WRITE;
/*!40000 ALTER TABLE `rf_purchase_order_statuses` DISABLE KEYS */;

INSERT INTO `rf_purchase_order_statuses` (`purchase_order_status_id`, `purchase_order_status`, `purchase_order_status_description`, `status_type_id`)
VALUES
	(1,'DRAFT','purchase order has been made as a draft, but not yet published',1),
	(2,'FOR APPROVAL','purchase order has been made, now waiting for approval from specific users',3),
	(3,'APPROVED','purchase order has been given approval',2),
	(4,'PARTIALLY DELIVERED','products have been delivered to the facility, but are not yet fully complete',3),
	(5,'COMPLETED','all products have been delivered',2),
	(6,'REJECTED','at least one of the actions for the for was rejected',4);

/*!40000 ALTER TABLE `rf_purchase_order_statuses` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table rf_requisition_form_statuses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rf_requisition_form_statuses`;

CREATE TABLE `rf_requisition_form_statuses` (
  `requisition_form_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `requisition_form_status` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `requisition_form_status_description` text COLLATE utf8_unicode_ci,
  `status_type_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`requisition_form_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `rf_requisition_form_statuses` WRITE;
/*!40000 ALTER TABLE `rf_requisition_form_statuses` DISABLE KEYS */;

INSERT INTO `rf_requisition_form_statuses` (`requisition_form_status_id`, `requisition_form_status`, `requisition_form_status_description`, `status_type_id`)
VALUES
	(1,'DRAFT','requisition form has been made, but not yet published',1),
	(2,'FOR APPROVAL','requisition form has been made, awaiting for approval',3),
	(3,'APPROVED','requisition form has been given approval',2),
	(4,'RELEASED','items have been released',2),
	(5,'COMPLETED','items have been picked up by receipient',2),
	(6,'REJECTED','at least one of the actions for the for was rejected',4);

/*!40000 ALTER TABLE `rf_requisition_form_statuses` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table rf_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rf_settings`;

CREATE TABLE `rf_settings` (
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `default` text COLLATE utf8_unicode_ci NOT NULL,
  `system_code` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'system',
  `is_locked` tinyint(4) NOT NULL DEFAULT '0',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `rf_settings` WRITE;
/*!40000 ALTER TABLE `rf_settings` DISABLE KEYS */;

INSERT INTO `rf_settings` (`slug`, `value`, `default`, `system_code`, `is_locked`, `insert_timestamp`)
VALUES
	('bank_transaction_cost','0','','system',0,'2012-10-03 22:02:41'),
	('bdo_transaction_cost','0','','system',0,'2012-10-03 22:02:41'),
	('contact_us_recipient','diego.manansala@gmail.com','diego.manansala@gmail.com','system',0,'2012-07-12 10:15:23'),
	('country_codes','[{\"code\":\"AF\",\"name\":\"Afghanistan\"}, {\"code\":\"AL\",\"name\":\"Albania\"}, {\"code\":\"DZ\",\"name\":\"Algeria\"}, {\"code\":\"AS\",\"name\":\"AmericanSamoa\"}, {\"code\":\"AD\",\"name\":\"Andorra\"}, {\"code\":\"AO\",\"name\":\"Angola\"}, {\"code\":\"AI\",\"name\":\"Anguilla\"}, {\"code\":\"AQ\",\"name\":\"Antarctica\"}, {\"code\":\"AG\",\"name\":\"AntiguaandBarbuda\"}, {\"code\":\"AR\",\"name\":\"Argentina\"}, {\"code\":\"AM\",\"name\":\"Armenia\"}, {\"code\":\"AW\",\"name\":\"Aruba\"}, {\"code\":\"AU\",\"name\":\"Australia\"}, {\"code\":\"AT\",\"name\":\"Austria\"}, {\"code\":\"AZ\",\"name\":\"Azerbaijan\"}, {\"code\":\"BS\",\"name\":\"Bahamas\"}, {\"code\":\"BH\",\"name\":\"Bahrain\"}, {\"code\":\"BD\",\"name\":\"Bangladesh\"}, {\"code\":\"BB\",\"name\":\"Barbados\"}, {\"code\":\"BY\",\"name\":\"Belarus\"}, {\"code\":\"BE\",\"name\":\"Belgium\"}, {\"code\":\"BZ\",\"name\":\"Belize\"}, {\"code\":\"BJ\",\"name\":\"Benin\"}, {\"code\":\"BM\",\"name\":\"Bermuda\"}, {\"code\":\"BT\",\"name\":\"Bhutan\"}, {\"code\":\"BO\",\"name\":\"Bolivia\"}, {\"code\":\"BA\",\"name\":\"Bosnia/Herzegovina\"}, {\"code\":\"BW\",\"name\":\"Botswana\"}, {\"code\":\"BV\",\"name\":\"BouvetIsland\"}, {\"code\":\"BR\",\"name\":\"Brazil\"}, {\"code\":\"IO\",\"name\":\"BritishIndianOceanTerr\"}, {\"code\":\"VG\",\"name\":\"BritishVirginIslands\"}, {\"code\":\"BN\",\"name\":\"BruneiDarussalam\"}, {\"code\":\"BG\",\"name\":\"Bulgaria\"}, {\"code\":\"BF\",\"name\":\"BurkinaFaso\"}, {\"code\":\"BI\",\"name\":\"Burundi\"}, {\"code\":\"KH\",\"name\":\"Cambodia\"}, {\"code\":\"CM\",\"name\":\"Cameroon\"}, {\"code\":\"CA\",\"name\":\"Canada\"}, {\"code\":\"CV\",\"name\":\"CapeVerde\"}, {\"code\":\"KY\",\"name\":\"CaymanIslands\"}, {\"code\":\"CF\",\"name\":\"CentralAfricanRepublic\"}, {\"code\":\"TD\",\"name\":\"Chad\"}, {\"code\":\"CL\",\"name\":\"Chile\"}, {\"code\":\"CN\",\"name\":\"China\"}, {\"code\":\"CX\",\"name\":\"ChristmasIsland\"}, {\"code\":\"CC\",\"name\":\"CocosKeelingIslands\"}, {\"code\":\"CO\",\"name\":\"Colombia\"}, {\"code\":\"KM\",\"name\":\"ComorosIslands\"}, {\"code\":\"CD\",\"name\":\"Congo,DemocraticRepublicof\"}, {\"code\":\"CG\",\"name\":\"CongoRepublic\"}, {\"code\":\"CK\",\"name\":\"CookIslands\"}, {\"code\":\"CR\",\"name\":\"CostaRica\"}, {\"code\":\"HR\",\"name\":\"Croatia\"}, {\"code\":\"CU\",\"name\":\"Cuba\"}, {\"code\":\"CY\",\"name\":\"Cyprus\"}, {\"code\":\"CZ\",\"name\":\"CzechRepublic\"}, {\"code\":\"DK\",\"name\":\"Denmark\"}, {\"code\":\"DJ\",\"name\":\"Djibouti\"}, {\"code\":\"DM\",\"name\":\"Dominica\"}, {\"code\":\"DO\",\"name\":\"DominicanRepublic\"}, {\"code\":\"TP\",\"name\":\"EastTimor\"}, {\"code\":\"EC\",\"name\":\"Ecuador\"}, {\"code\":\"EG\",\"name\":\"Egypt\"}, {\"code\":\"SV\",\"name\":\"ElSalvador\"}, {\"code\":\"GQ\",\"name\":\"EquatorialGuinea\"}, {\"code\":\"ER\",\"name\":\"Eritrea\"}, {\"code\":\"EE\",\"name\":\"Estonia\"}, {\"code\":\"ET\",\"name\":\"Ethiopia\"}, {\"code\":\"FK\",\"name\":\"FalklandIslands\"}, {\"code\":\"FO\",\"name\":\"FaroeIslands\"}, {\"code\":\"FJ\",\"name\":\"Fiji\"}, {\"code\":\"FI\",\"name\":\"Finland\"}, {\"code\":\"FR\",\"name\":\"France\"}, {\"code\":\"GF\",\"name\":\"FrenchGuiana\"}, {\"code\":\"PF\",\"name\":\"FrenchPolynesia\"}, {\"code\":\"TF\",\"name\":\"FrenchSouthernTerritories\"}, {\"code\":\"GA\",\"name\":\"Gabon\"}, {\"code\":\"GM\",\"name\":\"Gambia\"}, {\"code\":\"GE\",\"name\":\"Georgia\"}, {\"code\":\"DE\",\"name\":\"Germany\"}, {\"code\":\"GH\",\"name\":\"Ghana\"}, {\"code\":\"GI\",\"name\":\"Gibraltar\"}, {\"code\":\"GR\",\"name\":\"Greece\"}, {\"code\":\"GL\",\"name\":\"Greenland\"}, {\"code\":\"GD\",\"name\":\"Grenada\"}, {\"code\":\"GP\",\"name\":\"Guadeloupe\"}, {\"code\":\"GU\",\"name\":\"Guam\"}, {\"code\":\"GT\",\"name\":\"Guatemala\"}, {\"code\":\"GN\",\"name\":\"Guinea\"}, {\"code\":\"GW\",\"name\":\"GuineaBissau\"}, {\"code\":\"GY\",\"name\":\"Guyana\"}, {\"code\":\"HT\",\"name\":\"Haiti\"}, {\"code\":\"HM\",\"name\":\"Heard&amp;McDonaldIslands\"}, {\"code\":\"HN\",\"name\":\"Honduras\"}, {\"code\":\"HK\",\"name\":\"HongKong\"}, {\"code\":\"HU\",\"name\":\"Hungary\"}, {\"code\":\"IS\",\"name\":\"Iceland\"}, {\"code\":\"IN\",\"name\":\"India\"}, {\"code\":\"ID\",\"name\":\"Indonesia\"}, {\"code\":\"IR\",\"name\":\"Iran\"}, {\"code\":\"IQ\",\"name\":\"Iraq\"}, {\"code\":\"IE\",\"name\":\"Ireland\"}, {\"code\":\"IL\",\"name\":\"Israel\"}, {\"code\":\"IT\",\"name\":\"Italy\"}, {\"code\":\"CI\",\"name\":\"IvoryCoast\"}, {\"code\":\"JM\",\"name\":\"Jamaica\"}, {\"code\":\"JP\",\"name\":\"Japan\"}, {\"code\":\"JO\",\"name\":\"Jordan\"}, {\"code\":\"KZ\",\"name\":\"Kazakhstan\"}, {\"code\":\"KE\",\"name\":\"Kenya\"}, {\"code\":\"KI\",\"name\":\"Kirbati\"}, {\"code\":\"KW\",\"name\":\"Kuwait\"}, {\"code\":\"KG\",\"name\":\"Kyrgystan\"}, {\"code\":\"LA\",\"name\":\"Laos\"}, {\"code\":\"LV\",\"name\":\"Latvia\"}, {\"code\":\"LB\",\"name\":\"Lebanon\"}, {\"code\":\"LS\",\"name\":\"Lesotho\"}, {\"code\":\"LR\",\"name\":\"Liberia\"}, {\"code\":\"LY\",\"name\":\"LibyanArabJamahiriya\"}, {\"code\":\"LI\",\"name\":\"Liechtenstein\"}, {\"code\":\"LT\",\"name\":\"Lithuania\"}, {\"code\":\"LU\",\"name\":\"Luxembourg\"}, {\"code\":\"MO\",\"name\":\"Macau\"}, {\"code\":\"MK\",\"name\":\"Macedonia(F.Y.R.O.M)\"}, {\"code\":\"MG\",\"name\":\"Madagascar\"}, {\"code\":\"MW\",\"name\":\"Malawi\"}, {\"code\":\"MY\",\"name\":\"Malaysia\"}, {\"code\":\"MV\",\"name\":\"Maldives\"}, {\"code\":\"ML\",\"name\":\"Mali\"}, {\"code\":\"MT\",\"name\":\"Malta\"}, {\"code\":\"MH\",\"name\":\"MarshallIslands\"}, {\"code\":\"MQ\",\"name\":\"Martinique\"}, {\"code\":\"MR\",\"name\":\"Mauritania\"}, {\"code\":\"MU\",\"name\":\"Mauritius\"}, {\"code\":\"YT\",\"name\":\"Mayotte\"}, {\"code\":\"MX\",\"name\":\"Mexico\"}, {\"code\":\"FM\",\"name\":\"Micronesia\"}, {\"code\":\"MD\",\"name\":\"Moldova\"}, {\"code\":\"MC\",\"name\":\"Monaco\"}, {\"code\":\"MN\",\"name\":\"Mongolia\"}, {\"code\":\"ME\",\"name\":\"MONTENEGRO\"}, {\"code\":\"MS\",\"name\":\"Montserrat\"}, {\"code\":\"MA\",\"name\":\"Morocco\"}, {\"code\":\"MZ\",\"name\":\"Mozambique\"}, {\"code\":\"MM\",\"name\":\"Myanmar\"}, {\"code\":\"NA\",\"name\":\"Namibia\"}, {\"code\":\"NR\",\"name\":\"Nauru\"}, {\"code\":\"NP\",\"name\":\"Nepal\"}, {\"code\":\"NL\",\"name\":\"Netherlands\"}, {\"code\":\"AN\",\"name\":\"NetherlandsAntilles\"}, {\"code\":\"NC\",\"name\":\"NewCaledonia\"}, {\"code\":\"NZ\",\"name\":\"NewZealand\"}, {\"code\":\"NI\",\"name\":\"Nicaragua\"}, {\"code\":\"NE\",\"name\":\"Niger\"}, {\"code\":\"NG\",\"name\":\"Nigeria\"}, {\"code\":\"NU\",\"name\":\"Niue\"}, {\"code\":\"NF\",\"name\":\"NorfolkIsland\"}, {\"code\":\"MP\",\"name\":\"NorthernMarianaIslands\"}, {\"code\":\"KP\",\"name\":\"NorthKorea\"}, {\"code\":\"NO\",\"name\":\"Norway\"}, {\"code\":\"OM\",\"name\":\"Oman\"}, {\"code\":\"PK\",\"name\":\"Pakistan\"}, {\"code\":\"PW\",\"name\":\"Palau\"}, {\"code\":\"PA\",\"name\":\"Panama\"}, {\"code\":\"PG\",\"name\":\"PapuaNewGuinea\"}, {\"code\":\"PY\",\"name\":\"Paraguay\"}, {\"code\":\"PE\",\"name\":\"Peru\"}, {\"code\":\"PH\",\"name\":\"Philippines\"}, {\"code\":\"PL\",\"name\":\"Poland\"}, {\"code\":\"PT\",\"name\":\"Portugal\"}, {\"code\":\"PR\",\"name\":\"PuertoRico\"}, {\"code\":\"QA\",\"name\":\"Qatar\"}, {\"code\":\"RE\",\"name\":\"Reunion\"}, {\"code\":\"RO\",\"name\":\"Romania\"}, {\"code\":\"RU\",\"name\":\"RussianFederation\"}, {\"code\":\"RW\",\"name\":\"Rwanda\"}, {\"code\":\"SM\",\"name\":\"SanMarino\"}, {\"code\":\"ST\",\"name\":\"SaoTomeandPrincipe\"}, {\"code\":\"SA\",\"name\":\"SaudiArabia\"}, {\"code\":\"SN\",\"name\":\"Senegal\"}, {\"code\":\"RS\",\"name\":\"SERBIA\"}, {\"code\":\"SC\",\"name\":\"SeychellesIslands\"}, {\"code\":\"SL\",\"name\":\"SierraLeone\"}, {\"code\":\"SG\",\"name\":\"Singapore\"}, {\"code\":\"SK\",\"name\":\"Slovakia\"}, {\"code\":\"SI\",\"name\":\"Slovenia\"}, {\"code\":\"SB\",\"name\":\"SolomonIsland\"}, {\"code\":\"SO\",\"name\":\"Somalia\"}, {\"code\":\"ZA\",\"name\":\"SouthAfrica\"}, {\"code\":\"KR\",\"name\":\"SouthKorea\"}, {\"code\":\"GS\",\"name\":\"SouthSandwichIslands\"}, {\"code\":\"ES\",\"name\":\"Spain\"}, {\"code\":\"LK\",\"name\":\"SriLanka\"}, {\"code\":\"SH\",\"name\":\"St.Helena\"}, {\"code\":\"KN\",\"name\":\"St.KittsandNevis\"}, {\"code\":\"LC\",\"name\":\"St.Lucia\"}, {\"code\":\"PM\",\"name\":\"St.PierreandMiquelon\"}, {\"code\":\"VC\",\"name\":\"St.VincentandGrenadines\"}, {\"code\":\"SD\",\"name\":\"Sudan\"}, {\"code\":\"SR\",\"name\":\"Suriname\"}, {\"code\":\"SJ\",\"name\":\"Svalbard&amp;JanMayen\"}, {\"code\":\"SZ\",\"name\":\"Swaziland\"}, {\"code\":\"SE\",\"name\":\"Sweden\"}, {\"code\":\"CH\",\"name\":\"Switzerland\"}, {\"code\":\"SY\",\"name\":\"Syria\"}, {\"code\":\"TW\",\"name\":\"Taiwan\"}, {\"code\":\"TJ\",\"name\":\"Tajikistan\"}, {\"code\":\"TZ\",\"name\":\"Tanzania\"}, {\"code\":\"TH\",\"name\":\"Thailand\"}, {\"code\":\"TL\",\"name\":\"Timor-Leste\"}, {\"code\":\"TG\",\"name\":\"Togo\"}, {\"code\":\"TK\",\"name\":\"Tokelau\"}, {\"code\":\"TO\",\"name\":\"Tonga\"}, {\"code\":\"TT\",\"name\":\"TrinidadandTobago\"}, {\"code\":\"TN\",\"name\":\"Tunisia\"}, {\"code\":\"TR\",\"name\":\"Turkey\"}, {\"code\":\"TM\",\"name\":\"Turkmenistan\"}, {\"code\":\"TC\",\"name\":\"TurksandCaicosIslands\"}, {\"code\":\"TV\",\"name\":\"Tuvalu\"}, {\"code\":\"UM\",\"name\":\"U.S.MinorOutlyingIslands\"}, {\"code\":\"VI\",\"name\":\"U.S.VirginIslands\"}, {\"code\":\"UG\",\"name\":\"Uganda\"}, {\"code\":\"UA\",\"name\":\"Ukraine\"}, {\"code\":\"AE\",\"name\":\"UnitedArabEmirates\"}, {\"code\":\"GB\",\"name\":\"UnitedKingdom\"}, {\"code\":\"US\",\"name\":\"UnitedStates\"}, {\"code\":\"UY\",\"name\":\"Uruguay\"}, {\"code\":\"UZ\",\"name\":\"Uzbekistan\"}, {\"code\":\"VU\",\"name\":\"Vanuatu\"}, {\"code\":\"VA\",\"name\":\"VaticanCityState\"}, {\"code\":\"VE\",\"name\":\"Venezuela\"}, {\"code\":\"VN\",\"name\":\"Vietnam\"}, {\"code\":\"WF\",\"name\":\"WallisandFutunaIslands\"}, {\"code\":\"EH\",\"name\":\"WesternSahara\"}, {\"code\":\"WS\",\"name\":\"WesternSamoa\"}, {\"code\":\"YE\",\"name\":\"YemenRepublic\"}, {\"code\":\"YU\",\"name\":\"Yugoslavia\"}, {\"code\":\"ZR\",\"name\":\"Zaire\"}, {\"code\":\"ZM\",\"name\":\"Zambia\"}, {\"code\":\"ZW\",\"name\":\"Zimbabwe\"}]','','system',0,'2012-10-03 22:02:41'),
	('credit_card_and_cheque_discount_reduction','0.03','','webpoi',0,'2012-10-05 09:43:45'),
	('email_from','no-reply@vitalc.com','no-reply@vitalc.com','system',1,'2012-04-04 11:18:10'),
	('epc_discount','0.06','','webpoi',0,'2012-10-05 09:43:45'),
	('epc_min_amount','50000','','webpoi',0,'2012-10-05 09:43:45'),
	('gender_codes','[{\"code\":\"M\", \"name\":\"Male\"},{\"code\":\"F\", \"name\":\"Female\"}]','','system',0,'2012-10-03 22:02:41'),
	('gift_cheque','1000','','network',0,'2012-10-03 22:10:02'),
	('is_paypal_sandbox','1','','system',0,'2012-10-16 05:01:31'),
	('marital_status_codes','[{\"code\":\"Single\", \"name\":\"Single\"}, {\"code\":\"Married\", \"name\":\"Married\"}, {\"code\":\"Widowed\", \"name\":\"Widowed\"},{\"code\":\"Separated\", \"name\":\"Separated\"}]','','system',0,'2012-10-03 22:02:41'),
	('max_pairs','10','','network',0,'2012-10-03 22:10:02'),
	('mobile_country_codes','[{\"code\":\"93\",\"name\":\"Afghanistan (93)\"}, {\"code\":\"355\",\"name\":\"Albania (355)\"}, {\"code\":\"213\",\"name\":\"Algeria (213)\"}, {\"code\":\"684\",\"name\":\"American Samoa (684)\"}, {\"code\":\"376\",\"name\":\"Andorra (376)\"}, {\"code\":\"244\",\"name\":\"Angola (244)\"}, {\"code\":\"264\",\"name\":\"Anguilla (264)\"}, {\"code\":\"672\",\"name\":\"Antarctica (672)\"}, {\"code\":\"268\",\"name\":\"Antigua (268)\"}, {\"code\":\"54\",\"name\":\"Argentina (54)\"}, {\"code\":\"374\",\"name\":\"Armenia (374)\"}, {\"code\":\"297\",\"name\":\"Aruba (297)\"}, {\"code\":\"247\",\"name\":\"Ascension (247)\"}, {\"code\":\"61\",\"name\":\"Australia (61)\"}, {\"code\":\"672\",\"name\":\"Australian External Territories (672)\"}, {\"code\":\"43\",\"name\":\"Austria (43)\"}, {\"code\":\"994\",\"name\":\"Azerbaijan (994)\"}, {\"code\":\"242\",\"name\":\"Bahamas (242)\"}, {\"code\":\"973\",\"name\":\"Bahrain (973)\"}, {\"code\":\"880\",\"name\":\"Bangladesh (880)\"}, {\"code\":\"246\",\"name\":\"Barbados (246)\"}, {\"code\":\"268\",\"name\":\"Barbuda (268)\"}, {\"code\":\"375\",\"name\":\"Belarus (375)\"}, {\"code\":\"32\",\"name\":\"Belgium (32)\"}, {\"code\":\"501\",\"name\":\"Belize (501)\"}, {\"code\":\"229\",\"name\":\"Benin (229)\"}, {\"code\":\"441\",\"name\":\"Bermuda (441)\"}, {\"code\":\"975\",\"name\":\"Bhutan (975)\"}, {\"code\":\"591\",\"name\":\"Bolivia (591)\"}, {\"code\":\"387\",\"name\":\"Bosnia and Herzegovina (387)\"}, {\"code\":\"267\",\"name\":\"Botswana (267)\"}, {\"code\":\"55\",\"name\":\"Brazil (55)\"}, {\"code\":\"284\",\"name\":\"British Virgin Islands (284)\"}, {\"code\":\"673\",\"name\":\"Brunei Darussalam (673)\"}, {\"code\":\"359\",\"name\":\"Bulgaria (359)\"}, {\"code\":\"226\",\"name\":\"Burkina Faso (226)\"}, {\"code\":\"257\",\"name\":\"Burundi (257)\"}, {\"code\":\"855\",\"name\":\"Cambodia (855)\"}, {\"code\":\"237\",\"name\":\"Cameroon (237)\"}, {\"code\":\"1\",\"name\":\"Canada (1)\"}, {\"code\":\"238\",\"name\":\"Cape Verde Islands (238)\"}, {\"code\":\"345\",\"name\":\"Cayman Islands (345)\"}, {\"code\":\"236\",\"name\":\"Central African Republic (236)\"}, {\"code\":\"235\",\"name\":\"Chad (235)\"}, {\"code\":\"64\",\"name\":\"Chatham Island (New Zealand) (64)\"}, {\"code\":\"56\",\"name\":\"Chile (56)\"}, {\"code\":\"86\",\"name\":\"China (PRC) (86)\"}, {\"code\":\"618\",\"name\":\"Christmas Island (618)\"}, {\"code\":\"61\",\"name\":\"Cocos-Keeling Islands (61)\"}, {\"code\":\"57\",\"name\":\"Colombia (57)\"}, {\"code\":\"269\",\"name\":\"Comoros (269)\"}, {\"code\":\"242\",\"name\":\"Congo (242)\"}, {\"code\":\"243\",\"name\":\"Congo; Dem. Rep. of (formerly Zaire) (243)\"}, {\"code\":\"682\",\"name\":\"Cook Islands (682)\"}, {\"code\":\"506\",\"name\":\"Costa Rica (506)\"}, {\"code\":\"225\",\"name\":\"Cote d\'Ivoire (Ivory Coast) (225)\"}, {\"code\":\"385\",\"name\":\"Croatia (385)\"}, {\"code\":\"53\",\"name\":\"Cuba (53)\"}, {\"code\":\"599\",\"name\":\"Curaao (599)\"}, {\"code\":\"357\",\"name\":\"Cyprus (357)\"}, {\"code\":\"420\",\"name\":\"Czech Republic (420)\"}, {\"code\":\"45\",\"name\":\"Denmark (45)\"}, {\"code\":\"246\",\"name\":\"Diego Garcia (246)\"}, {\"code\":\"253\",\"name\":\"Djibouti (253)\"}, {\"code\":\"767\",\"name\":\"Dominica (767)\"}, {\"code\":\"809\",\"name\":\"Dominican Republic (809)\"}, {\"code\":\"670\",\"name\":\"East Timor (670)\"}, {\"code\":\"56\",\"name\":\"Easter Island (56)\"}, {\"code\":\"593\",\"name\":\"Ecuador (593)\"}, {\"code\":\"20\",\"name\":\"Egypt (20)\"}, {\"code\":\"503\",\"name\":\"El Salvador (503)\"}, {\"code\":\"240\",\"name\":\"Equatorial Guinea (240)\"}, {\"code\":\"291\",\"name\":\"Eritrea (291)\"}, {\"code\":\"372\",\"name\":\"Estonia (372)\"}, {\"code\":\"251\",\"name\":\"Ethiopia (251)\"}, {\"code\":\"500\",\"name\":\"Falkland Islands (Malvinas) (500)\"}, {\"code\":\"298\",\"name\":\"Faroe Islands (298)\"}, {\"code\":\"679\",\"name\":\"Fiji Islands (679)\"}, {\"code\":\"358\",\"name\":\"Finland (358)\"}, {\"code\":\"33\",\"name\":\"France (33)\"}, {\"code\":\"596\",\"name\":\"French Antilles (596)\"}, {\"code\":\"594\",\"name\":\"French Guiana (594)\"}, {\"code\":\"689\",\"name\":\"French Polynesia (689)\"}, {\"code\":\"241\",\"name\":\"Gabonese Republic (241)\"}, {\"code\":\"220\",\"name\":\"Gambia (220)\"}, {\"code\":\"995\",\"name\":\"Georgia (995)\"}, {\"code\":\"49\",\"name\":\"Germany (49)\"}, {\"code\":\"233\",\"name\":\"Ghana (233)\"}, {\"code\":\"350\",\"name\":\"Gibraltar (350)\"}, {\"code\":\"30\",\"name\":\"Greece (30)\"}, {\"code\":\"299\",\"name\":\"Greenland (299)\"}, {\"code\":\"473\",\"name\":\"Grenada (473)\"}, {\"code\":\"590\",\"name\":\"Guadeloupe (590)\"}, {\"code\":\"671\",\"name\":\"Guam (671)\"}, {\"code\":\"502\",\"name\":\"Guatemala (502)\"}, {\"code\":\"224\",\"name\":\"Guinea (224)\"}, {\"code\":\"245\",\"name\":\"Guinea-Bissau (245)\"}, {\"code\":\"592\",\"name\":\"Guyana (592)\"}, {\"code\":\"509\",\"name\":\"Haiti (509)\"}, {\"code\":\"504\",\"name\":\"Honduras (504)\"}, {\"code\":\"852\",\"name\":\"Hong Kong (852)\"}, {\"code\":\"36\",\"name\":\"Hungary (36)\"}, {\"code\":\"354\",\"name\":\"Iceland (354)\"}, {\"code\":\"91\",\"name\":\"India (91)\"}, {\"code\":\"62\",\"name\":\"Indonesia (62)\"}, {\"code\":\"871\",\"name\":\"Inmarsat (Atlantic Ocean - East) (871)\"}, {\"code\":\"874\",\"name\":\"Inmarsat (Atlantic Ocean - West) (874)\"}, {\"code\":\"873\",\"name\":\"Inmarsat (Indian Ocean) (873)\"}, {\"code\":\"872\",\"name\":\"Inmarsat (Pacific Ocean) (872)\"}, {\"code\":\"870\",\"name\":\"Inmarsat SNAC (870)\"}, {\"code\":\"800\",\"name\":\"International Freephone Service (800)\"}, {\"code\":\"808\",\"name\":\"International Shared Cost Service (ISCS) (808)\"}, {\"code\":\"98\",\"name\":\"Iran (98)\"}, {\"code\":\"964\",\"name\":\"Iraq (964)\"}, {\"code\":\"353\",\"name\":\"Ireland (353)\"}, {\"code\":\"972\",\"name\":\"Israel (972)\"}, {\"code\":\"39\",\"name\":\"Italy (39)\"}, {\"code\":\"876\",\"name\":\"Jamaica (876)\"}, {\"code\":\"81\",\"name\":\"Japan (81)\"}, {\"code\":\"962\",\"name\":\"Jordan (962)\"}, {\"code\":\"7\",\"name\":\"Kazakhstan (7)\"}, {\"code\":\"254\",\"name\":\"Kenya (254)\"}, {\"code\":\"686\",\"name\":\"Kiribati (686)\"}, {\"code\":\"850\",\"name\":\"Korea (North) (850)\"}, {\"code\":\"82\",\"name\":\"Korea (South) (82)\"}, {\"code\":\"965\",\"name\":\"Kuwait (965)\"}, {\"code\":\"996\",\"name\":\"Kyrgyz Republic (996)\"}, {\"code\":\"856\",\"name\":\"Laos (856)\"}, {\"code\":\"371\",\"name\":\"Latvia (371)\"}, {\"code\":\"961\",\"name\":\"Lebanon (961)\"}, {\"code\":\"266\",\"name\":\"Lesotho (266)\"}, {\"code\":\"231\",\"name\":\"Liberia (231)\"}, {\"code\":\"218\",\"name\":\"Libya (218)\"}, {\"code\":\"423\",\"name\":\"Liechtenstein (423)\"}, {\"code\":\"370\",\"name\":\"Lithuania (370)\"}, {\"code\":\"352\",\"name\":\"Luxembourg (352)\"}, {\"code\":\"853\",\"name\":\"Macao (853)\"}, {\"code\":\"389\",\"name\":\"Macedonia (Former Yugoslav Rep of.) (389)\"}, {\"code\":\"261\",\"name\":\"Madagascar (261)\"}, {\"code\":\"265\",\"name\":\"Malawi (265)\"}, {\"code\":\"60\",\"name\":\"Malaysia (60)\"}, {\"code\":\"960\",\"name\":\"Maldives (960)\"}, {\"code\":\"223\",\"name\":\"Mali Republic (223)\"}, {\"code\":\"356\",\"name\":\"Malta (356)\"}, {\"code\":\"692\",\"name\":\"Marshall Islands (692)\"}, {\"code\":\"596\",\"name\":\"Martinique (596)\"}, {\"code\":\"222\",\"name\":\"Mauritania (222)\"}, {\"code\":\"230\",\"name\":\"Mauritius (230)\"}, {\"code\":\"269\",\"name\":\"Mayotte Island (269)\"}, {\"code\":\"52\",\"name\":\"Mexico (52)\"}, {\"code\":\"691\",\"name\":\"Micronesia; Federal States of (691)\"}, {\"code\":\"808\",\"name\":\"Midway Island (808)\"}, {\"code\":\"373\",\"name\":\"Moldova (373)\"}, {\"code\":\"377\",\"name\":\"Monaco (377)\"}, {\"code\":\"976\",\"name\":\"Mongolia (976)\"}, {\"code\":\"664\",\"name\":\"Montserrat (664)\"}, {\"code\":\"212\",\"name\":\"Morocco (212)\"}, {\"code\":\"258\",\"name\":\"Mozambique (258)\"}, {\"code\":\"95\",\"name\":\"Myanmar (95)\"}, {\"code\":\"264\",\"name\":\"Namibia (264)\"}, {\"code\":\"674\",\"name\":\"Nauru (674)\"}, {\"code\":\"977\",\"name\":\"Nepal (977)\"}, {\"code\":\"31\",\"name\":\"Netherlands (31)\"}, {\"code\":\"599\",\"name\":\"Netherlands Antilles (599)\"}, {\"code\":\"869\",\"name\":\"Nevis (869)\"}, {\"code\":\"687\",\"name\":\"New Caledonia (687)\"}, {\"code\":\"64\",\"name\":\"New Zealand (64)\"}, {\"code\":\"505\",\"name\":\"Nicaragua (505)\"}, {\"code\":\"227\",\"name\":\"Niger (227)\"}, {\"code\":\"234\",\"name\":\"Nigeria (234)\"}, {\"code\":\"683\",\"name\":\"Niue (683)\"}, {\"code\":\"672\",\"name\":\"Norfolk Island (672)\"}, {\"code\":\"1\",\"name\":\"Northern Marianas Islands (Saipan; Rota; Tinian) (1)\"}, {\"code\":\"47\",\"name\":\"Norway (47)\"}, {\"code\":\"968\",\"name\":\"Oman (968)\"}, {\"code\":\"92\",\"name\":\"Pakistan (92)\"}, {\"code\":\"680\",\"name\":\"Palau (680)\"}, {\"code\":\"970\",\"name\":\"Palestinian Settlements (970)\"}, {\"code\":\"507\",\"name\":\"Panama (507)\"}, {\"code\":\"675\",\"name\":\"Papua New Guinea (675)\"}, {\"code\":\"595\",\"name\":\"Paraguay (595)\"}, {\"code\":\"51\",\"name\":\"Peru (51)\"}, {\"code\":\"63\",\"name\":\"Philippines (63)\"}, {\"code\":\"48\",\"name\":\"Poland (48)\"}, {\"code\":\"351\",\"name\":\"Portugal (351)\"}, {\"code\":\"787\",\"name\":\"Puerto Rico (787)\"}, {\"code\":\"974\",\"name\":\"Qatar (974)\"}, {\"code\":\"40\",\"name\":\"Romania (40)\"}, {\"code\":\"262\",\"name\":\"Runion Island (262)\"}, {\"code\":\"7\",\"name\":\"Russia (7)\"}, {\"code\":\"250\",\"name\":\"Rwandese Republic (250)\"}, {\"code\":\"378\",\"name\":\"San Marino (378)\"}, {\"code\":\"966\",\"name\":\"Saudi Arabia (966)\"}, {\"code\":\"221\",\"name\":\"Senegal (221)\"}, {\"code\":\"381\",\"name\":\"Serbia and Montenegro (381)\"}, {\"code\":\"248\",\"name\":\"Seychelles Republic (248)\"}, {\"code\":\"232\",\"name\":\"Sierra Leone (232)\"}, {\"code\":\"65\",\"name\":\"Singapore (65)\"}, {\"code\":\"421\",\"name\":\"Slovak Republic (421)\"}, {\"code\":\"386\",\"name\":\"Slovenia (386)\"}, {\"code\":\"239\",\"name\":\"So Tom and Principe (239)\"}, {\"code\":\"677\",\"name\":\"Solomon Islands (677)\"}, {\"code\":\"252\",\"name\":\"Somali Democratic Republic (252)\"}, {\"code\":\"27\",\"name\":\"South Africa (27)\"}, {\"code\":\"34\",\"name\":\"Spain (34)\"}, {\"code\":\"94\",\"name\":\"Sri Lanka (94)\"}, {\"code\":\"290\",\"name\":\"St. Helena (290)\"}, {\"code\":\"869\",\"name\":\"St. Kitts/Nevis (869)\"}, {\"code\":\"758\",\"name\":\"St. Lucia (758)\"}, {\"code\":\"508\",\"name\":\"St. Pierre and Miquelon (508)\"}, {\"code\":\"784\",\"name\":\"St. Vincent and Grenadines (784)\"}, {\"code\":\"249\",\"name\":\"Sudan (249)\"}, {\"code\":\"597\",\"name\":\"Suriname (597)\"}, {\"code\":\"268\",\"name\":\"Swaziland (268)\"}, {\"code\":\"46\",\"name\":\"Sweden (46)\"}, {\"code\":\"41\",\"name\":\"Switzerland (41)\"}, {\"code\":\"963\",\"name\":\"Syria (963)\"}, {\"code\":\"886\",\"name\":\"Taiwan (886)\"}, {\"code\":\"992\",\"name\":\"Tajikistan (992)\"}, {\"code\":\"255\",\"name\":\"Tanzania (255)\"}, {\"code\":\"66\",\"name\":\"Thailand (66)\"}, {\"code\":\"228\",\"name\":\"Togolese Republic (228)\"}, {\"code\":\"690\",\"name\":\"Tokelau (690)\"}, {\"code\":\"676\",\"name\":\"Tonga Islands (676)\"}, {\"code\":\"868\",\"name\":\"Trinidad and Tobago (868)\"}, {\"code\":\"216\",\"name\":\"Tunisia (216)\"}, {\"code\":\"90\",\"name\":\"Turkey (90)\"}, {\"code\":\"993\",\"name\":\"Turkmenistan (993)\"}, {\"code\":\"649\",\"name\":\"Turks and Caicos Islands (649)\"}, {\"code\":\"688\",\"name\":\"Tuvalu (688)\"}, {\"code\":\"340\",\"name\":\"US Virgin Islands (340)\"}, {\"code\":\"256\",\"name\":\"Uganda (256)\"}, {\"code\":\"380\",\"name\":\"Ukraine (380)\"}, {\"code\":\"971\",\"name\":\"United Arab Emirates (971)\"}, {\"code\":\"44\",\"name\":\"United Kingdom (44)\"}, {\"code\":\"1\",\"name\":\"United States of America (1)\"}, {\"code\":\"878\",\"name\":\"Universal Personal Telecommunications (UPT) (878)\"}, {\"code\":\"598\",\"name\":\"Uruguay (598)\"}, {\"code\":\"998\",\"name\":\"Uzbekistan (998)\"}, {\"code\":\"678\",\"name\":\"Vanuatu (678)\"}, {\"code\":\"379\",\"name\":\"Vatican City (379)\"}, {\"code\":\"39\",\"name\":\"Vatican City (39)\"}, {\"code\":\"58\",\"name\":\"Venezuela (58)\"}, {\"code\":\"84\",\"name\":\"Vietnam (84)\"}, {\"code\":\"808\",\"name\":\"Wake Island (808)\"}, {\"code\":\"681\",\"name\":\"Wallis and Futuna Islands (681)\"}, {\"code\":\"685\",\"name\":\"Western Samoa (685)\"}, {\"code\":\"967\",\"name\":\"Yemen (967)\"}, {\"code\":\"260\",\"name\":\"Zambia (260)\"}, {\"code\":\"255\",\"name\":\"Zanzibar (255)\"}, {\"code\":\"263\",\"name\":\"Zimbabwe (263)\"}]','','system',0,'2012-10-03 22:02:41'),
	('pairs_ctr_to_gc','5','','network',0,'2012-10-05 09:43:45'),
	('payment_methods','Cash, Credit Card, Gift Cards','Cash, Credit Card, Gift Cards','webpos',0,'2012-08-02 06:19:39'),
	('paypal_email','dantepangan@gmail.com','','system',0,'2012-10-16 05:01:31'),
	('paypal_transaction_cost','0','','system',0,'2012-10-03 22:02:41'),
	('ph_provinces_and_municipalities','[{\"province_id\":\"1\",\"province_name\":\"Abra\",\"municipality_list\":\"Bangued|Boliney|Bucay|Bucloc|Daguioman|Danglas|Dolores|La Paz|Lacub|Lagangilang|Lagayan|Langiden|Licuan-Baay|Luba|Malibcong|Manabo|Pe\\u00f1arrubia|Pidigan|Pilar|Sallapadan|San Isidro|San Juan|San Quintin|Tayum|Tineg|Tubo|Villaviciosa\'\"},{\"province_id\":\"2\",\"province_name\":\"Agusan del Norte\",\"municipality_list\":\"Buenavista|Butuan City|Cabadbaran|Carmen|Jabonga|Kitcharao|Las Nieves|Magallanes|Nasipit|Remedios T. Romualdez|Santiago|Tubay\"},{\"province_id\":\"3\",\"province_name\":\"Agusan del Sur\",\"municipality_list\":\"Bayugan|Bunawan|Esperanza|La Paz|Loreto|Prosperidad|Rosario|San Francisco|San Luis|Santa Josefa|Sibagat|Talacogon|Trento|Veruela\"},{\"province_id\":\"4\",\"province_name\":\"Aklan\",\"municipality_list\":\"Altavas|Balete|Banga|Batan|Buruanga|Ibajay|Kalibo|Lezo|Libacao|Madalag|Makato|Malay|Malinao|Nabas|New Washington|Numancia|Tangalan\"},{\"province_id\":\"5\",\"province_name\":\"Albay\",\"municipality_list\":\"Bacacay|Camalig|Daraga|Guinobatan|Jovellar|Legazpi City|Libon|Ligao City|Malilipot|Malinao|Manito|Oas|Pio Duran|Polangui|Rapu-Rapu|Santo Domingo|Tabaco City|Tiwi\"},{\"province_id\":\"6\",\"province_name\":\"Antique\",\"municipality_list\":\"Anini-y|Barbaza|Belison|Bugasong|Caluya|Culasi|Hamtic|Laua-an|Libertad|Pandan|Patnongon|San Jose|San Remigio|Sebaste|Sibalom|Tibiao|Tobias Fornier|Valderrama\"},{\"province_id\":\"7\",\"province_name\":\"Apayao\",\"municipality_list\":\"Calanasan|Conner|Flora|Kabugao|Luna|Pudtol|Santa Marcela\"},{\"province_id\":\"8\",\"province_name\":\"Aurora\",\"municipality_list\":\"Baler|Casiguran|Dilasag|Dinalungan|Dingalan|Dipaculao|Maria Aurora|San Luis\"},{\"province_id\":\"9\",\"province_name\":\"Basilan\",\"municipality_list\":\"Akbar|Al-Barka|Hadji Mohammad Ajul|Hadji Muhtamad|Isabela City|Lamitan|Lantawan|Maluso|Sumisip|Tabuan-Lasa|Tipo-Tipo|Tuburan|Ungkaya Pukan\"},{\"province_id\":\"10\",\"province_name\":\"Bataan\",\"municipality_list\":\"Abucay|Bagac|Balanga City|Dinalupihan|Hermosa|Limay|Mariveles|Morong|Orani|Orion|Pilar|Samal\"},{\"province_id\":\"11\",\"province_name\":\"Batanes\",\"municipality_list\":\"Basco|Itbayat|Ivana|Mahatao|Sabtang|Uyugan\"},{\"province_id\":\"12\",\"province_name\":\"Batangas\",\"municipality_list\":\"Agoncillo|Alitagtag|Balayan|Balete|Batangas City|Bauan|Calaca|Calatagan|Cuenca|Ibaan|Laurel|Lemery|Lian|Lipa City|Lobo|Mabini|Malvar|Mataas na Kahoy|Nasugbu|Padre Garcia|Rosario|San Jose|San Juan|San Luis|San Nicolas|San Pascual|Santa Teresita|Santo Tomas|Taal|Talisay|Tanauan City|Taysan|Tingloy|Tuy\"},{\"province_id\":\"13\",\"province_name\":\"Benguet\",\"municipality_list\":\"Atok|Baguio City|Bakun|Bokod|Buguias|Itogon|Kabayan|Kapangan|Kibungan|La Trinidad|Mankayan|Sablan|Tuba|Tublay\"},{\"province_id\":\"14\",\"province_name\":\"Biliran\",\"municipality_list\":\"Almeria|Biliran|Cabucgayan|Caibiran|Culaba|Kawayan|Maripipi|Naval\"},{\"province_id\":\"15\",\"province_name\":\"Bohol\",\"municipality_list\":\"Alburquerque|Alicia|Anda|Antequera|Baclayon|Balilihan|Batuan|Bien Unido|Bilar|Buenavista|Calape|Candijay|Carmen|Catigbian|Clarin|Corella|Cortes|Dagohoy|Danao|Dauis|Dimiao|Duero|Garcia Hernandez|Getafe|Guindulman|Inabanga|Jagna|Lila|Loay|Loboc|Loon|Mabini|Maribojoc|Panglao|Pilar|President Carlos P. Garcia|Sagbayan|San Isidro|San Miguel|Sevilla|Sierra Bullones|Sikatuna|Tagbilaran City|Talibon|Trinidad|Tubigon|Ubay|Valencia\"},{\"province_id\":\"16\",\"province_name\":\"Bukidnon\",\"municipality_list\":\"Baungon|Cabanglasan|Damulog|Dangcagan|Don Carlos|Impasug-ong|Kadingilan|Kalilangan|Kibawe|Kitaotao|Lantapan|Libona|Malaybalay City|Malitbog|Manolo Fortich|Maramag|Pangantucan|Quezon|San Fernando|Sumilao|Talakag|Valencia City\"},{\"province_id\":\"17\",\"province_name\":\"Bulacan\",\"municipality_list\":\"Angat|Balagtas|Baliuag|Bocaue|Bulacan|Bustos|Calumpit|Do\\u00f1a Remedios Trinidad|Guiguinto|Hagonoy|Malolos City|Marilao|Meycauayan City|Norzagaray|Obando|Pandi|Paombong|Plaridel|Pulilan|San Ildefonso|San Jose del Monte City|San Miguel|San Rafael|Santa Maria\"},{\"province_id\":\"18\",\"province_name\":\"Cagayan\",\"municipality_list\":\"Abulug|Alcala|Allacapan|Amulung|Aparri|Baggao|Ballesteros|Buguey|Calayan|Camalaniugan|Claveria|Enrile|Gattaran|Gonzaga|Iguig|Lal-lo|Lasam|Pamplona|Pe\\u00f1ablanca|Piat|Rizal|Sanchez-Mira|Santa Ana|Santa Praxedes|Santa Teresita|Santo Ni\\u00f1o|Solana|Tuao|Tuguegarao City\"},{\"province_id\":\"19\",\"province_name\":\"Camarines Norte\",\"municipality_list\":\"Basud|Capalonga|Daet|Jose Panganiban|Labo|Mercedes|Paracale|San Lorenzo Ruiz|San Vicente|Santa Elena|Talisay|Vinzons\"},{\"province_id\":\"20\",\"province_name\":\"Camarines Sur\",\"municipality_list\":\"Baao|Balatan|Bato|Bombon|Buhi|Bula|Cabusao|Calabanga|Camaligan|Canaman|Caramoan|Del Gallego|Gainza|Garchitorena|Goa|Iriga City|Lagonoy|Libmanan|Lupi|Magarao|Milaor|Minalabac|Nabua|Naga City|Ocampo|Pamplona|Pasacao|Pili|Presentacion|Ragay|Sag\\u00f1ay|San Fernando|San Jose|Sipocot|Siruma|Tigaon|Tinambac\"},{\"province_id\":\"21\",\"province_name\":\"Camiguin\",\"municipality_list\":\"Catarman|Guinsiliban|Mahinog|Mambajao|Sagay\"},{\"province_id\":\"22\",\"province_name\":\"Capiz\",\"municipality_list\":\"Cuartero|Dao|Dumalag|Dumarao|Ivisan|Jamindan|Ma-ayon|Mambusao|Panay|Panitan|Pilar|Pontevedra|President Roxas|Roxas City|Sapi-an|Sigma|Tapaz\"},{\"province_id\":\"23\",\"province_name\":\"Catanduanes\",\"municipality_list\":\"Bagamanoc|Baras|Bato|Caramoran|Gigmoto|Pandan|Panganiban|San Andres|San Miguel|Viga|Virac\"},{\"province_id\":\"24\",\"province_name\":\"Cavite\",\"municipality_list\":\"Alfonso|Amadeo|Bacoor|Carmona|Cavite City|Dasmari\\u00f1as City|General Mariano Alvarez|General Emilio Aguinaldo|General Trias|Imus|Indang|Kawit|Magallanes|Maragondon|Mendez|Naic|Noveleta|Rosario|Silang|Tagaytay City|Tanza|Ternate|Trece Martires City\"},{\"province_id\":\"25\",\"province_name\":\"Cebu\",\"municipality_list\":\"Alcantara|Alcoy|Alegria|Aloguinsan|Argao|Asturias|Badian|Balamban|Bantayan|Barili|Bogo City|Boljoon|Borbon|Carcar City|Carmen|Catmon|Cebu City|Compostela|Consolacion|Cordoba|Daanbantayan|Dalaguete|Danao City|Dumanjug|Ginatilan|Lapu-Lapu City|Liloan|Madridejos|Malabuyoc|Mandaue City|Medellin|Minglanilla|Moalboal|Naga City|Oslob|Pilar|Pinamungahan|Poro|Ronda|Samboan|San Fernando|San Francisco|San Remigio|Santa Fe|Santander|Sibonga|Sogod|Tabogon|Tabuelan|Talisay City|Toledo City|Tuburan|Tudela\"},{\"province_id\":\"26\",\"province_name\":\"Compostela Valley\",\"municipality_list\":\"Compostela|Laak|Mabini|Maco|Maragusan|Mawab|Monkayo|Montevista|Nabunturan|New Bataan|Pantukan\"},{\"province_id\":\"27\",\"province_name\":\"Cotabato\",\"municipality_list\":\"Alamada|Aleosan|Antipas|Arakan|Banisilan|Carmen|Kabacan|Kidapawan City|Libungan|M\'lang|Magpet|Makilala|Matalam|Midsayap|Pigkawayan|Pikit|President Roxas|Tulunan\"},{\"province_id\":\"28\",\"province_name\":\"Davao del Norte\",\"municipality_list\":\"Asuncion|Braulio E. Dujali|Carmen|Kapalong|New Corella|Panabo City|Samal City|San Isidro|Santo Tomas|Tagum City|Talaingod\"},{\"province_id\":\"29\",\"province_name\":\"Davao del Sur\",\"municipality_list\":\"Bansalan|Davao City|Digos City|Don Marcelino|Hagonoy|Jose Abad Santos|Kiblawan|Magsaysay|Malalag|Malita|Matanao|Padada|Santa Cruz|Santa Maria|Sarangani|Sulop\"},{\"province_id\":\"30\",\"province_name\":\"Davao Oriental\",\"municipality_list\":\"Baganga|Banaybanay|Boston|Caraga|Cateel|Governor Generoso|Lupon|Manay|Mati City|San Isidro|Tarragona\"},{\"province_id\":\"31\",\"province_name\":\"Eastern Samar\",\"municipality_list\":\"Arteche|Balangiga|Balangkayan|Borongan City|Can-avid|Dolores|General MacArthur|Giporlos|Guiuan|Hernani|Jipapad|Lawaan|Llorente|Maslog|Maydolong|Mercedes|Oras|Quinapondan|Salcedo|San Julian|San Policarpo|Sulat|Taft\"},{\"province_id\":\"32\",\"province_name\":\"Guimaras\",\"municipality_list\":\"Buenavista|Jordan|Nueva Valencia|San Lorenzo|Sibunag\"},{\"province_id\":\"33\",\"province_name\":\"Ifugao\",\"municipality_list\":\"Aguinaldo|Alfonso Lista|Asipulo|Banaue|Hingyon|Hungduan|Kiangan|Lagawe|Lamut|Mayoyao|Tinoc\"},{\"province_id\":\"34\",\"province_name\":\"Ilocos Norte\",\"municipality_list\":\"Adams|Bacarra|Badoc|Bangui|Banna|Batac City|Burgos|Carasi|Currimao|Dingras|Dumalneg|Laoag City|Marcos|Nueva Era|Pagudpud|Paoay|Pasuquin|Piddig|Pinili|San Nicolas|Sarrat|Solsona|Vintar\"},{\"province_id\":\"35\",\"province_name\":\"Ilocos Sur\",\"municipality_list\":\"Alilem|Banayoyo|Bantay|Burgos|Cabugao|Candon City|Caoayan|Cervantes|Galimuyod|Gregorio Del Pilar|Lidlidda|Magsingal|Nagbukel|Narvacan|Quirino|Salcedo|San Emilio|San Esteban|San Ildefonso|San Juan|San Vicente|Santa|Santa Catalina|Santa Cruz|Santa Lucia|Santa Maria|Santiago|Santo Domingo|Sigay|Sinait|Sugpon|Suyo|Tagudin|Vigan City\"},{\"province_id\":\"36\",\"province_name\":\"Iloilo\",\"municipality_list\":\"Ajuy|Alimodian|Anilao|Badiangan|Balasan|Banate|Barotac Nuevo|Barotac Viejo|Batad|Bingawan|Cabatuan|Calinog|Carles|Concepcion|Dingle|Due\\u00f1as|Dumangas|Estancia|Guimbal|Igbaras|Iloilo City|Janiuay|Lambunao|Leganes|Lemery|Leon|Maasin|Miagao|Mina|New Lucena|Oton|Passi City|Pavia|Pototan|San Dionisio|San Enrique|San Joaquin|San Miguel|San Rafael|Santa Barbara|Sara|Tigbauan|Tubungan|Zarraga\"},{\"province_id\":\"37\",\"province_name\":\"Isabela\",\"municipality_list\":\"Alicia|Angadanan|Aurora|Benito Soliven|Burgos|Cabagan|Cabatuan|Cauayan City|Cordon|Delfin Albano|Dinapigue|Divilacan|Echague|Gamu|Ilagan|Jones|Luna|Maconacon|Mallig|Naguilian|Palanan|Quezon|Quirino|Ramon|Reina Mercedes|Roxas|San Agustin|San Guillermo|San Isidro|San Manuel|San Mariano|San Mateo|San Pablo|Santiago City|Santa Maria|Santo Tomas|Tumauini\"},{\"province_id\":\"38\",\"province_name\":\"Kalinga\",\"municipality_list\":\"Balbalan|Lubuagan|Pasil|Pinukpuk|Rizal|Tabuk|Tanudan|Tinglayan\"},{\"province_id\":\"39\",\"province_name\":\"La Union\",\"municipality_list\":\"Agoo|Aringay|Bacnotan|Bagulin|Balaoan|Bangar|Bauang|Burgos|Caba|Luna|Naguilian|Pugo|Rosario|San Fernando City|San Gabriel|San Juan|Santo Tomas|Santol|Sudipen|Tubao\"},{\"province_id\":\"40\",\"province_name\":\"Laguna\",\"municipality_list\":\"Alaminos|Bay|Bi\\u00f1an City|Cabuyao|Calamba City|Calauan|Cavinti|Famy|Kalayaan|Liliw|Los Ba\\u00f1os|Luisiana|Lumban|Mabitac|Magdalena|Majayjay|Nagcarlan|Paete|Pagsanjan|Pakil|Pangil|Pila|Rizal|San Pablo City|San Pedro|Santa Cruz|Santa Maria|Santa Rosa City|Siniloan|Victoria\"},{\"province_id\":\"41\",\"province_name\":\"Lanao del Norte\",\"municipality_list\":\"Bacolod|Baloi|Baroy|Kapatagan|Kauswagan|Kolambugan|Iligan City|Lala|Linamon|Magsaysay|Maigo|Matungao|Munai|Nunungan|Pantao Ragat|Pantar|Poona Piagapo|Salvador|Sapad|Sultan Naga Dimaporo|Tagoloan|Tangcal|Tubod\"},{\"province_id\":\"42\",\"province_name\":\"Lanao del Sur\",\"municipality_list\":\"Bacolod-Kalawi|Balabagan|Balindong|Bayang|Binidayan|Buadiposo-Buntong|Bubong|Bumbaran|Butig|Calanogas|Ditsaan-Ramain|Ganassi|Kapai|Kapatagan|Lumba-Bayabao|Lumbaca-Unayan|Lumbatan|Lumbayanague|Madalum|Madamba|Maguing|Malabang|Marantao|Marawi City|Marogong|Masiu|Mulondo|Pagayawan|Piagapo|Poona Bayabao|Pualas|Saguiaran|Sultan Dumalondong|Picong|Tagoloan II|Tamparan|Taraka|Tubaran|Tugaya|Wao\"},{\"province_id\":\"43\",\"province_name\":\"Leyte\",\"municipality_list\":\"Abuyog|Alangalang|Albuera|Babatngon|Barugo|Bato|Baybay City|Burauen|Calubian|Capoocan|Carigara|Dagami|Dulag|Hilongos|Hindang|Inopacan|Isabel|Jaro|Javier|Julita|Kananga|La Paz|Leyte|Liloan|MacArthur|Mahaplag|Matag-ob|Matalom|Mayorga|Merida|Ormoc City|Palo|Palompon|Pastrana|San Isidro|San Miguel|Santa Fe|Sogod|Tacloban City|Tabango|Tabontabon|Tanauan|Tolosa|Tunga|Villaba\"},{\"province_id\":\"44\",\"province_name\":\"Maguindanao\",\"municipality_list\":\"Ampatuan|Barira|Buldon|Buluan|Cotabato City|Datu Abdullah Sangki|Datu Anggal Midtimbang|Datu Blah T. Sinsuat|Datu Hoffer Ampatuan|Datu Montawal|Datu Odin Sinsuat|Datu Paglas|Datu Piang|Datu Salibo|Datu Saudi-Ampatuan|Datu Unsay|General Salipada K. Pendatun|Guindulungan|Kabuntalan|Mamasapano|Mangudadatu|Matanog|Northern Kabuntalan|Pagalungan|Paglat|Pandag|Parang|Rajah Buayan|Shariff Aguak|Shariff Saydona Mustapha|South Upi|Sultan Kudarat|Sultan Mastura|Sultan sa Barongis|Talayan|Talitay|Upi\"},{\"province_id\":\"45\",\"province_name\":\"Marinduque\",\"municipality_list\":\"Boac|Buenavista|Gasan|Mogpog|Santa Cruz|Torrijos\"},{\"province_id\":\"46\",\"province_name\":\"Masbate\",\"municipality_list\":\"Aroroy|Baleno|Balud|Batuan|Cataingan|Cawayan|Claveria|Dimasalang|Esperanza|Mandaon|Masbate City|Milagros|Mobo|Monreal|Palanas|Pio V. Corpuz|Placer|San Fernando|San Jacinto|San Pascual|Uson\"},{\"province_id\":\"47\",\"province_name\":\"Metro Manila\",\"municipality_list\":\"Caloocan|Las Pi\\u00f1as|Makati|Malabon|Mandaluyong|Manila|Marikina|Muntinlupa|Navotas|Para\\u00f1aque|Pasay|Pasig|Pateros|Quezon City|San Juan City|Taguig|Valenzuela City\"},{\"province_id\":\"48\",\"province_name\":\"Misamis Occidental\",\"municipality_list\":\"Aloran|Baliangao|Bonifacio|Calamba|Clarin|Concepcion|Don Victoriano Chiongbian|Jimenez|Lopez Jaena|Oroquieta City|Ozamiz City|Panaon|Plaridel|Sapang Dalaga|Sinacaban|Tangub City|Tudela\"},{\"province_id\":\"49\",\"province_name\":\"Misamis Oriental\",\"municipality_list\":\"Alubijid|Balingasag|Balingoan|Binuangan|Cagayan de Oro|Claveria|El Salvador|Gingoog City|Gitagum|Initao|Jasaan|Kinoguitan|Lagonglong|Laguindingan|Libertad|Lugait|Magsaysay|Manticao|Medina|Naawan|Opol|Salay|Sugbongcogon|Tagoloan|Talisayan|Villanueva\"},{\"province_id\":\"50\",\"province_name\":\"Mountain Province\",\"municipality_list\":\"Barlig|Bauko|Besao|Bontoc|Natonin|Paracelis|Sabangan|Sadanga|Sagada|Tadian\"},{\"province_id\":\"51\",\"province_name\":\"Negros Occidental\",\"municipality_list\":\"Bacolod City|Bago City|Binalbagan|Cadiz City|Calatrava|Candoni|Cauayan|Enrique B. Magalona|Escalante City|Himamaylan City|Hinigaran|Hinoba-an|Ilog|Isabela|Kabankalan City|La Carlota City|La Castellana|Manapla|Moises Padilla|Murcia|Pontevedra|Pulupandan|Sagay City|Salvador Benedicto|San Carlos City|San Enrique|Silay City|Sipalay City|Talisay City|Toboso|Valladolid|Victorias City\"},{\"province_id\":\"52\",\"province_name\":\"Negros Oriental\",\"municipality_list\":\"Amlan|Ayungon|Bacong|Bais City|Basay|Bayawan City|Bindoy|Canlaon City|Dauin|Dumaguete City|Guihulngan City|Jimalalud|La Libertad|Mabinay|Manjuyod|Pamplona|San Jose|Santa Catalina|Siaton|Sibulan|Tanjay City|Tayasan|Valencia|Vallehermoso|Zamboanguita\"},{\"province_id\":\"53\",\"province_name\":\"Northern Samar\",\"municipality_list\":\"Allen|Biri|Bobon|Capul|Catarman|Catubig|Gamay|Laoang|Lapinig|Las Navas|Lavezares|Lope de Vega|Mapanas|Mondragon|Palapag|Pambujan|Rosario|San Antonio|San Isidro|San Jose|San Roque|San Vicente|Silvino Lobos|Victoria\"},{\"province_id\":\"54\",\"province_name\":\"Nueva Ecija\",\"municipality_list\":\"Aliaga|Bongabon|Cabanatuan City|Cabiao|Carranglan|Cuyapo|Gabaldon|Gapan City|General Mamerto Natividad|General Tinio|Guimba|Jaen|Laur|Licab|Llanera|Lupao|Nampicuan|Palayan City|Pantabangan|Pe\\u00f1aranda|Quezon|Rizal|San Antonio|San Isidro|San Jose City|San Leonardo|Santa Rosa|Santo Domingo|Science City of Mu\\u00f1oz|Talavera|Talugtug|Zaragoza\"},{\"province_id\":\"55\",\"province_name\":\"Nueva Vizcaya\",\"municipality_list\":\"Alfonso Castaneda|Ambaguio|Aritao|Bagabag|Bambang|Bayombong|Diadi|Dupax del Norte|Dupax del Sur|Kasibu|Kayapa|Quezon|Santa Fe|Solano|Villaverde\"},{\"province_id\":\"56\",\"province_name\":\"Occidental Mindoro\",\"municipality_list\":\"Abra de Ilog|Calintaan|Looc|Lubang|Magsaysay|Mamburao|Paluan|Rizal|Sablayan|San Jose|Santa Cruz\"},{\"province_id\":\"57\",\"province_name\":\"Oriental Mindoro\",\"municipality_list\":\"Baco|Bansud|Bongabong|Bulalacao|Calapan City|Gloria|Mansalay|Naujan|Pinamalayan|Pola|Puerto Galera|Roxas|San Teodoro|Socorro|Victoria\"},{\"province_id\":\"58\",\"province_name\":\"Palawan\",\"municipality_list\":\"Aborlan|Agutaya|Araceli|Balabac|Bataraza|Brooke\'s Point|Busuanga|Cagayancillo|Coron|Culion|Cuyo|Dumaran|El Nido|Kalayaan|Linapacan|Magsaysay|Narra|Puerto Princesa City|Quezon|Rizal|Roxas|San Vicente|Sofronio Espa\\u00f1ola|Taytay\"},{\"province_id\":\"59\",\"province_name\":\"Pampanga\",\"municipality_list\":\"Angeles City|Apalit|Arayat|Bacolor|Candaba|Floridablanca|Guagua|Lubao|Mabalacat|Macabebe|Magalang|Masantol|Mexico|Minalin|Porac|San Fernando City|San Luis|San Simon|Santa Ana|Santa Rita|Santo Tomas|Sasmuan\"},{\"province_id\":\"60\",\"province_name\":\"Pangasinan\",\"municipality_list\":\"Agno|Aguilar|Alaminos City|Alcala|Anda|Asingan|Balungao|Bani|Basista|Bautista|Bayambang|Binalonan|Binmaley|Bolinao|Bugallon|Burgos|Calasiao|Dagupan City|Dasol|Infanta|Labrador|Laoac|Lingayen|Mabini|Malasiqui|Manaoag|Mangaldan|Mangatarem|Mapandan|Natividad|Pozzorubio|Rosales|San Carlos City|San Fabian|San Jacinto|San Manuel|San Nicolas|San Quintin|Santa Barbara|Santa Maria|Santo Tomas|Sison|Sual|Tayug|Umingan|Urbiztondo|Urdaneta City|Villasis\"},{\"province_id\":\"61\",\"province_name\":\"Quezon\",\"municipality_list\":\"Agdangan|Alabat|Atimonan|Buenavista|Burdeos|Calauag|Candelaria|Catanauan|Dolores|General Luna|General Nakar|Guinayangan|Gumaca|Infanta|Jomalig|Lopez|Lucban|Lucena City|Macalelon|Mauban|Mulanay|Padre Burgos|Pagbilao|Panukulan|Patnanungan|Perez|Pitogo|Plaridel|Polillo|Quezon|Real|Sampaloc|San Andres|San Antonio|San Francisco|San Narciso|Sariaya|Tagkawayan|Tayabas City|Tiaong|Unisan\"},{\"province_id\":\"62\",\"province_name\":\"Quirino\",\"municipality_list\":\"Aglipay|Cabarroguis|Diffun|Maddela|Nagtipunan|Saguday\"},{\"province_id\":\"63\",\"province_name\":\"Rizal\",\"municipality_list\":\"Angono|Antipolo City|Baras|Binangonan|Cainta|Cardona|Jalajala|Morong|Pililla|Rodriguez|San Mateo|Tanay|Taytay|Teresa\"},{\"province_id\":\"64\",\"province_name\":\"Romblon\",\"municipality_list\":\"Alcantara|Banton|Cajidiocan|Calatrava|Concepcion|Corcuera|Ferrol|Looc|Magdiwang|Odiongan|Romblon|San Agustin|San Andres|San Fernando|San Jose|Santa Fe|Santa Maria\"},{\"province_id\":\"65\",\"province_name\":\"Samar\",\"municipality_list\":\"Almagro|Basey|Calbayog City|Calbiga|Catbalogan City|Daram|Gandara|Hinabangan|Jiabong|Marabut|Matuguinao|Motiong|Pagsanghan|Paranas|Pinabacdao|San Jorge|San Jose De Buan|San Sebastian|Santa Margarita|Santa Rita|Santo Ni\\u00f1o|Tagapul-an|Talalora|Tarangnan|Villareal|Zumarraga\"},{\"province_id\":\"66\",\"province_name\":\"Sarangani\",\"municipality_list\":\"Alabel|Glan|Kiamba|Maasim|Maitum|Malapatan|Malungon\"},{\"province_id\":\"67\",\"province_name\":\"Siquijor\",\"municipality_list\":\"Enrique Villanueva|Larena|Lazi|Maria|San Juan|Siquijor\"},{\"province_id\":\"68\",\"province_name\":\"Sorsogon\",\"municipality_list\":\"Barcelona|Bulan|Bulusan|Casiguran|Castilla|Donsol|Gubat|Irosin|Juban|Magallanes|Matnog|Pilar|Prieto Diaz|Santa Magdalena|Sorsogon City\"},{\"province_id\":\"69\",\"province_name\":\"South Cotabato\",\"municipality_list\":\"Banga|General Santos City|Koronadal City|Lake Sebu|Norala|Polomolok|Santo Ni\\u00f1o|Surallah|T\'boli|Tampakan|Tantangan|Tupi\"},{\"province_id\":\"70\",\"province_name\":\"Southern Leyte\",\"municipality_list\":\"Anahawan|Bontoc|Hinunangan|Hinundayan|Libagon|Liloan|Limasawa|Maasin City|Macrohon|Malitbog|Padre Burgos|Pintuyan|Saint Bernard|San Francisco|San Juan|San Ricardo|Silago|Sogod|Tomas Oppus\"},{\"province_id\":\"71\",\"province_name\":\"Sultan Kudarat\",\"municipality_list\":\"Bagumbayan|Columbio|Esperanza|Isulan|Kalamansig|Lambayong|Lebak|Lutayan|Palimbang|President Quirino|Senator Ninoy Aquino|Tacurong City\"},{\"province_id\":\"72\",\"province_name\":\"Sulu\",\"municipality_list\":\"Banguingui|Hadji Panglima Tahil|Indanan|Jolo|Kalingalan Caluang|Lugus|Luuk|Maimbung|Old Panamao|Omar|Pandami|Panglima Estino|Pangutaran|Parang|Pata|Patikul|Siasi|Talipao|Tapul\"},{\"province_id\":\"73\",\"province_name\":\"Surigao del Norte\",\"municipality_list\":\"Alegria|Bacuag|Basilisa|Burgos|Cagdianao|Claver|Dapa|Del Carmen|Dinagat|General Luna|Gigaquit|Libjo|Loreto|Mainit|Malimono|Pilar|Placer|San Benito|San Francisco|San Isidro|San Jose|Santa Monica|Sison|Socorro|Surigao City|Tagana-an|Tubajon|Tubod\"},{\"province_id\":\"74\",\"province_name\":\"Surigao del Sur\",\"municipality_list\":\"Barobo|Bayabas|Bislig City|Cagwait|Cantilan|Carmen|Carrascal|Cortes|Hinatuan|Lanuza|Lianga|Lingig|Madrid|Marihatag|San Agustin|San Miguel|Tagbina|Tago|Tandag City\"},{\"province_id\":\"75\",\"province_name\":\"Tarlac\",\"municipality_list\":\"Anao|Bamban|Camiling|Capas|Concepcion|Gerona|La Paz|Mayantoc|Moncada|Paniqui|Pura|Ramos|San Clemente|San Jose|San Manuel|Santa Ignacia|Tarlac City|Victoria\"},{\"province_id\":\"76\",\"province_name\":\"Tawi-Tawi\",\"municipality_list\":\"Bongao|Languyan|Mapun|Panglima Sugala|Sapa-Sapa|Sibutu|Simunul|Sitangkai|South Ubian|Tandubas|Turtle Islands\"},{\"province_id\":\"77\",\"province_name\":\"Zambales\",\"municipality_list\":\"Botolan|Cabangan|Candelaria|Castillejos|Iba|Masinloc|Olongapo City|Palauig|San Antonio|San Felipe|San Marcelino|San Narciso|Santa Cruz|Subic\"},{\"province_id\":\"78\",\"province_name\":\"Zamboanga del Norte\",\"municipality_list\":\"Bacungan|Baliguian|Dapitan City|Dipolog City|Godod|Gutalac|Jose Dalman|Kalawit|Katipunan|La Libertad|Labason|Liloy|Manukan|Mutia|Pi\\u00f1an|Polanco|President Manuel A. Roxas|Rizal|Salug|Sergio Osme\\u00f1a Sr.|Siayan|Sibuco|Sibutad|Sindangan|Siocon|Sirawai|Tampilisan\"},{\"province_id\":\"79\",\"province_name\":\"Zamboanga del Sur\",\"municipality_list\":\"Aurora|Bayog|Dimataling|Dinas|Dumalinao|Dumingag|Guipos|Josefina|Kumalarang|Labangan|Lakewood|Lapuyan|Mahayag|Margosatubig|Midsalip|Molave|Pagadian City|Pitogo|Ramon Magsaysay|San Miguel|San Pablo|Sominot|Tabina|Tambulig|Tigbao|Tukuran|Vincenzo A. Sagun|Zamboanga City\"},{\"province_id\":\"80\",\"province_name\":\"Zamboanga Sibugay\",\"municipality_list\":\"Alicia|Buug|Diplahan|Imelda|Ipil|Kabasalan|Mabuhay|Malangas|Naga|Olutanga|Payao|Roseller Lim|Siay|Talusan|Titay|Tungawan\"}]','','system',0,'2012-10-03 22:02:41'),
	('referral_bonus','300','','network',0,'2012-10-03 22:10:02'),
	('rs_commission','10','','network',0,'2012-10-05 09:43:45'),
	('rs_no_of_uplines_with_commission','10','','network',0,'2012-10-05 09:43:45'),
	('rs_pairing_bonus','1000','','network',0,'2012-10-03 22:10:02'),
	('rs_points','25','','network',0,'2012-10-05 09:43:45'),
	('rs_points_to_pair','700','','network',0,'2012-10-05 09:43:45'),
	('service_depot','[{\"code\":\"ORT\", \"name\":\"Ortigas\"},{\"code\":\"CEB\", \"name\":\"Cebu\"},{\"code\":\"DAV\", \"name\":\"Davao\"}]','','system',0,'2012-10-03 22:02:41'),
	('sp_pairing_bonus','1000','','network',0,'2012-10-03 22:10:02'),
	('sp_points','700','','network',0,'2012-10-05 09:43:45'),
	('sp_points_to_pair','700','','network',0,'2012-10-05 09:43:45'),
	('stockist_min_amount','10000','','webpoi',0,'2012-10-05 09:43:45'),
	('tp_points','350','','network',0,'2012-10-05 09:43:45'),
	('tp_points_to_pair','350','','network',0,'2012-10-05 09:43:45'),
	('vat_percent','12','','webpoi',0,'2012-10-05 09:43:45'),
	('vp_pairing_bonus','2000','','network',0,'2012-10-03 22:10:02'),
	('vp_points','700','','network',0,'2012-10-05 09:43:45'),
	('vp_points_to_pair','1400','','network',0,'2012-10-05 09:43:45'),
	('webpoi_payment_methods','{\"cash\":\"Cash\",\"card\":\"Credit Card\", \"cheque\":\"Cheque\",\"giftcheque\":\"Gift Cheque\",\"funds\":\"Funds\",\"onlinegiftcheque\":\"Online G.C.\"}','','webpoi',0,'2012-10-05 09:43:45'),
	('witholding_tax','0.10','','network',0,'2012-11-05 12:29:45');

/*!40000 ALTER TABLE `rf_settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table rf_shipping_methods
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rf_shipping_methods`;

CREATE TABLE `rf_shipping_methods` (
  `shipping_method_id` int(11) NOT NULL AUTO_INCREMENT,
  `shipping_method` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_method_description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`shipping_method_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `rf_shipping_methods` WRITE;
/*!40000 ALTER TABLE `rf_shipping_methods` DISABLE KEYS */;

INSERT INTO `rf_shipping_methods` (`shipping_method_id`, `shipping_method`, `shipping_method_description`)
VALUES
	(1,'LBC','Hari ng Padala'),
	(2,'Air21','Sagot Ko, Padala Mo'),
	(3,'UPS',''),
	(4,'2GO','');

/*!40000 ALTER TABLE `rf_shipping_methods` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table rf_status_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rf_status_types`;

CREATE TABLE `rf_status_types` (
  `status_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `status_type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`status_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `rf_status_types` WRITE;
/*!40000 ALTER TABLE `rf_status_types` DISABLE KEYS */;

INSERT INTO `rf_status_types` (`status_type_id`, `status_type`)
VALUES
	(1,'DEFAULT'),
	(2,'SUCCESS'),
	(3,'WARNING'),
	(4,'IMPORTANT'),
	(5,'INFO');

/*!40000 ALTER TABLE `rf_status_types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table rf_stocks_receiving_statuses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rf_stocks_receiving_statuses`;

CREATE TABLE `rf_stocks_receiving_statuses` (
  `stocks_receiving_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `stocks_receiving_status` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stocks_receiving_status_description` text COLLATE utf8_unicode_ci,
  `status_type_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`stocks_receiving_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `rf_stocks_receiving_statuses` WRITE;
/*!40000 ALTER TABLE `rf_stocks_receiving_statuses` DISABLE KEYS */;

INSERT INTO `rf_stocks_receiving_statuses` (`stocks_receiving_status_id`, `stocks_receiving_status`, `stocks_receiving_status_description`, `status_type_id`)
VALUES
	(1,'DRAFT','stocks receiving form has been made, but items have not yet been received',1),
	(2,'COMPLETED','facility has accepted the items',2);

/*!40000 ALTER TABLE `rf_stocks_receiving_statuses` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table rf_stocks_transfer_statuses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rf_stocks_transfer_statuses`;

CREATE TABLE `rf_stocks_transfer_statuses` (
  `stocks_transfer_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `stocks_transfer_status` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stocks_transfer_status_description` text COLLATE utf8_unicode_ci,
  `status_type_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`stocks_transfer_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `rf_stocks_transfer_statuses` WRITE;
/*!40000 ALTER TABLE `rf_stocks_transfer_statuses` DISABLE KEYS */;

INSERT INTO `rf_stocks_transfer_statuses` (`stocks_transfer_status_id`, `stocks_transfer_status`, `stocks_transfer_status_description`, `status_type_id`)
VALUES
	(1,'DRAFT','stocks transfer has been made but not yet published',1),
	(2,'FOR APPROVAL','stocks transfer has been published, now awaiting approval',3),
	(3,'APPROVED','stocks transfer has been given approval',2),
	(4,'RELEASED','items are in transit to destination',2),
	(5,'COMPLETED','items have been received by the recipient',2),
	(6,'REJECTED','at least one of the actions for the for was rejected',4);

/*!40000 ALTER TABLE `rf_stocks_transfer_statuses` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table rf_is_transaction_codes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rf_is_transaction_codes`;

CREATE TABLE `rf_is_transaction_codes` (
  `transaction_code` int(11) NOT NULL DEFAULT '0',
  `transaction_description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`transaction_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `rf_is_transaction_codes` WRITE;
/*!40000 ALTER TABLE `rf_is_transaction_codes` DISABLE KEYS */;

INSERT INTO `rf_is_transaction_codes` (`transaction_code`, `transaction_description`)
VALUES
	(100,'Admin Update'),
	(101,'Stocks Received'),
	(102,'Build Item'),
	(103,'Break Items'),
	(200,'Admin Update'),
	(201,'Stocks Released: Transfer'),
	(202,'Stocks Released: Requisition'),
	(203,'POS Order'),
	(204,'Items Issued'),
	(205,'Build Items'),
	(206,'Break Item'),
	(207,'Release from Toll');

/*!40000 ALTER TABLE `rf_is_transaction_codes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table rf_workflow_action_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rf_workflow_action_types`;

CREATE TABLE `rf_workflow_action_types` (
  `workflow_action_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `workflow_action_type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `workflow_action_type_description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`workflow_action_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `rf_workflow_action_types` WRITE;
/*!40000 ALTER TABLE `rf_workflow_action_types` DISABLE KEYS */;

INSERT INTO `rf_workflow_action_types` (`workflow_action_type_id`, `workflow_action_type`, `workflow_action_type_description`)
VALUES
	(1,'Request','person who requested the work order'),
	(3,'Check','person who checks the work order for stocks'),
	(4,'Approve','final approval of work order');

/*!40000 ALTER TABLE `rf_workflow_action_types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table rf_workflow_statuses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rf_workflow_statuses`;

CREATE TABLE `rf_workflow_statuses` (
  `workflow_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `workflow_status` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `workflow_status_description` text COLLATE utf8_unicode_ci,
  `status_type_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`workflow_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `rf_workflow_statuses` WRITE;
/*!40000 ALTER TABLE `rf_workflow_statuses` DISABLE KEYS */;

INSERT INTO `rf_workflow_statuses` (`workflow_status_id`, `workflow_status`, `workflow_status_description`, `status_type_id`)
VALUES
	(1,'FOR APPROVAL','actions is awaiting approval from user',1),
	(2,'APPROVED','user has approved the action',1),
	(3,'REJECTED','user rejected the action',1);

/*!40000 ALTER TABLE `rf_workflow_statuses` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table rt_facility_item_reports
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rt_facility_item_reports`;

CREATE TABLE `rt_facility_item_reports` (
  `facility_item_report_id` int(11) NOT NULL AUTO_INCREMENT,
  `facility_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `qty_released` int(11) NOT NULL,
  `qty_received` int(11) NOT NULL,
  `total_amount` int(11) NOT NULL,
  `insert_date` date NOT NULL,
  PRIMARY KEY (`facility_item_report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table rt_facility_item_reports_view
# ------------------------------------------------------------

DROP VIEW IF EXISTS `rt_facility_item_reports_view`;

CREATE TABLE `rt_facility_item_reports_view` (
   `item_name` VARCHAR(100) DEFAULT NULL,
   `item_type_id` INT(10) UNSIGNED NOT NULL DEFAULT '0',
   `item_sub_type_id` INT(11) NOT NULL DEFAULT '0',
   `facility_item_report_id` INT(11) NOT NULL DEFAULT '0',
   `item_id` INT(11) NOT NULL,
   `facility_id` INT(11) NOT NULL,
   `qty_released` INT(11) NOT NULL,
   `qty_received` INT(11) NOT NULL,
   `insert_date` DATE NOT NULL,
   `item_type` VARCHAR(100) DEFAULT NULL,
   `item_sub_type` VARCHAR(100) DEFAULT NULL,
   `qty` INT(11) DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table rt_facility_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rt_facility_items`;

CREATE TABLE `rt_facility_items` (
  `facility_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `insert_date` date NOT NULL,
  KEY `insert_date` (`insert_date`),
  KEY `facility_id` (`facility_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table rt_facility_items_releasing
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rt_facility_items_releasing`;

CREATE TABLE `rt_facility_items_releasing` (
  `facility_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `qty` decimal(11,2) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `insert_date` date DEFAULT NULL,
  KEY `insert_date` (`insert_date`),
  KEY `facility_id` (`facility_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table rt_member_orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rt_member_orders`;

CREATE TABLE `rt_member_orders` (
  `facility_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `package_quantity` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `quantity` int(10) DEFAULT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  `insert_date` date DEFAULT NULL,
  KEY `insert_date` (`insert_date`),
  KEY `facility_id` (`facility_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table sm_advertisements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sm_advertisements`;

CREATE TABLE `sm_advertisements` (
  `advertisement_id` int(11) NOT NULL AUTO_INCREMENT,
  `advertisement_title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `advertisement_description` text COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_filename` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hits` int(11) DEFAULT '0',
  `is_active` tinyint(4) NOT NULL DEFAULT '0',
  `with_active_period` tinyint(4) NOT NULL DEFAULT '0',
  `active_from` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `active_until` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int(20) NOT NULL DEFAULT '0',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`advertisement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table sm_contents
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sm_contents`;

CREATE TABLE `sm_contents` (
  `content_id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_content_id` int(20) NOT NULL DEFAULT '0',
  `user_id` int(20) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `thumb` text COLLATE utf8_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8_unicode_ci,
  `is_active` tinyint(2) NOT NULL DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content_type` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `updated_timestamp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table sm_faqs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sm_faqs`;

CREATE TABLE `sm_faqs` (
  `faqs_id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `is_published` tinyint(4) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`faqs_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sm_faqs` WRITE;
/*!40000 ALTER TABLE `sm_faqs` DISABLE KEYS */;

INSERT INTO `sm_faqs` (`faqs_id`, `question`, `body`, `is_published`, `ordering`, `user_id`, `insert_timestamp`)
VALUES
	(1,'Is Vital C registered in the Philippines?','<p>Vital C is registered with the Bureau of food and Drug, with registration Number DRHR-940. It is classified as a drug and a home remedy. It is classified bt BFAD as an essential drug/remedy (always needed by the body).</p>',1,1,4,'2012-07-17 02:14:48'),
	(2,'Why take Vital C?','<p>Vitamin C deficiency is the most commin and unrecognized cause of all major diseases of man today, as a result of our poor lifestyle. Most of these symptoms are seemingly normal to us that we do not realize we have it. Vital C contains only pure 100% Vitalmin C (as Sodium Ascorbate) which is necessary to prevent and treat conditions resulting from Vitamin C deficiency.</p>',1,2,4,'2012-07-17 02:15:08'),
	(3,'Has any study been done on Vitamin C?','<p><strong></strong>There are many published writings and clinical trials about Vitamin C in the popular medical journals because modern medicine is now aware of its potential in treatment.</p>',1,3,4,'2012-07-17 02:15:42'),
	(4,'Is Vital C free of any contaminants or heavy metals?','<p>Before each batch of Sodium Ascorbate is encapsulated and distributed to the public, the company makes sure it has undergone various tests from the country of origin and within the Philippines itself to make sure that it is safe to consume.</p>',1,4,4,'2012-07-17 02:16:04'),
	(5,'What is the edge of Vital C over the others?','<p>With all the Sodium Ascorbates in the market today, the company guarantees that Vital C is 100% pure Sodium Ascorbate of 568.18mg crystalized powder in the recommended vegetable capsule.</p>',1,5,4,'2012-07-17 02:16:24');

/*!40000 ALTER TABLE `sm_faqs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sm_featured_members
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sm_featured_members`;

CREATE TABLE `sm_featured_members` (
  `member_id` int(20) NOT NULL DEFAULT '0',
  `achievement_id` int(20) NOT NULL DEFAULT '0',
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_id` int(20) NOT NULL DEFAULT '0',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`member_id`,`achievement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sm_featured_members` WRITE;
/*!40000 ALTER TABLE `sm_featured_members` DISABLE KEYS */;

INSERT INTO `sm_featured_members` (`member_id`, `achievement_id`, `title`, `user_id`, `insert_timestamp`)
VALUES
	(256,1,'Grand Masters',4,'2012-07-18 08:10:33'),
	(256,2,'Presidents Club',4,'2012-07-18 08:10:34'),
	(256,3,'Millionaires Club',4,'2012-07-18 08:10:36'),
	(3587,2,'Presidents Club',2,'2012-07-16 03:34:45'),
	(3587,3,'Millionaires Club',2,'2012-07-16 03:34:48');

/*!40000 ALTER TABLE `sm_featured_members` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sm_featured_packages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sm_featured_packages`;

CREATE TABLE `sm_featured_packages` (
  `featured_packages_id` int(20) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `body` text COLLATE utf8_unicode_ci,
  `is_published` tinyint(4) NOT NULL DEFAULT '0',
  `user_id` int(20) NOT NULL DEFAULT '0',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`featured_packages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table sm_featured_products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sm_featured_products`;

CREATE TABLE `sm_featured_products` (
  `product_id` int(20) NOT NULL DEFAULT '0',
  `feature_type_id` int(20) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_id` int(20) NOT NULL DEFAULT '0',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_id`,`feature_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sm_featured_products` WRITE;
/*!40000 ALTER TABLE `sm_featured_products` DISABLE KEYS */;

INSERT INTO `sm_featured_products` (`product_id`, `feature_type_id`, `title`, `user_id`, `order_id`, `insert_timestamp`) VALUES
(48, 1, 'Featured', 35, 7, '2012-11-02 16:42:38'),
(49, 1, 'Featured', 35, 13, '2012-11-02 16:42:15'),
(58, 1, 'Featured', 35, 6, '2012-11-02 16:42:00'),
(63, 1, 'Featured', 35, 5, '2012-11-02 16:42:20'),
(74, 1, 'Featured', 35, 8, '2012-11-02 16:39:49'),
(85, 1, 'Featured', 35, 9, '2012-11-02 16:40:13'),
(89, 1, 'Featured', 35, 4, '2012-11-02 16:41:56'),
(91, 1, 'Featured', 35, 10, '2012-11-02 16:42:10'),
(94, 1, 'Featured', 35, 11, '2012-11-02 16:40:49'),
(96, 1, 'Featured', 35, 12, '2012-11-02 16:41:29'),
(97, 1, 'Featured', 35, 3, '2012-11-02 16:41:40'),
(98, 1, 'Featured', 35, 2, '2012-11-02 16:41:44'),
(99, 1, 'Featured', 35, 1, '2012-11-02 16:41:47');

/*!40000 ALTER TABLE `sm_featured_products` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sm_featured_promos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sm_featured_promos`;

CREATE TABLE `sm_featured_promos` (
  `promo_id` int(11) NOT NULL AUTO_INCREMENT,
  `promo_title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `promo_description` text COLLATE utf8_unicode_ci NOT NULL,
  `promo_text` text COLLATE utf8_unicode_ci,
  `image_filename` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` text COLLATE utf8_unicode_ci,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(4) NOT NULL DEFAULT '0',
  `with_active_period` tinyint(4) NOT NULL DEFAULT '0',
  `active_start` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `active_end` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`promo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sm_featured_promos` WRITE;
/*!40000 ALTER TABLE `sm_featured_promos` DISABLE KEYS */;

INSERT INTO `sm_featured_promos` (`promo_id`, `promo_title`, `promo_description`, `promo_text`, `image_filename`, `url`, `ordering`, `user_id`, `is_active`, `with_active_period`, `active_start`, `active_end`, `insert_timestamp`)
VALUES
	(3,'Boracay Getaway 2012','<p style=\"text-align: left;\"><strong>Contest period: MAY 1 &ndash; AUGUST 31, 2012</strong><br /> <strong> Travel Period: SEPTEMBER 2012</strong><br /> <strong> Travel destination: Crown Regency Hotel, Boracay Island</strong></p>\n<p style=\"text-align: left;\"><strong><span style=\"text-decoration: underline;\">PROMO MECHANICS</span></strong></p>\n<p style=\"text-align: left;\"><em><strong>FIRST 25 QUALIFIERS</strong></em></p>\n<p>&bull; Create a new empire by either having EIGHT (8) DIRECT REFERRALS as your first generation thru the purchase of the Starter Packs OR SIXTEEN (16) recruits to avail of TRIAL PACKS.<br /> &bull; 2nd generation are given two options to multiply, either by having at least ten (10) NEW referrals availing of the Starter Pack or Twenty (20) referrals using the Trial Packs.<br /> &bull; 3rd generation of either of Twelve (12) Starter Pack or Twenty-four (24) Trial Pack.</p>\n<p><em>&nbsp;<span style=\"text-decoration: underline; text-align: center;\">Guidelines to Qualify</span></em></p>\n<p>&bull; 1st Generation and Starter Pack registrations should be all NEW recruits. Those who avail of Trial Pack may come from old or new lines of the<br /> qualifying distributor and upgrade prior the end of the promo period.</p>\n<p>&bull; Multiple slots and similar account names will be considered as one (1) entry.</p>\n<p>&bull; All distributors are to remain active thru 3 repeat sales card of your choice of product all throughout the duration.</p>\n<p>&bull; Combination of Starter and Trial Packs may apply as long as One Starter Pack = Two Trial packs</p>\n<p>&nbsp;</p>\n<p><em>*** Management has the right to disqualify those who are found to have applied means not in accordance to the objectives of the promo.</em></p>','Boracay Getaway 2012\nContest period: MAY 1 – AUGUST 31, 2012 Travel Period: SEPTEMBER 2012 Travel destination: Crown Regency Hotel, Boracay Island','promo_3.jpg','boracay-getaway-2012',1,4,1,1,'2012-05-01 04:00:00','2012-08-31 04:00:00','2012-07-25 07:31:15'),
	(4,'Boracay Getaway 2012','<p style=\"text-align: left;\"><strong>Contest period: MAY 1 &ndash; AUGUST 31, 2012</strong><br /> <strong> Travel Period: SEPTEMBER 2012</strong><br /> <strong> Travel destination: Crown Regency Hotel, Boracay Island</strong></p>\n<p style=\"text-align: left;\"><strong><span style=\"text-decoration: underline;\">PROMO MECHANICS</span></strong></p>\n<p style=\"text-align: left;\"><em><strong>FIRST 25 QUALIFIERS</strong></em></p>\n<p>&bull; Create a new empire by either having EIGHT (8) DIRECT REFERRALS as your first generation thru the purchase of the Starter Packs OR SIXTEEN (16) recruits to avail of TRIAL PACKS.<br /> &bull; 2nd generation are given two options to multiply, either by having at least ten (10) NEW referrals availing of the Starter Pack or Twenty (20) referrals using the Trial Packs.<br /> &bull; 3rd generation of either of Twelve (12) Starter Pack or Twenty-four (24) Trial Pack.</p>\n<p><em>&nbsp;<span style=\"text-decoration: underline; text-align: center;\">Guidelines to Qualify</span></em></p>\n<p>&bull; 1st Generation and Starter Pack registrations should be all NEW recruits. Those who avail of Trial Pack may come from old or new lines of the<br /> qualifying distributor and upgrade prior the end of the promo period.</p>\n<p>&bull; Multiple slots and similar account names will be considered as one (1) entry.</p>\n<p>&bull; All distributors are to remain active thru 3 repeat sales card of your choice of product all throughout the duration.</p>\n<p>&bull; Combination of Starter and Trial Packs may apply as long as One Starter Pack = Two Trial packs</p>\n<p>&nbsp;</p>\n<p><em>*** Management has the right to disqualify those who are found to have applied means not in accordance to the objectives of the promo.</em></p>','Boracay Getaway 2012 Contest period: MAY 1 – AUGUST 31, 2012 Travel Period: SEPTEMBER 2012 Travel destination: Crown Regency Hotel, Boracay Island','promo_4.jpg','boracay-getaway-2012',2,4,1,1,'2012-05-01 04:00:00','2012-08-31 04:00:00','2012-07-25 08:58:49');

/*!40000 ALTER TABLE `sm_featured_promos` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sm_galleries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sm_galleries`;

CREATE TABLE `sm_galleries` (
  `gallery_id` int(11) NOT NULL AUTO_INCREMENT,
  `gallery_title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gallery_description` text COLLATE utf8_unicode_ci NOT NULL,
  `is_published` tinyint(4) NOT NULL DEFAULT '0',
  `user_id` int(20) NOT NULL DEFAULT '0',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`gallery_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sm_galleries` WRITE;
/*!40000 ALTER TABLE `sm_galleries` DISABLE KEYS */;

INSERT INTO `sm_galleries` (`gallery_id`, `gallery_title`, `gallery_description`, `is_published`, `user_id`, `insert_timestamp`)
VALUES
	(2,'Vital C Cebu Sizzle – May 2012','None',1,4,'2012-07-25 01:06:10'),
	(3,'Vital C Entrepreneurship Training &amp; Trial Pack Launching – Ortigas','Vital C Entrepreneurship Training &amp; Trial Pack Launching – Ortigas',1,4,'2012-07-25 03:57:17');

/*!40000 ALTER TABLE `sm_galleries` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sm_gallery_pictures
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sm_gallery_pictures`;

CREATE TABLE `sm_gallery_pictures` (
  `picture_id` int(11) NOT NULL AUTO_INCREMENT,
  `gallery_id` int(11) DEFAULT NULL,
  `user_id` int(20) NOT NULL DEFAULT '0',
  `image_filename` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`picture_id`),
  KEY `gallery_id` (`gallery_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sm_gallery_pictures` WRITE;
/*!40000 ALTER TABLE `sm_gallery_pictures` DISABLE KEYS */;

INSERT INTO `sm_gallery_pictures` (`picture_id`, `gallery_id`, `user_id`, `image_filename`, `insert_timestamp`)
VALUES
	(3,2,0,'3.jpg','2012-07-25 01:11:55'),
	(4,2,0,'1.jpg','2012-07-25 01:11:57'),
	(5,2,0,'282218_10150949847637958_2105572858_n.jpg','2012-07-25 01:11:58'),
	(6,2,0,'2.jpg','2012-07-25 01:12:00'),
	(7,2,0,'4.jpg','2012-07-25 01:12:01'),
	(8,2,0,'5.jpg','2012-07-25 01:12:03'),
	(9,2,0,'7.jpg','2012-07-25 01:12:04'),
	(10,2,0,'599977_10150949849182958_1933775541_n.jpg','2012-07-25 01:12:06'),
	(11,2,0,'8.jpg','2012-07-25 01:12:07'),
	(12,2,0,'13.jpg','2012-07-25 01:12:09'),
	(13,2,0,'10.jpg','2012-07-25 01:12:10'),
	(14,2,0,'11.jpg','2012-07-25 01:12:12'),
	(15,2,0,'522818_10150949848397958_2080149349_n.jpg','2012-07-25 01:15:23'),
	(16,2,0,'16.jpg','2012-07-25 01:15:24'),
	(17,2,0,'14.jpg','2012-07-25 01:15:26'),
	(18,2,0,'536764_10150949853337958_480396619_n.jpg','2012-07-25 01:15:27'),
	(19,2,0,'12.jpg','2012-07-25 01:15:29'),
	(20,2,0,'537729_10150948670542958_1875526841_n.jpg','2012-07-25 01:15:30'),
	(21,2,0,'538764_10150949850732958_1710326272_n.jpg','2012-07-25 01:15:32'),
	(22,2,0,'543706_10150949851052958_419996271_n.jpg','2012-07-25 01:15:33'),
	(23,2,0,'560068_10150949847897958_2059457037_n.jpg','2012-07-25 01:15:35'),
	(24,2,0,'575059_10150948667042958_1657549974_n.jpg','2012-07-25 01:15:36'),
	(25,2,0,'6.jpg','2012-07-25 01:15:38'),
	(26,2,0,'389757_10150949849882958_1141099927_n.jpg','2012-07-25 01:15:40'),
	(27,2,0,'379282_10150948653027958_992551216_n.jpg','2012-07-25 01:15:41'),
	(28,2,0,'306131_10150948677822958_1900735877_n.jpg','2012-07-25 01:15:43'),
	(29,2,0,'217934_10150948672057958_1673585243_n.jpg','2012-07-25 01:15:44'),
	(30,2,0,'197742_10150948660417958_268243008_n.jpg','2012-07-25 01:15:46'),
	(31,2,0,'17.jpg','2012-07-25 01:17:11'),
	(32,2,0,'182846_10150948669097958_290487690_n.jpg','2012-07-25 01:17:12'),
	(33,2,0,'9.jpg','2012-07-25 01:17:14'),
	(45,3,0,'dscn3664.jpg','2012-07-25 04:09:10'),
	(46,3,0,'dscn3665.jpg','2012-07-25 04:09:12'),
	(47,3,0,'dscn3666.jpg','2012-07-25 04:09:13'),
	(48,3,0,'dscn3667.jpg','2012-07-25 04:09:16'),
	(49,3,0,'dscn3668.jpg','2012-07-25 04:09:18'),
	(50,3,0,'dscn3669.jpg','2012-07-25 04:09:20'),
	(51,3,0,'dscn3670.jpg','2012-07-25 04:09:22'),
	(52,3,0,'dscn3671.jpg','2012-07-25 04:09:24'),
	(53,3,0,'dscn3673.jpg','2012-07-25 04:09:26'),
	(54,3,0,'dscn3674.jpg','2012-07-25 04:09:28'),
	(55,3,0,'dscn3675.jpg','2012-07-25 04:24:26'),
	(56,3,0,'dscn3676.jpg','2012-07-25 04:24:28'),
	(57,3,0,'dscn3677.jpg','2012-07-25 04:24:30'),
	(58,3,0,'dscn3678.jpg','2012-07-25 04:24:32'),
	(59,3,0,'dscn3679.jpg','2012-07-25 04:24:34'),
	(60,3,0,'dscn3680.jpg','2012-07-25 04:24:36'),
	(61,3,0,'dscn3681.jpg','2012-07-25 04:24:38'),
	(62,3,0,'dscn3682.jpg','2012-07-25 04:24:40'),
	(63,3,0,'dscn3683.jpg','2012-07-25 04:24:42'),
	(64,3,0,'dscn3684.jpg','2012-07-25 04:24:44'),
	(65,3,0,'dscn3685.jpg','2012-07-25 04:24:46'),
	(66,3,0,'dscn3686.jpg','2012-07-25 04:24:48'),
	(67,3,0,'dscn3687.jpg','2012-07-25 04:24:50'),
	(68,3,0,'dscn3688.jpg','2012-07-25 04:24:52'),
	(69,3,0,'dscn3689.jpg','2012-07-25 04:24:54'),
	(70,3,0,'dscn3690.jpg','2012-07-25 04:24:56'),
	(71,3,0,'dscn3691.jpg','2012-07-25 04:24:58'),
	(72,3,0,'dscn3692.jpg','2012-07-25 04:25:00'),
	(73,3,0,'dscn3693.jpg','2012-07-25 04:25:02'),
	(74,3,0,'dscn3694.jpg','2012-07-25 04:25:05'),
	(75,3,0,'dscn3695.jpg','2012-07-25 04:27:58'),
	(76,3,0,'dscn3696.jpg','2012-07-25 04:28:00'),
	(77,3,0,'dscn3699.jpg','2012-07-25 04:28:02'),
	(78,3,0,'dscn3700.jpg','2012-07-25 04:28:04'),
	(79,3,0,'dscn3702.jpg','2012-07-25 04:28:06'),
	(80,3,0,'dscn3703.jpg','2012-07-25 04:28:08'),
	(81,3,0,'dscn3705.jpg','2012-07-25 04:28:09'),
	(82,3,0,'dscn3706.jpg','2012-07-25 04:28:11'),
	(83,3,0,'dscn3707.jpg','2012-07-25 04:28:13'),
	(84,3,0,'dscn3708.jpg','2012-07-25 04:28:16'),
	(85,3,0,'dscn3709.jpg','2012-07-25 04:28:18'),
	(86,3,0,'dscn3710.jpg','2012-07-25 04:28:20'),
	(87,3,0,'dscn3712.jpg','2012-07-25 04:28:22'),
	(88,3,0,'dscn3713.jpg','2012-07-25 04:28:24'),
	(89,3,0,'dscn3716.jpg','2012-07-25 04:28:26'),
	(90,3,0,'dscn3717.jpg','2012-07-25 04:28:28'),
	(91,3,0,'dscn3718.jpg','2012-07-25 04:28:30'),
	(92,3,0,'dscn3719.jpg','2012-07-25 04:28:32'),
	(93,3,0,'dscn3721.jpg','2012-07-25 04:28:35'),
	(94,3,0,'dscn3722.jpg','2012-07-25 04:28:36'),
	(95,3,0,'dscn3723.jpg','2012-07-25 04:28:39'),
	(96,3,0,'dscn3724.jpg','2012-07-25 04:28:41'),
	(97,3,0,'dscn3725.jpg','2012-07-25 04:28:43'),
	(98,3,0,'dscn3727.jpg','2012-07-25 04:28:46'),
	(99,3,0,'dscn3728.jpg','2012-07-25 04:28:48'),
	(100,3,0,'dscn3729.jpg','2012-07-25 04:28:51'),
	(101,3,0,'dscn3730.jpg','2012-07-25 04:28:54');

/*!40000 ALTER TABLE `sm_gallery_pictures` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sm_image_uploads
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sm_image_uploads`;

CREATE TABLE `sm_image_uploads` (
  `image_id` int(11) NOT NULL AUTO_INCREMENT,
  `image_filename` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table sm_news
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sm_news`;

CREATE TABLE `sm_news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `news_type_id` int(11) NOT NULL DEFAULT '1',
  `title` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sub_title` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `short_body` text COLLATE utf8_unicode_ci,
  `tags` text COLLATE utf8_unicode_ci,
  `is_published` tinyint(4) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `start_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`news_id`),
  KEY `user_id` (`user_id`),
  KEY `update_timestamp` (`update_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sm_news` WRITE;
/*!40000 ALTER TABLE `sm_news` DISABLE KEYS */;

INSERT INTO `sm_news` (`news_id`, `news_type_id`, `title`, `sub_title`, `body`, `short_body`, `tags`, `is_published`, `user_id`, `start_date`, `end_date`, `update_timestamp`, `insert_timestamp`)
VALUES
	(1,1,'Vital R5','Vital R5','<strong><a href=\"http://www.vital-c.com/main/wp-content/uploads/2010/07/vital_r5.jpg\"><img class=\"alignleft size-full wp-image-156\" title=\"vital_r5\" src=\"http://www.vital-c.com/main/wp-content/uploads/2010/07/vital_r5.jpg\" alt=\"\" width=\"220\" height=\"150\" /></a>“Dare to defy aging”</strong>\n\nThe signs of aging may be written on your face but if you look more carefully, the problem goes skin deep. Aside from common complaints like wrinkles, dull complexion and sagging skin, the ravages of time may manifest in other ways. Your hair and nails might become more brittle. Wounds would start to heal slower. Joints and muscles would begin to ache more often. The pain of osteoarthritis, a degenerative joint disease caused by the breakdown and loss of cartilage, would keep you from leading a more active lifestyle. The onset of fatigue would come sooner that suddenly, you’re tired for most of the day. Your energy drops and your confidence follows suit. Eventually, you will be left to wonder where your youthful vibrancy went.\n\nThese telltale signs of aging may appear when the body decreases collagen production. Collagen is a fibrous protein that makes up the support system for several body tissues such as bones, tendons, cartilage, muscles, skin and various organs like kidneys. It provides our body tissues form, strength and flexibility. Collagen is crucial in maintain the external structure of cells. It encourages bone health, strengthens the blood vessels and cartilage, and preserves skin elasticity, thus promoting smooth, tight and supple skin.\n\nCollagen is a naturally occurring bodily component that we produce in abundance when we are young. Hence, youthful skin is wrinkle-free, firm and elastic. But as we get older, our body’s ability to manufacture collagen slows down. And like most things, collagen is subject to wear and tear. It breaks down over time, and as we age, our body’s ability to replace lost or damaged collagen is reduced and more irregularities and complications develop. Studies show that from 25 years old onwards, collagen reduces at a rate of 1.5%, taking into account the effects of diet, lifestyle and pollution which speed the reduction even further.\n\nScientists have been trying to unlock the secrets of aging for years. Among their findings show that replenishing the level of collagen in the body can help delay the aging process. Proper, safe and effective supplementation may compensate for collagen loss, thus promoting a more youthful appearance and renewed vigour.\n\n<strong>Vital R5</strong>\n\nA product of breakthrough research and state-of-the-art Japanese technology, Vital R5 leads the pack in the fight against aging. It contains Amino Acid Fish Collagen, a potent and highly absorbable source of collagen that replenishes collagen stores which diminish with age.\n\nThis “youth elixir” also contains key ingredients that support collagen production, promote healthier joints and cartilage, improve circulation, and reveal radiant younger looking skin.\n\n<strong>Hyaluronic Acid</strong> – A key component of collagen. It has been called a “space filler” or support scaffolding for living cells because it helps hold cells in place. It is essential in healing wounds, hydrating the skin and addressing wrinkles and other dermatological problems. It also acts as a cushion and lubricant in the joints and connective tissues. It helps keep the cushion between bones (cartilage) from wearing away, thus preventing degenerative joint disease.\n\nGlucosamine – Assists in rebuilding and strengthening cartilage, slows the progression of osteoarthritis, and eases pain particularly in weight-bearing joints such as knees, hips, and hands.\n\n<strong>Arginine</strong> – An amino acid that improves blood flow and circulation by changing into nitric oxide, a chemical that causes blood vessels to relax. Early evidence suggests Arginine may help treat vascular complications like chest pains, clogged arteries, coronary artery disease, heart failure, erectile dysfunction and vascular headaches. It is also associated with rapid wound healing and greater collagen synthesis.\n\n<strong>Ascorbic Acid (Vitamin C)</strong> – An antioxidant noted for its cell protection properties. It is integral in collagen formation. Without Vitamin C, the collagen produced is defective and weak which may lead to bleeding gums, skin discoloration and painful joints. Collagen coupled with Vitamin C is essential for healthy skin, tissues, cartilage, bones and teeth.\n<h3><span style=\"color: #ff6600;\">The Power of Vital R5</span></h3>\nREBUILDS damaged skin, hair, nails and joints.\nRESTORES lost collagen, making skin firmer, smoother and lifted.\nRENEWS skin’s dewy youthful appearance and helps reduce wrinkles.\nREJUVENATES tired aching joints and strengthens ligaments.\nREINVIGORATES cell health for more efficient transport of nutrients and better elimination of toxins.\n\nWith a daily dose of Vital R5, beauty and vitality will come to you at any age.\n\nDirections: Take atleast a teaspoon of Vital R5 three times daily with coffee, juices or water. Drink lots of liquids for faster dissolution.\n\n<strong>SIDE EFFECTS:</strong>\nThere are no known side effects from ingesting collagen. In fact, Japan has been using collagen for 25 years as an anti-aging dietary supplement.\n\nHigh doses of glucosamine may cause stomach upset, heartburn, indigestion, gas, bloating, and diarrhea, particularly for those with peptic ulcer. Glucosamine should be taken with food to avoid these effects. People with shellfish allergies must consult their healthcare professional before taking glucosamine because it may contain shellfish product. Glucosamine is not recommended for pregnant and breastfeeding women and diabetics.\n\nHyaluronic Acid is proven safe when ingested but may cause rashes in rare instances.\n\nArginine is well tolerated by most people in studies lasting up to six months. Potential side effects include:\n\n* <a href=\"http://www.webmd.com/digestive-disorders/abdominal-pain\" target=\"_blank\">abdominal pain</a>\n* <a href=\"http://www.webmd.com/heartburn-gerd/tc/gas-bloating-and-burping-topic-overview\" target=\"_blank\">bloating</a>\n* <a href=\"http://www.webmd.com/digestive-disorders/digestive-diseases-diarrhea\" target=\"_blank\">diarrhea</a>, and\n* <a href=\"http://www.webmd.com/a-to-z-guides/gout-topic-overview\" target=\"_blank\">gout</a>.\n\nIt may also aggravate <a href=\"http://www.webmd.com/asthma/default.htm\" target=\"_blank\">asthma</a> when inhaled. Arginine may interact with certain antihypertensive, cardiac and erectile dysfunction medication.','The signs of aging may be written on your face but if you look more carefully, the problem goes skin deep. Aside from common complaints like wrinkles, dull complexion and sagging skin, the ravages of time may manifest in other ways. Your hair and nails might become more brittle. Wounds would start to heal slower. Joints and muscles would begin to ache more often. The pain of osteoarthritis, a degenerative joint disease caused by the breakdown and loss of cartilage, would keep you from leading a more active lifestyle. The onset of fatigue would come sooner that suddenly, you’re tired for most of the day. Your energy drops and your confidence follows suit. Eventually, you will be left to wonder where your youthful vibrancy went.','vital c, vital r5, new product',1,2,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','2012-07-04 21:19:23'),
	(2,1,'Vital C','Vital C','<strong><a href=\"http://www.vital-c.com/main/wp-content/uploads/2010/07/vital_r5.jpg\"><img class=\"alignleft size-full wp-image-156\" title=\"vital_r5\" src=\"http://www.vital-c.com/main/wp-content/uploads/2010/07/vital_r5.jpg\" alt=\"\" width=\"220\" height=\"150\" /></a>“Dare to defy aging”</strong>\n\nThe signs of aging may be written on your face but if you look more carefully, the problem goes skin deep. Aside from common complaints like wrinkles, dull complexion and sagging skin, the ravages of time may manifest in other ways. Your hair and nails might become more brittle. Wounds would start to heal slower. Joints and muscles would begin to ache more often. The pain of osteoarthritis, a degenerative joint disease caused by the breakdown and loss of cartilage, would keep you from leading a more active lifestyle. The onset of fatigue would come sooner that suddenly, you’re tired for most of the day. Your energy drops and your confidence follows suit. Eventually, you will be left to wonder where your youthful vibrancy went.\n\nThese telltale signs of aging may appear when the body decreases collagen production. Collagen is a fibrous protein that makes up the support system for several body tissues such as bones, tendons, cartilage, muscles, skin and various organs like kidneys. It provides our body tissues form, strength and flexibility. Collagen is crucial in maintain the external structure of cells. It encourages bone health, strengthens the blood vessels and cartilage, and preserves skin elasticity, thus promoting smooth, tight and supple skin.\n\nCollagen is a naturally occurring bodily component that we produce in abundance when we are young. Hence, youthful skin is wrinkle-free, firm and elastic. But as we get older, our body’s ability to manufacture collagen slows down. And like most things, collagen is subject to wear and tear. It breaks down over time, and as we age, our body’s ability to replace lost or damaged collagen is reduced and more irregularities and complications develop. Studies show that from 25 years old onwards, collagen reduces at a rate of 1.5%, taking into account the effects of diet, lifestyle and pollution which speed the reduction even further.\n\nScientists have been trying to unlock the secrets of aging for years. Among their findings show that replenishing the level of collagen in the body can help delay the aging process. Proper, safe and effective supplementation may compensate for collagen loss, thus promoting a more youthful appearance and renewed vigour.\n\n<strong>Vital R5</strong>\n\nA product of breakthrough research and state-of-the-art Japanese technology, Vital R5 leads the pack in the fight against aging. It contains Amino Acid Fish Collagen, a potent and highly absorbable source of collagen that replenishes collagen stores which diminish with age.\n\nThis “youth elixir” also contains key ingredients that support collagen production, promote healthier joints and cartilage, improve circulation, and reveal radiant younger looking skin.\n\n<strong>Hyaluronic Acid</strong> – A key component of collagen. It has been called a “space filler” or support scaffolding for living cells because it helps hold cells in place. It is essential in healing wounds, hydrating the skin and addressing wrinkles and other dermatological problems. It also acts as a cushion and lubricant in the joints and connective tissues. It helps keep the cushion between bones (cartilage) from wearing away, thus preventing degenerative joint disease.\n\nGlucosamine – Assists in rebuilding and strengthening cartilage, slows the progression of osteoarthritis, and eases pain particularly in weight-bearing joints such as knees, hips, and hands.\n\n<strong>Arginine</strong> – An amino acid that improves blood flow and circulation by changing into nitric oxide, a chemical that causes blood vessels to relax. Early evidence suggests Arginine may help treat vascular complications like chest pains, clogged arteries, coronary artery disease, heart failure, erectile dysfunction and vascular headaches. It is also associated with rapid wound healing and greater collagen synthesis.\n\n<strong>Ascorbic Acid (Vitamin C)</strong> – An antioxidant noted for its cell protection properties. It is integral in collagen formation. Without Vitamin C, the collagen produced is defective and weak which may lead to bleeding gums, skin discoloration and painful joints. Collagen coupled with Vitamin C is essential for healthy skin, tissues, cartilage, bones and teeth.\n<h3><span style=\"color: #ff6600;\">The Power of Vital R5</span></h3>\nREBUILDS damaged skin, hair, nails and joints.\nRESTORES lost collagen, making skin firmer, smoother and lifted.\nRENEWS skin’s dewy youthful appearance and helps reduce wrinkles.\nREJUVENATES tired aching joints and strengthens ligaments.\nREINVIGORATES cell health for more efficient transport of nutrients and better elimination of toxins.\n\nWith a daily dose of Vital R5, beauty and vitality will come to you at any age.\n\nDirections: Take atleast a teaspoon of Vital R5 three times daily with coffee, juices or water. Drink lots of liquids for faster dissolution.\n\n<strong>SIDE EFFECTS:</strong>\nThere are no known side effects from ingesting collagen. In fact, Japan has been using collagen for 25 years as an anti-aging dietary supplement.\n\nHigh doses of glucosamine may cause stomach upset, heartburn, indigestion, gas, bloating, and diarrhea, particularly for those with peptic ulcer. Glucosamine should be taken with food to avoid these effects. People with shellfish allergies must consult their healthcare professional before taking glucosamine because it may contain shellfish product. Glucosamine is not recommended for pregnant and breastfeeding women and diabetics.\n\nHyaluronic Acid is proven safe when ingested but may cause rashes in rare instances.\n\nArginine is well tolerated by most people in studies lasting up to six months. Potential side effects include:\n\n* <a href=\"http://www.webmd.com/digestive-disorders/abdominal-pain\" target=\"_blank\">abdominal pain</a>\n* <a href=\"http://www.webmd.com/heartburn-gerd/tc/gas-bloating-and-burping-topic-overview\" target=\"_blank\">bloating</a>\n* <a href=\"http://www.webmd.com/digestive-disorders/digestive-diseases-diarrhea\" target=\"_blank\">diarrhea</a>, and\n* <a href=\"http://www.webmd.com/a-to-z-guides/gout-topic-overview\" target=\"_blank\">gout</a>.\n\nIt may also aggravate <a href=\"http://www.webmd.com/asthma/default.htm\" target=\"_blank\">asthma</a> when inhaled. Arginine may interact with certain antihypertensive, cardiac and erectile dysfunction medication.','The signs of aging may be written on your face but if you look more carefully, the problem goes skin deep. Aside from common complaints like wrinkles, dull complexion and sagging skin, the ravages of time may manifest in other ways. Your hair and nails might become more brittle. Wounds would start to heal slower. Joints and muscles would begin to ache more often. The pain of osteoarthritis, a degenerative joint disease caused by the breakdown and loss of cartilage, would keep you from leading a more active lifestyle. The onset of fatigue would come sooner that suddenly, you’re tired for most of the day. Your energy drops and your confidence follows suit. Eventually, you will be left to wonder where your youthful vibrancy went.','vital c, vital r5, new product',1,2,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','2012-07-04 22:00:37'),
	(6,2,'Vital C Sales Orientation - Tarlac City','','<p>Group Name:<strong>&nbsp;HI-ENERGY</strong></p>\n<p>Venue:<strong>&nbsp;Jollibee Tarlac City</strong></p>\n<p>Date:&nbsp;<strong>July 01, 2012</strong></p>\n<p>Time:<strong>&nbsp;1:00pm</strong></p>','Group Name: HI-ENERGY&lt;br /&gt;\n\nVenue: Jollibee Tarlac City &lt;br /&gt;\n\nDate: July 01, 2012\n\nTime: 1:00pm','vitalc, tarlac, orientation',1,3,'2012-07-01 17:00:00','0000-00-00 00:00:00','2012-07-13 04:49:19','2012-07-13 04:36:11'),
	(7,2,'Vital C Sales Orientation - San Fernando City','Vital C Sales Orientation - San Fernando City','<p>Group Name:<strong>&nbsp;HI-ENERGY</strong></p>\n<p>Venue:<strong>&nbsp;Chowking San Fernando City</strong></p>\n<p>Date:&nbsp;<strong>July 07, 2012</strong></p>\n<p>Time:<strong>&nbsp;1:00pm</strong></p>','Group Name: HI-ENERGY\n\nVenue: Chowking San Fernando City\n\nDate: July 07, 2012\n\nTime: 1:00pm','orientation, vitalc, san fernando',1,3,'2012-07-07 17:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','2012-07-13 04:47:37'),
	(8,2,'Vital C Sales Orientation - Lucena City','Vital C Sales Orientation - Lucena City','<p>Group Name:<strong>&nbsp;HI-ENERGY</strong></p>\n<p>Venue:<strong>&nbsp;Mang Inasal Lucena City</strong></p>\n<p>Date:&nbsp;<strong>July 08, 2012</strong></p>\n<p>Time:<strong>&nbsp;2:00pm</strong></p>','Group Name: HI-ENERGY','hi-energy, vital c, orientation',1,3,'2012-07-08 18:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','2012-07-13 05:14:26'),
	(9,2,'Vital C Sales Orientation - Tuguegarao City','Vital C Sales Orientation - Tuguegarao City','<p>Group Name:<strong>&nbsp;HI-ENERGY</strong></p>\n<p>Venue:<strong>&nbsp;McDonald&rsquo;s Tuguegarao City</strong></p>\n<p>Date:&nbsp;<strong>July 14, 2012</strong></p>\n<p>Time:<strong>&nbsp;2:00pm &nbsp; <br /></strong></p>','Group Name: HI-ENERGY\n\nVenue: McDonald’s Tuguegarao City','tuguegarao, hi energy,  orientation',1,3,'2012-07-14 18:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','2012-07-13 05:19:39'),
	(10,2,'Vital C Sales Orientation - Dipolog City','Vital C Sales Orientation - Dipolog City','<p>Group Name:<strong>&nbsp;HI-ENERGY</strong></p>\n<p>Venue:<strong>&nbsp;Jollibee Dipolog City</strong></p>\n<p>Date:&nbsp;<strong>July 21, 2012</strong></p>\n<p>Time:<strong>&nbsp;2:00pm &nbsp; <br /></strong></p>','Group Name: HI-ENERGY','hi-energy, vital c, orientation',1,3,'2012-07-21 18:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','2012-07-13 05:38:21'),
	(11,2,'Vital C Sales Orientation - Baguio City','Vital C Sales Orientation - Baguio City','<p>Group Name:<strong>&nbsp;HI-ENERGY</strong></p>\n<p>Venue:<strong>&nbsp;Chowking Baguio City</strong></p>\n<p>Date:&nbsp;<strong>July 22, 2012</strong></p>\n<p>Time:<strong>&nbsp;1:00pm &nbsp; <br /></strong></p>','Group Name: HI-ENERGY','hi-energy, vital c, orientation',1,3,'2012-07-22 17:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','2012-07-13 05:46:54'),
	(12,2,'Vital C Sales Orientation - San Fernando City','Vital C Sales Orientation - San Fernando City','<p>Group Name:<strong>&nbsp;HI-ENERGY</strong></p>\n<p>Venue:<strong>&nbsp;Chowking San Fernando City</strong></p>\n<p>Date:&nbsp;<strong>July 22, 2012</strong></p>\n<p>Time:<strong>&nbsp;4:00pm&nbsp; <br /></strong></p>','Group Name: HI-ENERGY','hi-energy, vital c, orientation',1,3,'2012-07-22 20:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','2012-07-13 05:52:38'),
	(13,2,'Vital C Sales Orientation - Puerto Princesa','Vital C Sales Orientation - Puerto Princesa','<p>Group Name:<strong>&nbsp;HI-ENERGY</strong></p>\n<p>Venue:<strong>&nbsp;Jollibee Puerto Princesa</strong></p>\n<p>Date:&nbsp;<strong>July 28, 2012</strong></p>\n<p>Time:<strong>&nbsp;1:00pm &nbsp; <br /></strong></p>','Group Name: HI-ENERGY','hi-energy, vital c, orientation',1,3,'2012-07-28 17:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','2012-07-13 05:56:24'),
	(14,2,'Vital C Sales Orientation - Tacloban City','Vital C Sales Orientation - Tacloban City','<p>Group Name:<strong>&nbsp;HI-ENERGY</strong></p>\n<p>Venue:<strong>&nbsp;McDonald&rsquo;sTacloban City</strong></p>\n<p>Date:&nbsp;<strong>July 04, 2012</strong></p>\n<p>Time:<strong>&nbsp;1:00pm&nbsp; <br /></strong></p>','Group Name: HI-ENERGY','hi-energy, vital c, orientation',1,3,'2012-07-04 17:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','2012-07-13 05:58:12'),
	(15,2,'Vital C Sales Orientation - Lipa City','Vital C Sales Orientation - Lipa City','<p>Group Name:<strong>&nbsp;HI-ENERGY</strong></p>\n<p>Venue:<strong>&nbsp;Chowking Lipa City</strong></p>\n<p>Date:&nbsp;<strong>July 15, 2012</strong></p>\n<p>Time:<strong>&nbsp;5:00pm&nbsp; <br /></strong></p>','Group Name: HI-ENERGY','hi-energy, vital c, orientation',1,4,'2012-07-15 21:00:00','0000-00-00 00:00:00','2012-07-24 11:17:28','2012-07-13 06:00:20'),
	(16,2,'Vital C Sales Orientation - Dagupan City','Vital C Sales Orientation - Dagupan City','<p>Group Name:<strong>&nbsp;HI-ENERGY</strong></p>\n<p>Venue:<strong>&nbsp;Jollibee Dagupan City</strong></p>\n<p>Date:&nbsp;<strong>July 22, 2012</strong></p>\n<p>Time:<strong>&nbsp;2:00pm&nbsp; <br /></strong></p>','Group Name: HI-ENERGY','hi-energy, vital c, orientation',1,3,'2012-07-22 18:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','2012-07-13 06:02:32'),
	(17,2,'Vital C Sales Orientation - Baguio City','','<p>Group Name:<strong>&nbsp;HI-ENERGY</strong></p>\n<p>Venue:<strong>&nbsp;McDonald&rsquo;s Baguio City</strong></p>\n<p>Date:&nbsp;<strong>July 28, 2012</strong></p>\n<p>Time:<strong>&nbsp;1:00pm&nbsp; <br /></strong></p>','Group Name: HI-ENERGY','hi-energy, vital c, orientation',1,3,'2012-07-28 17:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','2012-07-13 06:03:32'),
	(18,2,'Vital C Sales Orientation - Tanuan City','Vital C Sales Orientation - Tanuan City','<p>Group Name:<strong>&nbsp;HI-ENERGY</strong></p>\n<p>Venue:<strong>&nbsp;Chowking Tanuan City</strong></p>\n<p>Date:&nbsp;<strong>July 22, 2012</strong></p>\n<p>Time:<strong>&nbsp;5:00pm&nbsp; <br /></strong></p>','Group Name: HI-ENERGY','hi-energy, vital c, orientation',1,3,'2012-07-22 21:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','2012-07-13 06:08:15'),
	(19,2,'Vital C Sales Orientation - Tacloban City','Vital C Sales Orientation - Tacloban City','<p>Group Name:<strong>&nbsp;HI-ENERGY</strong></p>\n<p>Venue:<strong>&nbsp;McDonald&rsquo;s Tacloban City</strong></p>\n<p>Date:&nbsp;<strong>July 29, 2012</strong></p>\n<p>Time:<strong>&nbsp;2:00pm&nbsp; <br /></strong></p>','Group Name: HI-ENERGY\n\nVenue: McDonald’s Tacloban City\n\nDate: July 29, 2012\n\nTime: 2:00pm','hi-energy, vital c, orientation',1,3,'2012-07-29 18:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','2012-07-13 06:41:50'),
	(20,2,'Vital C Sales Orientation - Calapan City','Vital C Sales Orientation - Calapan City','<p>Group Name:<strong>&nbsp;HI-ENERGY</strong></p>\n<p>Venue:<strong>&nbsp;Jollibee Calapan City</strong></p>\n<p>Date:&nbsp;<strong>July 22, 2012</strong></p>\n<p>Time:<strong>&nbsp;2:00pm&nbsp; <br /></strong></p>','Group Name: HI-ENERGY\n\nVenue: Jollibee Calapan City\n\nDate: July 22, 2012\n\nTime: 2:00pm','hi-energy, vital c, orientation',1,3,'2012-07-22 18:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','2012-07-13 07:28:24'),
	(21,2,'Vital C Sales Orientation - Daet, Camarines Norte','Vital C Sales Orientation - Daet, Camarines Norte','<p>Group Name:<strong>&nbsp;WILL OF FORTUNE</strong></p>\n<p>Venue:<strong>&nbsp;Chowking Daet, Camarines Norte</strong></p>\n<p>Date:&nbsp;<strong>July 07, 2012</strong></p>\n<p>Time:<strong>&nbsp;2:00pm</strong></p>','Group Name: WILL OF FORTUNE\n\nVenue: Chowking Daet, Camarines Norte\n\nDate: July 07, 2012\n\nTime: 2:00pm','camarines norte, orientation, will of fortune',1,3,'2012-07-07 18:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','2012-07-13 07:30:02'),
	(22,2,'Vital C Sales Orientation - Novaliches','Vital C Sales Orientation - Novaliches','<p>Group Name:<strong>&nbsp;LEAGUE OF MILLIONAIRES MIND</strong></p>\n<p>Venue:<strong>&nbsp;Jollibee Gen. Luis Novaliches Quezon City</strong></p>\n<p>Date:&nbsp;<strong>July 07, 2012</strong></p>\n<p>Time:<strong>&nbsp;2:00pm</strong></p>','Group Name: LEAGUE OF MILLIONAIRES MIND\n\nVenue: Jollibee Gen. Luis Novaliches Quezon City\n\nDate: July 07, 2012\n\nTime: 2:00pm','orientation, novaliches, league of millionaires mind',1,3,'2012-07-07 18:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','2012-07-13 07:31:12'),
	(23,2,'Vital C Sales Orientation - Cogeo, Antipolo','Vital C Sales Orientation - Cogeo, Antipolo','<p>Group Name:<strong>&nbsp;PROSPERITY</strong></p>\n<p>Venue:<strong>&nbsp;Chowking Cogeo Antipolo City</strong></p>\n<p>Date:&nbsp;<strong>July 20, 2012</strong></p>\n<p>Time:<strong>&nbsp;3:00pm</strong></p>','Group Name: PROSPERITY\n\nVenue: Chowking Cogeo Antipolo City\n\nDate: July 20, 2012\n\nTime: 3:00pm','prosperity, orientation, vital c',1,3,'2012-07-20 19:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','2012-07-13 07:37:00'),
	(24,2,'Vital C Sales Orientation - Antipolo City','Vital C Sales Orientation - Antipolo City','<p>Group Name:<strong>&nbsp;PROSPERITY</strong></p>\n<p>Venue:<strong>&nbsp;Mang Inasal ML.Quezon Antipolo City</strong></p>\n<p>Date:&nbsp;<strong>July 20, 2012</strong></p>\n<p>Time:<strong>&nbsp;3:00pm</strong></p>','Group Name: PROSPERITY\n\nVenue: Mang Inasal ML.Quezon Antipolo City\n\nDate: July 20, 2012\n\nTime: 3:00pm','vital c, orientation, antipolo, prosperity',1,3,'2012-07-20 19:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','2012-07-13 07:39:50'),
	(25,2,'Vital C Sales Orientation - Cotabato City','Vital C Sales Orientation - Cotabato City','<p>Group Name:<strong>&nbsp;BLUE WARRIORS</strong></p>\n<p>Venue:<strong>&nbsp;Jollibee Cotabato City Orc Drive Sinsuat Ave.</strong></p>\n<p>Date:&nbsp;<strong>July 07, 2012</strong></p>\n<p>Time:<strong>&nbsp;2:00pm</strong></p>','Group Name: BLUE WARRIORS\n\nVenue: Jollibee Cotabato City Orc Drive Sinsuat Ave.\n\nDate: July 07, 2012\n\nTime: 2:00pm','blue warriors, orientation, cotabato, vital c',1,3,'2012-07-07 18:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','2012-07-13 07:44:07'),
	(26,2,'Vital C Sales Orientation - Panabo City','Vital C Sales Orientation - Panabo City','<p>Group Name:<strong>&nbsp;INFINITY</strong></p>\n<p>Venue:<strong>&nbsp;Jollibee Hi-Way Panabo City</strong></p>\n<p>Date:&nbsp;<strong>July 11, 2012</strong></p>\n<p>Time:<strong>&nbsp;6:00pm</strong></p>','Group Name: INFINITY\n\nVenue: Jollibee Hi-Way Panabo City\n\nDate: July 11, 2012\n\nTime: 6:00pm','infinity, vital c, orientation, panabo',1,3,'2012-07-11 22:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','2012-07-13 07:46:45'),
	(27,2,'Vital C Sales Orientation - Panabo City','Vital C Sales Orientation - Panabo City','<p>Group Name:<strong>&nbsp;INFINITY</strong></p>\n<p>Venue:<strong>&nbsp;Jollibee Hi-Way Panabo City</strong></p>\n<p>Date:&nbsp;<strong>July 18, 2012</strong></p>\n<p>Time:<strong>&nbsp;6:00pm</strong></p>','Group Name: INFINITY\n\nVenue: Jollibee Hi-Way Panabo City\n\nDate: July 18, 2012\n\nTime: 6:00pm','infinity, vital c, orientation, panabo',1,3,'2012-07-18 22:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','2012-07-13 07:48:34'),
	(28,2,'Vital C Sales Orientation - Tagum City','Vital C Sales Orientation - Tagum City','<p>Group Name:<strong>&nbsp;INFINITY</strong></p>\n<p>Venue:<strong>&nbsp;Jollibee Hi-Way Tagum City</strong></p>\n<p>Date:&nbsp;<strong>July 09, 2012</strong></p>\n<p>Time:<strong>&nbsp;7:00pm</strong></p>','Group Name: INFINITY\n\nVenue: Jollibee Hi-Way Tagum City\n\nDate: July 09, 2012\n\nTime: 7:00pm','infinity, vital c, orientation, tagum',1,3,'2012-07-09 23:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','2012-07-13 07:51:43'),
	(29,2,'Vital C Sales Orientation - Tagum City','Vital C Sales Orientation - Tagum City','<p>Group Name:<strong>&nbsp;INFINITY</strong></p>\n<p>Venue:<strong>&nbsp;Jollibee Hi-Way Tagum City</strong></p>\n<p>Date:&nbsp;<strong>July 23, 2012</strong></p>\n<p>Time:<strong>&nbsp;7:00pm</strong></p>','Group Name: INFINITY\n\nVenue: Jollibee Hi-Way Tagum City\n\nDate: July 23, 2012\n\nTime: 7:00pm','infinity, vital c, orientation, tagum',1,3,'2012-07-23 23:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','2012-07-13 07:56:10'),
	(30,2,'Vital C Sales Orientation - Tagum City','Vital C Sales Orientation - Tagum City','<p>Group Name:<strong>&nbsp;INFINITY</strong></p>\n<p>Venue:<strong>&nbsp;Jollibee Hi-Way Tagum City</strong></p>\n<p>Date:&nbsp;<strong>July 30, 2012</strong></p>\n<p>Time:<strong>&nbsp;7:00pm</strong></p>','Group Name: INFINITY\n\nVenue: Jollibee Hi-Way Tagum City\n\nDate: July 30, 2012\n\nTime: 7:00pm','infinity, vital c, orientation, tagum',1,3,'2012-07-30 23:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','2012-07-13 07:56:33'),
	(31,2,'Vital C Sales Orientation - General Santos','Vital C Sales Orientation - General Santos','<p>Group Name:<strong>&nbsp;BLUE WARRIORS</strong></p>\n<p>Venue:<strong>&nbsp;MIZ Bldg. Lote Calumpang General Santos</strong></p>\n<p>Date:&nbsp;<strong>July 08, 2012</strong></p>\n<p>Time:<strong>&nbsp;2:00pm</strong></p>','Group Name: BLUE WARRIORS\n\nVenue: MIZ Bldg. Lote Calumpang General Santos\n\nDate: July 08, 2012\n\nTime: 2:00pm','general santos, blue warriors, vital c, orientation',1,3,'2012-07-08 18:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','2012-07-13 08:01:38'),
	(32,2,'Vital C Sales Orientation - Marbel, South Cotabato','Vital C Sales Orientation - Marbel, South Cotabato','<p>Group Name:<strong>&nbsp;INFINITY</strong></p>\n<p>Venue:<strong>&nbsp;Jollibee Marbel South Cotabato</strong></p>\n<p>Date:&nbsp;<strong>July 08, 2012</strong></p>\n<p>Time:<strong>&nbsp;2:00pm</strong></p>','Group Name: INFINITY\n\nVenue: Jollibee Marbel South Cotabato\n\nDate: July 08, 2012\n\nTime: 2:00pm','infinity, vital c, orientation, south cotabato',1,3,'2012-07-08 18:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','2012-07-13 08:03:17'),
	(33,2,'Vital C Sales Orientation - General Santos','Vital C Sales Orientation - General Santos','<p>Group Name:<strong>&nbsp;INFINITY</strong></p>\n<p>Venue:<strong>&nbsp;Jollibee Nat&rsquo;l. Hi-Way General Santos</strong></p>\n<p>Date:&nbsp;<strong>July 15, 2012</strong></p>\n<p>Time:<strong>&nbsp;2:00pm</strong></p>','Group Name: INFINITY\n\nVenue: Jollibee Nat’l. Hi-Way General Santos\n\nDate: July 15, 2012\n\nTime: 2:00pm','vital c, general santos, infinity, orientation',1,3,'2012-07-15 18:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','2012-07-13 08:04:25'),
	(34,2,'Vital C Sales Orientation - General Santos','Vital C Sales Orientation - General Santos','<p>Group Name:<strong>&nbsp;INFINITY</strong></p>\n<p>Venue:<strong>&nbsp;Door C12 ECA Bldg. General Santos</strong></p>\n<p>Date:&nbsp;<strong>July 29, 2012</strong></p>\n<p>Time:<strong>&nbsp;2:00pm</strong></p>','Group Name: INFINITY\n\nVenue: Door C12 ECA Bldg. General Santos\n\nDate: July 29, 2012\n\nTime: 2:00pm','vital c, general santos, infinity, orientation',1,3,'2012-07-29 18:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','2012-07-13 08:05:21'),
	(35,2,'Vital C Sales Orientation - General Santos','Vital C Sales Orientation - General Santos','<p>Group Name:<strong>&nbsp;INFINITY</strong></p>\n<p>Venue:<strong>&nbsp;Door C12 ECA Bldg. General Santos</strong></p>\n<p>Date:&nbsp;<strong>July 22, 2012</strong></p>\n<p>Time:<strong>&nbsp;2:00pm</strong></p>','Group Name: INFINITY\n\nVenue: Door C12 ECA Bldg. General Santos\n\nDate: July 22, 2012\n\nTime: 2:00pm','vital c, general santos, infinity, orientation',1,3,'2012-07-22 18:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','2012-07-13 08:06:42'),
	(36,2,'Vital C Product Forum - Masbate City','Vital C Product Forum - Masbate City','<p>Speaker:&nbsp;<strong>Dr. Jose Oclarit&nbsp;</strong></p>\n<p>Date: &nbsp;<strong>July 6,2012</strong></p>\n<p><strong></strong>Venue:<strong>&nbsp;Masbate Hotel Masbate City</strong></p>\n<p><strong></strong>Time:&nbsp;<strong>&nbsp;2:00pm</strong></p>','Speaker: Dr. Jose Oclarit \n\nDate:  July 6,2012\n\nVenue: Masbate Hotel Masbate City\n\nTime:  2:00pm','masbate, vital c, product forum',1,3,'2012-07-06 18:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','2012-07-13 08:08:05'),
	(37,2,'Vital C Sizzle and Product Launching – Tentative Schedule (Davao)','Vital C Sizzle and Product Launching – Tentative Schedule (Davao)','<p>Venue:<strong> <strong> D&rsquo; Leonor Hotel, Davao Cit</strong>y<br /></strong></p>\n<p>Date:&nbsp;<strong><strong>August 24,2012</strong></strong></p>\n<p>Time:<strong> <strong>To be announced</strong><br /></strong></p>','Venue: D’ Leonor Hotel, Davao City\n\nDate: August 24,2012\n\nTime: To be announced','vital c, sizzle, product launching',1,4,'2012-08-24 04:00:00','0000-00-00 00:00:00','2012-07-24 11:41:04','2012-07-24 11:39:28'),
	(38,2,'Vital C Sizzle and Product Launching – Tentative Schedule (Cebu)','Vital C Sizzle and Product Launching – Tentative Schedule (Cebu)','<p>Venue:<strong> <strong>Club Ultima, Crown Regency Fuente</strong><br /></strong></p>\n<p>Date:&nbsp;<strong><strong><strong>August 25, 2012</strong></strong></strong></p>\n<p>Time:<strong> <strong>To be announced</strong><br /></strong></p>','Venue: Club Ultima, Crown Regency Fuente\n\nDate: August 25, 2012\n\nTime: To be announced','vital c, sizzle, product launching, cebu',1,4,'2012-08-25 04:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','2012-07-24 11:44:48'),
	(39,2,'Vital C Sizzle and Product Launching – Tentative Schedule (Ortigas)','Vital C Sizzle and Product Launching – Tentative Schedule (Ortigas)','<p>Venue:<strong> <strong><strong>5th Floor, SM Megamall Conference Hall</strong></strong><br /></strong></p>\n<p>Date: <strong><strong><strong><strong>August 26, 2012</strong></strong></strong></strong></p>\n<p>Time:<strong> <strong>To be announced</strong><br /></strong></p>','Venue: Club Ultima, Crown Regency Fuente\n\nDate: August 25, 2012\n\nTime: To be announced','vital c, sizzle, product launching, ortigas',1,4,'2012-08-26 04:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','2012-07-24 11:48:20'),
	(40,2,'Vital C Product Forum – Tanjay, Negros Occidental','Vital C Product Forum – Tanjay, Negros Occidental','<p>Speaker:&nbsp;<strong>Dr. Jose Oclarit&nbsp;</strong></p>\n<p>Date: &nbsp;<strong>July 21-22,2012</strong></p>\n<p><strong></strong>Venue:<strong>&nbsp;Hotel de Tanjay &ndash; Tanjay, Negros Oriental</strong></p>\n<p><strong></strong>Time:&nbsp;<strong>&nbsp;2:00pm</strong></p>','Speaker: Dr. Jose Oclarit \n\nDate:  July 21-22,2012\n\nVenue: Hotel de Tanjay – Tanjay, Negros Oriental\n\nTime:  2:00pm','vital c, product forum',1,4,'2012-07-21 18:00:00','2012-07-22 04:00:00','0000-00-00 00:00:00','2012-07-24 11:52:08'),
	(41,2,'Vital C Sizzle – Davao','Vital C Sizzle – Davao','<p>Venue:<strong>&nbsp;D&rsquo; Leonor Hotel Davao</strong></p>\n<p>Date:&nbsp;<strong>June 22, 2012</strong></p>\n<p>Time:<strong>&nbsp;6:00pm</strong></p>','Venue: D’ Leonor Hotel Davao\n\nDate: June 22, 2012\n\nTime: 6:00pm','vital c, sizzle, davao',1,4,'2012-06-22 22:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','2012-07-24 11:54:09'),
	(42,2,'Vital C Product Forum – Pagadian City','Vital C Product Forum – Pagadian City','<p>Speaker: <strong>Dr. Jose Oclarit</strong></p>\n<p>Venue:<strong>&nbsp;Hotel Guillermo Rizal. St. Pagadian&nbsp;</strong></p>\n<p>Date:&nbsp;<strong>July 28, 2012</strong></p>\n<p>Time:<strong>&nbsp;2:00pm <br /></strong></p>','Speaker: Dr. Jose Oclarit\n\nVenue: Hotel Guillermo Rizal. St. Pagadian \n\nDate: July 28, 2012\n\nTime: 2:00pm','vital c, product forum, pagadian city',1,4,'2012-07-28 18:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','2012-07-24 11:58:09'),
	(43,2,'Vital C Product Forum – Cagayan De Oro','Vital C Product Forum – Cagayan De Oro','<p>Speaker:&nbsp;<strong>Dr. Jose Oclarit</strong></p>\n<p>Venue:<strong>&nbsp;Jollibee Limkit Kai</strong></p>\n<p>Date:&nbsp;<strong>July 29, 2012</strong></p>\n<p>Time:<strong>&nbsp;2:00pm <br /></strong></p>','Speaker: Dr. Jose Oclarit\n\nVenue: Jollibee Limkit Kai\n\nDate: July 29, 2012\n\nTime: 2:00pm','vital c, product forum, cagayan de oro',1,4,'2012-07-29 18:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','2012-07-24 12:00:10'),
	(44,2,'Vital C Success Road Map Workshop – Cebu','Vital C Success Road Map Workshop – Cebu','<p>Speaker:&nbsp;<strong>Jophet Pedroso</strong></p>\n<p>Venue:<strong>&nbsp;Crown Regency Hotel Guadalupe&nbsp;</strong></p>\n<p>Date:&nbsp;<strong>July 21-22, 2012</strong></p>\n<p>Time:<strong>&nbsp;8:30am <br /></strong></p>','Speaker: Jophet Pedroso\n\nVenue: Crown Regency Hotel Guadalupe \n\nDate: July 21-22, 2012\n\nTime: 8:30am','vital c, workshop, cebu',1,4,'2012-07-21 12:30:00','2012-07-22 04:00:00','0000-00-00 00:00:00','2012-07-24 12:01:59'),
	(45,2,'Vital C Davao Sizzle – Davao Depot','Vital C Davao Sizzle – Davao Depot','<p>Venue:<strong>&nbsp;Davao Depot &ndash; Sobracarey Street Bo. Obrero, Davao City</strong></p>\n<p>Date:&nbsp;<strong>July 20, 2012</strong></p>\n<p>Time:<strong>&nbsp;6:00pm</strong></p>','Venue: Davao Depot – Sobracarey Street Bo. Obrero, Davao City\n\nDate: July 20, 2012\n\nTime: 6:00pm','vital c, sizzle, davao',1,4,'2012-07-20 22:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','2012-07-24 15:52:59'),
	(46,2,'Vital C Sales Caravan – Davao','Vital C Sales Caravan – Davao','<p><strong>Davao Sales Caravan:</strong></p>\n<p><strong>August 03,2012</strong> &ndash; Polomolok</p>\n<p><strong>Note: Venue and Time is to be announced or you may contact Mr. Alberto Obenza (09186590486) for further &nbsp;details.</strong></p>','Davao Sales Caravan:\n\nAugust 03,2012 – Polomolok\n\nNote: Venue and Time is to be announced or you may contact Mr. Alberto Obenza (09186590486) for further  details.','vital c, sales cravan, davao',1,4,'2012-08-03 04:00:00','0000-00-00 00:00:00','2012-07-25 00:39:54','2012-07-25 00:38:35'),
	(47,2,'Vital C Sales Caravan – Davao','Vital C Sales Caravan – Davao','<p><strong>Davao Sales Caravan:</strong></p>\n<p><strong></strong><strong>August 04,2012</strong> &ndash; Marbel</p>\n<p><strong>Note: Venue and Time is to be announced or you may contact Mr. Alberto Obenza (09186590486) for further &nbsp;details.</strong></p>','Davao Sales Caravan:\n\nAugust 04,2012 – Marbel\n\nNote: Venue and Time is to be announced or you may contact Mr. Alberto Obenza (09186590486) for further  details.','vital c, sales cravan, davao',1,4,'2012-08-04 04:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','2012-07-25 00:40:23'),
	(48,2,'Vital C Sales Caravan – Davao','Vital C Sales Caravan – Davao','<p><strong>Davao Sales Caravan:</strong></p>\n<p><strong></strong><strong></strong><strong>August 05,2012</strong> &ndash; General Santos</p>\n<p><strong>Note: Venue and Time is to be announced or you may contact Mr. Alberto Obenza (09186590486) for further &nbsp;details.</strong></p>','Davao Sales Caravan:\n\nAugust 05,2012 – General Santos\n\nNote: Venue and Time is to be announced or you may contact Mr. Alberto Obenza (09186590486) for further  details.','vital c, sales cravan, davao',1,4,'2012-08-05 04:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','2012-07-25 00:40:50'),
	(49,2,'Vital C Sales Caravan – Davao','Vital C Sales Caravan – Davao','<p><strong>Davao Sales Caravan:</strong></p>\n<p><strong></strong><strong></strong><strong></strong><strong>August 06,2012</strong> &ndash; Tagum</p>\n<p><strong>Note: Venue and Time is to be announced or you may contact Mr. Alberto Obenza (09186590486) for further &nbsp;details.</strong></p>','Davao Sales Caravan:\n\nAugust 06,2012 – Tagum\n\nNote: Venue and Time is to be announced or you may contact Mr. Alberto Obenza (09186590486) for further  details.','vital c, sales cravan, davao',1,4,'2012-08-06 04:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','2012-07-25 00:43:46'),
	(50,2,'Vital C Sales Caravan – Davao','Vital C Sales Caravan – Davao','<p><strong>Davao Sales Caravan:</strong></p>\n<p><strong></strong><strong></strong><strong></strong><strong></strong><strong>August 07,2012</strong> &ndash; Panabo</p>\n<p><strong>Note: Venue and Time is to be announced or you may contact Mr. Alberto Obenza (09186590486) for further &nbsp;details.</strong></p>','Davao Sales Caravan:\n\nAugust 07,2012 – Panabo\n\nNote: Venue and Time is to be announced or you may contact Mr. Alberto Obenza (09186590486) for further  details.','vital c, sales cravan, davao',1,4,'2012-08-07 04:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','2012-07-25 00:44:07'),
	(51,2,'Vital C Sales Caravan – Davao','Vital C Sales Caravan – Davao','<p><strong>Davao Sales Caravan:</strong></p>\n<p><strong></strong><strong></strong><strong></strong><strong></strong><strong></strong><strong>August 08,2012</strong> &ndash; Lupon</p>\n<p><strong>Note: Venue and Time is to be announced or you may contact Mr. Alberto Obenza (09186590486) for further &nbsp;details.</strong></p>','Davao Sales Caravan:\n\nAugust 08,2012 – Lupon\n\nNote: Venue and Time is to be announced or you may contact Mr. Alberto Obenza (09186590486) for further  details.','vital c, sales cravan, davao',1,4,'2012-08-08 04:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','2012-07-25 00:44:36'),
	(52,2,'Vital C Sales Caravan – Davao','Vital C Sales Caravan – Davao','<p><strong>Davao Sales Caravan:</strong></p>\n<p><strong></strong><strong></strong><strong></strong><strong></strong><strong></strong><strong></strong><strong>August 09,2012</strong> &ndash; Mati</p>\n<p><strong>Note: Venue and Time is to be announced or you may contact Mr. Alberto Obenza (09186590486) for further &nbsp;details.</strong></p>','Davao Sales Caravan:\n\nAugust 09,2012 – Mati\n\nNote: Venue and Time is to be announced or you may contact Mr. Alberto Obenza (09186590486) for further  details.','vital c, sales cravan, davao',1,4,'2012-08-09 04:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','2012-07-25 00:45:13'),
	(53,2,'Vital C Product Forum – Davao','Vital C Product Forum – Davao','<p><strong><strong>Vital C Product forum in Davao:</strong></strong></p>\n<p><strong>August 10,2012</strong> &ndash; Davao Depot (Sobracarey Street Bo. Obrero, Davao City)</p>\n<p><strong><strong>Note: Venue and Time is to be announced or you may contact Mr. Alberto Obenza (09186590486) for further &nbsp;details.</strong></strong></p>','Vital C Product forum in Davao:\n\nAugust 10,2012 – Davao Depot (Sobracarey Street Bo. Obrero, Davao City)\n\nNote: Venue and Time is to be announced or you may contact Mr. Alberto Obenza (09186590486) for further  details.','vital c,product forum, davao',1,4,'2012-08-10 04:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','2012-07-25 00:48:51'),
	(54,2,'Vital C Product Forum – Davao','Vital C Product Forum – Davao','<p><strong><strong>Vital C Product forum in Davao:</strong></strong></p>\n<p><strong></strong><strong>August 11,2012 &ndash; </strong>Tagum (Exact venue to be announced)</p>\n<p><strong><strong>Note: Venue and Time is to be announced or you may contact Mr. Alberto Obenza (09186590486) for further &nbsp;details.</strong></strong></p>','Vital C Product forum in Davao:\n\nAugust 11,2012 – Tagum (Exact venue to be announced)\n\nNote: Venue and Time is to be announced or you may contact Mr. Alberto Obenza (09186590486) for further  details.','vital c,product forum, davao',1,4,'2012-08-11 04:00:00','0000-00-00 00:00:00','2012-07-25 00:49:36','2012-07-25 00:49:11'),
	(55,2,'Vital C Product Forum – Davao','Vital C Product Forum – Davao','<p><strong><strong>Vital C Product forum in Davao:</strong></strong></p>\n<p><strong></strong><strong></strong><strong>August 12,2012 &ndash; </strong>Panabo&nbsp;(Exact venue to be announced)</p>\n<p><strong><strong>Note: Venue and Time is to be announced or you may contact Mr. Alberto Obenza (09186590486) for further &nbsp;details.</strong></strong></p>','Vital C Product forum in Davao:\n\nAugust 12,2012 – Panabo (Exact venue to be announced)\n\nNote: Venue and Time is to be announced or you may contact Mr. Alberto Obenza (09186590486) for further  details.','vital c,product forum, davao',1,4,'2012-08-12 04:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','2012-07-25 00:49:59'),
	(56,2,'Vital C Product Forum – Davao','Vital C Product Forum – Davao','<p><strong><strong>Vital C Product forum in Davao:</strong></strong></p>\n<p><strong>August 13,2012</strong> &ndash; General Santos&nbsp;(Exact venue to be announced)</p>\n<p><strong><strong>Note: Venue and Time is to be announced or you may contact Mr. Alberto Obenza (09186590486) for further &nbsp;details.</strong></strong></p>','Vital C Product forum in Davao:\n\nAugust 13,2012 – General Santos (Exact venue to be announced)\n\nNote: Venue and Time is to be announced or you may contact Mr. Alberto Obenza (09186590486) for further  details.','vital c,product forum, davao',1,4,'2012-08-13 04:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','2012-07-25 00:51:01'),
	(57,2,'Vital C Product Forum – Davao','Vital C Product Forum – Davao','<p><strong><strong>Vital C Product forum in Davao:</strong></strong></p>\n<p><strong></strong><strong>August 14,2012</strong> &ndash; Tacurong (Exact venue to be announced)</p>\n<p><strong><strong>Note: Venue and Time is to be announced or you may contact Mr. Alberto Obenza (09186590486) for further &nbsp;details.</strong></strong></p>','Vital C Product forum in Davao:\n\nAugust 14,2012 – Tacurong (Exact venue to be announced)\n\nNote: Venue and Time is to be announced or you may contact Mr. Alberto Obenza (09186590486) for further  details.','vital c,product forum, davao',1,4,'2012-08-14 04:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','2012-07-25 00:52:57'),
	(58,2,'Vital C Product Forum – Davao','Vital C Product Forum – Davao','<p><strong><strong>Vital C Product forum in Davao:</strong></strong></p>\n<p><strong>August 15,2012</strong>&nbsp;- Cotabato ((Exact venue to be announced)</p>\n<p><strong><strong>Note: Venue and Time is to be announced or you may contact Mr. Alberto Obenza (09186590486) for further &nbsp;details.</strong></strong></p>','Vital C Product forum in Davao:\n\nAugust 15,2012 - Cotabato ((Exact venue to be announced)\n\nNote: Venue and Time is to be announced or you may contact Mr. Alberto Obenza (09186590486) for further  details.','vital c,product forum, davao',1,4,'2012-08-15 04:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','2012-07-25 00:53:18'),
	(59,2,'Vital C Doctor’s Forum – Davao City','Vital C Doctor’s Forum – Davao City','<p>Speaker:&nbsp;<strong>Dr. Jose Oclarit</strong></p>\n<p>Venue:<strong>&nbsp;Apo View Hotel Davao City</strong></p>\n<p>Date: <strong>August 16,2012</strong></p>\n<p>Time:<strong>&nbsp;6:00pm <br /></strong></p>','Speaker: Dr. Jose Oclarit\n\nVenue: Apo View Hotel Davao City\n\nDate: August 16,2012\n\nTime: 6:00pm','vital c, doctor’s forum, davao',1,4,'2012-08-16 22:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','2012-07-25 00:54:58'),
	(60,2,'Vital C EPC Opening – Angeles City, Pampanga','Vital C EPC Opening – Angeles City, Pampanga','<p>Special Guest: <strong>The Medical Team -</strong>&nbsp;<strong>Dr. Ariel Baira,&nbsp;Dr. Jose Oclarit, Dr. Paolo Bellosillo&nbsp;</strong></p>\n<p>Venue:<strong>&nbsp;SM Clark Angeles City, Pampanga</strong></p>\n<p>Date:&nbsp;<strong>August 03,2012</strong></p>\n<p>Time:<strong>&nbsp;1:00pm <br /></strong></p>','Special Guest: The Medical Team - Dr. Ariel Baira, Dr. Jose Oclarit, Dr. Paolo Bellosillo \n\nVenue: SM Clark Angeles City, Pampanga\n\nDate: August 03,2012\n\nTime: 1:00pm','vital c, epc opening, pampanga',1,4,'2012-08-03 17:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','2012-07-25 00:56:14');

/*!40000 ALTER TABLE `sm_news` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sm_news_comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sm_news_comments`;

CREATE TABLE `sm_news_comments` (
  `news_comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) NOT NULL DEFAULT '0',
  `comment` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_approved` tinyint(4) NOT NULL DEFAULT '0',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`news_comment_id`),
  KEY `comment_id` (`comment_id`),
  KEY `name` (`name`),
  KEY `email` (`email`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table sm_results
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sm_results`;

CREATE TABLE `sm_results` (
  `result_id` int(11) NOT NULL AUTO_INCREMENT,
  `result` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `member_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_filename` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_published` tinyint(4) NOT NULL DEFAULT '0',
  `is_featured` tinyint(4) NOT NULL default '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`result_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table sm_testimonials
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sm_testimonials`;

CREATE TABLE `sm_testimonials` (
  `testimonial_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `member_details` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `image_filename` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_approved` tinyint(4) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`testimonial_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sm_testimonials` WRITE;
/*!40000 ALTER TABLE `sm_testimonials` DISABLE KEYS */;

INSERT INTO `sm_testimonials` (`testimonial_id`, `member_name`, `member_details`, `body`, `image_filename`, `is_approved`, `user_id`, `insert_timestamp`)
VALUES
	(1,'Riz Francisca A. Castañaga','44 yrs old | Matina Aplaya, Davao City','Vital C is a Blessing not only for me but for my family. I was diagnosed with Breast Cancer Stage II-B last May 2008. I had undergone 4 cycles of Chemotherapy from July to September 2008 and 32 sessions of Radiation from October to December 2008. By end of December 2008, I was cleared! I asked my doctor what my status is, after undergoing those procedures. He told me that it is wrong to say that I am totally cured. But the challenge is for me to stay cleared. He recommended me to take some supplements but he never mentioned any specific supplements. My friend?s doctor recommended her to take Vital C, in which I also tried taking it. I am taking 2 capsules 3x a day. Thank God from that time on, I was cleared from any traces of Cancer.','Riz-Francisca-t.gif',1,0,'2012-07-06 03:40:31'),
	(2,'Luz Seno - Redaja','Banawa, Cebu City','I have Bursitis on my knee, I could hardly walk. I?ve been trying many medications; even go abroad like Holy Land, just to have myself healed. I?ve been attending charismatic gatherings because I was so hopeless. Finally I had my knee operated but the pain is still there. My friend recommended me to take VITAL C. I would rather try it because I felt so desperate to ease the pain. She told me to take at least 12 capsules / day for 2 months. I was so surprised that my knee can move freely, the swelling and the pain were gone. What a miracle! I?m still taking VITAL C up to the present. Thank You VITAL C','Luz-Seno-t.gif',1,0,'2012-07-06 03:40:31'),
	(3,'Ryan A. Fernandez','Valenzuela City','WEIGHT REDUCTION from 36\" waistline to 33\". I took Vital C for almost a month. I feel more confident now. I lost weight, my girlfriend says I look great!','Ryan-A.-Fernandez-t.gif',1,0,'2012-07-06 03:40:31'),
	(4,'Apolinario Dela Cruz','74 yrs old | Consolacion, Cebu City','May sakit po akong Hernia. Isang taon na akong pabalik-balik sa ospital. Lagi na lang akong nakahiga, hirap akong makatayo at maglakad. Desperado na ako sa kalagayan ko dulot ng aking sakit. Hirap na hirap akong umihi. Yung sex organ ko ay naoperahan ng dalawang beses sa sobrang laki at ang dami kong gamut na iniinom. Lumalaki ang aking ?testicles.? Sabi ng anak ko, uminom at subukan ko raw ang Vital C. Pagkalipas ng 2 buwan sa pag inom ng 2 capsules sa umaga 2 capsules sa tanghali at 2 capsules sa gabi ng Vital C, maayos na ang pag ihi ko. Nabawasan ang pamamaga, yung sugat ay mabilis na naghilom at nakakalakad na ako! Salamat sa Diyos at may Vital C!','Apolinario-Dela-Cruz-t.gif',1,0,'2012-07-06 03:40:31'),
	(5,'Lucena Marilyn Sanchez','Talisay, Cebu City','Na-diagnose po ako ng Diabetes Mellitus at komplikado na ang sakit ko. Yung liver ko ay may malaking bukol kaya lagi rin sumasakit ang tiyan ko. Gusto na akong i-admit sa hospital ng aking doktor, ayaw ko at natatakot ako dahil na rin sa laki ng aking gagastusin. Naimbitahan ako na pumunta sa office ng Vital C ni Mr. Alvin Yu. Pinasubok sakin na uminom ng Vital C. 2 capsules sa umaga at 2 capsules sa gabi. After 5 days, napansin ko na ang sakit ng tiyan ko ay nawala! Yung aking blood sugar ay bumaba ng 222 mg/dl from 567 mg/dl. Kung wala ito, malaki po ang gagastusin ko sa pagpapa-ospital. Nagpapasalamat ako sa Panginoon, kay Alvin Yu, at sa Vital C!','Lucena-Marilyn-Sanchez-t.gif',1,0,'2012-07-06 03:40:31'),
	(6,'Flaura Banson Evangelista','76 yrs old | Danao City, Cebu','I have been diagnosed with several ailments. I have Ischemia, hypertension, and a very high level of cholesterol. I had too much fluid in my body that it went into my lungs and it developed into phlegm which is the cause of my pulmonary problem. I could not breathe normally and I am not able to take a walk with such distance. I started taking Vital C which was introduced to me by my sister. I take 2 capsules 3 times a day. In a week?s time, I felt the difference! It was really great. I believe if you have faith in God and in the product, you will recover from your ailments. I am taking Vital C religiously. Now, I can walk with far distance and it?s amazing that I could even take a walk up hill without panting. I had never done it in 2 years when I was under treatment. I am very happy, at the age of 76, with Vital C I feel so much younger. In fact, I feel like 15 years being ?revitalized!? Thank you so much Vital C!','Flaura-Banson-Evangelista-t.gif',1,0,'2012-07-06 03:40:31'),
	(7,'Policarpio E. Fontanilla','49 yrs old | Bansalan, Davao del Sur','My problem is about my arthritis that I have been suffering for 12 years. I am taking pain relievers and even injecting Diclofenac when my feet and knees are swelling and inflamed. July 2009, Vital C was introduced to me by Evan thru Mr. Marc Bo-o. I take 4 capsules per day then I increased my dosage to 15 capsules distributed along the day. I have noticed that the effect was very good. I had also lost weight about 11 kgs. in 3 months. My waist line before was 36, but now it is down to 30. It is important for me to lose weight because my knees and joints are suffering due to arthritis if my body is heavy or not in the normal weight. Now, I feel better and I can say that I don?t suffer from arthritis anymore. I can even jog and have a walking session in the morning. Thank you Vital C!','Policarpio-E.-Fontanilla-t.gif',1,0,'2012-07-06 03:40:31'),
	(8,'Jerry A. Pichon','47 yrs old | Matina, Davao City','I am suffering from stress. Assigned in Davao City Police Office, Investigation Unit in Detective Management Section. I work for 24 hours. We were also directed to receive all the reports from all stations in Davao City. It is a tough job to handle all the reports. I have been taking a lot of vitamins and supplements. Aside from that, I am also suffering from premature ejaculation. I really am having a big problem that I couldn?t even perform my role as a husband. July 2009, my wife introduced me the product Vital C. I gave it a try and have been taking this product. I was surprised by its effect! I had more stamina and strength. I could now adjust and cope with my work even for 24 hours. I can say that my problem with premature ejaculation was minimized and even have a progress of good effect to me. I am very much happy! I was able to face these challenges with the help of Vital C! Thank you Vital C!','Jerry-A.-Pichon-t.gif',1,0,'2012-07-06 03:40:31'),
	(9,'Dr. Amelia S. Arcilla','Catanduanes','Patient 1. One week history of swelling and pain of both ankles and feet. Vital C was prescribed, 1 capsule 4 times daily in 2 days time. Swelling and pain subsided. Patient 2. Male, 47 years old suffering from depression, anxiety, insomia and high blood pressure. Prescribed with Vital C capsule 4 times daily, after 1 week blood pressure went down and became stable to 130/80 (initial BP before Vital C is 160/100), sleep improved, anxiety lessened significantly. Patient 3. 7-yr old male with skin disease or skin asthma. Skin appeared, coarse with white spots, after taking Vital C for 1 month 2 times daily, skin lesions disappeared.','Dr.-Amelia-S.-Arcilla-t.gif',1,0,'2012-07-06 03:40:31'),
	(10,'Romel Zulueta','Lopez, Quezon','Ako po ay nagkasakit sa baga, at may bumukol sa aking kili-kili. Yun ay lumaki ng lumaki! Nung pina-check up ko sa doktor, ang sabi nga ay Cancer. Ako ay hindi na makakain. Kung maka-kain man ako, sinusuka ko lang ito. Kahit na gamot ang iniinom ko, sinusuka ko pa rin! Nung ako ay uminom ng Vital C, may lumalabas na may madumi sa may sugat sa bukol ng aking kili-kili. Patuloy pa rin ang pag inom ko ng Vital C! Habang tumatagal, paliit ng paliit ang bukol. Ngayon ay wala na yung bukol. Ang masasabi ko, ito ay magaling! Sa Vital C lang po ako nabigyan ng pag-asa!','Romel-Zulueta-t.gif',1,0,'2012-07-06 03:40:31'),
	(11,'Diosdada B. Esconde','Licanan, Lasang, Davao City','Ang laki ng aking pasasalamat sa Vital C! Meron akong Breast Cancer (R) III-B at Bronchitis. 9 years na akong naghihirap sa ganitong sakit. Ang pinakamasakit, lumaki po ito, namaga at pumutok. Ang daming dugo at nana (pus) na lumabas. Ang sakit po talaga at hirap na hirap ako sa pag papagamot dahil sa kakulangan ng pera. Ang butas na sugat ng aking breast nung umpisa ay kasing sukat ng 25 sentimong barya (coin) hanggang sa ito ay lumaki. Nung pinasubok sa akin ang Vital C ni Ms. Mary Jane Anillo, agad ko itong ininom! Sinimulan ko ang pag inom ng Vital C ng 15 capsules 3x a day noong June, 2009 hanggang ngayon. Lalong lumabas ang dugo at dumi sa sugat. Hindi ako natakot at tinuloy-tuloy ko ang pag inom! Pagkalipas ng ilang buwan, lumiliit na ang sugat, at ito?y natutuyo. Ang pamamaga ay nawala, ang sugat ay tuluyan nang naghilom! Hinding-hindi ko po makakalimutan ang tulong na naibigay sa akin ng Vital C!','Diosdada-B.-Esconde-t.gif',1,0,'2012-07-06 03:40:31'),
	(12,'Rudito Mendoza','Dollar St., Antipolo City','Year 2002, I had undergone Heart By-Pass operation due to a Complete Heart Block from my Doctor?s findings. I was brought to the Phil. Heart Center and was confined for 7 days. In the operation, I was given a pacemaker. The pacemaker is helping me to have a heartbeat of 60 beats / minute. In the year 2006, my body weakened and I was confined in Medical City. The Doctor?s finding thru 2D-Echo procedure is that I had another Heart Block. I was advised to prepare a big amount of money for Angioplasty procedure. I was financially hard up and I can?t produce that certain amount so I just ignored it. Then, my kidney followed in the year 2007. I was confined at East Ave. Medical Center. I had an infection from urine and it was so frustrating! I met Bro. Mel Ramos and he suggested me to try Vital C. He told me that Vital C already helped a lot of people make their health better. I take 2 capsules / day until now. In a year of taking Vital C, I went back to my attending Physician and had myself checked thru 2D-Echo procedure. ?Nawala na po ang bara sa aking puso! Ang laki ng pasasalamat ko sa Vital C!? With regard to my kidney problem, I had decided to continue taking Vital C because I believe that if it helped me with my Heart Block problem, I?m sure it will also help me with the infection in my urine or kidney problem. After that, I felt everything was normal! I felt better and I felt everything was cleared! Right now, I was able to go back to work as an Auto Mechanic. I can do tasks that are quite heavy in which I never had done before! A big thanks to God and for the people behind and made Vital C!','Rudito-Mendoza-t.gif',1,0,'2012-07-06 03:40:31'),
	(13,'Rey Fernandez','Valenzuela City','I am Rey Fernandez from Valenzuela, Bulacan 58 years old. My eczema dried up after taking Vital C for 2 weeks, 3 capsules, 3 times daily. I felt stronger, I don\'t easily get tired washing cars, body aches and pains are gone. My blood sugar level went down to 171 from 259. My blurry eyesight got clearer. Only 1 box was all I need. I will continue to take Vital C','Rey-Fernandez-t.gif',1,0,'2012-07-06 03:40:31'),
	(14,'Armando H. De Jesus','Talisay City','I had an Acute Myocardial Infarction, commonly known as a Heart Attack, occurs when the blood supply to part of the heart is interrupted. My attending Physicians informed me that there might be a Second Attack which is fatal! I was so scared that time. I started eating the right amount of food, a proper diet and taking 6 capsules of VITAL C everyday! You know what? Sa awa ng Diyos, yung Cholesterol sa Artery na papunta sa Heart ko, Clear! I felt better, had no worries, and had peace of mind! Pwede na akong mag trabaho ulit as a seaman. Daghang Salamat sa VITAL C!','Armando-H.-De-Jesus-t.gif',1,0,'2012-07-06 03:40:45'),
	(15,'Susanita M. Ruiz','49 yrs. old | Mansiungan, Bacolod City.','I am an elementary teacher who has had Bilateral Thyroid cysts since year 2005. It is really hard for me especially in my profession to have this kind of health problem. My students often ask me what happened to my throat because it is swollen. It affects my confidence and my desire to be an effective and a good teacher. A friend of my husband told me that Vital C is good. I gave it a try for 6 months, taking 2 capsules per day and I have observed that the enlargement of the exterior portion of my neck disappeared. Vital C didn?t just help me with my sickness but also gave me back my confidence in practicing my profession. Thank you Vital C!','Susanita-M.-Ruiz-49-yrs.-old-t.gif',1,0,'2012-07-06 03:40:45'),
	(16,'Dan Tan Valles','59 yrs old | Valladolid, Negros Occidental','Noong buwan ng Mayo 2008, ako po ay nagkaroon ng acquired Diabetes. Ako po ay nagulat at ang problema ko ay kung paano mabibigyan ng lunas at prevention sa aking blood sugar na mataas. Ako ay naging isang Distributor ng Vital C dahil nakita ko ang kagandahan ng negosyo at kabuhayan. Iniinom ko ang Vital C ng masubukan ko ang bisa nito. Pagkalipas ng 2 buwan, napansin ko na naging normal ang aking blood sugar. Sobrang natuwa ako at mas madali magbenta at ikwento ang ating produkto kasi ito?y subok ko na! Napakagaling po ng Vital C! Sa Vital C, alam kong hindi lang ako kikita, magiging maganda pa ang aking kalusugan at sa mga pinagbebentahan ko!','Dan-Tan-Valles-t.gif',1,0,'2012-07-06 03:41:09'),
	(17,'Jowersito A. Ibay','47 yrs old | Barangay Pitogo, Makati City','Ako po ay dating may problema sa pamamaga ng aking mga paa dahil nabagsakan ng bakal na ginagamit sa gym ng uncle ko. Ang hirap maglakad at ang hirap din sa pambili ng gamot. Bukod diyan, ako ay nahihirapan sa pananakit ng aking mga buto at tuhod. Bago ko lang nalaman na ako pala ay mayroong Osteopenia. Naririndi ako sa mga dinaranas ko, paulit-ulit ang pamamaga at sakit. Pumunta ako sa St. Francis Free Doctor?s Clinic, sa Ortigas. Ayon kay Dra. Marcos, kailangan ko raw magpasuri sa laboratory at marami siyang referral na ibinigay sa akin. Wala akong kapera-pera noon kaya?t hindi ko rin nagawa iyon. Maraming gamot ang naireseta sa akin. Noong tinanong ko sa mga botika, ito ay may kamahalan. Pumunta ako sa ibang Doktor, pareho lang rin ang mga suggestions niya noong nagpunta ako sa Generic Clinic, sa basement ng Farmer?s Cubao na may free check up. Isang araw, napadaan ako ulit sa St. Francis Free Doctor?s Clinic at nakilala ko si Mr. Manny Cultura. Hindi niya ako personal na kilala subalit sinabi niya sa akin na ?I ? Vital C mo lang iyan!? Sinabi ko na wala akong kapera-pera pambili ng Vital C. Nagkawang gawa siya at binigyan niya ako ng dalawang (2) banig (blister pack) ng Vital C. Noong naubos ko yung binigay niya, nakakapag produce ako ng paisa-isang capsule! Masasabi ko talagang ?effective!? kasi nawala yung pananakit ng paa ko! Yung kuko ng hinlalaki ng aking paa ay tumutubo na, hindi katulad dati. Ngayon, ako ay malakas na! Nakakapaglakad na ako para maghanap ng trabaho. Salamat po sa gumawa ng Vital C at sa taong tumulong sa akin. Salamat at nasubukan ko ang napaka epektibong Vital C! Subukan niyo po!','Jowersito-A.-Ibay-t.gif',1,0,'2012-07-06 03:41:09'),
	(18,'Elda D. Padilla','Luna Ext., Digos City','Isang malaking karangalan po sa akin na magpatotoo sa nagawa sa akin ng Vital C! Inabot po ako ng walong (8) buwan na may ubo. Tinitiis ko ito at nakakaranas ng matinding hirap. Ang dami ng gamot na nainom ko, mga antibiotics, cough syrup at umabot na ako sa punto na uminom ng Prednisone. Nahihiya na ako at di makahalubilo sa mga tao kasi ang akala nila?y mayroon akong TB. Natulungan ako ng gamot na Prednisone na nairekomenda ng pinsan kong Doktor. Subalit ito?y pansamantala lamang at inubo na naman ako ulit! January 2009, may kasama po ako sa simbahan. Sinabi niya na pwede kong subukan ang ?F.C.? at baka makatulong ito sa akin. Nakaubos ako ng 2 boxes subalit walang nangyari. Nabanggit niya rin sa akin ang tungkol sa Vital C, yun nga lang di naming alam saan makakabili nito. Nagkataon nakapakinig ako ng radyo at nabanggit ng announcer ang cellphone number ni Ms. Pearl na Distributor ng Vital C. Tinext ko at pinapa attend niya ako ng VSO at Product Demo sa Toril. Pumunta kami ng asawa ko. Ang ganda ng pagpapaliwanag ni Ms. Claire at kami ay nagdesisyon na bumili ng Vital C. May 8, 2009 nag umpisa akong uminom ng Vital C at gumaling ang aking ubo! Madalas ko itong inumin, 6 - 10 capsules / day. Nakita ko rin ang magandang resulta sa operasyon ng aking asawa na mabilis ang paggaling! Maraming salamat at hindi na bumalik ang ubo ko. Salamat sa Vital C!','Elda-D.-Padilla-t.gif',1,0,'2012-07-06 03:41:09'),
	(19,'Engr. Efren Yap Satorre','I.T. Hardware Engineer, working in Dubai, U.A.E.','Sometime in 2008 while he is still residing in the Philippines, was suffering from pain due to gall stone and numbness in his hands. Aside from those primary complaints, he said, he also had joint pains, a sign of arthritis. He also had back pains and difficulty in urinating. He ignored all these symptoms and brushed them aside as part of aging process, however, when he arrived in Dubai last March 2008 the pain lingered on and intensified. It was getting worse day after day. He then instructed his sister and wife to look for appropriate medicine for the medical problem that he was experiencing.\nHe tried to do some research about all those ailments. His best immediate solution was applying intensive water therapy hoping his kidney problems would be addressed. His contention at that time was that drug based medications have side effects affecting either kidney or liver, so, he believed that taking enough water would help a lot. Due to intense pain, he had then medical laboratory tests complaining about pain in the lumbo sacral area. After the tests, uric acid was found to be high and medication was given but the pain was still there recurring regularly. Then one day he met Cesar Barela talking about the Vital C business. He then purchased Vital C from Mr. Barela and he tried taking Vital C regularly. In May 2010, while working in Dubai, he continued to take Vital C intensively and regularly, and he noticed that pain in all the body joints have disappeared especially at the lumbo-sacral area of the vertebrae. He recommended the Vital C capsules to all his family members including his wife and children. They were all amazed that they became so strong without those lingering pains. Since then until now, all of them are users of Vital C health products.','no.6-t.png',1,0,'2012-07-06 03:41:28');

/*!40000 ALTER TABLE `sm_testimonials` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tr_cards_logging
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tr_cards_logging`;

CREATE TABLE `tr_cards_logging` (
  `card_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `transaction_id` int(11) DEFAULT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `cards_entered` text COLLATE utf8_unicode_ci,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`card_id`),
  KEY `transaction_id` (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table tr_facility_items_receiving
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tr_facility_items_receiving`;

CREATE TABLE `tr_facility_items_receiving` (
  `facility_items_receiving_id` int(11) NOT NULL AUTO_INCREMENT,
  `facility_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `transaction_code` int(11) DEFAULT NULL,
  `qty` decimal(11,2) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `remarks` text COLLATE utf8_unicode_ci,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`facility_items_receiving_id`),
  KEY `facility_id` (`facility_id`,`item_id`),
  KEY `facility_id_2` (`facility_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table tr_facility_items_receiving_view
# ------------------------------------------------------------

DROP VIEW IF EXISTS `tr_facility_items_receiving_view`;

CREATE TABLE `tr_facility_items_receiving_view` (
   `facility_items_receiving_id` INT(11) NOT NULL DEFAULT '0',
   `facility_id` INT(11) DEFAULT NULL,
   `item_id` INT(11) DEFAULT NULL,
   `transaction_code` INT(11) DEFAULT NULL,
   `qty` DECIMAL(11) DEFAULT NULL,
   `unit_id` INT(11) DEFAULT NULL,
   `user_id` INT(11) NOT NULL,
   `remarks` TEXT DEFAULT NULL,
   `insert_timestamp` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
   `item_name` VARCHAR(100) DEFAULT NULL,
   `item_type_id` INT(10) UNSIGNED NOT NULL DEFAULT '0',
   `item_sub_type_id` INT(11) NOT NULL DEFAULT '0',
   `item_type` VARCHAR(100) DEFAULT NULL,
   `item_sub_type` VARCHAR(100) DEFAULT NULL,
   `unit_name` VARCHAR(100) DEFAULT NULL,
   `first_name` VARCHAR(100) NOT NULL,
   `last_name` VARCHAR(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM;



# Dump of table tr_facility_items_releasing
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tr_facility_items_releasing`;

CREATE TABLE `tr_facility_items_releasing` (
  `facility_items_releasing_id` int(11) NOT NULL AUTO_INCREMENT,
  `facility_id` int(11) DEFAULT NULL,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `package_id` int(11) NOT NULL DEFAULT '0',
  `item_id` int(11) DEFAULT NULL,
  `transaction_code` int(11) DEFAULT NULL,
  `qty` decimal(11,2) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `remarks` text COLLATE utf8_unicode_ci,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`facility_items_releasing_id`),
  KEY `facility_id` (`facility_id`,`item_id`),
  KEY `facility_id_2` (`facility_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table tr_facility_items_releasing_view
# ------------------------------------------------------------

DROP VIEW IF EXISTS `tr_facility_items_releasing_view`;

CREATE TABLE `tr_facility_items_releasing_view` (
   `facility_items_releasing_id` INT(11) NOT NULL DEFAULT '0',
   `item_name` VARCHAR(100) DEFAULT NULL,
   `item_type_id` INT(10) UNSIGNED NOT NULL DEFAULT '0',
   `item_sub_type_id` INT(11) NOT NULL DEFAULT '0',
   `item_type` VARCHAR(100) DEFAULT NULL,
   `item_sub_type` VARCHAR(100) DEFAULT NULL,
   `item_id` INT(11) DEFAULT NULL,
   `facility_id` INT(11) DEFAULT NULL,
   `transaction_code` INT(11) DEFAULT NULL,
   `qty` DECIMAL(11) DEFAULT NULL,
   `unit_id` INT(11) DEFAULT NULL,
   `unit_name` VARCHAR(100) DEFAULT NULL,
   `user_id` INT(11) NOT NULL,
   `first_name` VARCHAR(100) NOT NULL,
   `last_name` VARCHAR(100) NOT NULL DEFAULT '',
   `remarks` TEXT DEFAULT NULL,
   `insert_timestamp` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM;



# Dump of table tr_inventory_logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tr_inventory_logs`;

CREATE TABLE `tr_inventory_logs` (
  `inventory_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `table_id` int(11) NOT NULL DEFAULT '0',
  `field_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `old_value` text COLLATE utf8_unicode_ci,
  `new_value` text COLLATE utf8_unicode_ci,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`inventory_log_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table tr_inventory_tracking
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tr_inventory_tracking`;

CREATE TABLE `tr_inventory_tracking` (
  `tracking_id` int(11) NOT NULL AUTO_INCREMENT,
  `tracking_number` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `current_process_type_id` int(11) DEFAULT NULL,
  `current_process_id` int(11) DEFAULT NULL,
  `current_process_status` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `current_step` int(11) DEFAULT NULL,
  `tracking_status` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `update_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`tracking_id`),
  KEY `tracking_number` (`tracking_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table tr_inventory_tracking_processes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tr_inventory_tracking_processes`;

CREATE TABLE `tr_inventory_tracking_processes` (
  `tracking_process_id` int(11) NOT NULL AUTO_INCREMENT,
  `tracking_id` int(11) DEFAULT NULL,
  `tracking_number` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `process_type_id` int(11) DEFAULT NULL,
  `process_id` int(11) DEFAULT NULL,
  `process_number` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tracking_process_status` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `step` int(11) DEFAULT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`tracking_process_id`),
  KEY `tracking_id` (`tracking_id`),
  KEY `tracking_number` (`tracking_number`),
  KEY `tracking_id_2` (`tracking_id`,`process_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table tr_member_acct_credit_points_logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tr_member_acct_credit_points_logs`;

CREATE TABLE `tr_member_acct_credit_points_logs` (
  `credit_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `account_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `card_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from_account_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `side` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `remarks` text COLLATE utf8_unicode_ci,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`credit_log_id`),
  KEY `member_id` (`member_id`),
  KEY `account_id` (`account_id`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table tr_member_acct_debit_points_logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tr_member_acct_debit_points_logs`;

CREATE TABLE `tr_member_acct_debit_points_logs` (
  `debit_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `account_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `card_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `side` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `remarks` text COLLATE utf8_unicode_ci,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`debit_log_id`),
  KEY `member_id` (`member_id`),
  KEY `account_id` (`account_id`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table tr_payment_gateway_transactions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tr_payment_gateway_transactions`;

CREATE TABLE `tr_payment_gateway_transactions` (
  `gateway_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` int(10) unsigned DEFAULT NULL,
  `member_id` int(10) unsigned DEFAULT NULL,
  `total_amount` decimal(10,2) unsigned DEFAULT NULL,
  `payment_gateway` varchar(20) DEFAULT NULL,
  `ip_address` varchar(100) DEFAULT NULL,
  `remarks` varchar(100) DEFAULT NULL,
  `completed_timestamp` timestamp NULL DEFAULT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`gateway_transaction_id`),
  KEY `transaction_id` (`transaction_id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


# Dump of table tr_paypal_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tr_paypal_log`;

CREATE TABLE `tr_paypal_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `log` varchar(4096) DEFAULT NULL,
  `transaction_id` int(11) NOT NULL DEFAULT '0',
  `txn_id` varchar(64) NOT NULL,
  `status` varchar(32) NOT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




# Replace placeholder table for rf_card_types_view with correct view syntax
# ------------------------------------------------------------

DROP TABLE `rf_card_types_view`;
CREATE VIEW `rf_card_types_view`
AS select
   `rf_card_types`.`card_type_id` AS `card_type_id`,
   `rf_card_types`.`code` AS `code`,
   `rf_card_types`.`name` AS `name`,
   `rf_card_series`.`series_number` AS `series_number`,
   `rf_card_types`.`is_package` AS `is_package`,
   `rf_card_types`.`description` AS `description`,
   `rf_card_types`.`insert_timestamp` AS `insert_timestamp`
from (`rf_card_types` left join `rf_card_series` on((`rf_card_types`.`card_type_id` = `rf_card_series`.`card_type_id`)));


# Replace placeholder table for is_product_products_view with correct view syntax
# ------------------------------------------------------------

DROP TABLE `is_product_products_view`;
CREATE VIEW `is_product_products_view`
AS select
   `pp`.`product_id` AS `product_id`,
   `pp`.`child_product_id` AS `child_product_id`,
   `pp`.`quantity` AS `quantity`,
   `p`.`product_name` AS `product_name`,
   `p`.`product_type_id` AS `product_type_id`,
   `p`.`product_line_id` AS `product_line_id`,
   `p`.`item_id` AS `item_id`,
   `p`.`standard_retail_price` AS `standard_retail_price`,
   `p`.`member_price` AS `member_price`,
   `p`.`employee_price` AS `employee_price`,
   `p`.`igpsm_points` AS `igpsm_points`,
   `p`.`is_active` AS `is_active`,
   `p`.`is_display` AS `is_display`,
   `p`.`is_visible` AS `is_visible`,
   `p`.`is_vatable` AS `is_vatable`,
   `p`.`image_filename` AS `image_filename`,
   `pp`.`is_swappable` AS `is_swappable`,
   `pp`.`group` AS `group`,
   `pp`.`group_quantity` AS `group_quantity`,
   `pp`.`insert_timestamp` AS `insert_timestamp`
from (`is_products` `p` join `is_product_products` `pp` on((`p`.`product_id` = `pp`.`child_product_id`)));


# Replace placeholder table for cm_member_vouchers_view with correct view syntax
# ------------------------------------------------------------

DROP TABLE `cm_member_vouchers_view`;
CREATE VIEW `cm_member_vouchers_view`
AS select
   `cm_member_vouchers`.`voucher_id` AS `voucher_id`,
   `cm_member_vouchers`.`voucher_type_id` AS `voucher_type_id`,
   `cm_member_vouchers`.`voucher_code` AS `voucher_code`,
   `cm_member_vouchers`.`confirmation_code` AS `confirmation_code`,
   `cm_member_vouchers`.`redemption_code` AS `redemption_code`,
   `cm_member_vouchers`.`member_id` AS `member_id`,
   `cm_member_vouchers`.`member_code` AS `member_code`,
   `cm_member_vouchers`.`product_id` AS `product_id`,
   `cm_member_vouchers`.`product_text` AS `product_text`,
   `cm_member_vouchers`.`last_name` AS `last_name`,
   `cm_member_vouchers`.`first_name` AS `first_name`,
   `cm_member_vouchers`.`middle_name` AS `middle_name`,
   `cm_member_vouchers`.`email` AS `email`,
   `cm_member_vouchers`.`mobile_number` AS `mobile_number`,
   `cm_members`.`home_address` AS `home_address`,
   `cm_members`.`birthdate` AS `birthdate`,
   `cm_members`.`sex` AS `sex`,
   `cm_members`.`nationality` AS `nationality`,
   `cm_members`.`marital_status` AS `marital_status`,
   `cm_members`.`tin` AS `tin`,
   `cm_members`.`beneficiary1` AS `beneficiary1`,
   `cm_members`.`beneficiary2` AS `beneficiary2`,
   `cm_member_vouchers`.`user_id` AS `user_id`,
   `cm_member_vouchers`.`status` AS `status`,
   `cm_member_vouchers`.`remarks` AS `remarks`,
   `cm_member_vouchers`.`start_timestamp` AS `start_timestamp`,
   `cm_member_vouchers`.`end_timestamp` AS `end_timestamp`,
   `cm_member_vouchers`.`update_timestamp` AS `update_timestamp`,
   `cm_member_vouchers`.`insert_timestamp` AS `insert_timestamp`
from (`cm_member_vouchers` left join `cm_members` on((`cm_members`.`member_id` = `cm_member_vouchers`.`member_id`)));


# Replace placeholder table for ad_user_facilities_view with correct view syntax
# ------------------------------------------------------------

CREATE VIEW `ad_user_facilities_view`
AS select
   `a`.`user_id` AS `user_id`,
   `a`.`facility_id` AS `facility_id`,
   `b`.`facility_name` AS `facility_name`,
   `a`.`is_default` AS `is_default`
from (`ad_user_facilities` `a` left join `is_facilities` `b` on((`a`.`facility_id` = `b`.`facility_id`)));


# Replace placeholder table for rt_facility_item_reports_view with correct view syntax
# ------------------------------------------------------------

DROP TABLE `rt_facility_item_reports_view`;
CREATE VIEW `rt_facility_item_reports_view`
AS select
   `i`.`item_name` AS `item_name`,
   `i`.`item_type_id` AS `item_type_id`,
   `i`.`item_sub_type_id` AS `item_sub_type_id`,
   `fr`.`facility_item_report_id` AS `facility_item_report_id`,
   `fr`.`item_id` AS `item_id`,
   `fr`.`facility_id` AS `facility_id`,
   `fr`.`qty_released` AS `qty_released`,
   `fr`.`qty_received` AS `qty_received`,
   `fr`.`insert_date` AS `insert_date`,
   `it`.`item_type` AS `item_type`,
   `st`.`item_sub_type` AS `item_sub_type`,
   `fi`.`qty` AS `qty`
from ((((`rt_facility_item_reports` `fr` join `is_items` `i`) join `rf_item_types` `it`) join `rf_item_sub_types` `st`) join `is_facility_items` `fi`)
where ((`fr`.`item_id` = `i`.`item_id`) and (`i`.`item_type_id` = `it`.`item_type_id`) and (`i`.`item_sub_type_id` = `st`.`item_sub_type_id`) and (`fi`.`facility_id` = `fr`.`facility_id`) and (`fi`.`item_id` = `fr`.`item_id`));


# Replace placeholder table for is_facility_items_view with correct view syntax
# ------------------------------------------------------------

DROP TABLE `is_facility_items_view`;
CREATE VIEW `is_facility_items_view`
AS select
   `a`.`facility_item_id` AS `facility_item_id`,
   `a`.`facility_id` AS `facility_id`,
   `a`.`item_id` AS `item_id`,
   `b`.`item_name` AS `item_name`,
   `b`.`item_description` AS `item_description`,
   `a`.`qty` AS `qty`,
   `a`.`unit_id` AS `unit_id`,
   `c`.`unit_name` AS `unit_name`,
   `a`.`critical_qty` AS `critical_qty`,
   `a`.`update_timestamp` AS `update_timestamp`,
   `a`.`insert_timestamp` AS `insert_timestamp`
from ((`is_facility_items` `a` left join `is_items` `b` on((`a`.`item_id` = `b`.`item_id`))) left join `is_units` `c` on((`a`.`unit_id` = `c`.`unit_id`)));


# Replace placeholder table for is_products_view with correct view syntax
# ------------------------------------------------------------

DROP TABLE `is_products_view`;
CREATE VIEW `is_products_view`
AS select
   `p`.`product_id` AS `product_id`,(case when ((isnull(`p`.`product_name`) or (`p`.`product_name` = '')) and (`p`.`product_type_id` = 1)) then `i`.`item_name` else `p`.`product_name` end) AS `product_name`,
   `p`.`product_type_id` AS `product_type_id`,
   `p`.`product_line_id` AS `product_line_id`,(case when ((isnull(`p`.`product_code`) or (`p`.`product_code` = '')) and (`p`.`product_type_id` = 1)) then `i`.`item_code` else `p`.`product_code` end) AS `product_code`,(case when ((isnull(`p`.`product_description`) or (`p`.`product_description` = '')) and (`p`.`product_type_id` = 1)) then `i`.`item_description` else `p`.`product_description` end) AS `product_description`,
   `r`.`product_line` AS `product_line`,
   `p`.`item_id` AS `item_id`,
   `i`.`item_name` AS `item_name`,
   `i`.`item_description` AS `item_description`,
   `p`.`image_filename` AS `image_filename`,
   `p`.`standard_retail_price` AS `standard_retail_price`,
   `p`.`member_price` AS `member_price`,
   `p`.`employee_price` AS `employee_price`,
   `p`.`igpsm_points` AS `igpsm_points`,
   `i`.`item_type_id` AS `item_type_id`,
   `i`.`item_sub_type_id` AS `item_sub_type_id`,
   `i`.`sub_category` AS `sub_category`,
   `p`.`is_active` AS `is_active`,
   `p`.`is_display` AS `is_display`,
   `p`.`is_visible` AS `is_visible`,
   `p`.`is_vatable` AS `is_vatable`,
   `p`.`insert_timestamp` AS `insert_timestamp`
from ((`is_products` `p` left join `is_items` `i` on((`p`.`item_id` = `i`.`item_id`))) left join `rf_product_lines` `r` on((`p`.`product_line_id` = `r`.`product_line_id`)));


# Replace placeholder table for tr_facility_items_releasing_view with correct view syntax
# ------------------------------------------------------------

DROP TABLE `tr_facility_items_releasing_view`;
CREATE VIEW `tr_facility_items_releasing_view`
AS select
   distinct `fr`.`facility_items_releasing_id` AS `facility_items_releasing_id`,
   `i`.`item_name` AS `item_name`,
   `i`.`item_type_id` AS `item_type_id`,
   `i`.`item_sub_type_id` AS `item_sub_type_id`,
   `it`.`item_type` AS `item_type`,
   `st`.`item_sub_type` AS `item_sub_type`,
   `fr`.`item_id` AS `item_id`,
   `fr`.`facility_id` AS `facility_id`,
   `fr`.`transaction_code` AS `transaction_code`,
   `fr`.`qty` AS `qty`,
   `fr`.`unit_id` AS `unit_id`,
   `u`.`unit_name` AS `unit_name`,
   `fr`.`user_id` AS `user_id`,
   `ur`.`first_name` AS `first_name`,
   `ur`.`last_name` AS `last_name`,
   `fr`.`remarks` AS `remarks`,
   `fr`.`insert_timestamp` AS `insert_timestamp`
from ((((((`tr_facility_items_releasing` `fr` join `is_items` `i`) join `rf_item_types` `it`) join `rf_item_sub_types` `st`) join `is_facility_items` `fi`) join `is_units` `u`) join `ad_users` `ur`)
where ((`fr`.`item_id` = `i`.`item_id`) and (`i`.`item_type_id` = `it`.`item_type_id`) and (`i`.`item_sub_type_id` = `st`.`item_sub_type_id`) and (`fr`.`unit_id` = `u`.`unit_id`) and (`fr`.`user_id` = `ur`.`user_id`));


# Replace placeholder table for ad_user_privileges_view with correct view syntax
# ------------------------------------------------------------

DROP TABLE `ad_user_privileges_view`;
CREATE VIEW `ad_user_privileges_view`
AS select
   `a`.`user_id` AS `user_id`,
   `a`.`privilege_id` AS `privilege_id`,
   `b`.`privilege_code` AS `privilege_code`,
   `b`.`privilege_description` AS `privilege_description`,
   `b`.`privilege_uri` AS `privilege_uri`,
   `a`.`insert_timestamp` AS `insert_timestamp`
from (`ad_user_privileges` `a` left join `ad_privileges` `b` on((`a`.`privilege_id` = `b`.`privilege_id`)));


# Replace placeholder table for tr_facility_items_receiving_view with correct view syntax
# ------------------------------------------------------------

DROP TABLE `tr_facility_items_receiving_view`;
CREATE VIEW `tr_facility_items_receiving_view`
AS select
   `tr`.`facility_items_receiving_id` AS `facility_items_receiving_id`,
   `tr`.`facility_id` AS `facility_id`,
   `tr`.`item_id` AS `item_id`,
   `tr`.`transaction_code` AS `transaction_code`,
   `tr`.`qty` AS `qty`,
   `tr`.`unit_id` AS `unit_id`,
   `tr`.`user_id` AS `user_id`,
   `tr`.`remarks` AS `remarks`,
   `tr`.`insert_timestamp` AS `insert_timestamp`,
   `i`.`item_name` AS `item_name`,
   `i`.`item_type_id` AS `item_type_id`,
   `i`.`item_sub_type_id` AS `item_sub_type_id`,
   `it`.`item_type` AS `item_type`,
   `st`.`item_sub_type` AS `item_sub_type`,
   `u`.`unit_name` AS `unit_name`,
   `ur`.`first_name` AS `first_name`,
   `ur`.`last_name` AS `last_name`
from (((((`tr_facility_items_receiving` `tr` join `is_items` `i`) join `rf_item_types` `it`) join `rf_item_sub_types` `st`) join `is_units` `u`) join `ad_users` `ur`)
where ((`tr`.`item_id` = `i`.`item_id`) and (`i`.`item_type_id` = `it`.`item_type_id`) and (`i`.`item_sub_type_id` = `st`.`item_sub_type_id`) and (`tr`.`unit_id` = `u`.`unit_id`) and (`tr`.`user_id` = `ur`.`user_id`));

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

# Dump of table tr_member_acct_credit_logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tr_member_acct_credit_logs`;
CREATE TABLE `tr_member_acct_credit_logs` (
  `credit_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `account_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `card_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from_account_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_code` INT NOT NULL DEFAULT 0,
  `type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `remarks` text COLLATE utf8_unicode_ci,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`credit_log_id`),
  KEY `member_id` (`member_id`),
  KEY `account_id` (`account_id`),
  KEY `card_id` (`card_id`),
  KEY `transaction_code` (`transaction_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table tr_member_acct_debit_points_logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tr_member_acct_debit_logs`;

CREATE TABLE `tr_member_acct_debit_logs` (
  `debit_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `account_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `card_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_code` INT NOT NULL DEFAULT 0,
  `type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `remarks` text COLLATE utf8_unicode_ci,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`debit_log_id`),
  KEY `member_id` (`member_id`),
  KEY `card_id` (`card_id`),
  KEY `account_id` (`account_id`),
  KEY `transaction_code` (`transaction_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table tr_member_funds_credit_logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tr_member_funds_credit_logs`;

CREATE TABLE `tr_member_funds_credit_logs` (
  `credit_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `remarks` text COLLATE utf8_unicode_ci,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`credit_log_id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table tr_member_funds_debit_logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tr_member_funds_debit_logs`;

CREATE TABLE `tr_member_funds_debit_logs` (
  `debit_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `remarks` text COLLATE utf8_unicode_ci,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`debit_log_id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS tr_member_logs;
CREATE TABLE IF NOT EXISTS tr_member_logs (
	member_action_id INT AUTO_INCREMENT,
	member_id INT,
	remarks TEXT,
	insert_timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY(member_action_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS rf_transaction_codes;
CREATE TABLE rf_transaction_codes(
	transaction_code INT,
	transaction_description VARCHAR(100),
	PRIMARY KEY (transaction_code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO rf_transaction_codes (transaction_code, transaction_description)
VALUES
	(100,'Referral Bonus'),
	(101,'SP Pairing Bonus'),
	(102,'VP Pairing Bonus'),
	(103,'TP Pairing Bonus'),
	(104,'RS Pairing Bonus'),
	(105,'Unilevel Commission'),
	(106,'SP Gift Cheque'),
	(107,'VP Gift Cheque'),
	(108,'TP Gift Cheque'),
	(109,'RS Gift Cheque'),
	(200,'Process Referral Bonus'),
	(201,'Process SP Pairing Bonus'),
	(202,'Process VP Pairing Bonus'),
	(203,'Process TP Pairing Bonus'),
	(204,'Process RS Pairing Bonus'),
	(205,'Process RS Unilevel Commission'),
	(206,'Process SP Gift Cheque'),
	(207,'Process VP Gift Cheque'),
	(208,'Process TP Gift Cheque'),
	(209,'Process RS Gift Cheque');


DROP TABLE IF EXISTS cm_member_commissions;

DROP TABLE IF EXISTS cm_member_earnings;
CREATE TABLE cm_member_earnings(
	earning_id INT AUTO_INCREMENT,
	member_id INT,
	account_id VARCHAR(64) DEFAULT NULL,
	referral_bonus DECIMAL(10,2) NOT NULL DEFAULT 0,
	pairing_bonus_sp DECIMAL(10,2) NOT NULL DEFAULT 0,
	gift_cheque_sp DECIMAL(10,2) NOT NULL DEFAULT 0,
	pairing_bonus_vp DECIMAL(10,2) NOT NULL DEFAULT 0,
	gift_cheque_vp DECIMAL(10,2) NOT NULL DEFAULT 0,
	pairing_bonus_tp DECIMAL(10,2) NOT NULL DEFAULT 0,
	gift_cheque_tp DECIMAL(10,2) NOT NULL DEFAULT 0,
	pairing_bonus_rs DECIMAL(10,2) NOT NULL DEFAULT 0,
	gift_cheque_rs DECIMAL(10,2) NOT NULL DEFAULT 0,
	unilevel_commission DECIMAL(10,2) NOT NULL DEFAULT 0,
	PRIMARY KEY (earning_id),
	KEY (member_id),
	KEY (account_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `rt_payment_transactions` (
  `transaction_id` int(11) NOT NULL,
  `transaction_code` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `transaction_type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `rate_to_use` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `facility_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0',
  `fullname` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `subtotal_amount` decimal(11,2) NOT NULL DEFAULT '0.00',
  `total_amount` decimal(11,2) NOT NULL DEFAULT '0.00',
  `transaction_detail_id` int(11) NOT NULL,
  `payment_method` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` decimal(11,2) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `discount_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `discount_value` decimal(10,2) NOT NULL DEFAULT '0.00',
  `amount_to_discount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `completed_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS tr_admin_logs;
CREATE TABLE tr_admin_logs(
	log_id INT AUTO_INCREMENT,
	user_id INT,
	module_name VARCHAR(100),
	table_name VARCHAR(100),
	action VARCHAR(100),
	details_before TEXT,
	details_after TEXT,
	remarks TEXT,
	insert_timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (log_id),
	KEY (user_id),
	KEY (module_name),
	KEY (action)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS tr_inventory_logs;
CREATE TABLE tr_inventory_logs(
	log_id INT AUTO_INCREMENT,
	user_id INT,
	module_name VARCHAR(100),
	table_name VARCHAR(100),
	action VARCHAR(100),
	details_before TEXT,
	details_after TEXT,
	remarks TEXT,
	insert_timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (log_id),
	KEY (user_id),
	KEY (module_name),
	KEY (action)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS tr_member_logs;
CREATE TABLE tr_member_logs(
	log_id INT AUTO_INCREMENT,
	member_id INT NOT NULL DEFAULT 0,
	module_name VARCHAR(100),
	table_name VARCHAR(100),
	action VARCHAR(100),
	details_before TEXT,
	details_after TEXT,
	remarks TEXT,
	insert_timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (log_id),
	KEY (member_id),
	KEY (module_name),
	KEY (action)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#-- Create rs card and sp cards table
#
#DROP TABLE IF EXISTS is_rs_cards;
#CREATE TABLE IF NOT EXISTS is_rs_cards(
#	rs_card_id INT AUTO_INCREMENT,
#	card_id VARCHAR(64),
#	card_code VARCHAR(64),
#	status VARCHAR(64) NOT NULL DEFAULT 'INACTIVE',
#	type VARCHAR(64),	
#	member_id INT NOT NULL DEFAULT 0,
#	released_to VARCHAR(100),
#	issued_to VARCHAR(100),
#	user_id INT NOT NULL DEFAULT 0,
#	used_timestamp TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',	
#	released_timestamp TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',	
#	issued_timestamp TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',	
#	activate_timestamp TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
#	insert_timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
#	PRIMARY KEY (rs_card_id),
#	KEY (card_id),
#	KEY (card_code),
#	KEY (member_id)
#) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#DROP TABLE IF EXISTS is_sp_cards;
#CREATE TABLE IF NOT EXISTS is_sp_cards(
#	sp_card_id INT AUTO_INCREMENT,
#	card_id VARCHAR(64),
#	card_code VARCHAR(64),
#	status VARCHAR(64) NOT NULL DEFAULT 'INACTIVE',
#	type VARCHAR(64),	
#	member_id INT NOT NULL DEFAULT 0,
#	released_to VARCHAR(100),
#	issued_to VARCHAR(100),
#	user_id INT NOT NULL DEFAULT 0,
#	used_timestamp TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',	
#	released_timestamp TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',	
#	issued_timestamp TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',	
#	activate_timestamp TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
#	insert_timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
#	PRIMARY KEY (sp_card_id),
#	KEY (card_id),
#	KEY (card_code),
#	KEY (member_id)
#) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `sm_announcements`;
CREATE TABLE `sm_announcements` (
  `announcement_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `is_published` tinyint(4) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `update_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`announcement_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `sm_announcements` (`announcement_id`, `title`, `body`, `is_published`, `user_id`, `update_timestamp`, `insert_timestamp`)
VALUES
	(1, 'Monthly Maintenance Policies', '<p style=\"font-family: \'Calibri\',\'sans-serif\'; font-size: 11pt; text-align: left;\"><span style=\"font-size: large;\"><strong><span style=\"color: #000000;\">FROM: THE MANAGEMENT COMMITTEE</span></strong></span><br /><span style=\"font-size: large;\"><strong><span style=\"color: #000000;\">Effective April 01, 2010, the company will implement the following monthly maintenance policies:</span></strong></span></p>\n<p style=\"font-family: \'Calibri\',\'sans-serif\'; font-size: 11pt; text-align: left;\"><span style=\"color: #000000;\">1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; On the first day of each month starting April 1, 2010, all accounts will be placed on the inactive list immediately after the processing of the previous month&rsquo;s Unilevel Commissions. For example on April 1, 2010, after the processing of the March 2010 Unilevel Commissions, all the status of your accounts will be INACTIVE.</span></p>\n<p style=\"font-family: \'Calibri\',\'sans-serif\'; font-size: 11pt; text-align: left;\"><span style=\"color: #000000;\">2.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Your accounts will only be active and eligible for commissions only from the date of the encoding of your monthly maintenance of the two boxes until the end of the same month.</span></p>\n<p style=\"font-family: \'Calibri\',\'sans-serif\'; font-size: 11pt; text-align: left;\"><span style=\"color: #000000;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; For example: April 2010.</span></p>\n<ul style=\"font-family: \'Calibri\',\'sans-serif\'; font-size: 11pt; text-align: left;\">\n<ul>\n<li style=\"font-family: \'Calibri\',\'sans-serif\'; font-size: 11pt;\">\n<p style=\"font-family: \'Calibri\',\'sans-serif\'; font-size: 11pt;\"><span style=\"color: #000000;\">If you will maintain your account on April 2, 2010, then your account is eligible for commissions for all payout cutoffs from April 2 to 30, 2010. These are March 27 &ndash; April 2, April 3 &ndash; 9, April 10 &ndash; 16, April 17 &ndash; 23 and April 24 &ndash; 30.</span></p>\n</li>\n<li style=\"font-family: \'Calibri\',\'sans-serif\'; font-size: 11pt;\">\n<p style=\"font-family: \'Calibri\',\'sans-serif\'; font-size: 11pt;\"><span style=\"color: #000000;\">If you will encode your monthly maintenance on April 15, 2010, you are active and eligible for commissions for all payout cutoffs from April 15 to 30 only. These are April 10 &ndash; 16, April 17 &ndash; 23 and April 24 &ndash; 30. You will forfeit all commissions for payout cutoffs March 27 &ndash; April 2 and April 3 &ndash; 9.</span></p>\n</li>\n<li style=\"font-family: \'Calibri\',\'sans-serif\'; font-size: 11pt;\">\n<p style=\"font-family: \'Calibri\',\'sans-serif\'; font-size: 11pt;\"><span style=\"color: #000000;\">If you will decide to encode on April 3, 2010, you will forfeit your commissions for the cutoff March 27, 2010 &ndash; April 2, 2010.</span></p>\n</li>\n<li style=\"font-family: \'Calibri\',\'sans-serif\'; font-size: 11pt;\">\n<p style=\"font-family: \'Calibri\',\'sans-serif\'; font-size: 11pt;\"><span style=\"color: #000000;\">&nbsp;If you will opt to maintain on April 30, 2010, you will only get your commissions for the payout April 24 &ndash; 30, 2010.</span></p>\n</li>\n</ul>\n</ul>\n<p style=\"font-family: \'Calibri\',\'sans-serif\'; font-size: 11pt; text-align: left;\"><span style=\"color: #000000;\">3.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; All distributors who encoded 2 boxes in March 2010 under the previous monthly maintenance procedure will be considered as active and eligible for commissions for the whole month of April 2010.</span></p>\n<p style=\"font-family: \'Calibri\',\'sans-serif\'; font-size: 11pt; text-align: left;\"><span style=\"color: #000000;\">However if these same distributors will encode 2 boxes in April 2010, these will still be considered for April 2010 only and will not extend to May 2010.</span></p>\n<p style=\"font-family: \'Calibri\',\'sans-serif\'; font-size: 11pt; text-align: left;\"><span style=\"color: #000000;\">4.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; For new accounts that will be encoded from the first day to the 15<sup>th</sup> day of the month, their first monthly maintenance will be on the first week of the following month. Whereas, accounts that will be registered between the 16<sup>th</sup> to the end of the month, will have their first maintenance on the first week of the 2<sup>nd</sup> month.</span></p>\n<p style=\"font-family: \'Calibri\',\'sans-serif\'; font-size: 11pt; text-align: left;\"><span style=\"color: #000000;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; For example:</span></p>\n<ul style=\"font-family: \'Calibri\',\'sans-serif\'; font-size: 11pt; text-align: left;\">\n<ul>\n<li style=\"font-family: \'Calibri\',\'sans-serif\'; font-size: 11pt;\">\n<p style=\"font-family: \'Calibri\',\'sans-serif\'; font-size: 11pt;\"><span style=\"color: #000000;\">A new account will be encoded between April 1 and 15, the first monthly maintenance will be on or before May 7, 2010 (May 1 &ndash; 7 cutoff). If it will be registered between April 16 and 30, the first monthly maintenance will be on or before June 4, 2010 (May 29 &ndash; June 4, 2010 cutoff).</span></p>\n</li>\n</ul>\n</ul>\n<p style=\"font-family: \'Calibri\',\'sans-serif\'; font-size: 11pt; text-align: left;\"><span style=\"color: #000000;\"><strong>5.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong><strong> Monthly maintenance does not ensure &ldquo;ACTIVE&rdquo; status at all times. All distributors should also check their annual renewal compliance.</strong></span></p>\n<p style=\"font-family: \'Calibri\',\'sans-serif\'; font-size: 11pt; text-align: left;\"><span style=\"color: #000000;\"><strong>6.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong><strong> IGNORANCE OF THE ABOVE POLICIES IS NOT AN EXCUSE FOR EXCEPTION.</strong></span></p>\n<p style=\"font-family: \'Calibri\',\'sans-serif\'; font-size: 11pt; text-align: left;\"><span style=\"color: #000000;\">For your queries and clarifications, please coordinate with your respective DEPOT General Managers.</span></p>', 1, 1, '2012-11-16 09:28:42', '2012-11-16 16:46:26');

DROP TABLE IF EXISTS `sm_featured`;

CREATE TABLE `sm_featured` (
  `featured_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL DEFAULT '',
  `title` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sub_title` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8_unicode_ci,
  `body` text COLLATE utf8_unicode_ci,
  `bg_color` varchar(10) NOT NULL DEFAULT '',
  `tags` text COLLATE utf8_unicode_ci,
  `is_published` tinyint(4) NOT NULL DEFAULT '0',
  `image_filename` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `start_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`featured_id`),
  KEY `user_id` (`user_id`),
  KEY `update_timestamp` (`update_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO `sm_featured` (`featured_id`, `type`, `title`, `sub_title`, `excerpt`, `body`, `tags`, `is_published`, `image_filename`, `user_id`, `start_date`, `end_date`, `update_timestamp`, `insert_timestamp`) VALUES
(1, 'news', 'Vital R5', 'Vital R5', 'The signs of aging may be written on your face but if you look more carefully, the problem goes skin deep. Aside from common complaints like wrinkles, dull complexion and sagging skin, the ravages of time may manifest in other ways. Your hair and nails might become more brittle. Wounds would start to heal slower. Joints and muscles would begin to ache more often. The pain of osteoarthritis, a degenerative joint disease caused by the breakdown and loss of cartilage, would keep you from leading a more active lifestyle. The onset of fatigue would come sooner that suddenly, you’re tired for most of the day. Your energy drops and your confidence follows suit. Eventually, you will be left to wonder where your youthful vibrancy went.', '<strong><a href="http://www.vital-c.com/main/wp-content/uploads/2010/07/vital_r5.jpg"><img class="alignleft size-full wp-image-156" title="vital_r5" src="http://www.vital-c.com/main/wp-content/uploads/2010/07/vital_r5.jpg" alt="" width="220" height="150" /></a>“Dare to defy aging”</strong>\n\nThe signs of aging may be written on your face but if you look more carefully, the problem goes skin deep. Aside from common complaints like wrinkles, dull complexion and sagging skin, the ravages of time may manifest in other ways. Your hair and nails might become more brittle. Wounds would start to heal slower. Joints and muscles would begin to ache more often. The pain of osteoarthritis, a degenerative joint disease caused by the breakdown and loss of cartilage, would keep you from leading a more active lifestyle. The onset of fatigue would come sooner that suddenly, you’re tired for most of the day. Your energy drops and your confidence follows suit. Eventually, you will be left to wonder where your youthful vibrancy went.\n\nThese telltale signs of aging may appear when the body decreases collagen production. Collagen is a fibrous protein that makes up the support system for several body tissues such as bones, tendons, cartilage, muscles, skin and various organs like kidneys. It provides our body tissues form, strength and flexibility. Collagen is crucial in maintain the external structure of cells. It encourages bone health, strengthens the blood vessels and cartilage, and preserves skin elasticity, thus promoting smooth, tight and supple skin.\n\nCollagen is a naturally occurring bodily component that we produce in abundance when we are young. Hence, youthful skin is wrinkle-free, firm and elastic. But as we get older, our body’s ability to manufacture collagen slows down. And like most things, collagen is subject to wear and tear. It breaks down over time, and as we age, our body’s ability to replace lost or damaged collagen is reduced and more irregularities and complications develop. Studies show that from 25 years old onwards, collagen reduces at a rate of 1.5%, taking into account the effects of diet, lifestyle and pollution which speed the reduction even further.\n\nScientists have been trying to unlock the secrets of aging for years. Among their findings show that replenishing the level of collagen in the body can help delay the aging process. Proper, safe and effective supplementation may compensate for collagen loss, thus promoting a more youthful appearance and renewed vigour.\n\n<strong>Vital R5</strong>\n\nA product of breakthrough research and state-of-the-art Japanese technology, Vital R5 leads the pack in the fight against aging. It contains Amino Acid Fish Collagen, a potent and highly absorbable source of collagen that replenishes collagen stores which diminish with age.\n\nThis “youth elixir” also contains key ingredients that support collagen production, promote healthier joints and cartilage, improve circulation, and reveal radiant younger looking skin.\n\n<strong>Hyaluronic Acid</strong> – A key component of collagen. It has been called a “space filler” or support scaffolding for living cells because it helps hold cells in place. It is essential in healing wounds, hydrating the skin and addressing wrinkles and other dermatological problems. It also acts as a cushion and lubricant in the joints and connective tissues. It helps keep the cushion between bones (cartilage) from wearing away, thus preventing degenerative joint disease.\n\nGlucosamine – Assists in rebuilding and strengthening cartilage, slows the progression of osteoarthritis, and eases pain particularly in weight-bearing joints such as knees, hips, and hands.\n\n<strong>Arginine</strong> – An amino acid that improves blood flow and circulation by changing into nitric oxide, a chemical that causes blood vessels to relax. Early evidence suggests Arginine may help treat vascular complications like chest pains, clogged arteries, coronary artery disease, heart failure, erectile dysfunction and vascular headaches. It is also associated with rapid wound healing and greater collagen synthesis.\n\n<strong>Ascorbic Acid (Vitamin C)</strong> – An antioxidant noted for its cell protection properties. It is integral in collagen formation. Without Vitamin C, the collagen produced is defective and weak which may lead to bleeding gums, skin discoloration and painful joints. Collagen coupled with Vitamin C is essential for healthy skin, tissues, cartilage, bones and teeth.\n<h3><span style="color: #ff6600;">The Power of Vital R5</span></h3>\nREBUILDS damaged skin, hair, nails and joints.\nRESTORES lost collagen, making skin firmer, smoother and lifted.\nRENEWS skin’s dewy youthful appearance and helps reduce wrinkles.\nREJUVENATES tired aching joints and strengthens ligaments.\nREINVIGORATES cell health for more efficient transport of nutrients and better elimination of toxins.\n\nWith a daily dose of Vital R5, beauty and vitality will come to you at any age.\n\nDirections: Take atleast a teaspoon of Vital R5 three times daily with coffee, juices or water. Drink lots of liquids for faster dissolution.\n\n<strong>SIDE EFFECTS:</strong>\nThere are no known side effects from ingesting collagen. In fact, Japan has been using collagen for 25 years as an anti-aging dietary supplement.\n\nHigh doses of glucosamine may cause stomach upset, heartburn, indigestion, gas, bloating, and diarrhea, particularly for those with peptic ulcer. Glucosamine should be taken with food to avoid these effects. People with shellfish allergies must consult their healthcare professional before taking glucosamine because it may contain shellfish product. Glucosamine is not recommended for pregnant and breastfeeding women and diabetics.\n\nHyaluronic Acid is proven safe when ingested but may cause rashes in rare instances.\n\nArginine is well tolerated by most people in studies lasting up to six months. Potential side effects include:\n\n* <a href="http://www.webmd.com/digestive-disorders/abdominal-pain" target="_blank">abdominal pain</a>\n* <a href="http://www.webmd.com/heartburn-gerd/tc/gas-bloating-and-burping-topic-overview" target="_blank">bloating</a>\n* <a href="http://www.webmd.com/digestive-disorders/digestive-diseases-diarrhea" target="_blank">diarrhea</a>, and\n* <a href="http://www.webmd.com/a-to-z-guides/gout-topic-overview" target="_blank">gout</a>.\n\nIt may also aggravate <a href="http://www.webmd.com/asthma/default.htm" target="_blank">asthma</a> when inhaled. Arginine may interact with certain antihypertensive, cardiac and erectile dysfunction medication.', 'vital c, vital r5, new product', 1, NULL, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-07-05 01:19:23'),
(2, 'news', 'Vital C', 'Vital C', 'The signs of aging may be written on your face but if you look more carefully, the problem goes skin deep. Aside from common complaints like wrinkles, dull complexion and sagging skin, the ravages of time may manifest in other ways. Your hair and nails might become more brittle. Wounds would start to heal slower. Joints and muscles would begin to ache more often. The pain of osteoarthritis, a degenerative joint disease caused by the breakdown and loss of cartilage, would keep you from leading a more active lifestyle. The onset of fatigue would come sooner that suddenly, you’re tired for most of the day. Your energy drops and your confidence follows suit. Eventually, you will be left to wonder where your youthful vibrancy went.', '<strong><a href="http://www.vital-c.com/main/wp-content/uploads/2010/07/vital_r5.jpg"><img class="alignleft size-full wp-image-156" title="vital_r5" src="http://www.vital-c.com/main/wp-content/uploads/2010/07/vital_r5.jpg" alt="" width="220" height="150" /></a>“Dare to defy aging”</strong>\n\nThe signs of aging may be written on your face but if you look more carefully, the problem goes skin deep. Aside from common complaints like wrinkles, dull complexion and sagging skin, the ravages of time may manifest in other ways. Your hair and nails might become more brittle. Wounds would start to heal slower. Joints and muscles would begin to ache more often. The pain of osteoarthritis, a degenerative joint disease caused by the breakdown and loss of cartilage, would keep you from leading a more active lifestyle. The onset of fatigue would come sooner that suddenly, you’re tired for most of the day. Your energy drops and your confidence follows suit. Eventually, you will be left to wonder where your youthful vibrancy went.\n\nThese telltale signs of aging may appear when the body decreases collagen production. Collagen is a fibrous protein that makes up the support system for several body tissues such as bones, tendons, cartilage, muscles, skin and various organs like kidneys. It provides our body tissues form, strength and flexibility. Collagen is crucial in maintain the external structure of cells. It encourages bone health, strengthens the blood vessels and cartilage, and preserves skin elasticity, thus promoting smooth, tight and supple skin.\n\nCollagen is a naturally occurring bodily component that we produce in abundance when we are young. Hence, youthful skin is wrinkle-free, firm and elastic. But as we get older, our body’s ability to manufacture collagen slows down. And like most things, collagen is subject to wear and tear. It breaks down over time, and as we age, our body’s ability to replace lost or damaged collagen is reduced and more irregularities and complications develop. Studies show that from 25 years old onwards, collagen reduces at a rate of 1.5%, taking into account the effects of diet, lifestyle and pollution which speed the reduction even further.\n\nScientists have been trying to unlock the secrets of aging for years. Among their findings show that replenishing the level of collagen in the body can help delay the aging process. Proper, safe and effective supplementation may compensate for collagen loss, thus promoting a more youthful appearance and renewed vigour.\n\n<strong>Vital R5</strong>\n\nA product of breakthrough research and state-of-the-art Japanese technology, Vital R5 leads the pack in the fight against aging. It contains Amino Acid Fish Collagen, a potent and highly absorbable source of collagen that replenishes collagen stores which diminish with age.\n\nThis “youth elixir” also contains key ingredients that support collagen production, promote healthier joints and cartilage, improve circulation, and reveal radiant younger looking skin.\n\n<strong>Hyaluronic Acid</strong> – A key component of collagen. It has been called a “space filler” or support scaffolding for living cells because it helps hold cells in place. It is essential in healing wounds, hydrating the skin and addressing wrinkles and other dermatological problems. It also acts as a cushion and lubricant in the joints and connective tissues. It helps keep the cushion between bones (cartilage) from wearing away, thus preventing degenerative joint disease.\n\nGlucosamine – Assists in rebuilding and strengthening cartilage, slows the progression of osteoarthritis, and eases pain particularly in weight-bearing joints such as knees, hips, and hands.\n\n<strong>Arginine</strong> – An amino acid that improves blood flow and circulation by changing into nitric oxide, a chemical that causes blood vessels to relax. Early evidence suggests Arginine may help treat vascular complications like chest pains, clogged arteries, coronary artery disease, heart failure, erectile dysfunction and vascular headaches. It is also associated with rapid wound healing and greater collagen synthesis.\n\n<strong>Ascorbic Acid (Vitamin C)</strong> – An antioxidant noted for its cell protection properties. It is integral in collagen formation. Without Vitamin C, the collagen produced is defective and weak which may lead to bleeding gums, skin discoloration and painful joints. Collagen coupled with Vitamin C is essential for healthy skin, tissues, cartilage, bones and teeth.\n<h3><span style="color: #ff6600;">The Power of Vital R5</span></h3>\nREBUILDS damaged skin, hair, nails and joints.\nRESTORES lost collagen, making skin firmer, smoother and lifted.\nRENEWS skin’s dewy youthful appearance and helps reduce wrinkles.\nREJUVENATES tired aching joints and strengthens ligaments.\nREINVIGORATES cell health for more efficient transport of nutrients and better elimination of toxins.\n\nWith a daily dose of Vital R5, beauty and vitality will come to you at any age.\n\nDirections: Take atleast a teaspoon of Vital R5 three times daily with coffee, juices or water. Drink lots of liquids for faster dissolution.\n\n<strong>SIDE EFFECTS:</strong>\nThere are no known side effects from ingesting collagen. In fact, Japan has been using collagen for 25 years as an anti-aging dietary supplement.\n\nHigh doses of glucosamine may cause stomach upset, heartburn, indigestion, gas, bloating, and diarrhea, particularly for those with peptic ulcer. Glucosamine should be taken with food to avoid these effects. People with shellfish allergies must consult their healthcare professional before taking glucosamine because it may contain shellfish product. Glucosamine is not recommended for pregnant and breastfeeding women and diabetics.\n\nHyaluronic Acid is proven safe when ingested but may cause rashes in rare instances.\n\nArginine is well tolerated by most people in studies lasting up to six months. Potential side effects include:\n\n* <a href="http://www.webmd.com/digestive-disorders/abdominal-pain" target="_blank">abdominal pain</a>\n* <a href="http://www.webmd.com/heartburn-gerd/tc/gas-bloating-and-burping-topic-overview" target="_blank">bloating</a>\n* <a href="http://www.webmd.com/digestive-disorders/digestive-diseases-diarrhea" target="_blank">diarrhea</a>, and\n* <a href="http://www.webmd.com/a-to-z-guides/gout-topic-overview" target="_blank">gout</a>.\n\nIt may also aggravate <a href="http://www.webmd.com/asthma/default.htm" target="_blank">asthma</a> when inhaled. Arginine may interact with certain antihypertensive, cardiac and erectile dysfunction medication.', 'vital c, vital r5, new product', 1, NULL, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-07-05 02:00:37'),
(3, 'event', 'Vital C Sales Orientation - Tarlac City', '', 'Group Name: HI-ENERGY&lt;br /&gt;\n\nVenue: Jollibee Tarlac City &lt;br /&gt;\n\nDate: July 01, 2012\n\nTime: 1:00pm', '<p>Group Name:<strong>&nbsp;HI-ENERGY</strong></p>\n<p>Venue:<strong>&nbsp;Jollibee Tarlac City</strong></p>\n<p>Date:&nbsp;<strong>July 01, 2012</strong></p>\n<p>Time:<strong>&nbsp;1:00pm</strong></p>', 'vitalc, tarlac, orientation', 1, NULL, 3, '2012-07-01 21:00:00', '0000-00-00 00:00:00', '2012-07-13 08:49:19', '2012-07-13 08:36:11'),
(4, 'event', 'Vital C Sales Orientation - San Fernando City', 'Vital C Sales Orientation - San Fernando City', 'Group Name: HI-ENERGY\n\nVenue: Chowking San Fernando City\n\nDate: July 07, 2012\n\nTime: 1:00pm', '<p>Group Name:<strong>&nbsp;HI-ENERGY</strong></p>\n<p>Venue:<strong>&nbsp;Chowking San Fernando City</strong></p>\n<p>Date:&nbsp;<strong>July 07, 2012</strong></p>\n<p>Time:<strong>&nbsp;1:00pm</strong></p>', 'orientation, vitalc, san fernando', 1, NULL, 3, '2012-07-07 21:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-07-13 08:47:37'),
(5, 'event', 'Vital C Sales Orientation - Lucena City', 'Vital C Sales Orientation - Lucena City', 'Group Name: HI-ENERGY', '<p>Group Name:<strong>&nbsp;HI-ENERGY</strong></p>\n<p>Venue:<strong>&nbsp;Mang Inasal Lucena City</strong></p>\n<p>Date:&nbsp;<strong>July 08, 2012</strong></p>\n<p>Time:<strong>&nbsp;2:00pm</strong></p>', 'hi-energy, vital c, orientation', 1, NULL, 3, '2012-07-08 22:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-07-13 09:14:26'),
(6, 'event', 'Vital C Sales Orientation - Tuguegarao City', 'Vital C Sales Orientation - Tuguegarao City', 'Group Name: HI-ENERGY\n\nVenue: McDonald’s Tuguegarao City', '<p>Group Name:<strong>&nbsp;HI-ENERGY</strong></p>\n<p>Venue:<strong>&nbsp;McDonald&rsquo;s Tuguegarao City</strong></p>\n<p>Date:&nbsp;<strong>July 14, 2012</strong></p>\n<p>Time:<strong>&nbsp;2:00pm &nbsp; <br /></strong></p>', 'tuguegarao, hi energy,  orientation', 1, NULL, 3, '2012-07-14 22:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-07-13 09:19:39'),
(7, 'event', 'Vital C Sales Orientation - Dipolog City', 'Vital C Sales Orientation - Dipolog City', 'Group Name: HI-ENERGY', '<p>Group Name:<strong>&nbsp;HI-ENERGY</strong></p>\n<p>Venue:<strong>&nbsp;Jollibee Dipolog City</strong></p>\n<p>Date:&nbsp;<strong>July 21, 2012</strong></p>\n<p>Time:<strong>&nbsp;2:00pm &nbsp; <br /></strong></p>', 'hi-energy, vital c, orientation', 1, NULL, 3, '2012-07-21 22:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-07-13 09:38:21'),
(8, 'event', 'Vital C Sales Orientation - Baguio City', 'Vital C Sales Orientation - Baguio City', 'Group Name: HI-ENERGY', '<p>Group Name:<strong>&nbsp;HI-ENERGY</strong></p>\n<p>Venue:<strong>&nbsp;Chowking Baguio City</strong></p>\n<p>Date:&nbsp;<strong>July 22, 2012</strong></p>\n<p>Time:<strong>&nbsp;1:00pm &nbsp; <br /></strong></p>', 'hi-energy, vital c, orientation', 1, NULL, 3, '2012-07-22 21:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-07-13 09:46:54'),
(9, 'event', 'Vital C Sales Orientation - San Fernando City', 'Vital C Sales Orientation - San Fernando City', 'Group Name: HI-ENERGY', '<p>Group Name:<strong>&nbsp;HI-ENERGY</strong></p>\n<p>Venue:<strong>&nbsp;Chowking San Fernando City</strong></p>\n<p>Date:&nbsp;<strong>July 22, 2012</strong></p>\n<p>Time:<strong>&nbsp;4:00pm&nbsp; <br /></strong></p>', 'hi-energy, vital c, orientation', 1, NULL, 3, '2012-07-23 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-07-13 09:52:38'),
(10, 'event', 'Vital C Sales Orientation - Puerto Princesa', 'Vital C Sales Orientation - Puerto Princesa', 'Group Name: HI-ENERGY', '<p>Group Name:<strong>&nbsp;HI-ENERGY</strong></p>\n<p>Venue:<strong>&nbsp;Jollibee Puerto Princesa</strong></p>\n<p>Date:&nbsp;<strong>July 28, 2012</strong></p>\n<p>Time:<strong>&nbsp;1:00pm &nbsp; <br /></strong></p>', 'hi-energy, vital c, orientation', 1, NULL, 3, '2012-07-28 21:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-07-13 09:56:24'),
(11, 'event', 'Vital C Sales Orientation - Tacloban City', 'Vital C Sales Orientation - Tacloban City', 'Group Name: HI-ENERGY', '<p>Group Name:<strong>&nbsp;HI-ENERGY</strong></p>\n<p>Venue:<strong>&nbsp;McDonald&rsquo;sTacloban City</strong></p>\n<p>Date:&nbsp;<strong>July 04, 2012</strong></p>\n<p>Time:<strong>&nbsp;1:00pm&nbsp; <br /></strong></p>', 'hi-energy, vital c, orientation', 1, NULL, 3, '2012-07-04 21:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-07-13 09:58:12'),
(12, 'event', 'Vital C Sales Orientation - Lipa City', 'Vital C Sales Orientation - Lipa City', 'Group Name: HI-ENERGY', '<p>Group Name:<strong>&nbsp;HI-ENERGY</strong></p>\n<p>Venue:<strong>&nbsp;Chowking Lipa City</strong></p>\n<p>Date:&nbsp;<strong>July 15, 2012</strong></p>\n<p>Time:<strong>&nbsp;5:00pm&nbsp; <br /></strong></p>', 'hi-energy, vital c, orientation', 1, NULL, 4, '2012-07-16 01:00:00', '0000-00-00 00:00:00', '2012-07-24 15:17:28', '2012-07-13 10:00:20'),
(13, 'event', 'Vital C Sales Orientation - Dagupan City', 'Vital C Sales Orientation - Dagupan City', 'Group Name: HI-ENERGY', '<p>Group Name:<strong>&nbsp;HI-ENERGY</strong></p>\n<p>Venue:<strong>&nbsp;Jollibee Dagupan City</strong></p>\n<p>Date:&nbsp;<strong>July 22, 2012</strong></p>\n<p>Time:<strong>&nbsp;2:00pm&nbsp; <br /></strong></p>', 'hi-energy, vital c, orientation', 1, NULL, 3, '2012-07-22 22:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-07-13 10:02:32'),
(14, 'event', 'Vital C Sales Orientation - Baguio City', '', 'Group Name: HI-ENERGY', '<p>Group Name:<strong>&nbsp;HI-ENERGY</strong></p>\n<p>Venue:<strong>&nbsp;McDonald&rsquo;s Baguio City</strong></p>\n<p>Date:&nbsp;<strong>July 28, 2012</strong></p>\n<p>Time:<strong>&nbsp;1:00pm&nbsp; <br /></strong></p>', 'hi-energy, vital c, orientation', 1, NULL, 3, '2012-07-28 21:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-07-13 10:03:32'),
(15, 'event', 'Vital C Sales Orientation - Tanuan City', 'Vital C Sales Orientation - Tanuan City', 'Group Name: HI-ENERGY', '<p>Group Name:<strong>&nbsp;HI-ENERGY</strong></p>\n<p>Venue:<strong>&nbsp;Chowking Tanuan City</strong></p>\n<p>Date:&nbsp;<strong>July 22, 2012</strong></p>\n<p>Time:<strong>&nbsp;5:00pm&nbsp; <br /></strong></p>', 'hi-energy, vital c, orientation', 1, NULL, 3, '2012-07-23 01:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-07-13 10:08:15'),
(16, 'event', 'Vital C Sales Orientation - Tacloban City', 'Vital C Sales Orientation - Tacloban City', 'Group Name: HI-ENERGY\n\nVenue: McDonald’s Tacloban City\n\nDate: July 29, 2012\n\nTime: 2:00pm', '<p>Group Name:<strong>&nbsp;HI-ENERGY</strong></p>\n<p>Venue:<strong>&nbsp;McDonald&rsquo;s Tacloban City</strong></p>\n<p>Date:&nbsp;<strong>July 29, 2012</strong></p>\n<p>Time:<strong>&nbsp;2:00pm&nbsp; <br /></strong></p>', 'hi-energy, vital c, orientation', 1, NULL, 3, '2012-07-29 22:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-07-13 10:41:50'),
(17, 'event', 'Vital C Sales Orientation - Calapan City', 'Vital C Sales Orientation - Calapan City', 'Group Name: HI-ENERGY\n\nVenue: Jollibee Calapan City\n\nDate: July 22, 2012\n\nTime: 2:00pm', '<p>Group Name:<strong>&nbsp;HI-ENERGY</strong></p>\n<p>Venue:<strong>&nbsp;Jollibee Calapan City</strong></p>\n<p>Date:&nbsp;<strong>July 22, 2012</strong></p>\n<p>Time:<strong>&nbsp;2:00pm&nbsp; <br /></strong></p>', 'hi-energy, vital c, orientation', 1, NULL, 3, '2012-07-22 22:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-07-13 11:28:24'),
(18, 'event', 'Vital C Sales Orientation - Daet, Camarines Norte', 'Vital C Sales Orientation - Daet, Camarines Norte', 'Group Name: WILL OF FORTUNE\n\nVenue: Chowking Daet, Camarines Norte\n\nDate: July 07, 2012\n\nTime: 2:00pm', '<p>Group Name:<strong>&nbsp;WILL OF FORTUNE</strong></p>\n<p>Venue:<strong>&nbsp;Chowking Daet, Camarines Norte</strong></p>\n<p>Date:&nbsp;<strong>July 07, 2012</strong></p>\n<p>Time:<strong>&nbsp;2:00pm</strong></p>', 'camarines norte, orientation, will of fortune', 1, NULL, 3, '2012-07-07 22:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-07-13 11:30:02'),
(19, 'event', 'Vital C Sales Orientation - Novaliches', 'Vital C Sales Orientation - Novaliches', 'Group Name: LEAGUE OF MILLIONAIRES MIND\n\nVenue: Jollibee Gen. Luis Novaliches Quezon City\n\nDate: July 07, 2012\n\nTime: 2:00pm', '<p>Group Name:<strong>&nbsp;LEAGUE OF MILLIONAIRES MIND</strong></p>\n<p>Venue:<strong>&nbsp;Jollibee Gen. Luis Novaliches Quezon City</strong></p>\n<p>Date:&nbsp;<strong>July 07, 2012</strong></p>\n<p>Time:<strong>&nbsp;2:00pm</strong></p>', 'orientation, novaliches, league of millionaires mind', 1, NULL, 3, '2012-07-07 22:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-07-13 11:31:12'),
(20, 'event', 'Vital C Sales Orientation - Cogeo, Antipolo', 'Vital C Sales Orientation - Cogeo, Antipolo', 'Group Name: PROSPERITY\n\nVenue: Chowking Cogeo Antipolo City\n\nDate: July 20, 2012\n\nTime: 3:00pm', '<p>Group Name:<strong>&nbsp;PROSPERITY</strong></p>\n<p>Venue:<strong>&nbsp;Chowking Cogeo Antipolo City</strong></p>\n<p>Date:&nbsp;<strong>July 20, 2012</strong></p>\n<p>Time:<strong>&nbsp;3:00pm</strong></p>', 'prosperity, orientation, vital c', 1, NULL, 3, '2012-07-20 23:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-07-13 11:37:00'),
(21, 'event', 'Vital C Sales Orientation - Antipolo City', 'Vital C Sales Orientation - Antipolo City', 'Group Name: PROSPERITY\n\nVenue: Mang Inasal ML.Quezon Antipolo City\n\nDate: July 20, 2012\n\nTime: 3:00pm', '<p>Group Name:<strong>&nbsp;PROSPERITY</strong></p>\n<p>Venue:<strong>&nbsp;Mang Inasal ML.Quezon Antipolo City</strong></p>\n<p>Date:&nbsp;<strong>July 20, 2012</strong></p>\n<p>Time:<strong>&nbsp;3:00pm</strong></p>', 'vital c, orientation, antipolo, prosperity', 1, NULL, 3, '2012-07-20 23:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-07-13 11:39:50'),
(22, 'event', 'Vital C Sales Orientation - Cotabato City', 'Vital C Sales Orientation - Cotabato City', 'Group Name: BLUE WARRIORS\n\nVenue: Jollibee Cotabato City Orc Drive Sinsuat Ave.\n\nDate: July 07, 2012\n\nTime: 2:00pm', '<p>Group Name:<strong>&nbsp;BLUE WARRIORS</strong></p>\n<p>Venue:<strong>&nbsp;Jollibee Cotabato City Orc Drive Sinsuat Ave.</strong></p>\n<p>Date:&nbsp;<strong>July 07, 2012</strong></p>\n<p>Time:<strong>&nbsp;2:00pm</strong></p>', 'blue warriors, orientation, cotabato, vital c', 1, NULL, 3, '2012-07-07 22:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-07-13 11:44:07'),
(23, 'event', 'Vital C Sales Orientation - Panabo City', 'Vital C Sales Orientation - Panabo City', 'Group Name: INFINITY\n\nVenue: Jollibee Hi-Way Panabo City\n\nDate: July 11, 2012\n\nTime: 6:00pm', '<p>Group Name:<strong>&nbsp;INFINITY</strong></p>\n<p>Venue:<strong>&nbsp;Jollibee Hi-Way Panabo City</strong></p>\n<p>Date:&nbsp;<strong>July 11, 2012</strong></p>\n<p>Time:<strong>&nbsp;6:00pm</strong></p>', 'infinity, vital c, orientation, panabo', 1, NULL, 3, '2012-07-12 02:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-07-13 11:46:45'),
(24, 'event', 'Vital C Sales Orientation - Panabo City', 'Vital C Sales Orientation - Panabo City', 'Group Name: INFINITY\n\nVenue: Jollibee Hi-Way Panabo City\n\nDate: July 18, 2012\n\nTime: 6:00pm', '<p>Group Name:<strong>&nbsp;INFINITY</strong></p>\n<p>Venue:<strong>&nbsp;Jollibee Hi-Way Panabo City</strong></p>\n<p>Date:&nbsp;<strong>July 18, 2012</strong></p>\n<p>Time:<strong>&nbsp;6:00pm</strong></p>', 'infinity, vital c, orientation, panabo', 1, NULL, 3, '2012-07-19 02:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-07-13 11:48:34'),
(25, 'event', 'Vital C Sales Orientation - Tagum City', 'Vital C Sales Orientation - Tagum City', 'Group Name: INFINITY\n\nVenue: Jollibee Hi-Way Tagum City\n\nDate: July 09, 2012\n\nTime: 7:00pm', '<p>Group Name:<strong>&nbsp;INFINITY</strong></p>\n<p>Venue:<strong>&nbsp;Jollibee Hi-Way Tagum City</strong></p>\n<p>Date:&nbsp;<strong>July 09, 2012</strong></p>\n<p>Time:<strong>&nbsp;7:00pm</strong></p>', 'infinity, vital c, orientation, tagum', 1, NULL, 3, '2012-07-10 03:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-07-13 11:51:43'),
(26, 'event', 'Vital C Sales Orientation - Tagum City', 'Vital C Sales Orientation - Tagum City', 'Group Name: INFINITY\n\nVenue: Jollibee Hi-Way Tagum City\n\nDate: July 23, 2012\n\nTime: 7:00pm', '<p>Group Name:<strong>&nbsp;INFINITY</strong></p>\n<p>Venue:<strong>&nbsp;Jollibee Hi-Way Tagum City</strong></p>\n<p>Date:&nbsp;<strong>July 23, 2012</strong></p>\n<p>Time:<strong>&nbsp;7:00pm</strong></p>', 'infinity, vital c, orientation, tagum', 1, NULL, 3, '2012-07-24 03:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-07-13 11:56:10'),
(27, 'event', 'Vital C Sales Orientation - Tagum City', 'Vital C Sales Orientation - Tagum City', 'Group Name: INFINITY\n\nVenue: Jollibee Hi-Way Tagum City\n\nDate: July 30, 2012\n\nTime: 7:00pm', '<p>Group Name:<strong>&nbsp;INFINITY</strong></p>\n<p>Venue:<strong>&nbsp;Jollibee Hi-Way Tagum City</strong></p>\n<p>Date:&nbsp;<strong>July 30, 2012</strong></p>\n<p>Time:<strong>&nbsp;7:00pm</strong></p>', 'infinity, vital c, orientation, tagum', 1, NULL, 3, '2012-07-31 03:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-07-13 11:56:33'),
(28, 'event', 'Vital C Sales Orientation - General Santos', 'Vital C Sales Orientation - General Santos', 'Group Name: BLUE WARRIORS\n\nVenue: MIZ Bldg. Lote Calumpang General Santos\n\nDate: July 08, 2012\n\nTime: 2:00pm', '<p>Group Name:<strong>&nbsp;BLUE WARRIORS</strong></p>\n<p>Venue:<strong>&nbsp;MIZ Bldg. Lote Calumpang General Santos</strong></p>\n<p>Date:&nbsp;<strong>July 08, 2012</strong></p>\n<p>Time:<strong>&nbsp;2:00pm</strong></p>', 'general santos, blue warriors, vital c, orientation', 1, NULL, 3, '2012-07-08 22:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-07-13 12:01:38'),
(29, 'event', 'Vital C Sales Orientation - Marbel, South Cotabato', 'Vital C Sales Orientation - Marbel, South Cotabato', 'Group Name: INFINITY\n\nVenue: Jollibee Marbel South Cotabato\n\nDate: July 08, 2012\n\nTime: 2:00pm', '<p>Group Name:<strong>&nbsp;INFINITY</strong></p>\n<p>Venue:<strong>&nbsp;Jollibee Marbel South Cotabato</strong></p>\n<p>Date:&nbsp;<strong>July 08, 2012</strong></p>\n<p>Time:<strong>&nbsp;2:00pm</strong></p>', 'infinity, vital c, orientation, south cotabato', 1, NULL, 3, '2012-07-08 22:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-07-13 12:03:17'),
(30, 'event', 'Vital C Sales Orientation - General Santos', 'Vital C Sales Orientation - General Santos', 'Group Name: INFINITY\n\nVenue: Jollibee Nat’l. Hi-Way General Santos\n\nDate: July 15, 2012\n\nTime: 2:00pm', '<p>Group Name:<strong>&nbsp;INFINITY</strong></p>\n<p>Venue:<strong>&nbsp;Jollibee Nat&rsquo;l. Hi-Way General Santos</strong></p>\n<p>Date:&nbsp;<strong>July 15, 2012</strong></p>\n<p>Time:<strong>&nbsp;2:00pm</strong></p>', 'vital c, general santos, infinity, orientation', 1, NULL, 3, '2012-07-15 22:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-07-13 12:04:25'),
(31, 'event', 'Vital C Sales Orientation - General Santos', 'Vital C Sales Orientation - General Santos', 'Group Name: INFINITY\n\nVenue: Door C12 ECA Bldg. General Santos\n\nDate: July 29, 2012\n\nTime: 2:00pm', '<p>Group Name:<strong>&nbsp;INFINITY</strong></p>\n<p>Venue:<strong>&nbsp;Door C12 ECA Bldg. General Santos</strong></p>\n<p>Date:&nbsp;<strong>July 29, 2012</strong></p>\n<p>Time:<strong>&nbsp;2:00pm</strong></p>', 'vital c, general santos, infinity, orientation', 1, NULL, 3, '2012-07-29 22:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-07-13 12:05:21'),
(32, 'event', 'Vital C Sales Orientation - General Santos', 'Vital C Sales Orientation - General Santos', 'Group Name: INFINITY\n\nVenue: Door C12 ECA Bldg. General Santos\n\nDate: July 22, 2012\n\nTime: 2:00pm', '<p>Group Name:<strong>&nbsp;INFINITY</strong></p>\n<p>Venue:<strong>&nbsp;Door C12 ECA Bldg. General Santos</strong></p>\n<p>Date:&nbsp;<strong>July 22, 2012</strong></p>\n<p>Time:<strong>&nbsp;2:00pm</strong></p>', 'vital c, general santos, infinity, orientation', 1, NULL, 3, '2012-07-22 22:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-07-13 12:06:42'),
(33, 'event', 'Vital C Product Forum - Masbate City', 'Vital C Product Forum - Masbate City', 'Speaker: Dr. Jose Oclarit \n\nDate:  July 6,2012\n\nVenue: Masbate Hotel Masbate City\n\nTime:  2:00pm', '<p>Speaker:&nbsp;<strong>Dr. Jose Oclarit&nbsp;</strong></p>\n<p>Date: &nbsp;<strong>July 6,2012</strong></p>\n<p><strong></strong>Venue:<strong>&nbsp;Masbate Hotel Masbate City</strong></p>\n<p><strong></strong>Time:&nbsp;<strong>&nbsp;2:00pm</strong></p>', 'masbate, vital c, product forum', 1, NULL, 3, '2012-07-06 22:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-07-13 12:08:05'),
(34, 'event', 'Vital C Sizzle and Product Launching – Tentative Schedule (Davao)', 'Vital C Sizzle and Product Launching – Tentative Schedule (Davao)', 'Venue: D’ Leonor Hotel, Davao City\n\nDate: August 24,2012\n\nTime: To be announced', '<p>Venue:<strong> <strong> D&rsquo; Leonor Hotel, Davao Cit</strong>y<br /></strong></p>\n<p>Date:&nbsp;<strong><strong>August 24,2012</strong></strong></p>\n<p>Time:<strong> <strong>To be announced</strong><br /></strong></p>', 'vital c, sizzle, product launching', 1, NULL, 4, '2012-08-24 08:00:00', '0000-00-00 00:00:00', '2012-07-24 15:41:04', '2012-07-24 15:39:28'),
(35, 'event', 'Vital C Sizzle and Product Launching – Tentative Schedule (Cebu)', 'Vital C Sizzle and Product Launching – Tentative Schedule (Cebu)', 'Venue: Club Ultima, Crown Regency Fuente\n\nDate: August 25, 2012\n\nTime: To be announced', '<p>Venue:<strong> <strong>Club Ultima, Crown Regency Fuente</strong><br /></strong></p>\n<p>Date:&nbsp;<strong><strong><strong>August 25, 2012</strong></strong></strong></p>\n<p>Time:<strong> <strong>To be announced</strong><br /></strong></p>', 'vital c, sizzle, product launching, cebu', 1, NULL, 4, '2012-08-25 08:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-07-24 15:44:48'),
(36, 'event', 'Vital C Sizzle and Product Launching – Tentative Schedule (Ortigas)', 'Vital C Sizzle and Product Launching – Tentative Schedule (Ortigas)', 'Venue: Club Ultima, Crown Regency Fuente\n\nDate: August 25, 2012\n\nTime: To be announced', '<p>Venue:<strong> <strong><strong>5th Floor, SM Megamall Conference Hall</strong></strong><br /></strong></p>\n<p>Date: <strong><strong><strong><strong>August 26, 2012</strong></strong></strong></strong></p>\n<p>Time:<strong> <strong>To be announced</strong><br /></strong></p>', 'vital c, sizzle, product launching, ortigas', 1, NULL, 4, '2012-08-26 08:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-07-24 15:48:20'),
(37, 'event', 'Vital C Product Forum – Tanjay, Negros Occidental', 'Vital C Product Forum – Tanjay, Negros Occidental', 'Speaker: Dr. Jose Oclarit \n\nDate:  July 21-22,2012\n\nVenue: Hotel de Tanjay – Tanjay, Negros Oriental\n\nTime:  2:00pm', '<p>Speaker:&nbsp;<strong>Dr. Jose Oclarit&nbsp;</strong></p>\n<p>Date: &nbsp;<strong>July 21-22,2012</strong></p>\n<p><strong></strong>Venue:<strong>&nbsp;Hotel de Tanjay &ndash; Tanjay, Negros Oriental</strong></p>\n<p><strong></strong>Time:&nbsp;<strong>&nbsp;2:00pm</strong></p>', 'vital c, product forum', 1, NULL, 4, '2012-07-21 22:00:00', '2012-07-22 08:00:00', '0000-00-00 00:00:00', '2012-07-24 15:52:08'),
(38, 'event', 'Vital C Sizzle – Davao', 'Vital C Sizzle – Davao', 'Venue: D’ Leonor Hotel Davao\n\nDate: June 22, 2012\n\nTime: 6:00pm', '<p>Venue:<strong>&nbsp;D&rsquo; Leonor Hotel Davao</strong></p>\n<p>Date:&nbsp;<strong>June 22, 2012</strong></p>\n<p>Time:<strong>&nbsp;6:00pm</strong></p>', 'vital c, sizzle, davao', 1, NULL, 4, '2012-06-23 02:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-07-24 15:54:09'),
(39, 'event', 'Vital C Product Forum – Pagadian City', 'Vital C Product Forum – Pagadian City', 'Speaker: Dr. Jose Oclarit\n\nVenue: Hotel Guillermo Rizal. St. Pagadian \n\nDate: July 28, 2012\n\nTime: 2:00pm', '<p>Speaker: <strong>Dr. Jose Oclarit</strong></p>\n<p>Venue:<strong>&nbsp;Hotel Guillermo Rizal. St. Pagadian&nbsp;</strong></p>\n<p>Date:&nbsp;<strong>July 28, 2012</strong></p>\n<p>Time:<strong>&nbsp;2:00pm <br /></strong></p>', 'vital c, product forum, pagadian city', 1, NULL, 4, '2012-07-28 22:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-07-24 15:58:09'),
(40, 'event', 'Vital C Product Forum – Cagayan De Oro', 'Vital C Product Forum – Cagayan De Oro', 'Speaker: Dr. Jose Oclarit\n\nVenue: Jollibee Limkit Kai\n\nDate: July 29, 2012\n\nTime: 2:00pm', '<p>Speaker:&nbsp;<strong>Dr. Jose Oclarit</strong></p>\n<p>Venue:<strong>&nbsp;Jollibee Limkit Kai</strong></p>\n<p>Date:&nbsp;<strong>July 29, 2012</strong></p>\n<p>Time:<strong>&nbsp;2:00pm <br /></strong></p>', 'vital c, product forum, cagayan de oro', 1, NULL, 4, '2012-07-29 22:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-07-24 16:00:10'),
(41, 'event', 'Vital C Success Road Map Workshop – Cebu', 'Vital C Success Road Map Workshop – Cebu', 'Speaker: Jophet Pedroso\n\nVenue: Crown Regency Hotel Guadalupe \n\nDate: July 21-22, 2012\n\nTime: 8:30am', '<p>Speaker:&nbsp;<strong>Jophet Pedroso</strong></p>\n<p>Venue:<strong>&nbsp;Crown Regency Hotel Guadalupe&nbsp;</strong></p>\n<p>Date:&nbsp;<strong>July 21-22, 2012</strong></p>\n<p>Time:<strong>&nbsp;8:30am <br /></strong></p>', 'vital c, workshop, cebu', 1, NULL, 4, '2012-07-21 16:30:00', '2012-07-22 08:00:00', '0000-00-00 00:00:00', '2012-07-24 16:01:59'),
(42, 'event', 'Vital C Davao Sizzle – Davao Depot', 'Vital C Davao Sizzle – Davao Depot', 'Venue: Davao Depot – Sobracarey Street Bo. Obrero, Davao City\n\nDate: July 20, 2012\n\nTime: 6:00pm', '<p>Venue:<strong>&nbsp;Davao Depot &ndash; Sobracarey Street Bo. Obrero, Davao City</strong></p>\n<p>Date:&nbsp;<strong>July 20, 2012</strong></p>\n<p>Time:<strong>&nbsp;6:00pm</strong></p>', 'vital c, sizzle, davao', 1, NULL, 4, '2012-07-21 02:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-07-24 19:52:59'),
(43, 'event', 'Vital C Sales Caravan – Davao', 'Vital C Sales Caravan – Davao', 'Davao Sales Caravan:\n\nAugust 03,2012 – Polomolok\n\nNote: Venue and Time is to be announced or you may contact Mr. Alberto Obenza (09186590486) for further  details.', '<p><strong>Davao Sales Caravan:</strong></p>\n<p><strong>August 03,2012</strong> &ndash; Polomolok</p>\n<p><strong>Note: Venue and Time is to be announced or you may contact Mr. Alberto Obenza (09186590486) for further &nbsp;details.</strong></p>', 'vital c, sales cravan, davao', 1, NULL, 4, '2012-08-03 08:00:00', '0000-00-00 00:00:00', '2012-07-25 04:39:54', '2012-07-25 04:38:35'),
(44, 'event', 'Vital C Sales Caravan – Davao', 'Vital C Sales Caravan – Davao', 'Davao Sales Caravan:\n\nAugust 04,2012 – Marbel\n\nNote: Venue and Time is to be announced or you may contact Mr. Alberto Obenza (09186590486) for further  details.', '<p><strong>Davao Sales Caravan:</strong></p>\n<p><strong></strong><strong>August 04,2012</strong> &ndash; Marbel</p>\n<p><strong>Note: Venue and Time is to be announced or you may contact Mr. Alberto Obenza (09186590486) for further &nbsp;details.</strong></p>', 'vital c, sales cravan, davao', 1, NULL, 4, '2012-08-04 08:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-07-25 04:40:23'),
(45, 'event', 'Vital C Sales Caravan – Davao', 'Vital C Sales Caravan – Davao', 'Davao Sales Caravan:\n\nAugust 05,2012 – General Santos\n\nNote: Venue and Time is to be announced or you may contact Mr. Alberto Obenza (09186590486) for further  details.', '<p><strong>Davao Sales Caravan:</strong></p>\n<p><strong></strong><strong></strong><strong>August 05,2012</strong> &ndash; General Santos</p>\n<p><strong>Note: Venue and Time is to be announced or you may contact Mr. Alberto Obenza (09186590486) for further &nbsp;details.</strong></p>', 'vital c, sales cravan, davao', 1, NULL, 4, '2012-08-05 08:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-07-25 04:40:50'),
(46, 'event', 'Vital C Sales Caravan – Davao', 'Vital C Sales Caravan – Davao', 'Davao Sales Caravan:\n\nAugust 06,2012 – Tagum\n\nNote: Venue and Time is to be announced or you may contact Mr. Alberto Obenza (09186590486) for further  details.', '<p><strong>Davao Sales Caravan:</strong></p>\n<p><strong></strong><strong></strong><strong></strong><strong>August 06,2012</strong> &ndash; Tagum</p>\n<p><strong>Note: Venue and Time is to be announced or you may contact Mr. Alberto Obenza (09186590486) for further &nbsp;details.</strong></p>', 'vital c, sales cravan, davao', 1, NULL, 4, '2012-08-06 08:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-07-25 04:43:46'),
(47, 'event', 'Vital C Sales Caravan – Davao', 'Vital C Sales Caravan – Davao', 'Davao Sales Caravan:\n\nAugust 07,2012 – Panabo\n\nNote: Venue and Time is to be announced or you may contact Mr. Alberto Obenza (09186590486) for further  details.', '<p><strong>Davao Sales Caravan:</strong></p>\n<p><strong></strong><strong></strong><strong></strong><strong></strong><strong>August 07,2012</strong> &ndash; Panabo</p>\n<p><strong>Note: Venue and Time is to be announced or you may contact Mr. Alberto Obenza (09186590486) for further &nbsp;details.</strong></p>', 'vital c, sales cravan, davao', 1, NULL, 4, '2012-08-07 08:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-07-25 04:44:07'),
(48, 'event', 'Vital C Sales Caravan – Davao', 'Vital C Sales Caravan – Davao', 'Davao Sales Caravan:\n\nAugust 08,2012 – Lupon\n\nNote: Venue and Time is to be announced or you may contact Mr. Alberto Obenza (09186590486) for further  details.', '<p><strong>Davao Sales Caravan:</strong></p>\n<p><strong></strong><strong></strong><strong></strong><strong></strong><strong></strong><strong>August 08,2012</strong> &ndash; Lupon</p>\n<p><strong>Note: Venue and Time is to be announced or you may contact Mr. Alberto Obenza (09186590486) for further &nbsp;details.</strong></p>', 'vital c, sales cravan, davao', 1, NULL, 4, '2012-08-08 08:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-07-25 04:44:36'),
(49, 'event', 'Vital C Sales Caravan – Davao', 'Vital C Sales Caravan – Davao', 'Davao Sales Caravan:\n\nAugust 09,2012 – Mati\n\nNote: Venue and Time is to be announced or you may contact Mr. Alberto Obenza (09186590486) for further  details.', '<p><strong>Davao Sales Caravan:</strong></p>\n<p><strong></strong><strong></strong><strong></strong><strong></strong><strong></strong><strong></strong><strong>August 09,2012</strong> &ndash; Mati</p>\n<p><strong>Note: Venue and Time is to be announced or you may contact Mr. Alberto Obenza (09186590486) for further &nbsp;details.</strong></p>', 'vital c, sales cravan, davao', 1, NULL, 4, '2012-08-09 08:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-07-25 04:45:13'),
(50, 'event', 'Vital C Product Forum – Davao', 'Vital C Product Forum – Davao', 'Vital C Product forum in Davao:\n\nAugust 10,2012 – Davao Depot (Sobracarey Street Bo. Obrero, Davao City)\n\nNote: Venue and Time is to be announced or you may contact Mr. Alberto Obenza (09186590486) for further  details.', '<p><strong><strong>Vital C Product forum in Davao:</strong></strong></p>\n<p><strong>August 10,2012</strong> &ndash; Davao Depot (Sobracarey Street Bo. Obrero, Davao City)</p>\n<p><strong><strong>Note: Venue and Time is to be announced or you may contact Mr. Alberto Obenza (09186590486) for further &nbsp;details.</strong></strong></p>', 'vital c,product forum, davao', 1, NULL, 4, '2012-08-10 08:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-07-25 04:48:51'),
(51, 'event', 'Vital C Product Forum – Davao', 'Vital C Product Forum – Davao', 'Vital C Product forum in Davao:\n\nAugust 11,2012 – Tagum (Exact venue to be announced)\n\nNote: Venue and Time is to be announced or you may contact Mr. Alberto Obenza (09186590486) for further  details.', '<p><strong><strong>Vital C Product forum in Davao:</strong></strong></p>\n<p><strong></strong><strong>August 11,2012 &ndash; </strong>Tagum (Exact venue to be announced)</p>\n<p><strong><strong>Note: Venue and Time is to be announced or you may contact Mr. Alberto Obenza (09186590486) for further &nbsp;details.</strong></strong></p>', 'vital c,product forum, davao', 1, NULL, 4, '2012-08-11 08:00:00', '0000-00-00 00:00:00', '2012-07-25 04:49:36', '2012-07-25 04:49:11'),
(52, 'event', 'Vital C Product Forum – Davao', 'Vital C Product Forum – Davao', 'Vital C Product forum in Davao:\n\nAugust 12,2012 – Panabo (Exact venue to be announced)\n\nNote: Venue and Time is to be announced or you may contact Mr. Alberto Obenza (09186590486) for further  details.', '<p><strong><strong>Vital C Product forum in Davao:</strong></strong></p>\n<p><strong></strong><strong></strong><strong>August 12,2012 &ndash; </strong>Panabo&nbsp;(Exact venue to be announced)</p>\n<p><strong><strong>Note: Venue and Time is to be announced or you may contact Mr. Alberto Obenza (09186590486) for further &nbsp;details.</strong></strong></p>', 'vital c,product forum, davao', 1, NULL, 4, '2012-08-12 08:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-07-25 04:49:59'),
(53, 'event', 'Vital C Product Forum – Davao', 'Vital C Product Forum – Davao', 'Vital C Product forum in Davao:\n\nAugust 13,2012 – General Santos (Exact venue to be announced)\n\nNote: Venue and Time is to be announced or you may contact Mr. Alberto Obenza (09186590486) for further  details.', '<p><strong><strong>Vital C Product forum in Davao:</strong></strong></p>\n<p><strong>August 13,2012</strong> &ndash; General Santos&nbsp;(Exact venue to be announced)</p>\n<p><strong><strong>Note: Venue and Time is to be announced or you may contact Mr. Alberto Obenza (09186590486) for further &nbsp;details.</strong></strong></p>', 'vital c,product forum, davao', 1, NULL, 4, '2012-08-13 08:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-07-25 04:51:01'),
(54, 'event', 'Vital C Product Forum – Davao', 'Vital C Product Forum – Davao', 'Vital C Product forum in Davao:\n\nAugust 14,2012 – Tacurong (Exact venue to be announced)\n\nNote: Venue and Time is to be announced or you may contact Mr. Alberto Obenza (09186590486) for further  details.', '<p><strong><strong>Vital C Product forum in Davao:</strong></strong></p>\n<p><strong></strong><strong>August 14,2012</strong> &ndash; Tacurong (Exact venue to be announced)</p>\n<p><strong><strong>Note: Venue and Time is to be announced or you may contact Mr. Alberto Obenza (09186590486) for further &nbsp;details.</strong></strong></p>', 'vital c,product forum, davao', 1, NULL, 4, '2012-08-14 08:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-07-25 04:52:57'),
(55, 'event', 'Vital C Product Forum – Davao', 'Vital C Product Forum – Davao', 'Vital C Product forum in Davao:\n\nAugust 15,2012 - Cotabato ((Exact venue to be announced)\n\nNote: Venue and Time is to be announced or you may contact Mr. Alberto Obenza (09186590486) for further  details.', '<p><strong><strong>Vital C Product forum in Davao:</strong></strong></p>\n<p><strong>August 15,2012</strong>&nbsp;- Cotabato ((Exact venue to be announced)</p>\n<p><strong><strong>Note: Venue and Time is to be announced or you may contact Mr. Alberto Obenza (09186590486) for further &nbsp;details.</strong></strong></p>', 'vital c,product forum, davao', 1, NULL, 4, '2012-08-15 08:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-07-25 04:53:18'),
(56, 'event', 'Vital C Doctor’s Forum – Davao City', 'Vital C Doctor’s Forum – Davao City', 'Speaker: Dr. Jose Oclarit\n\nVenue: Apo View Hotel Davao City\n\nDate: August 16,2012\n\nTime: 6:00pm', '<p>Speaker:&nbsp;<strong>Dr. Jose Oclarit</strong></p>\n<p>Venue:<strong>&nbsp;Apo View Hotel Davao City</strong></p>\n<p>Date: <strong>August 16,2012</strong></p>\n<p>Time:<strong>&nbsp;6:00pm <br /></strong></p>', 'vital c, doctor’s forum, davao', 1, NULL, 4, '2012-08-17 02:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-07-25 04:54:58'),
(57, 'event', 'Vital C EPC Opening – Angeles City, Pampanga', 'Vital C EPC Opening – Angeles City, Pampanga', 'Special Guest: The Medical Team - Dr. Ariel Baira, Dr. Jose Oclarit, Dr. Paolo Bellosillo \n\nVenue: SM Clark Angeles City, Pampanga\n\nDate: August 03,2012\n\nTime: 1:00pm', '<p>Special Guest: <strong>The Medical Team -</strong>&nbsp;<strong>Dr. Ariel Baira,&nbsp;Dr. Jose Oclarit, Dr. Paolo Bellosillo&nbsp;</strong></p>\n<p>Venue:<strong>&nbsp;SM Clark Angeles City, Pampanga</strong></p>\n<p>Date:&nbsp;<strong>August 03,2012</strong></p>\n<p>Time:<strong>&nbsp;1:00pm <br /></strong></p>', 'vital c, epc opening, pampanga', 1, NULL, 4, '2012-08-03 21:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-07-25 04:56:14');
