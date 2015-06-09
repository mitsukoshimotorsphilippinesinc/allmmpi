
DROP TABLE IF EXISTS `sm_featured_products`;
CREATE TABLE IF NOT EXISTS `sm_featured_products` (
  `product_id` int(20) NOT NULL default '0',
  `feature_type_id` int(20) NOT NULL default '0',
  `title` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  `user_id` int(20) NOT NULL default '0',
  `order_id` int(11) NOT NULL default '1',
  `insert_timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`product_id`,`feature_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
