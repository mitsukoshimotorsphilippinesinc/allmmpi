DROP TABLE IF EXISTS `sm_top_earners`;
CREATE TABLE IF NOT EXISTS `sm_top_earners` (
  `earner_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `member_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `earner_type_id` int(20) NOT NULL DEFAULT '0',
  `position` int(20) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `user_id` int(20) NOT NULL DEFAULT '0',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`earner_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=101 ;;

INSERT INTO `sm_top_earners` (`earner_id`, `member_name`, `group_name`, `earner_type_id`, `position`, `is_active`, `user_id`, `insert_timestamp`) VALUES
(1, '', '', 1, 1, 1, 1, '2012-11-15 08:40:59'),
(2, '', '', 1, 2, 1, 0, '2012-11-15 08:40:59'),
(3, '', '', 1, 3, 1, 0, '2012-11-15 08:40:59'),
(4, '', '', 1, 4, 1, 0, '2012-11-15 08:40:59'),
(5, '', '', 1, 5, 1, 0, '2012-11-15 08:40:59'),
(6, '', '', 1, 6, 1, 0, '2012-11-15 08:40:59'),
(7, '', '', 1, 7, 1, 0, '2012-11-15 08:40:59'),
(8, '', '', 1, 8, 1, 0, '2012-11-15 08:40:59'),
(9, '', '', 1, 9, 1, 0, '2012-11-15 08:40:59'),
(10, '', '', 1, 10, 1, 0, '2012-11-15 08:40:59'),
(11, '', '', 1, 11, 1, 0, '2012-11-15 08:40:59'),
(12, '', '', 1, 12, 1, 0, '2012-11-15 08:40:59'),
(13, '', '', 1, 13, 1, 0, '2012-11-15 08:40:59'),
(14, '', '', 1, 14, 1, 0, '2012-11-15 08:40:59'),
(15, '', '', 1, 15, 1, 0, '2012-11-15 08:40:59'),
(16, '', '', 1, 16, 1, 0, '2012-11-15 08:40:59'),
(17, '', '', 1, 17, 1, 0, '2012-11-15 08:40:59'),
(18, '', '', 1, 18, 1, 0, '2012-11-15 08:40:59'),
(19, '', '', 1, 19, 1, 0, '2012-11-15 08:40:59'),
(20, '', '', 1, 20, 1, 0, '2012-11-15 08:40:59'),
(21, '', '', 1, 21, 1, 0, '2012-11-15 08:40:59'),
(22, '', '', 1, 22, 1, 0, '2012-11-15 08:40:59'),
(23, '', '', 1, 23, 1, 0, '2012-11-15 08:40:59'),
(24, '', '', 1, 24, 1, 0, '2012-11-15 08:40:59'),
(25, '', '', 1, 25, 1, 0, '2012-11-15 08:40:59'),
(26, '', '', 1, 26, 1, 0, '2012-11-15 08:40:59'),
(27, '', '', 1, 27, 1, 0, '2012-11-15 08:40:59'),
(28, '', '', 1, 28, 1, 0, '2012-11-15 08:40:59'),
(29, '', '', 1, 29, 1, 0, '2012-11-15 08:40:59'),
(30, '', '', 1, 30, 1, 0, '2012-11-15 08:40:59'),
(31, 'MANUEL M CULTURA', 'HI-ENERGY', 2, 1, 1, 1, '2012-11-15 08:49:01'),
(32, 'WENCESLAO SO OCAMPO', 'INFINITY', 2, 2, 1, 1, '2012-11-15 08:49:01'),
(33, 'JOSELITO S TAN', 'HI-ENERGY', 2, 3, 1, 1, '2012-11-15 08:49:01'),
(34, 'EDDIE LUYAS MAHILUM', 'SKYSCRAPERS', 2, 4, 1, 1, '2012-11-15 08:49:01'),
(35, 'ANDRES B MONDREZA JR.', 'BLUE WARRIORS', 2, 5, 1, 1, '2012-11-15 08:49:01'),
(36, 'JAZON O MERJILLA', 'LMM', 2, 6, 1, 0, '2012-11-15 08:49:01'),
(37, 'VIVIAN DELFINO HERNANDEZ', 'UNIFIED GROUP', 2, 7, 1, 0, '2012-11-15 08:49:01'),
(38, 'MARJORIE R CANDOG', 'DYNAMIC', 2, 8, 1, 0, '2012-11-15 08:49:01'),
(39, 'FLORENCE JOHN PEARSON GARCIA', 'GOLDVINE', 2, 9, 1, 0, '2012-11-15 08:49:01'),
(40, 'DALE SILBOL RENACIA', 'UNIFIED GROUP', 2, 10, 1, 0, '2012-11-15 08:49:01'),
(41, 'CHARLENE LOPEZ VILLAPAZ', 'PROSPERITY', 2, 11, 1, 0, '2012-11-15 08:49:01'),
(42, 'CESARIO & LEVELYN BARELA', 'HI-ENERGY', 2, 12, 1, 0, '2012-11-15 08:49:01'),
(43, 'LUCY RAMOS', 'HI-ENERGY', 2, 13, 1, 0, '2012-11-15 08:49:01'),
(44, 'ELVIN ALIPAN ENGLISA', 'UNIFIED GROUP', 2, 14, 1, 0, '2012-11-15 08:49:01'),
(45, 'ACE GROUP (MARLO & ELIZA SISON)', 'ACE GROUP', 2, 15, 1, 0, '2012-11-15 08:49:01'),
(46, 'BABES NAGRAMPA', 'MIA', 2, 16, 1, 0, '2012-11-15 08:49:01'),
(47, 'NICPAR AUSAN PAMOR', 'HI-ENERGY', 2, 17, 1, 0, '2012-11-15 08:49:01'),
(48, 'MAIDA LOU TABANAG MAHILUM', 'SKYSCRAPERS', 2, 18, 1, 0, '2012-11-15 08:49:01'),
(49, 'ZENAIDO PATRIARCA', 'DAVAO EAGLES', 2, 19, 1, 0, '2012-11-15 08:49:01'),
(50, 'DEXTER LAUREANO DIANO', 'HI-ENERGY', 2, 20, 1, 0, '2012-11-15 08:49:01'),
(51, 'SPARTAN''S EAGLE''S TEAM (FRANCIS,  & CELSO)', 'LMM', 2, 21, 1, 0, '2012-11-15 08:49:01'),
(52, 'EL MARIE Q ESTIGOY', 'INFINITY', 2, 22, 1, 0, '2012-11-15 08:49:01'),
(53, 'DIVINA C MARUYA', 'HI-ENERGY', 2, 23, 1, 0, '2012-11-15 08:49:01'),
(54, 'ERNESTO LORO LAPIDEZ JR.', 'HI-ENERGY', 2, 24, 1, 0, '2012-11-15 08:49:01'),
(55, 'ROY & MITZIE PALMA', 'QCI GROUP', 2, 25, 1, 0, '2012-11-15 08:49:01'),
(56, 'JHUFEL DAYANAN SARNO', 'VITAL ACHIEVERS', 2, 26, 1, 0, '2012-11-15 08:49:01'),
(57, 'HANS KINDIPAN DUMAR', 'INFINITY', 2, 27, 1, 0, '2012-11-15 08:49:01'),
(58, 'JAIME LUIS DENIA DOROMAL', 'INFINITY', 2, 28, 1, 0, '2012-11-15 08:49:01'),
(59, 'MERLA DIAPANA CABUSAS', 'INFINITY', 2, 29, 1, 0, '2012-11-15 08:49:01'),
(60, 'WILFREDO BALASTA', 'WILL OF FORTUNE', 2, 30, 1, 0, '2012-11-15 08:49:01'),
(61, 'PAQUITO DUMAPIAS BITANG', 'INFINITY', 2, 31, 1, 0, '2012-11-15 08:49:01'),
(62, 'BRENDA IBASCO MALACAS', 'WILL OF FORTUNE', 2, 32, 1, 0, '2012-11-15 08:49:01'),
(63, 'JESUS O NUITE', 'HI-ENERGY', 2, 33, 1, 0, '2012-11-15 08:49:01'),
(64, 'SHERWIN OLANDA', 'HI ENERGY', 2, 34, 1, 0, '2012-11-15 08:49:01'),
(65, 'RYAN REY AQUINO FERNANDEZ', 'HI-ENERGY', 2, 35, 1, 0, '2012-11-15 08:49:01'),
(66, 'JOSE CHELO FERRER', 'SKYSCRAPERS', 2, 36, 1, 0, '2012-11-15 08:49:01'),
(67, 'LUDIVINA DALUPANG GALANO', 'HI-ENERGY', 2, 37, 1, 0, '2012-11-15 08:49:01'),
(68, 'CECILE PUEBLO ABACIAL', 'BLUE WARRIORS', 2, 38, 1, 0, '2012-11-15 08:49:01'),
(69, 'ESTRELLA QUINICOT MACATUMBAS', 'QCI GROUP', 2, 39, 1, 0, '2012-11-15 08:49:01'),
(70, 'ANDRES & CYNTHIA MANLAPUS', 'BLUE WARRIORS', 2, 40, 1, 0, '2012-11-15 08:49:01'),
(71, 'GLADYS GLENDA M. PATRIARCA', 'DAVAO EAGLE', 2, 41, 1, 0, '2012-11-15 08:49:01'),
(72, 'ELPIDIO & PRAXEDES CANIMO', 'HI-ENERGY', 2, 42, 1, 0, '2012-11-15 08:49:01'),
(73, 'ANTONIETA N. PAMOR', 'HI-ENERGY', 2, 43, 1, 0, '2012-11-15 08:49:01'),
(74, 'MARCELO E. ENGCOT', 'GOLDVINE', 2, 44, 1, 0, '2012-11-15 08:49:01'),
(75, 'RAQUEL RODRIGUEZ ABAD', 'HI-ENERGY', 2, 45, 1, 0, '2012-11-15 08:49:01'),
(76, 'ZALDY TAGUIBULOSAN CASTILLON', 'BLUE WARRIORS', 2, 46, 1, 0, '2012-11-15 08:49:01'),
(77, 'MARIA MELINDA ABOGADO BARIZO', 'WILL OF FORTUNE', 2, 47, 1, 0, '2012-11-15 08:49:01'),
(78, 'JUNE FORD & MARY ANN SALIG', 'BLUE WARRIORS', 2, 48, 1, 0, '2012-11-15 08:49:01'),
(79, 'WAYNE M. GUTUAL JR.', 'BLUE WARRIORS', 2, 49, 1, 0, '2012-11-15 08:49:01'),
(80, 'FRANCO W. PALACIO', 'DAVAO EAGLES', 2, 50, 1, 0, '2012-11-15 08:49:01'),
(81, 'PERLA N. DERODAR', 'DAVAO EAGLES', 2, 51, 1, 0, '2012-11-15 08:49:01'),
(82, 'ELMER & MERLYN YEPEZ', 'BLUE WARRIORS', 2, 52, 1, 0, '2012-11-15 08:49:01'),
(83, 'VIRGINIO ALEMAN ZAMORAS', 'UNIFIED GROUP', 2, 53, 1, 0, '2012-11-15 08:49:01'),
(84, 'FILIPINA ELLAZAR PASCUAL', 'HI-ENERGY', 2, 54, 1, 0, '2012-11-15 08:49:01'),
(85, 'CHARMAINE BRAVO UY', 'INFINITY', 2, 55, 1, 0, '2012-11-15 08:49:01'),
(86, 'RODOLFO & MITZI ALBA', 'HI-ENERGY', 2, 56, 1, 0, '2012-11-15 08:49:01'),
(87, 'ANTONIO SANTIAGO BUENAOBRA', 'PROSPERITY', 2, 57, 1, 0, '2012-11-15 08:49:01'),
(88, 'MARILYN CAMINGUE DALOCANOG', 'SKYSCRAPERS', 2, 58, 1, 0, '2012-11-15 08:49:01'),
(89, 'MANNY DEL ROSARIO BATAC', 'HI ENERGY', 2, 59, 1, 0, '2012-11-15 08:49:01'),
(90, 'GEMMA CRUZ OH', 'HI-ENERGY', 2, 60, 1, 0, '2012-11-15 08:49:01'),
(91, 'HENRY CHU YU', 'GOLDVINE', 2, 61, 1, 0, '2012-11-15 08:49:01'),
(92, 'RIZA MARIE SAMPAYAN DAUNGCAY', 'INFINITY', 2, 62, 1, 0, '2012-11-15 08:49:01'),
(93, 'IMELDA RAMOS CHAVEZ', 'BLUE WARRIORS', 2, 63, 1, 0, '2012-11-15 08:49:01'),
(94, 'GREGORIO JR DE JESUS JOVER', 'INFINITY', 2, 64, 1, 0, '2012-11-15 08:49:01'),
(95, 'SITTI JANE JIKIRANY ABASTILLAS', 'INFINITY', 2, 65, 1, 0, '2012-11-15 08:49:01'),
(96, 'BRYAN VIRTUDAZO BIOL', 'BLUE WARRIORS', 2, 66, 1, 0, '2012-11-15 08:49:01'),
(97, 'VENUS SALCEDO VILLANUEVA', 'DYNAMIC', 2, 67, 1, 0, '2012-11-15 08:49:01'),
(98, 'MELCHOR MANLANGIT MAIQUE', 'BLUE WARRIORS', 2, 68, 1, 0, '2012-11-15 08:49:01'),
(99, 'LILIAN MAMUGAY GILVES', 'BLUE WARRIORS', 2, 69, 1, 0, '2012-11-15 08:49:01'),
(100, 'CHRISTIAN CARROL RAMOS LEGACION', 'BLUE WARRIORS', 2, 70, 1, 0, '2012-11-15 08:49:01');

DROP TABLE IF EXISTS `rf_top_earners`;
CREATE TABLE IF NOT EXISTS `rf_top_earners` (
  `earner_type_id` int(20) NOT NULL DEFAULT '0',
  `description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`earner_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;