-- phpMyAdmin SQL Dump
-- version 3.5.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 31, 2012 at 02:34 PM
-- Server version: 5.1.44
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `vitalc`
--

-- --------------------------------------------------------

--
-- Table structure for table `tmp_epc_members`
--

DROP TABLE IF EXISTS `tmp_epc_members`;
CREATE TABLE IF NOT EXISTS `tmp_epc_members` (
  `member_id` int(11) DEFAULT NULL,
  `member_name` varchar(255) DEFAULT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `depot` varchar(255) DEFAULT NULL,
  `year` varchar(255) DEFAULT NULL,
  `area_of_operation` varchar(255) DEFAULT NULL,
  `location_of_office` varchar(255) DEFAULT NULL,
  `contact_numbers` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tmp_epc_members`
--

INSERT INTO `tmp_epc_members` (`member_id`, `member_name`, `owner`, `depot`, `year`, `area_of_operation`, `location_of_office`, `contact_numbers`, `status`) VALUES
(NULL, 'Andres Alemania', 'Andres Alemania', 'Ortigas', '2011', 'General Santos City', '1st Street Soriano Subd. Heights General Santos City ', '09177155980', 'ACTIVE'),
(26546, 'Brenda Malacas', 'Brenda Malacas', 'Ortigas', '2011', '"Daet, Camarines Norte"', '"Guinhawa Bldg., J. Lucban St., Daet, Camarines Norte"', '0919-3954037', 'ACTIVE'),
(12315, 'Amazing Grace', 'Catherine Cortez', 'Ortigas', '2010', 'Tacloban', 'J.D. Avelino St. Calbayog City 6710', '09157570618', 'ACTIVE'),
(28051, 'Cleotilde Matibag', 'Cleotilde Matibag', 'Ortigas', '2011', 'Batac', '"10 La Batacque?a St., Brgy. Ablan, Batac"', '0917-9339202', 'ACTIVE'),
(14928, 'Hi-Energy/Dexter Diano', 'Dexter Diano', 'Ortigas', '2011', 'Olongapo City', '40-20th St. East Batac-Batac Olongapo City', '0917-5419835/09072862828', 'ACTIVE'),
(853, 'Dulce Acietuna', 'Dulce Acietuna', 'Ortigas', '2012', 'Batangas', '"2ND FLOOR BIG BEN BLDG., J.P. LAUREL ST., LIPA CITY BATANGAS"', '09175047772', 'ACTIVE'),
(NULL, 'Edwin Manabat', 'Edwin Manabat', 'Ortigas', '2011', 'PAMPANGA', '"2ND FLR PLAZA CRISTINA BLDG., SAN FERNANDO PAMPANGA"', '', 'ACTIVE'),
(40586, 'Elizabeth Tai HK', 'Elizabeth Tai', 'Cebu', '2012', 'Central Hongkong', '4th floor Hung Kei Mansion Queen Victoria St. Central Hk', '+85293272794', 'ACTIVE'),
(4681, 'Hi-Energ/Elvie Badongen Baguio City', 'Elvie Badongen', 'Ortigas', '2011', 'Baguio/Benguet', 'GP Shopping Arcade Upper Mabini St. Bagiuo City', '0928-1328268/0921-2026221', 'ACTIVE'),
(NULL, 'Emma A. Takahashi', 'Emma A. Takahashi', 'Ortigas', '2012', '"Caluag, Quezon"', '"1759 Sta. Maria St., Maharlika Highway Calauag Quezon"', '0947-9378099', 'ACTIVE'),
(11520, 'Emilia T. Collado', 'Emilia T. Collado', 'Ortigas', '2012', 'Masbate City', '"Lot 8 Block 9 Provincial Subd., Masbate City, Masbate"', '0949-8502475/0906-3263099', 'ACTIVE'),
(NULL, 'Erlinda Sigaya', 'Erlinda Sigaya', 'Ortigas', '2011', '', '"RM 207 THE WALDOLF GARCIA BLDG., OSME?A AVE., KALIBO AKLAN (in front of Ceres Terminal)"', '09088667243', 'LAST REQUEST DEC 2011'),
(18237, 'Eugenio T. Forbes', 'Eugenio T. Forbes', 'Ortigas', '2012', 'Lucena City', '"1011 Quezon Ave., Lucena City"', '09155814758', 'ACTIVE'),
(14814, 'Farmacia Perlan', 'Perla Derodar/Zenaido Patriarca ', 'Davao', '2012', 'South Cotabato', '"Public Market, Polomolok, South Cotabato"', '0918-9376078/0919-6051281', 'ACTIVE'),
(33007, 'Hi-Energy/Filipina Pascual/Tuguegarao', 'Filipina Pascual', 'Ortigas', '2010', '"Tuguegarao City, Cagayan"', '"Botica Simplicio, Luna St., cor Blumentritt St., Tuguegarao"', '0929-6857400/0917-6115756', 'ACTIVE'),
(30977, 'Hi-Energy/Gemma Oh', 'Gemma Oh', 'Ortigas', '2010', '"Cauayan, Isabela"', '43 National Highway Cauayan Isabela', '0906-3161404', 'ACTIVE'),
(15866, 'Summit EPC/Hans Dumar', 'Hans Dumar', 'Davao', '2011', '"Digos, Davao del Sur"', '"Rizal Avenue, Digos City"', '0939-9140865', 'ACTIVE'),
(44588, 'Henry Yu', 'Henry Yu', 'Cebu', '2009', 'Cagayan De Oro', 'Padero Bldg. 238 Don Apolinar Velez St. Cagayan De Oro City', '0920-9243797', 'ACTIVE'),
(NULL, 'Herminia Serran/Janet Madarang', 'Herminia Serran/Janet Madarang', 'Ortigas', '2012', 'Laguna', 'RM A CASAL BLDG. 222 CAPINPIN ST.  POBLACION BI?AN CITY LAGUNA (in front of BPI Bi?an Laguna)', '09212994589', 'ACTIVE'),
(5008, 'Ida B. Balbin', 'Ida B. Balbin', 'Davao', '2011', 'Benguet', '', '0920-9667096', 'ACTIVE'),
(NULL, 'Isidro Sotelo', 'Isidro Sotelo', 'Ortigas', '2012', '"Rosales, Pangasinan"', '', '', 'ACTIVE'),
(NULL, 'Jericho Aguas/Angeles City Pampanga', 'Jericho Aguas', 'Ortigas', '2012', 'Angeles City', '"AGUAS ST., PAMPANGA ANGELES CITY"', '0917-8114866', 'ACTIVE'),
(36299, 'Jesse George Robillos', 'Jesse George Robillos', 'Cebu', '2010', '', '', '', 'LAST PURCHASED JAN.2012'),
(32131, 'Jessica Pahinado', 'Jessica Pahinado', 'Cebu', '2009', '', '', '', 'CLOSED'),
(17918, 'Jose Chelo Ferrer', 'Jose Chelo Ferrer', 'Cebu', '2012', 'Lapu-Lapu', '2ND Floor MYSP bldg. Patalinghug Ave. Lapu-lapu City', '0922-9499307', 'ACTIVE'),
(15867, 'Kathryn Fe G. Dumar/Gensan', 'Kathryn Fe G. Dumar', 'Davao', '2012', 'General Santos City', '"C 11 & 12, ECA Building, National, Highway, Gen San City"', '0917-7237390', 'ACTIVE'),
(NULL, 'Hi-Energy/Ketch Maligro', 'Ketch Maligro', 'Ortigas', '2011', 'Dipolog City', '"041 Magsaysay St., Miputak, Dipolog City"', '0928-9016811/0917-6299622', 'ACTIVE'),
(7773, 'Leon Bucago', 'Leon Bucago', 'Ortigas', '2011', '"Cuyo, Palawan"', '', '0917-8223621', 'ACTIVE'),
(15287, 'Hi-Energy/Joel Divina/Manny Batac', 'Joel Divina/Manny Batac', 'Ortigas', '2011', 'Ilo-Ilo City', '"0203 E. Lopez St., Baldoza, Lapaz, Iloilo City"', '0928-5210703', 'ACTIVE'),
(NULL, 'Maricel A. Valois/Tabaco City', 'Maricel A. Valois', 'Ortigas', '2012', 'TABACO CITY', '"DEL PILAR ST., TAYHI TABACO CITY"', '09217515047', 'ACTIVE'),
(1256, 'Hi-Energy/Marites Agraam', 'Marites Agraam', 'Ortigas', '2012', 'Nueva Vizcaya', '"Heroes Blvd., Caloocan, Bambang, Nueva Vizcaya"', '0918-7896970/0927-3832106', 'ACTIVE'),
(20658, 'Marlo Guanzon/Negros Occidental', 'Marlo Guanzon', 'Ortigas', '2012', 'Bacolod City', 'CANE TOWN VICTORIAS CITY NEGROS OCCIDENTAL ', '0917-3045627', 'ACTIVE'),
(44480, 'Blue Falcon EPC/Merlyn Yepez', 'Merlyn Yepez', 'Davao', '2011', '"Panabo City, Davao"', 'Quirino St. Panabo City', '0906-4705219/0908-3938248', 'ACTIVE'),
(NULL, 'Merry Claire Mendoza', 'Merry Claire Mendoza', 'Ortigas', '2012', 'Batangas', '#45 NATIONAL ROAD TANAUAN CITY BATANGAS', '09234534593', 'ACTIVE'),
(40910, 'Hi-Energy/Mila Tan', 'Mila Tan', 'Ortigas', '2011', '"Puerto Princesa, Palawan"', 'Romasanta Bldg. Wescom RD. Puerto Princesa City', '0919-8451765', 'ACTIVE'),
(37239, 'Nemesia Sagarino', 'Nemesia Sagarino', 'Ortigas', '2011', 'Comval Province', '"Poblacion Nabunturan, Compostela Valley Province"', '09109854544', 'LAST REQUEST JUN 2011'),
(7097, 'KJM EPC/Paquito Bitang', 'Paquito Bitang', 'Davao', '2011', '"Davao, Oriental"', '"Aguinaldo St. Lupon, Davao Oriental"', '0917-8893741', 'ACTIVE'),
(32356, 'Quadcore International - Bacolod', 'Mitzie Palma', 'Cebu', '2011', 'Bacolod City', '"GF Cineflex Bldg. Araneta St. Bacolod City, 6100 Negros Oriental"', '0922-8526336', 'CLOSED'),
(32356, 'Quadcore International - Dumaguete', 'Mitzie Palma', 'Cebu', '2011', 'Dumaguete', '"Ground Flr., Pastoral Center Perdices St. Dumaguete City (beside Cathedral Church)"', '0915-9518490', 'ACTIVE'),
(11064, 'Blue Warriors/Ramon Chavez', 'Ramon Chavez', 'Davao', '', 'Tagum', '"Pioneer Ave., Tagum City"', '0928-5003513', 'ACTIVE'),
(317, 'Hi-Energy/Raquel Abad', 'Raquel Abad', 'Ortigas', '2011', '"Roxas, Palawan"', '"Petac Roxas, Palawan"', '0909-9117110', 'ACTIVE'),
(42424, 'Gold Orient Hi-Energy/Raymund Tuvera', 'Raymund Tuvera', 'Ortigas', '2011', '"Calapan City, Oriental Mindoro"', 'Calapan City (Pachoca Village)', '0917-8281419', 'ACTIVE'),
(34307, 'Richelle Prado - Mandaue City', 'Richelle Prado', 'Cebu', '2010', 'Maguikay Mandaue', '', '', 'CLOSED'),
(42949, 'Hi-Energy/Rodolfo Valerio', 'Rodolfo Valerio', 'Ortigas', '2011', 'Dagupan City', '"Rm 09A 2/F F. Consuelo Bldg., M.H. Del Pilar, Dagupan City"', '0916-5139864/0917-4471879', 'ACTIVE'),
(43772, 'Rogelio Villapaz', 'Rogelio Villapaz', 'Ortigas', '2010', '"Antipolo, Rizal"', 'Rm. 216 FBM Bldg. M.L.Quezon St. Antipolo City', '385-5432', 'ACTIVE'),
(NULL, 'Gen San Vital Group', 'Rosalinda Veloria/Zenaido Patriarca', 'Davao', '', '', '', '', 'LAST REQUEST NOV 2011'),
(37288, 'Rosa Delena Sagusay', 'Rosa Delena Sagusay', 'Davao', '', 'Butuan City', '"754 J-C Aquino Avenue, Butuan City"', '342-8094/0923-8791135', 'LAST REQUEST MAR 2010'),
(205, 'San Jose Multi-Purpose Coop', 'San Jose Multi-Purpose Coop', 'Ortigas', '2011', '"San Jose, Antique"', '"Trade Town, Dalipe, San Jose Antique"', '0917-3081505', 'ACTIVE'),
(NULL, 'Sharon Rose de Leon/Lower Sultan Kudarat', 'Sharon Rose de Leon', 'Davao', '2012', 'Sultan Kudarat', '"Didtaras, Lambayong, Sultan Kudarat"', '0947-9216790', 'ACTIVE'),
(NULL, 'Sheryl A. Natulla/Tacloban', 'Sheryl A. Natulla', 'Ortigas', '2012', 'Tacloban City', '"Del Pilar St., Tacloban City"', '0920-5371536', 'ACTIVE'),
(26417, 'Skycrapers', 'Eddie Mahilum', 'Cebu', '2010', 'Roxas', '3rd Fl. Of Sari-Sari Bakeshop Roxas City', '0929-8023019', 'ACTIVE'),
(28018, 'Teresita Matas', 'Teresita Matas', 'Ortigas', '2012', 'Cagayan Valley', '123 National Highway Tucalana Lal-lo Cagayan Valley', '0917-8440818', 'ACTIVE'),
(NULL, '"C Brothers/Mati, Davao Oriental"', 'Ulysess/Leonides L. Caballero', 'Davao', '2011', 'Davao Oriental', '"Do?a Rosa St., Madang, Mati City, Dvo. Oriental"', '0919-7810662/091-03407596', 'ACTIVE'),
(35685, 'Unified Power Team', 'Dale Renacia', 'Cebu', '2010', 'Pagadian', '"Pajares St. corner Pulmones St., Pagadian City, Zamboanga Del Sur"', '0917-3273852', 'ACTIVE'),
(NULL, 'Vanessa Blanca Cucal/Nueva Ecija', 'Vanessa Blanca Cucal', 'Ortigas', '2012', 'Nueva Ecija', '"#188 Del Pilar St., Brgy. Sangitan West, Cabanatuan City, Nueva Ecija (in front of Sangitan West Baranggay Hall near freedom park and tennis court)"', '0927-9973304', 'ACTIVE'),
(30841, 'Infinity/Wenceslao Ocampo', 'Wenceslao Ocampo', 'Davao', '', 'Sto. Thomas', '"MGR Building,2/f,near Sto Tomas Market,Sto. Tomas, Dvo del Norte"', '0917-5427774', 'ACTIVE'),
(10475, 'Gen San Power/Zaldy Castillon', 'Zaldy Castillon', 'Davao', '2011', 'General Santos City', '"Brgy. Calumpang, Gensan City"', '0906-2250473', 'ACTIVE');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
