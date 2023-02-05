-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 05, 2023 at 02:50 AM
-- Server version: 10.3.36-MariaDB-cll-lve
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pawansmm_pawan`
--

-- --------------------------------------------------------

--
-- Table structure for table `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `id` int(11) NOT NULL,
  `bank_name` varchar(225) NOT NULL,
  `bank_sube` varchar(225) NOT NULL,
  `bank_hesap` varchar(225) NOT NULL,
  `bank_iban` text NOT NULL,
  `bank_alici` varchar(225) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` text COLLATE utf8mb4_bin NOT NULL,
  `category_line` double NOT NULL,
  `category_type` enum('1','2') CHARACTER SET utf8 NOT NULL DEFAULT '2',
  `category_secret` enum('1','2') COLLATE utf8mb4_bin NOT NULL DEFAULT '2',
  `category_icon` text COLLATE utf8mb4_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `childpanels`
--

CREATE TABLE `childpanels` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `domain` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `currency` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `child_username` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `child_password` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `charge` double NOT NULL,
  `status` enum('active','terminated','disabled') COLLATE utf8_unicode_ci NOT NULL,
  `renewal_date` date NOT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `client_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `email` varchar(225) CHARACTER SET utf8 NOT NULL,
  `username` varchar(225) CHARACTER SET utf8 NOT NULL,
  `password` text CHARACTER SET utf8 NOT NULL,
  `telephone` varchar(225) CHARACTER SET utf8 NOT NULL,
  `balance` double NOT NULL DEFAULT 0,
  `balance_type` enum('1','2') CHARACTER SET utf8 NOT NULL DEFAULT '2',
  `debit_limit` double DEFAULT NULL,
  `spent` double NOT NULL DEFAULT 0,
  `register_date` datetime NOT NULL,
  `login_date` datetime DEFAULT NULL,
  `login_ip` varchar(225) CHARACTER SET utf8 DEFAULT NULL,
  `apikey` text CHARACTER SET utf8 DEFAULT NULL,
  `tel_type` enum('1','2') CHARACTER SET utf8 NOT NULL DEFAULT '1' COMMENT '2 -> ON, 1 -> OFF	',
  `email_type` enum('1','2') CHARACTER SET utf8 NOT NULL DEFAULT '1' COMMENT '2 -> ON, 1 -> OFF	',
  `client_type` enum('1','2') CHARACTER SET utf8 NOT NULL DEFAULT '2' COMMENT '2 -> ON, 1 -> OFF',
  `access` text CHARACTER SET utf8 NOT NULL,
  `lang` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT 'en',
  `timezone` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`client_id`, `name`, `email`, `username`, `password`, `telephone`, `balance`, `balance_type`, `debit_limit`, `spent`, `register_date`, `login_date`, `login_ip`, `apikey`, `tel_type`, `email_type`, `client_type`, `access`, `lang`, `timezone`) VALUES
(15, 'admin', 'admin@admin.com', 'admin', 'dca907d589cb040dddeecc145294b266', '+919708606814', 40.858475, '2', NULL, 4.161525, '2021-12-25 17:13:29', '2022-03-14 13:30:56', '223.187.186.25', '32805c4567981777d93d55540eff5a0c', '2', '2', '2', '{\"admin_access\":\"1\",\"users\":\"1\",\"orders\":\"1\",\"subscriptions\":\"1\",\"dripfeed\":\"1\",\"services\":\"1\",\"payments\":\"1\",\"tickets\":\"1\",\"reports\":\"1\",\"general_settings\":\"1\",\"pages\":\"1\",\"payments_settings\":\"1\",\"bank_accounts\":\"1\",\"payments_bonus\":\"1\",\"alert_settings\":\"1\",\"providers\":\"1\",\"themes\":\"1\",\"admins\":\"1\",\"language\":\"1\",\"meta\":\"1\",\"child-panels\":\"1\",\"proxy\":\"1\",\"kuponlar\":\"1\"}', 'en', 0),
(26, 'dharmendra', 'laptiop@gmail.com', 'admin12', '69005bb62e9622ee1de61958aacf0f63', '54858552522', 0, '2', NULL, 0, '2023-02-04 19:06:52', '2023-02-04 21:07:43', '2.58.194.135', 'b7db7b4f90e05ab18d9a0cfbe31ec388', '1', '1', '2', '{\"admin_access\":\"1\",\"users\":\"1\",\"orders\":\"1\",\"subscriptions\":\"1\",\"dripfeed\":\"1\",\"services\":\"1\",\"payments\":\"1\",\"tickets\":\"1\",\"reports\":\"1\",\"general_settings\":\"1\",\"pages\":\"1\",\"payments_settings\":\"1\",\"bank_accounts\":\"1\",\"payments_bonus\":\"1\",\"alert_settings\":\"1\",\"providers\":\"1\",\"themes\":\"1\",\"admins\":\"1\",\"language\":\"1\",\"meta\":\"1\",\"child-panels\":\"1\",\"proxy\":\"1\",\"kuponlar\":\"1\"}', 'en', 0);

-- --------------------------------------------------------

--
-- Table structure for table `clients_category`
--

CREATE TABLE `clients_category` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `clients_price`
--

CREATE TABLE `clients_price` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `service_price` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `clients_service`
--

CREATE TABLE `clients_service` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `client_report`
--

CREATE TABLE `client_report` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `action` text NOT NULL,
  `report_ip` varchar(225) NOT NULL,
  `report_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `client_report`
--

INSERT INTO `client_report` (`id`, `client_id`, `action`, `report_ip`, `report_date`) VALUES
(1, 15, 'Üye girişi yapıldı.', '42.111.201.155', '2021-12-14 11:36:51'),
(2, 15, 'Üye girişi yapıldı.', '42.111.217.135', '2021-12-14 18:45:53'),
(3, 19, 'Kullanıcı kaydı yapıldı.', '106.214.115.59', '2021-12-14 19:22:44'),
(4, 19, 'Üye girişi yapıldı.', '106.214.115.59', '2021-12-14 19:22:52'),
(5, 15, 'Üye girişi yapıldı.', '42.111.217.135', '2021-12-14 20:06:26'),
(6, 15, 'Yönetici girişi yapıldı.', '103.40.199.106', '2021-12-14 20:07:22'),
(7, 15, 'Yönetici girişi yapıldı.', '119.160.64.250', '2021-12-14 21:42:24'),
(8, 15, 'Üye girişi yapıldı.', '42.111.193.83', '2021-12-15 08:16:03'),
(9, 20, 'Kullanıcı kaydı yapıldı.', '117.203.253.234', '2021-12-15 17:21:46'),
(10, 21, 'Kullanıcı kaydı yapıldı.', '42.111.193.83', '2021-12-15 17:23:14'),
(11, 20, 'Üye girişi yapıldı.', '117.203.253.234', '2021-12-15 17:24:21'),
(12, 15, 'Yönetici girişi yapıldı.', '2409:4064:4e04:276e:6152:cc52:5da8:6043, 172.70.189.32', '2021-12-25 12:56:56'),
(13, 15, 'Yönetici girişi yapıldı.', '2409:4064:4e04:276e:d190:59c5:800d:391c, 172.70.142.145', '2021-12-25 17:15:57'),
(14, 22, 'Kullanıcı kaydı yapıldı.', '59.89.181.235', '2022-01-11 17:23:51'),
(15, 23, 'Kullanıcı kaydı yapıldı.', '106.212.86.24', '2022-01-11 17:33:41'),
(16, 15, 'Yönetici girişi yapıldı.', '59.89.181.235', '2022-01-11 17:58:49'),
(17, 15, 'Yönetici girişi yapıldı.', '152.206.174.195', '2022-01-15 02:37:58'),
(18, 15, 'New 0.01  payment has been made with PerfectMoney', '78.41.203.75', '2022-01-15 02:48:00'),
(19, 15, 'New 0.01  payment has been made with PerfectMoney', '78.41.203.75', '2022-01-15 02:49:45'),
(20, 24, 'Kullanıcı kaydı yapıldı.', '195.114.147.139', '2022-01-17 13:51:39'),
(21, 24, 'Üye girişi yapıldı.', '195.114.147.139', '2022-01-17 13:51:50'),
(22, 25, 'Kullanıcı kaydı yapıldı.', '157.47.39.105', '2022-01-17 21:43:19'),
(23, 25, 'Üye girişi yapıldı.', '157.47.39.105', '2022-01-17 21:43:33'),
(24, 25, 'Üye girişi yapıldı.', '223.238.4.92', '2022-01-18 10:32:06'),
(25, 15, 'Yönetici girişi yapıldı.', '223.225.59.31', '2022-03-14 12:38:27'),
(26, 15, 'Yönetici girişi yapıldı.', '223.225.59.31', '2022-03-14 12:44:34'),
(27, 15, 'Yönetici girişi yapıldı.', '223.225.59.31', '2022-03-14 12:44:53'),
(28, 15, 'Yönetici girişi yapıldı.', '223.225.59.31', '2022-03-14 13:13:24'),
(29, 15, 'Yönetici girişi yapıldı.', '223.187.186.25', '2022-03-14 13:15:42'),
(30, 15, 'Yönetici girişi yapıldı.', '223.187.186.25', '2022-03-14 13:19:47'),
(31, 15, 'Yönetici girişi yapıldı.', '223.187.186.25', '2022-03-14 13:20:27'),
(32, 15, 'Yönetici girişi yapıldı.', '223.187.186.25', '2022-03-14 13:21:51'),
(33, 15, 'Üye girişi yapıldı.', '223.225.59.31', '2022-03-14 13:26:23'),
(34, 15, 'Kullanıcı parolası değiştirildi', '223.225.59.31', '2022-03-14 13:26:55'),
(35, 15, 'Yönetici girişi yapıldı.', '223.187.186.25', '2022-03-14 13:28:00'),
(36, 15, 'Yönetici girişi yapıldı.', '223.187.186.25', '2022-03-14 13:30:56'),
(37, 26, 'Kullanıcı kaydı yapıldı.', '92.38.148.53', '2023-02-04 19:06:52'),
(38, 26, 'Yönetici girişi yapıldı.', '92.38.148.53', '2023-02-04 19:07:49'),
(39, 26, 'Yönetici girişi yapıldı.', '2.58.194.135', '2023-02-04 21:07:43');

-- --------------------------------------------------------

--
-- Table structure for table `kuponlar`
--

CREATE TABLE `kuponlar` (
  `id` int(11) NOT NULL,
  `kuponadi` varchar(255) NOT NULL,
  `adet` int(11) NOT NULL,
  `tutar` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kupon_kullananlar`
--

CREATE TABLE `kupon_kullananlar` (
  `id` int(11) NOT NULL,
  `uye_id` int(11) NOT NULL,
  `kuponadi` varchar(255) NOT NULL,
  `tutar` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `language_name` varchar(225) NOT NULL,
  `language_code` varchar(225) NOT NULL,
  `language_type` enum('2','1') NOT NULL DEFAULT '2',
  `default_language` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `language_name`, `language_code`, `language_type`, `default_language`) VALUES
(1, 'Türkçe', 'tr', '1', '0'),
(2, 'English', 'en', '2', '1'),
(3, 'Hindi', 'hi', '2', '0');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `api_orderid` int(11) NOT NULL DEFAULT 0,
  `order_error` text NOT NULL,
  `order_detail` text DEFAULT NULL,
  `order_api` int(11) NOT NULL DEFAULT 0,
  `api_serviceid` int(11) NOT NULL DEFAULT 0,
  `api_charge` double NOT NULL DEFAULT 0,
  `api_currencycharge` double NOT NULL DEFAULT 1,
  `order_profit` double NOT NULL,
  `order_quantity` double NOT NULL,
  `order_extras` text NOT NULL,
  `order_charge` double NOT NULL,
  `dripfeed` enum('1','2','3') DEFAULT '1' COMMENT '2 -> ON, 1 -> OFF',
  `dripfeed_id` double NOT NULL DEFAULT 0,
  `subscriptions_id` double NOT NULL DEFAULT 0,
  `subscriptions_type` enum('1','2') NOT NULL DEFAULT '1' COMMENT '2 -> ON, 1 -> OFF',
  `dripfeed_totalcharges` double DEFAULT NULL,
  `dripfeed_runs` double DEFAULT NULL,
  `dripfeed_delivery` double NOT NULL DEFAULT 0,
  `dripfeed_interval` double DEFAULT NULL,
  `dripfeed_totalquantity` double DEFAULT NULL,
  `dripfeed_status` enum('active','completed','canceled') NOT NULL DEFAULT 'active',
  `order_url` text NOT NULL,
  `order_start` double NOT NULL DEFAULT 0,
  `order_finish` double NOT NULL DEFAULT 0,
  `order_remains` double NOT NULL DEFAULT 0,
  `order_create` datetime NOT NULL,
  `order_status` enum('pending','inprogress','completed','partial','processing','canceled') NOT NULL DEFAULT 'pending',
  `subscriptions_status` enum('active','paused','completed','canceled','expired','limit') NOT NULL DEFAULT 'active',
  `subscriptions_username` text DEFAULT NULL,
  `subscriptions_posts` double DEFAULT NULL,
  `subscriptions_delivery` double NOT NULL DEFAULT 0,
  `subscriptions_delay` double DEFAULT NULL,
  `subscriptions_min` double DEFAULT NULL,
  `subscriptions_max` double DEFAULT NULL,
  `subscriptions_expiry` date DEFAULT NULL,
  `last_check` datetime NOT NULL,
  `order_where` enum('site','api') NOT NULL DEFAULT 'site',
  `show_refill` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `page_id` int(11) NOT NULL,
  `page_name` varchar(225) NOT NULL,
  `page_get` varchar(225) NOT NULL,
  `page_content` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`page_id`, `page_name`, `page_get`, `page_content`) VALUES
(1, 'Login', 'auth', ''),
(2, 'New Order', 'neworder', 'User Manual ( Must Read )<div>&nbsp;</div><div>READ BEFORE MAKING AN ORDER</div><div>1. If You Want To Increase Your Instagram Followers So You Have To Put Profile Url Of Instagram Accounts Like https://www.instagram.com/username</div><div><br></div><div>*  Do Not Put Profile Username If You Want To Increase Instagram Followers&nbsp;</div><div><br></div><div>*  If You Want To Likes Of Post , Then Put Post Link Only&nbsp;</div><div><br></div><div>Don\'t change username if u ordered refill service otherwise refill will never work and this can not be solved&nbsp;</div><div><br></div><div>2. Always Check the order delivery by visiting the link you give.&nbsp;</div><div><br></div><div>3. Once an order is entered, it is IMPOSSIBLE to stop it 99% of the time, so please try not to contact us requesting this. If the post or profile is deleted or changed to private a refund cannot not be given.</div><div><br></div><div>4. Read Description Before adding order</div><div><br></div><div>5. Dont place multiple orders on one link at once. Wait for first order to complete</div><div><br></div><div>6. If you face any issues Open a support Ticket after24 hours of ordering&nbsp; &nbsp; &nbsp;</div><div>&nbsp;</div><div>&nbsp;</div><div>Must read</div><div>&nbsp;</div><div><br></div><div>Service may take 0-24 hours  time because of many   other and overload We try our best to complete your order in 0-24 hours&nbsp;</div><div><br></div><div>Ticket raise or co is only allowed after  24 hours of ordering the service if u want to say not started yet</div><div><br></div><div>❤️We thank u all for your love trust and support</div>'),
(3, 'Services', 'services', ''),
(4, 'Add Funds', 'addfunds', ''),
(5, 'Tickets', 'tickets', '<p><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">faf</font></font></p>');
INSERT INTO `pages` (`page_id`, `page_name`, `page_get`, `page_content`) VALUES
(6, 'Terms', 'terms', '<p><br></p><style>\r\n  [data-custom-class=\'body\'], [data-custom-class=\'body\'] * {\r\n          background: transparent !important;\r\n        }\r\n[data-custom-class=\'title\'], [data-custom-class=\'title\'] * {\r\n          font-family: Arial !important;\r\nfont-size: 26px !important;\r\ncolor: #000000 !important;\r\n        }\r\n[data-custom-class=\'subtitle\'], [data-custom-class=\'subtitle\'] * {\r\n          font-family: Arial !important;\r\ncolor: #595959 !important;\r\nfont-size: 14px !important;\r\n        }\r\n[data-custom-class=\'heading_1\'], [data-custom-class=\'heading_1\'] * {\r\n          font-family: Arial !important;\r\nfont-size: 19px !important;\r\ncolor: #000000 !important;\r\n        }\r\n[data-custom-class=\'heading_2\'], [data-custom-class=\'heading_2\'] * {\r\n          font-family: Arial !important;\r\nfont-size: 17px !important;\r\ncolor: #000000 !important;\r\n        }\r\n[data-custom-class=\'body_text\'], [data-custom-class=\'body_text\'] * {\r\n          color: #595959 !important;\r\nfont-size: 14px !important;\r\nfont-family: Arial !important;\r\n        }\r\n[data-custom-class=\'link\'], [data-custom-class=\'link\'] * {\r\n          color: #3030F1 !important;\r\nfont-size: 14px !important;\r\nfont-family: Arial !important;\r\nword-break: break-word !important;\r\n        }\r\n</style>\r\n\r\n      <div data-custom-class=\"body\">\r\n      <div align=\"center\" style=\"text-align: left;\"><div align=\"center\" class=\"MsoNormal\" data-custom-class=\"title\" style=\"text-align: left; line-height: 1.5;\"><strong><span style=\"line-height: 22.5px; font-size: 26px;\"><bdt class=\"block-component\"></bdt><bdt class=\"question\">TERMS AND CONDITIONS</bdt><bdt class=\"statement-end-if-in-editor\"></bdt></span></strong></div><div align=\"center\" class=\"MsoNormal\" style=\"text-align: center; line-height: 22.5px;\"><a name=\"_7m5b3xg56u7y\"></a></div><div align=\"center\" class=\"MsoNormal\" data-custom-class=\"subtitle\" style=\"text-align: left; line-height: 150%;\"><br></div><div align=\"center\" class=\"MsoNormal\" data-custom-class=\"subtitle\" style=\"text-align: left; line-height: 1.5;\"><span style=\"color: rgb(89, 89, 89); font-size: 14.6667px; text-align: justify;\"><strong>Last updated <bdt class=\"block-container question question-in-editor\" data-id=\"6d5ec16f-716c-32d6-1aa6-f4c1bd8cce1f\" data-type=\"question\">September 14, 2021</bdt></strong></span><br><a name=\"_gm5sejt4p02f\"></a></div></div><div align=\"center\" style=\"text-align: left;\"><br></div><div align=\"center\" style=\"text-align: left;\"><div class=\"MsoNormal\" style=\"text-align:justify;line-height:115%;\"><br></div><div class=\"MsoNormal\" style=\"text-align:justify;line-height:115%;\"><br></div><div class=\"MsoNormal\" data-custom-class=\"heading_1\" style=\"line-height: 1.5;\"><a name=\"_6aa3gkhykvst\"></a><strong><span style=\"line-height: 115%; font-family: Arial; font-size: 19px;\">AGREEMENT TO TERMS</span></strong></div></div><div align=\"center\" style=\"text-align: left; line-height: 1;\"><br></div><div align=\"center\" style=\"text-align: left;\"><div class=\"MsoNormal\" data-custom-class=\"body_text\" style=\"line-height: 1.5;\"><span style=\"font-size:11.0pt;line-height:115%;font-family:Arial;\r\nCalibri;color:#595959;mso-themecolor:text1;mso-themetint:166;\">These Terms of Use constitute a legally binding agreement made between you, whether personally or on behalf of an entity (“you”) and <bdt class=\"block-container question question-in-editor\" data-id=\"9d459c4e-c548-e5cb-7729-a118548965d2\" data-type=\"question\">SMM CANON World</bdt><bdt class=\"block-component\"></bdt> (\"<bdt class=\"block-component\"></bdt><strong>Company</strong><bdt class=\"statement-end-if-in-editor\"></bdt>\", “<strong>we</strong>”, “<strong>us</strong>”, or “<strong>our</strong>”), concerning your access to and use of the <bdt class=\"block-container question question-in-editor\" data-id=\"fdf30452-99b8-c68b-5cdf-34af764cd1fd\" data-type=\"question\">smmcanon.com</bdt> website as well as any other media form, media channel, mobile website or mobile application related, linked, or otherwise connected thereto (collectively, the “Site”).<span style=\"font-size:11.0pt;line-height:115%;\r\nArial;mso-fareast-font-family:Calibri;color:#595959;mso-themecolor:text1;\r\nmso-themetint:166;\"><span style=\"font-size:11.0pt;line-height:115%;\r\nArial;mso-fareast-font-family:Calibri;color:#595959;mso-themecolor:text1;\r\nmso-themetint:166;\"><span style=\"font-size:11.0pt;line-height:115%;\r\nArial;mso-fareast-font-family:Calibri;color:#595959;mso-themecolor:text1;\r\nmso-themetint:166;\"><bdt class=\"question\"><bdt class=\"block-component\"></bdt></bdt><span style=\"font-size:11.0pt;line-height:115%;\r\nArial;mso-fareast-font-family:Calibri;color:#595959;mso-themecolor:text1;\r\nmso-themetint:166;\"><bdt class=\"block-component\"></bdt></span> We are registered in<bdt class=\"block-component\"></bdt><bdt class=\"block-component\"></bdt> <span style=\"font-size:11.0pt;line-height:115%;\r\nArial;mso-fareast-font-family:Calibri;color:#595959;mso-themecolor:text1;\r\nmso-themetint:166;\"><span style=\"font-size:11.0pt;line-height:115%;\r\nArial;mso-fareast-font-family:Calibri;color:#595959;mso-themecolor:text1;\r\nmso-themetint:166;\"><bdt class=\"question\">India</bdt><bdt class=\"statement-end-if-in-editor\"><span style=\"font-size:11.0pt;line-height:115%;\r\nArial;mso-fareast-font-family:Calibri;color:#595959;mso-themecolor:text1;\r\nmso-themetint:166;\"><span style=\"font-size:11.0pt;line-height:115%;\r\nArial;mso-fareast-font-family:Calibri;color:#595959;mso-themecolor:text1;\r\nmso-themetint:166;\"><bdt class=\"statement-end-if-in-editor\"></bdt></span></span></bdt></span></span> and have our registered office at <bdt class=\"question\">Ramnagar Mahakalpada</bdt><bdt class=\"block-component\"></bdt>, <bdt class=\"question\">Kentia</bdt><span style=\"font-size:11.0pt;line-height:115%;\r\nArial;mso-fareast-font-family:Calibri;color:#595959;mso-themecolor:text1;\r\nmso-themetint:166;\"><span style=\"font-size:11.0pt;line-height:115%;\r\nArial;mso-fareast-font-family:Calibri;color:#595959;mso-themecolor:text1;\r\nmso-themetint:166;\"><bdt class=\"statement-end-if-in-editor\"></bdt></span></span>, <bdt class=\"question\">Kendrapara</bdt></span></span><span style=\"font-size: 15px;\"><span data-custom-class=\"body_text\"><span style=\"font-size: 15px;\"><span data-custom-class=\"body_text\"><span style=\"color: rgb(89, 89, 89);\"><bdt class=\"block-component\"></bdt>, <bdt class=\"question\">Odisha</bdt><bdt class=\"statement-end-if-in-editor\"></bdt><bdt class=\"block-component\"></bdt> <bdt class=\"question\">754224</bdt><bdt class=\"statement-end-if-in-editor\"></bdt></span></span></span></span></span><span style=\"font-size:11.0pt;line-height:115%;\r\nArial;mso-fareast-font-family:Calibri;color:#595959;mso-themecolor:text1;\r\nmso-themetint:166;\"><span style=\"font-size:11.0pt;line-height:115%;\r\nArial;mso-fareast-font-family:Calibri;color:#595959;mso-themecolor:text1;\r\nmso-themetint:166;\"><bdt class=\"statement-end-if-in-editor\">.</bdt><bdt class=\"else-block\"></bdt></span></span><bdt class=\"statement-end-if-in-editor\"></bdt></span><bdt class=\"block-component\"></bdt></span> You agree that by accessing the Site, you have read, understood, and agreed to be bound by all of these Terms of Use. IF YOU DO NOT AGREE WITH ALL OF THESE TERMS OF USE, THEN YOU ARE EXPRESSLY PROHIBITED FROM USING THE SITE AND YOU MUST DISCONTINUE USE IMMEDIATELY.</div></div><div align=\"center\" style=\"text-align: left; line-height: 1;\"><br></div><div align=\"center\" style=\"text-align: left;\"><div class=\"MsoNormal\" data-custom-class=\"body_text\" style=\"line-height: 1.5;\"><span style=\"font-size:11.0pt;line-height:115%;font-family:Arial;\r\nCalibri;color:#595959;mso-themecolor:text1;mso-themetint:166;\">Supplemental terms and conditions or documents that may be posted on the Site from time to time are hereby expressly incorporated herein by reference. We reserve the right, in our sole discretion, to make changes or modifications to these Terms of Use <bdt class=\"block-component\"></bdt>at any time and for any reason<bdt class=\"statement-end-if-in-editor\"></bdt>. We will alert you about any changes by updating the “Last updated” date of these Terms of Use, and you waive any right to receive specific notice of each such change. Please ensure that you check the applicable Terms every time you use our Site so that you understand which Terms apply. You will be subject to, and will be deemed to have been made aware of and to have accepted, the changes in any revised Terms of Use by your continued use of the Site after the date such revised Terms of Use are posted.</span></div></div><div align=\"center\" style=\"text-align: left; line-height: 1;\"><br></div><div align=\"center\" style=\"text-align: left;\"><div class=\"MsoNormal\" data-custom-class=\"body_text\" style=\"line-height: 1.5;\"><span style=\"font-size:11.0pt;line-height:115%;font-family:Arial;\r\nCalibri;color:#595959;mso-themecolor:text1;mso-themetint:166;\">The information provided on the Site is not intended for distribution to or use by any person or entity in any jurisdiction or country where such distribution or use would be contrary to law or regulation or which would subject us to any registration requirement within such jurisdiction or country. Accordingly, those persons who choose to access the Site from other locations do so on their own initiative and are solely responsible for compliance with local laws, if and to the extent local laws are applicable.</span></div><div class=\"MsoNormal\" style=\"line-height: 115%;\"><bdt class=\"block-component\"></bdt></div></div><div align=\"center\" data-custom-class=\"body_text\" style=\"text-align: left; line-height: 1;\"><br></div><div align=\"center\" style=\"text-align: left;\"><div class=\"MsoNormal\" data-custom-class=\"body_text\" style=\"line-height: 1.5;\"><bdt class=\"block-container if\" data-type=\"if\" id=\"a2595956-7028-dbe5-123e-d3d3a93ed076\"><bdt data-type=\"conditional-block\"><bdt data-type=\"body\"><span style=\"font-size:11.0pt;line-height:115%;font-family:Arial;\r\nCalibri;color:#595959;mso-themecolor:text1;mso-themetint:166;\"><bdt class=\"block-component\"></bdt><bdt class=\"block-container if\" data-type=\"if\" id=\"a2595956-7028-dbe5-123e-d3d3a93ed076\"><bdt data-type=\"conditional-block\"><bdt data-type=\"body\"><span style=\"color: rgb(89, 89, 89); font-size: 14.6667px;\">All users who are minors in the jurisdiction in which they reside (generally under the age of 18) must have the permission of, and be directly supervised by, their parent or guardian to use the Site. If you are a minor, you must have your parent or guardian read and agree to these Terms of Use prior to you using the Site.</span></bdt></bdt></bdt></span></bdt></bdt><bdt class=\"statement-end-if-in-editor\" data-type=\"close\"></bdt></bdt></div></div><div align=\"center\" style=\"text-align: left; line-height: 1.5;\"><br></div><div align=\"center\" style=\"text-align: left; line-height: 1.5;\"><br></div><div align=\"center\" style=\"text-align: left;\"><div class=\"MsoNormal\" data-custom-class=\"heading_1\" style=\"line-height: 1.5;\"><a name=\"_b6y29mp52qvx\"></a><strong><span style=\"line-height: 115%; font-family: Arial; font-size: 19px;\">INTELLECTUAL PROPERTY RIGHTS</span></strong></div></div><div align=\"center\" style=\"text-align: left; line-height: 1;\"><br></div><div align=\"center\" style=\"text-align: left;\"><div class=\"MsoNormal\" data-custom-class=\"body_text\" style=\"line-height: 1.5;\"><span style=\"font-size:11.0pt;line-height:115%;font-family:Arial;\r\nCalibri;color:#595959;mso-themecolor:text1;mso-themetint:166;\">Unless otherwise\r\nindicated, the Site is our proprietary property and all source code, databases,\r\nfunctionality, software, website designs, audio, video, text, photographs, and\r\ngraphics on the Site (collectively, the “Content”) and the trademarks, service\r\nmarks, and logos contained therein (the “Marks”) are owned or controlled by us or\r\nlicensed to us, and are protected by copyright and trademark laws and various\r\nother intellectual property rights and unfair competition laws of the United\r\nStates, international copyright laws, and international conventions. The Content and the Marks are provided on the\r\nSite “AS IS” for your information and personal use only. Except as expressly provided in these Terms\r\nof Use, no part of the Site and no Content or Marks may be copied, reproduced,\r\naggregated, republished, uploaded, posted, publicly displayed, encoded,\r\ntranslated, transmitted, distributed, sold, licensed, or otherwise exploited\r\nfor any commercial purpose whatsoever, without our express prior written\r\npermission.</span></div></div><div align=\"center\" style=\"text-align: left; line-height: 1;\"><br></div><div align=\"center\" style=\"text-align: left;\"><div class=\"MsoNormal\" data-custom-class=\"body_text\" style=\"line-height: 1.5;\"><span style=\"font-size:11.0pt;line-height:115%;font-family:Arial;\r\nCalibri;color:#595959;mso-themecolor:text1;mso-themetint:166;\">Provided that you\r\nare eligible to use the Site, you are granted a limited license to access and\r\nuse the Site and to download or print a copy of any portion of the Content to\r\nwhich you have properly gained access solely for your personal, non-commercial\r\nuse. We reserve all rights not expressly granted to you in and to the Site, the Content and the Marks.</span></div></div><div align=\"center\" style=\"text-align: left; line-height: 1.5;\"><br></div><div align=\"center\" style=\"text-align: left; line-height: 1.5;\"><br></div><div align=\"center\" style=\"text-align: left;\"><div class=\"MsoNormal\" data-custom-class=\"heading_1\" style=\"line-height: 1.5;\"><a name=\"_5hg7kgyv9l8z\"></a><strong><span style=\"line-height: 115%; font-family: Arial; font-size: 19px;\">USER REPRESENTATIONS</span></strong></div></div><div align=\"center\" style=\"text-align: left; line-height: 1;\"><br></div><div align=\"center\" style=\"text-align: left;\"><div class=\"MsoNormal\" data-custom-class=\"body_text\" style=\"line-height: 1.5;\"><span style=\"font-size:11.0pt;line-height:115%;font-family:Arial;\r\nCalibri;color:#595959;mso-themecolor:text1;mso-themetint:166;\">By using the Site, you represent and warrant that:</span><bdt class=\"block-container if\" data-type=\"if\" id=\"d2d82ca8-275f-3f86-8149-8a5ef8054af6\"><bdt data-type=\"conditional-block\"><bdt class=\"block-component\" data-record-question-key=\"user_account_option\" data-type=\"statement\"></bdt> <bdt data-type=\"body\"><span style=\"color: rgb(89, 89, 89); font-size: 11pt;\">(</span><span style=\"color: rgb(89, 89, 89); font-size: 14.6667px;\">1</span><span style=\"color: rgb(89, 89, 89); font-size: 11pt;\">) all registration information you submit\r\nwill be true, accurate, current, and complete; (</span><span style=\"color: rgb(89, 89, 89); font-size: 14.6667px;\">2</span><span style=\"color: rgb(89, 89, 89); font-size: 11pt;\">) you will maintain the accuracy of such information and promptly update such registration information as necessary;</span></bdt></bdt><bdt class=\"statement-end-if-in-editor\" data-type=\"close\"></bdt>&nbsp;</bdt><span style=\"color: rgb(89, 89, 89); font-size: 11pt;\">(</span><span style=\"color: rgb(89, 89, 89); font-size: 14.6667px;\">3</span><span style=\"color: rgb(89, 89, 89); font-size: 11pt;\">) you have the legal capacity and you agree to comply with these Terms of Use;</span><bdt class=\"block-container if\" data-type=\"if\" id=\"8d4c883b-bc2c-f0b4-da3e-6d0ee51aca13\"><bdt data-type=\"conditional-block\"><bdt class=\"block-component\" data-record-question-key=\"user_u13_option\" data-type=\"statement\"></bdt>&nbsp;</bdt><span style=\"color: rgb(89, 89, 89); font-size: 11pt;\">(</span><span style=\"color: rgb(89, 89, 89); font-size: 14.6667px;\">4</span><span style=\"color: rgb(89, 89, 89); font-size: 11pt;\">) you are not a\r\nminor in the jurisdiction in which you reside<bdt class=\"block-container if\" data-type=\"if\" id=\"76948fab-ec9e-266a-bb91-948929c050c9\"><bdt data-type=\"conditional-block\"><bdt class=\"block-component\" data-record-question-key=\"user_o18_option\" data-type=\"statement\"></bdt><bdt data-type=\"body\">, or if a minor, you have\r\nreceived parental permission to use the Site</bdt></bdt><bdt class=\"statement-end-if-in-editor\" data-type=\"close\"></bdt></bdt>; (</span><span style=\"color: rgb(89, 89, 89); font-size: 14.6667px;\">5</span><span style=\"color: rgb(89, 89, 89); font-size: 11pt;\">) you will not access the Site\r\nthrough automated or non-human means, whether through a bot, script or\r\notherwise; (</span><span style=\"color: rgb(89, 89, 89); font-size: 14.6667px;\">6</span><span style=\"color: rgb(89, 89, 89); font-size: 11pt;\">) you will not use the Site for any illegal or unauthorized\r\npurpose; and (</span><span style=\"color: rgb(89, 89, 89); font-size: 14.6667px;\">7</span><span style=\"color: rgb(89, 89, 89); font-size: 11pt;\">) your use of the Site\r\nwill not violate any applicable law or regulation.</span><span style=\"color: rgb(89, 89, 89); font-size: 14.6667px;\"></span></bdt></div></div><div align=\"center\" style=\"text-align: left; line-height: 1;\"><br></div><div align=\"center\" style=\"text-align: left;\"><div class=\"MsoNormal\" style=\"text-align: justify; line-height: 115%;\"><div class=\"MsoNormal\" style=\"line-height: 17.25px;\"><div class=\"MsoNormal\" data-custom-class=\"body_text\" style=\"line-height: 1.5; text-align: left;\"><span style=\"font-size: 11pt; line-height: 16.8667px; color: rgb(89, 89, 89);\">If you provide any information that is untrue, inaccurate, not current, or incomplete, we have the right to suspend or terminate your account and refuse any and all current or future use of the Site (or any portion thereof).</span></div><div class=\"MsoNormal\" style=\"line-height: 1.1; text-align: left;\"><bdt class=\"block-component\"></bdt></div><div class=\"MsoNormal\" style=\"line-height: 1.5; text-align: left;\"><br></div><div class=\"MsoNormal\" style=\"line-height: 1.5; text-align: left;\"><br></div></div><div class=\"MsoNormal\" style=\"line-height: 1;\"><bdt data-type=\"conditional-block\"><bdt data-type=\"body\"><div class=\"MsoNormal\" data-custom-class=\"heading_1\" style=\"line-height: 1.5; text-align: left;\"><strong><span style=\"line-height: 24.5333px; font-size: 19px;\">USER REGISTRATION</span></strong></div></bdt></bdt></div><div class=\"MsoNormal\" style=\"line-height: 1;\"><br></div><div class=\"MsoNormal\" style=\"line-height: 1;\"><bdt data-type=\"conditional-block\"><bdt data-type=\"body\"><div class=\"MsoNormal\" data-custom-class=\"body_text\" style=\"text-align: left; line-height: 1.5;\"><span style=\"font-size: 11pt; line-height: 16.8667px; color: rgb(89, 89, 89);\">You may be required to register with the Site. You agree to keep your password confidential and will be responsible for all use of your account and password. We reserve the right to remove, reclaim, or change a username you select if we determine, in our sole discretion, that such username is inappropriate, obscene, or otherwise objectionable.<bdt class=\"statement-end-if-in-editor\" data-type=\"close\"></bdt></span></div></bdt></bdt></div><div class=\"MsoNormal\" style=\"line-height: 1.5;\"><br></div><div class=\"MsoNormal\" style=\"line-height: 1.5;\"><br></div></div><div class=\"MsoNormal\" data-custom-class=\"heading_1\" style=\"line-height: 1.5;\"><a name=\"_nds4qylockxx\"></a><strong><span style=\"line-height: 115%; font-family: Arial; font-size: 19px;\">PRODUCTS</span></strong></div></div><div align=\"center\" style=\"text-align: left; line-height: 1;\"><br></div><div align=\"center\" style=\"text-align: left;\"><div class=\"MsoNormal\" data-custom-class=\"body_text\" style=\"line-height: 1.5;\"><span style=\"font-size:11.0pt;line-height:115%;font-family:Arial;\r\nCalibri;color:#595959;mso-themecolor:text1;mso-themetint:166;\"><bdt class=\"block-container if\" data-type=\"if\" id=\"b9812c02-490b-3a1e-9b3a-9a03c73ee63c\"><bdt data-type=\"conditional-block\"><bdt class=\"block-component\" data-record-question-key=\"product_option\" data-type=\"statement\"></bdt></bdt>All products are subject to availability<bdt class=\"block-container if\" data-type=\"if\" id=\"35c07bc8-4217-594b-b7e7-1b4f0e8c56e4\"><bdt data-type=\"conditional-block\"><bdt class=\"block-component\" data-record-question-key=\"product_option\" data-type=\"statement\"></bdt></bdt>. We reserve the right to\r\ndiscontinue any products at any time for any reason. Prices for all products\r\nare subject to change.</bdt></bdt></span></div></div><div align=\"center\" style=\"text-align: left; line-height: 1.5;\"><br></div><div align=\"center\" style=\"text-align: left; line-height: 1.5;\"><br></div><div align=\"center\" style=\"text-align: left;\"><div class=\"MsoNormal\" data-custom-class=\"heading_1\" style=\"line-height: 1.5;\"><a name=\"_ynub0jdx8pob\"></a><strong><span style=\"line-height: 115%; font-family: Arial; font-size: 19px;\">PURCHASES AND PAYMENT</span></strong></div></div><div align=\"center\" style=\"text-align: left; line-height: 1;\"><br></div><div align=\"center\" style=\"text-align: left;\"><div class=\"MsoNormal\" data-custom-class=\"body_text\" style=\"line-height: 1.5;\"><span style=\"font-size:11.0pt;line-height:115%;font-family:Arial;\r\nCalibri;color:#595959;mso-themecolor:text1;mso-themetint:166;\">We accept the following forms of payment:</span></div><div class=\"MsoNormal\" style=\"text-align:justify;line-height:115%;\"><div class=\"MsoNormal\" style=\"text-align: left; line-height: 1;\"><br></div></div><div class=\"MsoNormal\" data-custom-class=\"body_text\" style=\"line-height: 1.5; margin-left: 20px;\"><span style=\"font-size:11.0pt;line-height:115%;font-family:Arial;\r\nCalibri;color:#595959;mso-themecolor:text1;mso-themetint:166;\"><bdt class=\"forloop-component\"></bdt>- &nbsp;<bdt class=\"question\">PayPal</bdt></span></div><div class=\"MsoNormal\" data-custom-class=\"body_text\" style=\"line-height: 1.5; margin-left: 20px;\"><span style=\"font-size:11.0pt;line-height:115%;font-family:Arial;\r\nCalibri;color:#595959;mso-themecolor:text1;mso-themetint:166;\"><bdt class=\"forloop-component\"></bdt></span></div><div class=\"MsoNormal\" style=\"line-height: 1;\"><span style=\"font-size:11.0pt;line-height:115%;font-family:Arial;\r\nCalibri;color:#595959;mso-themecolor:text1;mso-themetint:166;\"><br></span></div><div class=\"MsoNormal\" data-custom-class=\"body_text\" style=\"line-height: 1.5;\"><span style=\"font-size:11.0pt;line-height:115%;font-family:Arial;\r\nCalibri;color:#595959;mso-themecolor:text1;mso-themetint:166;\">You agree to provide current, complete, and accurate purchase and account information for all purchases made via the Site. You further agree to promptly update account and payment information, including email address, payment method, and payment card expiration date, so that we can complete your transactions and contact you as needed. Sales tax will be added to the price of purchases as deemed required by us. We may change prices at any time. All payments shall be&nbsp;</span><span style=\"font-size: 15px; line-height: 115%; font-family: Arial; color: rgb(89, 89, 89);\">in <bdt class=\"question\">INR</bdt>.</span></div></div><div align=\"center\" style=\"text-align: left; line-height: 1;\"><br></div><div align=\"center\" style=\"text-align: left;\"><div class=\"MsoNormal\" data-custom-class=\"body_text\" style=\"line-height: 1.5;\"><span style=\"font-size:11.0pt;line-height:115%;font-family:Arial;\r\nCalibri;color:#595959;mso-themecolor:text1;mso-themetint:166;\">You agree to pay all charges at the prices then in effect for your purchases and any applicable shipping fees, and you authorize us to charge your chosen payment provider for any such amounts upon placing your order. <bdt class=\"block-container if\" data-type=\"if\" id=\"9c0216a1-d094-fd73-a062-9615dc795ffc\"><bdt data-type=\"conditional-block\"><bdt class=\"block-component\" data-record-question-key=\"recurring_charge_option\" data-type=\"statement\"></bdt></bdt>We reserve the right to correct\r\nany errors or mistakes in pricing, even if we have already requested or\r\nreceived payment.</bdt></span></div></div><div align=\"center\" style=\"text-align: left; line-height: 1;\"><br></div><div align=\"center\" style=\"text-align: left;\"><div class=\"MsoNormal\" data-custom-class=\"body_text\" style=\"line-height: 1.5;\"><span style=\"font-size:11.0pt;line-height:115%;font-family:Arial;\r\nCalibri;color:#595959;mso-themecolor:text1;mso-themetint:166;\">We reserve the\r\nright to refuse any order placed through the Site. We may, in our sole discretion, limit or\r\ncancel quantities purchased per person, per household, or per order. These restrictions may include orders placed\r\nby or under the same customer account, the same payment method, and/or orders\r\nthat use the same billing or shipping address. We reserve the right to limit or prohibit orders that, in our sole\r\njudgment, appear to be placed by dealers, resellers, or distributors.</span></div><div class=\"MsoNormal\" style=\"text-align: justify; line-height: 115%;\"><span style=\"line-height: 115%; font-family: Arial; color: rgb(89, 89, 89);\"><bdt data-type=\"conditional-block\" style=\"color: rgb(10, 54, 90); text-align: left;\"><bdt class=\"block-component\" data-record-question-key=\"return_option\" data-type=\"statement\" style=\"font-size: 15px;\"></bdt></bdt></span></div><div class=\"MsoNormal\" style=\"text-align: justify; line-height: 1.5;\"><br></div><div class=\"MsoNormal\" style=\"text-align: justify; line-height: 1.5;\"><br></div><div class=\"MsoNormal\" style=\"text-align: justify; line-height: 1;\"><span style=\"line-height: 115%; font-family: Arial; color: rgb(89, 89, 89);\"><bdt data-type=\"conditional-block\" style=\"color: rgb(10, 54, 90); text-align: left;\"><bdt data-type=\"body\"><div class=\"MsoNormal\" data-custom-class=\"heading_1\" style=\"line-height: 1.5;\"><strong><span style=\"line-height: 24.5333px;\"><bdt class=\"block-container if\" data-type=\"if\" id=\"09a19ea5-53d7-8b08-be6e-279bf01450e1\"><bdt data-type=\"conditional-block\"><span style=\"font-size: 19px;\"><bdt data-type=\"body\"><bdt class=\"block-component\"></bdt><bdt data-type=\"body\">REFUNDS</bdt></bdt><bdt data-type=\"conditional-block\"><bdt class=\"block-component\" data-record-question-key=\"null\" data-type=\"statement\"></bdt></bdt></span></bdt><span style=\"font-size: 19px;\">&nbsp;POLICY</span></bdt></span></strong></div></bdt></bdt></span></div><div class=\"MsoNormal\" style=\"text-align: justify; line-height: 1;\"><br></div><div class=\"MsoNormal\" style=\"text-align: justify; line-height: 1;\"><span style=\"line-height: 115%; font-family: Arial; color: rgb(89, 89, 89);\"><bdt data-type=\"conditional-block\" style=\"color: rgb(10, 54, 90); text-align: left;\"><bdt data-type=\"body\"><div class=\"MsoNormal\" data-custom-class=\"body_text\" style=\"font-size: 15px; line-height: 1.5;\"><span style=\"font-size: 11pt; line-height: 16.8667px; color: rgb(89, 89, 89);\">All sales are final and no refund will be issued.<span style=\"line-height: 115%; font-family: Arial; color: rgb(89, 89, 89);\"><bdt class=\"statement-end-if-in-editor\" data-type=\"close\" style=\"font-size: 15px; text-align: left;\"></bdt></span></span></div></bdt></bdt></span></div><div class=\"MsoNormal\" style=\"text-align: justify; line-height: 1.5;\"><span style=\"line-height: 115%; font-family: Arial; color: rgb(89, 89, 89);\"><bdt data-type=\"conditional-block\" style=\"color: rgb(10, 54, 90); text-align: left;\"><bdt data-type=\"body\"><div class=\"MsoNormal\" style=\"font-size: 15px; line-height: 1.5;\"><br></div></bdt></bdt><br></span> <a name=\"_h284p8mrs3r7\"></a><div class=\"MsoNormal\" data-custom-class=\"heading_1\" style=\"text-align: left; line-height: 1.5;\"><strong><span style=\"line-height: 24.5333px; font-size: 19px;\">PROHIBITED ACTIVITIES</span></strong></div></div><div class=\"MsoNormal\" style=\"text-align: justify; line-height: 1;\"><br></div><div class=\"MsoNormal\" style=\"text-align: justify; line-height: 1;\"><div class=\"MsoNormal\" data-custom-class=\"body_text\" style=\"line-height: 1.5; text-align: left;\"><span style=\"font-size: 11pt; line-height: 16.8667px; color: rgb(89, 89, 89);\">You may not access or use the Site for any purpose other than that for which we make the Site available. The Site may not be used in connection with any commercial endeavors except those that are specifically endorsed or approved by us.</span></div></div><div class=\"MsoNormal\" style=\"text-align: justify; line-height: 1;\"><br></div><div class=\"MsoNormal\" style=\"text-align: justify; line-height: 1;\"><div class=\"MsoNormal\" style=\"line-height: 17.25px;\"><div class=\"MsoNormal\" style=\"line-height: 1.1;\"><div class=\"MsoNormal\" style=\"line-height: 17.25px;\"><div class=\"MsoNormal\" data-custom-class=\"body_text\" style=\"line-height: 1.5; text-align: left;\"><span style=\"font-size: 11pt; line-height: 16.8667px; color: rgb(89, 89, 89);\">As a user of the Site, you agree not to:</span></div><div class=\"MsoNormal\" style=\"line-height: 1; text-align: left;\"><br></div></div><div class=\"MsoNormal\" data-custom-class=\"body_text\" style=\"line-height: 1.5; margin-left: 20px; text-align: left;\"><span style=\"font-size: 11pt; line-height: 16.8667px; color: rgb(89, 89, 89);\"><bdt class=\"forloop-component\"></bdt><bdt class=\"block-container forloop\" data-type=\"forloop\" id=\"19beb913-5a5e-2b51-51f9-8600a8eb26c3\" style=\"display: inline;\"><bdt data-type=\"conditional-block\" style=\"display: inline;\"><bdt data-type=\"body\" style=\"display: inline;\"><span style=\"font-size: 14.6667px;font-family: sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: justify; text-indent: -22.05pt; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; color: rgb(89, 89, 89); font-size: 14.6667px;\">1</span></bdt></bdt></bdt><span style=\"font-family: sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: justify; text-indent: -29.4px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; color: rgb(89, 89, 89); font-size: 14.6667px;\">.&nbsp;</span> <bdt class=\"question\">Systematically retrieve data or other content from the Site to create or compile, directly or indirectly, a collection, compilation, database, or directory without written permission from us.</bdt></span></div><div class=\"MsoNormal\" data-custom-class=\"body_text\" style=\"line-height: 1.5; margin-left: 20px; text-align: left;\"><span style=\"font-size: 11pt; line-height: 16.8667px; color: rgb(89, 89, 89);\"><bdt class=\"forloop-component\"></bdt><bdt class=\"block-container forloop\" data-type=\"forloop\" id=\"19beb913-5a5e-2b51-51f9-8600a8eb26c3\" style=\"display: inline;\"><bdt data-type=\"conditional-block\" style=\"display: inline;\"><bdt data-type=\"body\" style=\"display: inline;\"><span style=\"font-size: 14.6667px;font-family: sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: justify; text-indent: -22.05pt; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; color: rgb(89, 89, 89); font-size: 14.6667px;\">2</span></bdt></bdt></bdt><span style=\"font-family: sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: justify; text-indent: -29.4px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; color: rgb(89, 89, 89); font-size: 14.6667px;\">.&nbsp;</span> <bdt class=\"question\">Use a buying agent or purchasing agent to make purchases on the Site.</bdt></span></div><div class=\"MsoNormal\" data-custom-class=\"body_text\" style=\"line-height: 1.5; margin-left: 20px; text-align: left;\"><span style=\"font-size: 11pt; line-height: 16.8667px; color: rgb(89, 89, 89);\"><bdt class=\"forloop-component\"></bdt><bdt class=\"block-container forloop\" data-type=\"forloop\" id=\"19beb913-5a5e-2b51-51f9-8600a8eb26c3\" style=\"display: inline;\"><bdt data-type=\"conditional-block\" style=\"display: inline;\"><bdt data-type=\"body\" style=\"display: inline;\"><span style=\"font-size: 14.6667px;font-family: sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: justify; text-indent: -22.05pt; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; color: rgb(89, 89, 89); font-size: 14.6667px;\">3</span></bdt></bdt></bdt><span style=\"font-family: sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: justify; text-indent: -29.4px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; color: rgb(89, 89, 89); font-size: 14.6667px;\">.&nbsp;</span> <bdt class=\"question\">Use the Site in a manner inconsistent with any applicable laws or regulations.</bdt></span></div><div class=\"MsoNormal\" data-custom-class=\"body_text\" style=\"line-height: 1.5; margin-left: 20px; text-align: left;\"><span style=\"font-size: 11pt; line-height: 16.8667px; color: rgb(89, 89, 89);\"><bdt class=\"forloop-component\"></bdt><bdt class=\"block-container forloop\" data-type=\"forloop\" id=\"19beb913-5a5e-2b51-51f9-8600a8eb26c3\" style=\"display: inline;\"><bdt data-type=\"conditional-block\" style=\"display: inline;\"><bdt data-type=\"body\" style=\"display: inline;\"><span style=\"font-size: 14.6667px;font-family: sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: justify; text-indent: -22.05pt; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; color: rgb(89, 89, 89); font-size: 14.6667px;\">4</span></bdt></bdt></bdt><span style=\"font-family: sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: justify; text-indent: -29.4px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; color: rgb(89, 89, 89); font-size: 14.6667px;\">.&nbsp;</span> <bdt class=\"question\">Upload or transmit (or attempt to upload or to transmit) any material that acts as a passive or active information collection or transmission mechanism, including without limitation, clear graphics interchange formats (“gifs”), 1×1 pixels, web bugs, cookies, or other similar devices (sometimes referred to as “spyware” or “passive collection mechanisms” or “pcms”).</bdt></span></div><div class=\"MsoNormal\" data-custom-class=\"body_text\" style=\"line-height: 1.5; margin-left: 20px; text-align: left;\"><span style=\"font-size: 11pt; line-height: 16.8667px; color: rgb(89, 89, 89);\"><bdt class=\"forloop-component\"></bdt></span></div></div><div class=\"MsoNormal\" style=\"line-height: 1.5;\"><br></div></div><div class=\"MsoNormal\" style=\"line-height: 1.5;\"><br></div><div class=\"MsoNormal\" style=\"line-height: 17.25px;\"><div class=\"MsoNormal\" style=\"line-height: 1;\"><bdt class=\"block-container if\" data-type=\"if\" style=\"text-align: left;\"><bdt data-type=\"conditional-block\"><bdt data-type=\"body\"><div class=\"MsoNormal\" data-custom-class=\"heading_1\" style=\"line-height: 1.5;\"><strong><span style=\"line-height: 24.5333px; font-size: 19px;\">USER GENERATED CONTRIBUTIONS</span></strong></div></bdt></bdt></bdt></div><div class=\"MsoNormal\" style=\"line-height: 1;\"><br></div><div class=\"MsoNormal\" style=\"line-height: 1;\"><bdt class=\"block-container if\" data-type=\"if\" style=\"text-align: left;\"><bdt data-type=\"conditional-block\"><bdt data-type=\"body\"><div class=\"MsoNormal\" data-custom-class=\"body_text\" style=\"line-height: 1.5;\"><span style=\"font-size: 11pt; line-height: 16.8667px; color: rgb(89, 89, 89);\"><bdt class=\"block-container if\" data-type=\"if\" id=\"24327c5d-a34f-f7e7-88f1-65a2f788484f\" style=\"text-align: left;\"><bdt data-type=\"conditional-block\"><bdt class=\"block-component\" data-record-question-key=\"user_post_content_option\" data-type=\"statement\"></bdt></bdt></bdt>The Site may invite you to chat, contribute to, or participate in blogs, message boards, online forums, and other functionality, and may provide you with the opportunity to create, submit, post, display, transmit, perform, publish, distribute, or broadcast content and materials to us or on the Site, including but not limited to text, writings, video, audio, photographs, graphics, comments, suggestions, or personal information or other material (collectively, \"Contributions\"). Contributions may be viewable by other users of the Site and the Marketplace Offerings and through third-party websites. As such, any Contributions you transmit may be treated as non-confidential and non-proprietary. When you create or make available any Contributions, you thereby represent and warrant that:<bdt class=\"else-block\"></bdt></span></div></bdt></bdt></bdt></div><div class=\"MsoNormal\" style=\"line-height: 1;\"><br></div></div></div><div class=\"MsoNormal\" style=\"line-height: 1.5; margin-left: 20px;\"><span style=\"color: rgb(89, 89, 89);\"><span style=\"font-size: 14px;\"><span data-custom-class=\"body_text\">1. &nbsp;The creation, distribution, transmission, public display, or performance, and the accessing, downloading, or copying of your Contributions do not and will not infringe the proprietary rights, including but not limited to the copyright, patent, trademark, trade secret, or moral rights of any third party.<br>2. &nbsp;You are the creator and owner of or have the necessary licenses, rights, consents, releases, and permissions to use and to authorize us, the Site, and other users of the Site to use your Contributions in any manner contemplated by the Site and these Terms of Use.<br>3. &nbsp;You have the written consent, release, and/or permission of each and every identifiable individual person in your Contributions to use the name or likeness of each and every such identifiable individual person to enable inclusion and use of your Contributions in any manner contemplated by the Site and these Terms of Use.<br>4. &nbsp;Your Contributions are not false, inaccurate, or misleading.<br>5. &nbsp;Your Contributions are not unsolicited or unauthorized advertising, promotional materials, pyramid schemes, chain letters, spam, mass mailings, or other forms of solicitation.<br>6. &nbsp;Your Contributions are not obscene, lewd, lascivious, filthy, violent, harassing, libelous, slanderous, or otherwise objectionable (as determined by us).<br>7. &nbsp;Your Contributions do not ridicule, mock, disparage, intimidate, or abuse anyone.<br>8. &nbsp;Your Contributions are not used to harass or threaten (in the legal sense of those terms) any other person and to promote violence against a specific person or class of people.<br>9. &nbsp;Your Contributions do not violate any applicable law, regulation, or rule.<br>10. &nbsp;Your Contributions do not violate the privacy or publicity rights of any third party.<br>11. &nbsp;Your Contributions do not violate any applicable law concerning child pornography, or otherwise intended to protect the health or well-being of minors;<br>12. &nbsp;Your Contributions do not include any offensive comments that are connected to race, national origin, gender, sexual preference, or physical handicap.<br>13. &nbsp;Your Contributions do not otherwise violate, or link to material that violates, any provision of these Terms of Use, or any applicable law or regulation.</span></span></span></div><div class=\"MsoNormal\" style=\"line-height: 1; margin-left: 20px;\"><span style=\"color: rgb(89, 89, 89);\"><br></span></div><div class=\"MsoNormal\" style=\"text-align: justify; line-height: 1.5;\"><bdt class=\"block-container if\" data-type=\"if\" style=\"text-align: left;\"><bdt data-type=\"conditional-block\"><bdt data-type=\"body\"><div class=\"MsoNormal\" data-custom-class=\"body_text\" style=\"line-height: 1.5;\"><span style=\"font-size: 11pt; line-height: 16.8667px; color: rgb(89, 89, 89);\">Any use of the Site or the Marketplace Offerings in violation of the foregoing violates these Terms of Use and may result in, among other things, termination or suspension of your rights to use the Site and the Marketplace Offerings.</span></div></bdt></bdt></bdt></div><div class=\"MsoNormal\" style=\"text-align: justify; line-height: 1.5;\"><br></div><div class=\"MsoNormal\" style=\"text-align: justify; line-height: 1.5;\"><br></div><div class=\"MsoNormal\" style=\"text-align: justify; line-height: 1;\"><bdt class=\"block-container if\" data-type=\"if\" style=\"text-align: left;\"><bdt data-type=\"conditional-block\"><bdt data-type=\"body\"><div class=\"MsoNormal\" data-custom-class=\"heading_1\" style=\"line-height: 1.5;\"><strong><span style=\"line-height: 24.5333px; font-size: 19px;\">CONTRIBUTION LICENSE</span></strong></div></bdt></bdt></bdt></div><div class=\"MsoNormal\" style=\"text-align: justify; line-height: 1;\"><br></div><div class=\"MsoNormal\" style=\"text-align: justify; line-height: 1;\"><bdt class=\"block-container if\" data-type=\"if\" id=\"a088ddfb-d8c1-9e58-6f21-958c3f4f0709\" style=\"text-align: left;\"><bdt data-type=\"conditional-block\"><bdt class=\"block-component\" data-record-question-key=\"user_post_content_option\" data-type=\"statement\"></bdt></bdt></bdt><bdt class=\"block-container if\" data-type=\"if\" style=\"text-align: left;\"><bdt data-type=\"conditional-block\"><bdt data-type=\"body\"><div class=\"MsoNormal\" data-custom-class=\"body_text\" style=\"line-height: 1.5;\"><span style=\"font-size: 11pt; line-height: 16.8667px; color: rgb(89, 89, 89);\">By posting your Contributions to any part of the Site<bdt class=\"block-container if\" data-type=\"if\" id=\"19652acc-9a2a-5ffe-6189-9474402fa6cc\"><bdt data-type=\"conditional-block\"><bdt class=\"block-component\" data-record-question-key=\"socialnetwork_link_option\" data-type=\"statement\"></bdt><bdt data-type=\"body\">&nbsp;or making Contributions accessible to the Site by linking your account from the Site to any of your social networking accounts</bdt></bdt><bdt class=\"statement-end-if-in-editor\" data-type=\"close\"></bdt></bdt>, you automatically grant, and you represent and warrant that you have the right to grant, to us an unrestricted, unlimited, irrevocable, perpetual, non-exclusive, transferable, royalty-free, fully-paid, worldwide right, and license to host, use, copy, reproduce, disclose, sell, resell, publish, broadcast, retitle, archive, store, cache, publicly perform, publicly display, reformat, translate, transmit, excerpt (in whole or in part), and distribute such Contributions (including, without limitation, your image and voice) for any purpose, commercial, advertising, or otherwise, and to prepare derivative works of, or incorporate into other works, such Contributions, and grant and authorize sublicenses of the foregoing. The use and distribution may occur in any media formats and through any media channels.</span></div></bdt></bdt></bdt></div><div class=\"MsoNormal\" style=\"text-align: justify; line-height: 1;\"><br></div><div class=\"MsoNormal\" style=\"text-align: justify; line-height: 1;\"><bdt class=\"block-container if\" data-type=\"if\" style=\"text-align: left;\"><bdt data-type=\"conditional-block\"><bdt data-type=\"body\"><div class=\"MsoNormal\" data-custom-class=\"body_text\" style=\"line-height: 1.5;\"><span style=\"font-size: 11pt; line-height: 16.8667px; color: rgb(89, 89, 89);\">This license will apply to any form, media, or technology now known or hereafter developed, and includes our use of your name, company name, and franchise name, as applicable, and any of the trademarks, service marks, trade names, logos, and personal and commercial images you provide. You waive all moral rights in your Contributions, and you warrant that moral rights have not otherwise been asserted in your Contributions.</span></div></bdt></bdt></bdt></div><div class=\"MsoNormal\" style=\"text-align: justify; line-height: 1;\"><br></div><div class=\"MsoNormal\" style=\"text-align: justify; line-height: 1;\"><bdt class=\"block-container if\" data-type=\"if\" style=\"text-align: left;\"><bdt data-type=\"conditional-block\"><bdt data-type=\"body\"><div class=\"MsoNormal\" data-custom-class=\"body_text\" style=\"line-height: 1.5;\"><span style=\"font-size: 11pt; line-height: 16.8667px; color: rgb(89, 89, 89);\">We do not assert any ownership over your Contributions. You retain full ownership of all of your Contributions and any intellectual property rights or other proprietary rights associated with your Contributions. We are not liable for any statements or representations in your Contributions provided by you in any area on the Site. You are solely responsible for your Contributions to the Site and you expressly agree to exonerate us from any and all responsibility and to refrain from any legal action against us regarding your Contributions.</span></div></bdt></bdt></bdt></div><div class=\"MsoNormal\" style=\"text-align: justify; line-height: 1;\"><br></div><div class=\"MsoNormal\" style=\"text-align: justify; line-height: 1;\"><bdt class=\"block-container if\" data-type=\"if\" style=\"text-align: left;\"><bdt data-type=\"conditional-block\"><bdt data-type=\"body\"><div class=\"MsoNormal\" data-custom-class=\"body_text\" style=\"line-height: 1.5;\"><span style=\"font-size: 11pt; line-height: 16.8667px; color: rgb(89, 89, 89);\">We have the right, in our sole and absolute discretion, (1) to edit, redact, or otherwise change any Contributions; (2) to re-categorize any Contributions to place them in more appropriate locations on the Site; and (3) to pre-screen or delete any Contributions at any time and for any reason, without notice. We have no obligation to monitor your Contributions.</span></div></bdt></bdt></bdt></div><div class=\"MsoNormal\" style=\"text-align: justify; line-height: 1.5;\"><br></div><div class=\"MsoNormal\" style=\"text-align: justify; line-height: 1;\"><bdt class=\"block-container if\" data-type=\"if\" style=\"text-align: left;\"><bdt data-type=\"conditional-block\"><bdt data-type=\"body\"><div class=\"MsoNormal\" style=\"line-height: 1.5;\"><br></div></bdt></bdt></bdt><bdt class=\"block-container if\" data-type=\"if\" style=\"text-align: left;\"><bdt data-type=\"conditional-block\"><bdt data-type=\"body\"><span style=\"font-size: 11pt; line-height: 16.8667px; color: rgb(89, 89, 89);\"><bdt class=\"else-block\"></bdt></span></bdt></bdt></bdt></div><div class=\"MsoNormal\" style=\"line-height: 1.5;\"><bdt class=\"block-container if\" data-type=\"if\" style=\"text-align: left;\"><bdt data-type=\"conditional-block\"><bdt class=\"block-component\" data-record-question-key=\"review_option\" data-type=\"statement\"></bdt></bdt></bdt></div><div class=\"MsoNormal\" data-custom-class=\"heading_1\" style=\"line-height: 1.5;\"><strong>GUIDELINES FOR REVIEWS</strong></div><div class=\"MsoNormal\" style=\"line-height: 1;\"><br></div><div class=\"MsoNormal\" style=\"text-align: justify; line-height: 1;\"><bdt class=\"block-container if\" data-type=\"if\" style=\"text-align: left;\"><bdt data-type=\"conditional-block\"><bdt data-type=\"body\"><div class=\"MsoNormal\" data-custom-class=\"body_text\" style=\"line-height: 1.5;\"><span style=\"font-size: 11pt; line-height: 16.8667px; color: rgb(89, 89, 89);\">We may provide you areas on the Site to leave reviews or ratings. When posting a review, you must comply with the following criteria: (1) you should have firsthand experience with the person/entity being reviewed; (2) your reviews should not contain offensive profanity, or abusive, racist, offensive, or hate language; (3) your reviews should not contain discriminatory references based on religion, race, gender, national origin, age, marital status, sexual orientation, or disability; (4) your reviews should not contain references to illegal activity; (5) you should not be affiliated with competitors if posting negative reviews; (6) you should not make any conclusions as to the legality of conduct; (7) you may not post any false or misleading statements; and (8) you may not organize a campaign encouraging others to post reviews, whether positive or negative.</span></div></bdt></bdt></bdt></div><div class=\"MsoNormal\" style=\"text-align: justify; line-height: 1;\"><br></div><div class=\"MsoNormal\" style=\"text-align: justify; line-height: 1;\"><bdt class=\"block-container if\" data-type=\"if\" style=\"text-align: left;\"><bdt data-type=\"conditional-block\"><bdt data-type=\"body\"><div class=\"MsoNormal\" data-custom-class=\"body_text\" style=\"line-height: 1.5;\"><span style=\"font-size: 11pt; line-height: 16.8667px; color: rgb(89, 89, 89);\">We may accept, reject, or remove reviews in our sole discretion. We have absolutely no obligation to screen reviews or to delete reviews, even if anyone considers reviews objectionable or inaccurate. Reviews are not endorsed by us, and do not necessarily represent our opinions or the views of any of our affiliates or partners. We do not assume liability for any review or for any claims, liabilities, or losses resulting from any review. By posting a review, you</span><span style=\"font-size: 11pt; line-height: 16.8667px;\">&nbsp;</span><span style=\"font-size: 11pt; line-height: 16.8667px; color: rgb(89, 89, 89);\">hereby grant to us a perpetual, non-exclusive, worldwide, royalty-free, fully-paid, assignable, and sublicensable right and license to reproduce, modify, translate, transmit by any means, display, perform, and/or distribute all content relating to reviews.</span></div></bdt></bdt></bdt></div><div class=\"MsoNormal\" style=\"text-align: justify; line-height: 1.5;\"><br></div><div class=\"MsoNormal\" style=\"text-align: justify; line-height: 1;\"><bdt class=\"block-container if\" data-type=\"if\" style=\"text-align: left;\"><bdt data-type=\"conditional-block\"><bdt data-type=\"body\"><div class=\"MsoNormal\" style=\"line-height: 1.5;\"><br></div></bdt></bdt></bdt><span style=\"font-size: 11pt; line-height: 16.8667px; color: rgb(89, 89, 89);\"><span style=\"font-size: 11pt; line-height: 16.8667px; color: rgb(89, 89, 89);\"><span style=\"font-size: 11pt; line-height: 16.8667px; color: rgb(89, 89, 89);\"><bdt class=\"block-container if\" data-type=\"if\" style=\"text-align: left;\"><bdt class=\"statement-end-if-in-editor\" data-type=\"close\"></bdt></bdt></span></span></span></div><div class=\"MsoNormal\" style=\"text-align: justify; line-height: 1;\"><bdt class=\"block-container if\" data-type=\"if\" id=\"c954892f-02b9-c743-d1e8-faf0d59a4b70\" style=\"text-align: left;\"><bdt data-type=\"conditional-block\"><bdt class=\"block-component\" data-record-question-key=\"mobile_app_option\" data-type=\"statement\"></bdt></bdt></bdt></div><div class=\"MsoNormal\" data-custom-class=\"heading_1\" style=\"text-align: justify; line-height: 1;\"><strong>MOBILE APPLICATION LICENSE</strong></div><div class=\"MsoNormal\" style=\"text-align: justify; line-height: 1;\"><br></div><div class=\"MsoNormal\" data-custom-class=\"heading_2\" style=\"text-align: justify; line-height: 1;\"><strong>Use License</strong></div><div class=\"MsoNormal\" style=\"text-align: justify; line-height: 1;\"><br></div><div class=\"MsoNormal\" data-custom-class=\"body_text\" style=\"line-height: 1.5;\"><span style=\"font-size: 11pt; line-height: 16.8667px; color: rgb(89, 89, 89);\">If you access the Marketplace Offerings via a mobile application, then we grant you a revocable, non-exclusive, non-transferable, limited right to install and use the mobile application on wireless electronic devices owned or controlled by you, and to access and use the mobile application on such devices strictly in accordance with the terms and conditions of this mobile application license contained in these Terms of Use. You shall not: (1) except as permitted by applicable law, decompile, reverse engineer, disassemble, attempt to derive the source code of, or decrypt the application; (2) make any modification, adaptation, improvement, enhancement, translation, or derivative work from the application; (3) violate any applicable laws, rules, or regulations in connection with your access or use of the application; (4) remove, alter, or obscure any proprietary notice (including any notice of copyright or trademark) posted by us or the licensors of the application; (5) use the application for any revenue generating endeavor, commercial enterprise, or other purpose for which it is not designed or intended; (6) make the application available over a network or other environment permitting access or use by multiple devices or users at the same time; (7) use the application for creating a product, service, or software that is, directly or indirectly, competitive with or in any way a substitute for the application; (8) use the application to send automated queries to any website or to send any unsolicited commercial e-mail; or (9) use any proprietary information or any of our interfaces or our other intellectual property in the design, development, manufacture, licensing, or distribution of any applications, accessories, or devices for use with the application.</span></div><div class=\"MsoNormal\" style=\"line-height: 1;\"><br></div><div class=\"MsoNormal\" data-custom-class=\"heading_2\" style=\"line-height: 1.5;\"><span style=\"font-size: 11pt; line-height: 16.8667px; color: rgb(89, 89, 89);\"><strong>Apple and Android Devices</strong></span></div><div class=\"MsoNormal\" style=\"line-height: 1;\"><br></div><div class=\"MsoNormal\" data-custom-class=\"body_text\" style=\"line-height: 1.5;\"><span style=\"font-size: 11pt; line-height: 16.8667px; color: rgb(89, 89, 89);\">The following terms apply when you use a mobile application obtained from either the Apple Store or Google Play (each an “App Distributor”) to access the Marketplace Offerings: (1) the license granted to you for our mobile application is limited to a non-transferable license to use the application on a device that utilizes the Apple iOS or Android operating systems, as applicable, and in accordance with the usage rules set forth in the applicable App Distributor’s terms of service; (2) we are responsible for providing any maintenance and support services with respect to the mobile application as specified in the terms and conditions of this mobile application license contained in these Terms of Use or as otherwise required under applicable law, and you acknowledge that each App Distributor has no obligation whatsoever to furnish any maintenance and support services with respect to the mobile application; (3) in the event of any failure of the mobile application to conform to any applicable warranty, you may notify the applicable App Distributor, and the App Distributor, in accordance with its terms and policies, may refund the purchase price, if any, paid for the mobile application, and to the maximum extent permitted by applicable law, the App Distributor will have no other warranty obligation whatsoever with respect to the mobile application; (4) you represent and warrant that (i) you are not located in a country that is subject to a U.S. government embargo, or that has been designated by the U.S. government as a “terrorist supporting” country and (ii) you are not listed on any U.S. government list of prohibited or restricted parties; (5) you must comply with applicable third-party terms of agreement when using the mobile application, e.g., if you have a VoIP application, then you must not be in violation of their wireless data service agreement when using the mobile application; and (6) you acknowledge and agree that the App Distributors are third-party beneficiaries of the terms and conditions in this mobile application license contained in these Terms of Use, and that each App Distributor will have the right (and will be deemed to have accepted the right) to enforce the terms and conditions in this mobile application license contained in these Terms of Use against you as a third-party beneficiary thereof.</span></div><div class=\"MsoNormal\" style=\"line-height: 1.5;\"><br><bdt class=\"block-container if\" data-type=\"if\" style=\"text-align: left;\"><bdt data-type=\"conditional-block\"><bdt data-type=\"body\"><div class=\"MsoNormal\" style=\"line-height: 1.5;\"><br></div></bdt></bdt></bdt><span style=\"font-size: 11pt; line-height: 16.8667px; color: rgb(89, 89, 89);\"><span style=\"font-size: 11pt; line-height: 16.8667px; color: rgb(89, 89, 89);\"><span style=\"font-size: 11pt; line-height: 16.8667px; color: rgb(89, 89, 89);\"><bdt class=\"block-container if\" data-type=\"if\" style=\"text-align: left;\"><bdt class=\"statement-end-if-in-editor\" data-type=\"close\"></bdt></bdt></span></span></span></div><div class=\"MsoNormal\" style=\"line-height: 1.5;\"><bdt class=\"block-container if\" data-type=\"if\" style=\"text-align: left;\"><bdt data-type=\"conditional-block\"><bdt class=\"block-component\" data-record-question-key=\"socialnetwork_link_option\" data-type=\"statement\"></bdt></bdt></bdt></div><div class=\"MsoNormal\" data-custom-class=\"heading_1\" style=\"line-height: 1.5;\"><strong>SOCIAL MEDIA</strong></div><div class=\"MsoNormal\" style=\"line-height: 1;\"><br><bdt class=\"block-container if\" data-type=\"if\" style=\"text-align: left;\"><bdt data-type=\"conditional-block\"><bdt data-type=\"body\"><div class=\"MsoNormal\" data-custom-class=\"body_text\" style=\"line-height: 1.5;\"><span style=\"font-size: 11pt; line-height: 16.8667px; color: rgb(89, 89, 89);\">As part of the functionality of the Site, you may link your account with online accounts you have with third-party service providers (each such account, a “Third-Party Account”) by either: (1) providing your Third-Party Account login information through the Site; or (2) allowing us to access your <span style=\"font-size: 14.6667px;\">Third-Party</span> Account, as is permitted under the applicable terms and conditions that govern your use of each <span style=\"font-size: 14.6667px;\">Third-Party</span> Account. You represent and warrant that you are entitled to disclose your <span style=\"font-size: 14.6667px;\">Third-Party</span> Account login information to us and/or grant us access to your <span style=\"font-size: 14.6667px;\">Third-Party</span> Account, without breach by you of any of the terms and conditions that govern your use of the applicable <span style=\"font-size: 14.6667px;\">Third-Party</span> Account, and without obligating us to pay any fees or making us subject to any usage limitations imposed by the third-party service provider of the <span style=\"font-size: 14.6667px;\">Third-Party</span> Account. By granting us access to any <span style=\"font-size: 14.6667px;\">Third-Party</span> Accounts, you understand that (1) we may access, make available, and store (if applicable) any content that you have provided to and stored in your <span style=\"font-size: 14.6667px;\">Third-Party</span> Account (the “Social Network Content”) so that it is available on and through the Site via your account, including without limitation any friend lists and (2) we may submit to and receive from your <span style=\"font-size: 14.6667px;\">Third-Party</span> Account additional information to the extent you are notified when you link your account with the <span style=\"font-size: 14.6667px;\">Third-Party</span> Account. Depending on the <span style=\"font-size: 14.6667px;\">Third-Party</span> Accounts you choose and subject to the privacy settings that you have set in such <span style=\"font-size: 14.6667px;\">Third-Party</span> Accounts, personally identifiable information that you post to your <span style=\"font-size: 14.6667px;\">Third-Party</span> Accounts may be available on and through your account on the Site. Please note that if a <span style=\"font-size: 14.6667px;\">Third-Party</span> Account or associated service becomes unavailable or our access to such <span style=\"font-size: 14.6667px;\">Third-Party</span> Account is terminated by the third-party service provider, then Social Network Content may no longer be available on and through the Site. You will have the ability to disable the connection between your account on the Site and your <span style=\"font-size: 14.6667px;\">Third-Party</span> Accounts at any time. PLEASE NOTE THAT YOUR RELATIONSHIP WITH THE THIRD-PARTY SERVICE PROVIDERS ASSOCIATED WITH YOUR THIRD-PARTY ACCOUNTS IS GOVERNED SOLELY BY YOUR AGREEMENT(S) WITH SUCH THIRD-PARTY SERVICE PROVIDERS. We make no effort to review any Social Network Content for any purpose, including but not limited to, for accuracy, legality, or non-infringement, and we are not responsible for any Social Network Content. You acknowledge and agree that we may access your email address book associated with a <span style=\"font-size: 14.6667px;\">Third-Party</span> Account and your contacts list stored on your mobile device or tablet computer solely for purposes of identifying and informing you of those contacts who have also registered to use the Site. You can deactivate the connection between the Site and your <span style=\"font-size: 14.6667px;\">Third-Party</span> Account by contacting us using the contact information below or through your account settings (if applicable). We will attempt to delete any information stored on our servers that was obtained through such <span style=\"font-size: 14.6667px;\">Third-Party</span> Account, except the username and profile picture that become associated with your account.</span></div></bdt></bdt></bdt></div><div class=\"MsoNormal\" style=\"line-height: 1.5;\"><br></div><div class=\"MsoNormal\" style=\"line-height: 1;\"><bdt class=\"block-container if\" data-type=\"if\" style=\"text-align: left;\"><bdt data-type=\"conditional-block\"><bdt data-type=\"body\"><div class=\"MsoNormal\" style=\"line-height: 1.5;\"><br></div></bdt></bdt></bdt><bdt class=\"block-container if\" data-type=\"if\" style=\"text-align: left;\"><span style=\"font-size: 11pt; line-height: 16.8667px; color: rgb(89, 89, 89);\"><span style=\"font-size: 11pt; line-height: 16.8667px; color: rgb(89, 89, 89);\"><span style=\"font-size: 11pt; line-height: 16.8667px; color: rgb(89, 89, 89);\"><bdt class=\"block-container if\" data-type=\"if\" style=\"text-align: left;\"><bdt class=\"statement-end-if-in-editor\" data-type=\"close\"></bdt></bdt></span></span></span></bdt></div><div class=\"MsoNormal\" data-custom-class=\"heading_1\" style=\"line-height: 1;\"><strong><span style=\"line-height: 24.5333px; font-size: 19px;\">SUBMISSIONS</span></strong></div><div class=\"MsoNormal\" style=\"line-height: 1;\"><br></div><div class=\"MsoNormal\" data-custom-class=\"body_text\" style=\"line-height: 1.5;\">You acknowledge and agree that any questions, comments, suggestions, ideas, feedback, or other information regarding the Site or the Marketplace Offerings (\"Submissions\") provided by you to us are non-confidential and shall become our sole property. We shall own exclusive rights, including all intellectual property rights, and shall be entitled to the unrestricted use and dissemination of these Submissions for any lawful purpose, commercial or otherwise, without acknowledgment or compensation to you. You hereby waive all moral rights to any such Submissions, and you hereby warrant that any such Submissions are original with you or that you have the right to submit such Submissions. You agree there shall be no recourse against us for any alleged or actual infringement or misappropriation of any proprietary right in your Submissions.</div><div class=\"MsoNormal\" style=\"line-height: 1.5;\"><br></div><div class=\"MsoNormal\" style=\"line-height: 1.5;\"><br></div><div class=\"MsoNormal\" style=\"line-height: 1.5;\"><bdt class=\"block-container if\" data-type=\"if\" style=\"text-align: left;\"><bdt data-type=\"conditional-block\"><bdt class=\"block-component\" data-record-question-key=\"3rd_party_option\" data-type=\"statement\"></bdt></bdt></bdt></div><div class=\"MsoNormal\" style=\"line-height: 1.5;\"><bdt class=\"block-container if\" data-type=\"if\" style=\"text-align: left;\"><bdt data-type=\"conditional-block\"><bdt class=\"block-component\" data-record-question-key=\"advertiser_option\" data-type=\"statement\"></bdt></bdt></bdt></div><div class=\"MsoNormal\" data-custom-class=\"heading_1\" style=\"line-height: 1.5;\"><strong><span style=\"line-height: 24.5333px; font-size: 19px;\">SITE MANAGEMENT</span></strong></div><div class=\"MsoNormal\" style=\"line-height: 1;\"><br></div><div class=\"MsoNormal\" data-custom-class=\"body_text\" style=\"line-height: 1.5;\">We reserve the right, but not the obligation, to: (1) monitor the Site for violations of these Terms of Use; (2) take appropriate legal action against anyone who, in our sole discretion, violates the law or these Terms of Use, including without limitation, reporting such user to law enforcement authorities; (3) in our sole discretion and without limitation, refuse, restrict access to, limit the availability of, or disable (to the extent technologically feasible) any of your Contributions or any portion thereof; (4) in our sole discretion and without limitation, notice, or liability, to remove from the Site or otherwise disable all files and content that are excessive in size or are in any way burdensome to our systems; and (5) otherwise manage the Site in a manner designed to protect our rights and property and to facilitate the proper functioning of the Site and the Marketplace Offerings.</div><div class=\"MsoNormal\" style=\"line-height: 1.5;\"><br></div><di');
INSERT INTO `pages` (`page_id`, `page_name`, `page_get`, `page_content`) VALUES
(7, 'FAQ', 'faq', '<p>hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhooooooooooooooooo</p>'),
(8, 'Terms, FAQ', 'terms,faq', '<agrzm>'),
(9, 'Terms, FAQ', 'terms,faq', '<agrzm>');
INSERT INTO `pages` (`page_id`, `page_name`, `page_get`, `page_content`) VALUES
(10, 'Child Panel', 'child-panels', '<p><img src=\"data:image/png;base64,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');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL DEFAULT 0,
  `client_balance` double NOT NULL DEFAULT 0,
  `payment_amount` double NOT NULL DEFAULT 0,
  `payment_privatecode` double DEFAULT NULL,
  `payment_method` int(11) NOT NULL DEFAULT -1,
  `payment_status` enum('1','2','3') NOT NULL DEFAULT '1',
  `payment_delivery` enum('1','2') NOT NULL DEFAULT '1',
  `payment_note` text DEFAULT NULL,
  `payment_mode` enum('Manuel','Otomatik') NOT NULL DEFAULT 'Otomatik',
  `payment_create_date` datetime NOT NULL DEFAULT current_timestamp(),
  `payment_update_date` datetime NOT NULL DEFAULT current_timestamp(),
  `payment_ip` varchar(225) DEFAULT NULL,
  `payment_extra` text DEFAULT NULL,
  `payment_bank` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `client_id`, `client_balance`, `payment_amount`, `payment_privatecode`, `payment_method`, `payment_status`, `payment_delivery`, `payment_note`, `payment_mode`, `payment_create_date`, `payment_update_date`, `payment_ip`, `payment_extra`, `payment_bank`) VALUES
(1, 15, 0, 5, NULL, 1, '1', '1', NULL, '', '2022-01-14 17:07:22', '2022-01-14 11:37:22', '59.89.178.142', '7522afbe1a5220745d96b5fc2fa1517d', 0),
(2, 15, 0, 51, NULL, 1, '1', '1', NULL, '', '2022-01-14 17:08:07', '2022-01-14 11:38:07', '59.89.178.142', '3f17cb6f9d8098185a5c797b6e127978', 0),
(3, 15, 0, 1, NULL, 1, '1', '1', NULL, '', '2022-01-14 17:08:32', '2022-01-14 11:38:32', '59.89.178.142', '99225ad8e1851d5f8d269ceaa2b7acc0', 0),
(4, 15, 0, 100, NULL, 13, '1', '1', NULL, 'Otomatik', '2022-01-14 17:13:08', '2022-01-14 11:43:08', '59.89.178.142', 'c83f061b4051259d70ed6afe6959b85a', 0),
(5, 15, 0, 100, NULL, 13, '1', '1', NULL, 'Otomatik', '2022-01-14 17:27:03', '2022-01-14 11:57:03', '59.89.178.142', 'aeca3a28913444da31162dea9aca2237', 0),
(6, 15, 0, 100, NULL, 12, '1', '1', NULL, 'Otomatik', '2022-01-14 17:27:30', '2022-01-14 11:57:30', '59.89.178.142', 'ORDS16074434', 0),
(7, 15, 0, 1, NULL, 1, '1', '1', NULL, '', '2022-01-14 17:28:31', '2022-01-14 11:58:31', '59.89.178.142', 'f4a3da473416a6bf8c6dae134e0abbe0', 0),
(8, 15, 0, 10, NULL, 13, '1', '1', NULL, 'Otomatik', '2022-01-14 17:31:54', '2022-01-14 12:01:54', '59.89.178.142', 'f30dde732f45ba6578644dd8e6ab6c0d', 0),
(9, 15, 0, 10, NULL, 1, '1', '1', NULL, '', '2022-01-14 17:33:06', '2022-01-14 12:03:06', '205.253.121.60', '5434d832e0dd3baab78c581eb7414b31', 0),
(10, 15, 0, 10, NULL, 1, '1', '1', NULL, '', '2022-01-14 18:50:17', '2022-01-14 13:20:17', '59.89.178.142', '0d9c965f9bcf5d9ad6e5b76b68228375', 0),
(11, 15, 0, 10, NULL, 12, '1', '1', NULL, 'Otomatik', '2022-01-14 18:55:50', '2022-01-14 13:25:50', '59.89.178.142', 'ORDS5302575', 0),
(12, 15, 0, 10, NULL, 1, '1', '1', NULL, '', '2022-01-14 18:55:59', '2022-01-14 13:25:59', '59.89.178.142', '3c071b6893d7c29ad92dcfde6943e8b4', 0),
(13, 15, 0, 10, NULL, 1, '1', '1', NULL, '', '2022-01-14 23:16:48', '2022-01-14 17:46:48', '59.89.178.142', 'dea3420bc46fe8596ddfddd0e05ec901', 0),
(14, 15, 0, 10, NULL, 1, '1', '1', NULL, '', '2022-01-14 23:17:29', '2022-01-14 17:47:29', '59.89.178.142', 'bdf6d5efa373dc0b83735ec3bece31d9', 0),
(15, 15, 0, 10, NULL, 1, '1', '1', NULL, '', '2022-01-14 23:17:46', '2022-01-14 17:47:46', '59.89.178.142', '6b332648b3692d54767a7a7c4c06581e', 0),
(16, 15, 0, 10, NULL, 1, '1', '1', NULL, '', '2022-01-14 23:18:34', '2022-01-14 17:48:34', '59.89.178.142', '35ecda86099c223861f0a7f4f8612e9e', 0),
(17, 15, 0, 10, NULL, 13, '1', '1', NULL, 'Otomatik', '2022-01-14 23:29:07', '2022-01-14 17:59:07', '59.89.178.142', '57cc2d25992af11b4b93583e4aef01d3', 0),
(18, 15, 0, 10, NULL, 15, '1', '1', NULL, 'Otomatik', '2022-01-14 23:29:17', '2022-01-14 17:59:17', '59.89.178.142', '1642183157', 0),
(19, 15, 0, 10, NULL, 15, '1', '1', NULL, 'Otomatik', '2022-01-14 23:30:31', '2022-01-14 18:00:31', '59.89.178.142', '1642183231', 0),
(20, 15, 0, 10, NULL, 15, '1', '1', NULL, 'Otomatik', '2022-01-14 23:30:49', '2022-01-14 18:00:49', '59.89.178.142', '1642183249', 0),
(21, 15, 0, 10, NULL, 15, '1', '1', NULL, 'Otomatik', '2022-01-14 23:32:02', '2022-01-14 18:02:02', '59.89.178.142', '1642183322', 0),
(22, 15, 0, 10, NULL, 2, '1', '1', NULL, '', '2022-01-14 23:36:16', '2022-01-14 18:06:16', '59.89.178.142', '8c33b6faca17c3cbe16c4afab2bf9c84', 0),
(23, 15, 0, 10, NULL, 9, '1', '1', NULL, '', '2022-01-14 23:36:51', '2022-01-14 18:06:51', '59.89.178.142', '709275d87bb9effff79faed261388f7e', 0),
(24, 15, 0, 10, NULL, 13, '1', '1', NULL, 'Otomatik', '2022-01-15 01:00:00', '2022-01-14 19:30:00', '59.89.178.142', 'c49a320b5208dc083743f945b58430e6', 0),
(25, 15, 40.838475, 0.01, NULL, 15, '3', '2', NULL, 'Otomatik', '2022-01-15 02:47:14', '2022-01-14 21:17:14', '152.206.174.195', '1642195034', 0),
(26, 15, 40.848475, 0.01, NULL, 15, '3', '2', NULL, 'Otomatik', '2022-01-15 02:49:23', '2022-01-14 21:19:23', '152.207.150.195', '1642195163', 0),
(27, 15, 0, 72, NULL, 13, '1', '1', NULL, 'Otomatik', '2022-01-15 03:13:43', '2022-01-14 21:43:43', '193.176.87.206', 'ec7e66865210646fa5dfdb359d097cb9', 0),
(28, 15, 0, 72, NULL, 2, '1', '1', NULL, '', '2022-01-15 03:13:56', '2022-01-14 21:43:56', '193.176.87.206', '717f123f12880d7e17b09f5ca02b6f40', 0),
(29, 15, 0, 7, NULL, 9, '1', '1', NULL, '', '2022-01-15 03:14:19', '2022-01-14 21:44:19', '193.176.87.206', '15d8ff7b4fd0ae363dc511a5029e8599', 0),
(30, 15, 0, 7, NULL, 15, '1', '1', NULL, 'Otomatik', '2022-01-15 03:15:14', '2022-01-14 21:45:14', '193.176.87.206', '1642196714', 0);

-- --------------------------------------------------------

--
-- Table structure for table `payments_bonus`
--

CREATE TABLE `payments_bonus` (
  `bonus_id` int(11) NOT NULL,
  `bonus_method` int(11) NOT NULL,
  `bonus_from` double NOT NULL,
  `bonus_amount` double NOT NULL,
  `bonus_type` enum('1','2') NOT NULL DEFAULT '2'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int(11) NOT NULL,
  `method_name` varchar(225) NOT NULL,
  `method_get` varchar(225) NOT NULL,
  `method_min` double NOT NULL,
  `method_max` double NOT NULL,
  `method_type` enum('1','2') NOT NULL DEFAULT '2' COMMENT '2 -> ON, 1 -> OFF	',
  `method_extras` mediumtext NOT NULL,
  `method_line` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `method_name`, `method_get`, `method_min`, `method_max`, `method_type`, `method_extras`, `method_line`) VALUES
(1, 'Paypal', 'paypal', 5, 1000, '2', '{\"method_type\":\"2\",\"name\":\"Paypal\",\"min\":\"5\",\"max\":\"1000\",\"client_id\":\"AY6gPwfYMGU_lAn4SkIPtCqpH06yFFP02CnBssNvy9ghl58tX8P7iB5CSNf4xWYAL09pDE5DfmwEOLxH\",\"client_secret\":\"EPoJ1ziJxjeZqmhIVTYD2MO0ZzgpZaxzITIBDCmLVuPHHmp2VOPAzC9SqSV6DIO6jMTd9mJzCCcgiIIV\",\"fee\":\"0\", \"currency\":\"USD\"}', 1),
(2, 'Stripe', 'stripe', 10, 100, '2', '{\"method_type\":\"1\",\"name\":\"STRIPE-----[All Credit\\/Debit  Cards Accepted here!]\",\"min\":\"10\",\"max\":\"100\",\"stripe_publishable_key\":\"pk_live_51ImMLASA7QppiHSDneuBu9YniS7QerlZbqsUu3bnG49gWJUjn8CzGgdAuEVny3nRBEkhuiT90TENQgzvacRsiBdr00DEELTPwh\",\"stripe_secret_key\":\"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\",\"stripe_webhooks_secret\":\"whsec_PszM3ujuFjvO4zwES7CzLoNP9qmmxCLt\",\"fee\":\"6\",\"currency\":\"USD\"}', 6),
(6, 'Manual Transfer(Bank)', 'havale-eft', 0, 0, '1', '{\"method_type\":\"2\",\"name\":\"Manual Bank Transfer(Minimum 200\\u20b9 Maximum Unlimited)\"}', 8),
(8, 'Coinpayments', 'coinpayments', 0.01, 10, '2', '{\"method_type\":\"2\",\"name\":\"Coinpayments\",\"min\":\"0.01\",\"max\":\"10\",\"coinpayments_public_key\":\"\",\"coinpayments_private_key\":\"\",\"coinpayments_currency\":\"BTC\",\"merchant_id\":\"\",\"ipn_secret\":\"123\",\"fee\":\"0\",\"currency\":\"USD\"}', 13),
(9, '2checkout', '2checkout', 1, 100, '2', '{\"method_type\":\"2\",\"name\":\"2checkout\",\"min\":\"1\",\"max\":\"100\",\"seller_id\":\"\",\"private_key\":\"\",\"fee\":\"1\",\"currency\":\"USD\"}', 14),
(11, 'Mollie', 'mollie', 1, 100, '2', '{\"method_type\":\"1\",\"name\":\"Mollie\",\"min\":\"1\",\"max\":\"100\",\"live_api_key\":\"\",\"fee\":\"0\",\"currency\":\"USD\"}', 15),
(12, 'PayTM', 'paytm', 10, 200, '2', '{\"method_type\":\"2\",\"name\":\"PayTM Checkout\",\"min\":\"10\",\"max\":\"200\",\"merchant_key\":\"JRA0FS8ur14Jx0C2\",\"merchant_mid\":\"rjCXTt59772219038828\",\"merchant_website\":\"DEFAULT\",\"fee\":\"0\",\"currency\":\"INR\"}', 16),
(14, 'PayTM QR', 'paytmqr', 1, 0, '2', '{\"method_type\":\"2\",\"name\":\"PayTM-QR (Please Don\'t Send Below 10\\u20b9)\",\"min\":\"1\",\"max\":\"0\",\"merchant_key\":\"\",\"merchant_mid\":\"\",\"merchant_website\":\"DEFAULT\",\"fee\":\"0\"}', 10),
(15, 'PerfectMoney', 'perfectmoney', 0.01, 1000, '2', '{\"method_type\":\"2\",\"name\":\"PerfectMoney\",\"min\":\"0.01\",\"max\":\"1000\",\"passphrase\":\"\",\"usd\":\"\",\"merchant_website\":\"\",\"fee\":\"0\"}', 18),
(17, 'RazorPay', 'razorpay', 50, 22000, '2', '{\"method_type\":\"2\",\"name\":\"[Please Don\'t Send Money Here -Please scroll down for Paytm Qr ]\",\"min\":\"50\",\"max\":\"22000\",\"public_key\":\"\",\"key_secret\":\"\",\"merchant_website\":\"https:\\/\\/api.razorpay.com\\/v1\\/orders\",\"fee\":\"3\"}', 2);

-- --------------------------------------------------------

--
-- Table structure for table `refill_status`
--

CREATE TABLE `refill_status` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `order_id` int(99) NOT NULL,
  `order_apiid` int(99) NOT NULL,
  `refill_apiid` int(99) NOT NULL,
  `refill_status` text NOT NULL,
  `creation_date` datetime NOT NULL,
  `order_url` text NOT NULL,
  `service_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `serviceapi_alert`
--

CREATE TABLE `serviceapi_alert` (
  `id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `serviceapi_alert` text NOT NULL,
  `servicealert_extra` text NOT NULL,
  `servicealert_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `service_id` int(11) NOT NULL,
  `service_api` int(11) NOT NULL DEFAULT 0,
  `api_service` int(11) NOT NULL DEFAULT 0,
  `api_servicetype` enum('1','2') NOT NULL DEFAULT '2',
  `api_detail` text NOT NULL,
  `category_id` int(11) NOT NULL,
  `service_line` double NOT NULL,
  `service_type` enum('1','2') NOT NULL DEFAULT '2',
  `service_package` enum('1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17') NOT NULL,
  `service_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `service_description` text DEFAULT NULL,
  `service_price` double NOT NULL DEFAULT 0,
  `service_min` double NOT NULL,
  `service_max` double NOT NULL,
  `service_dripfeed` enum('1','2') NOT NULL DEFAULT '1',
  `service_autotime` double NOT NULL DEFAULT 0,
  `service_autopost` double NOT NULL DEFAULT 0,
  `service_speed` enum('1','2','3','4') NOT NULL,
  `want_username` enum('1','2','3','4') NOT NULL DEFAULT '1',
  `service_secret` enum('1','2') NOT NULL DEFAULT '2',
  `price_type` enum('normal','percent','amount') NOT NULL DEFAULT 'normal',
  `price_cal` text DEFAULT NULL,
  `instagram_second` enum('1','2') NOT NULL DEFAULT '2',
  `start_count` enum('none','instagram_follower','instagram_photo','') NOT NULL,
  `instagram_private` enum('1','2') NOT NULL,
  `name_lang` text DEFAULT NULL,
  `description_lang` text DEFAULT NULL,
  `service_refill` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `service_api`
--

CREATE TABLE `service_api` (
  `id` int(11) NOT NULL,
  `api_name` varchar(225) NOT NULL,
  `api_url` text NOT NULL,
  `api_key` varchar(225) NOT NULL,
  `api_type` int(11) NOT NULL,
  `api_limit` double NOT NULL DEFAULT 0,
  `currency` enum('INR','USD') DEFAULT NULL,
  `api_alert` enum('1','2') NOT NULL DEFAULT '2' COMMENT '2 -> Gönder, 1 -> Gönderildi'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `service_api`
--

INSERT INTO `service_api` (`id`, `api_name`, `api_url`, `api_key`, `api_type`, `api_limit`, `currency`, `api_alert`) VALUES
(2, 'finalsmm', 'https://finalsmm.com.com/api/v2', 'c92a6e52387c55c5dd3b73c1a9523848', 1, 1, 'INR', '1');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `site_seo` text NOT NULL,
  `site_title` text DEFAULT NULL,
  `site_description` text DEFAULT NULL,
  `site_keywords` text DEFAULT NULL,
  `site_logo` text DEFAULT NULL,
  `site_name` text DEFAULT NULL,
  `site_currency` varchar(2555) NOT NULL DEFAULT 'try',
  `favicon` text DEFAULT NULL,
  `site_language` varchar(225) NOT NULL DEFAULT 'tr',
  `site_theme` text NOT NULL,
  `site_theme_alt` text DEFAULT NULL,
  `recaptcha` enum('1','2') NOT NULL DEFAULT '1',
  `recaptcha_key` text DEFAULT NULL,
  `recaptcha_secret` text DEFAULT NULL,
  `custom_header` text DEFAULT NULL,
  `custom_footer` text DEFAULT NULL,
  `ticket_system` enum('1','2') NOT NULL DEFAULT '2',
  `register_page` enum('1','2') NOT NULL DEFAULT '2',
  `service_speed` enum('1','2') NOT NULL,
  `service_list` enum('1','2') NOT NULL,
  `dolar_charge` double NOT NULL,
  `euro_charge` double NOT NULL,
  `smtp_user` text NOT NULL,
  `smtp_pass` text NOT NULL,
  `smtp_server` text NOT NULL,
  `smtp_port` varchar(225) NOT NULL,
  `smtp_protocol` enum('0','ssl','tls') NOT NULL,
  `alert_type` enum('1','2','3') NOT NULL,
  `alert_newbankpayment` enum('1','2') NOT NULL,
  `alert_newmanuelservice` enum('1','2') NOT NULL,
  `alert_newticket` enum('1','2') NOT NULL,
  `alert_apibalance` enum('1','2') NOT NULL,
  `alert_serviceapialert` enum('1','2') NOT NULL,
  `sms_provider` varchar(225) NOT NULL,
  `sms_title` varchar(225) NOT NULL,
  `sms_user` varchar(225) NOT NULL,
  `sms_pass` varchar(225) NOT NULL,
  `sms_validate` enum('0','1') NOT NULL DEFAULT '0' COMMENT '1 -> OK, 0 -> NO',
  `admin_mail` varchar(225) NOT NULL,
  `admin_telephone` varchar(225) NOT NULL,
  `resetpass_page` enum('1','2') NOT NULL,
  `resetpass_sms` enum('1','2') NOT NULL,
  `resetpass_email` enum('1','2') NOT NULL,
  `site_maintenance` enum('1','2') NOT NULL DEFAULT '2',
  `servis_siralama` varchar(255) NOT NULL,
  `bronz_statu` int(11) NOT NULL,
  `silver_statu` int(11) NOT NULL,
  `gold_statu` int(11) NOT NULL,
  `bayi_statu` int(11) NOT NULL,
  `ns1` varchar(191) DEFAULT NULL,
  `ns2` varchar(191) DEFAULT NULL,
  `childpanel_price` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `site_seo`, `site_title`, `site_description`, `site_keywords`, `site_logo`, `site_name`, `site_currency`, `favicon`, `site_language`, `site_theme`, `site_theme_alt`, `recaptcha`, `recaptcha_key`, `recaptcha_secret`, `custom_header`, `custom_footer`, `ticket_system`, `register_page`, `service_speed`, `service_list`, `dolar_charge`, `euro_charge`, `smtp_user`, `smtp_pass`, `smtp_server`, `smtp_port`, `smtp_protocol`, `alert_type`, `alert_newbankpayment`, `alert_newmanuelservice`, `alert_newticket`, `alert_apibalance`, `alert_serviceapialert`, `sms_provider`, `sms_title`, `sms_user`, `sms_pass`, `sms_validate`, `admin_mail`, `admin_telephone`, `resetpass_page`, `resetpass_sms`, `resetpass_email`, `site_maintenance`, `servis_siralama`, `bronz_statu`, `silver_statu`, `gold_statu`, `bayi_statu`, `ns1`, `ns2`, `childpanel_price`) VALUES
(1, 'ARSMM PANEL', 'ARSMM PANEL', 'ARSMM PANEL', 'ARSMM PANEL', 'public/images/37bc2f75bf1bcfe8450a1a41c200364c.png', 'Smm script seller', 'USD', '', 'en', 'cpan', 'Solar', '1', '', '', '', '', '2', '2', '2', '2', 1, 1, 'admin@admin.com', 'admin@admin.com', 'admin@admin.com', '465', 'ssl', '1', '2', '2', '2', '2', '2', 'bizimsms', 'admin@admin.com', 'admin@admin.com', 'admin@admin.com', '1', 'admin@admin.com', 'admin@admin.com', '2', '2', '2', '2', 'desc', 5000, 20000, 50000, 100000, 'ns1.clubfire.in', 'ns2.clubfire.in', 700);

-- --------------------------------------------------------

--
-- Table structure for table `themes`
--

CREATE TABLE `themes` (
  `id` int(11) NOT NULL,
  `theme_name` text NOT NULL,
  `theme_dirname` text NOT NULL,
  `theme_extras` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `themes`
--

INSERT INTO `themes` (`id`, `theme_name`, `theme_dirname`, `theme_extras`) VALUES
(286, 'cpan', 'cpan', '{\"stylesheets\":[\"public/cpan/bootstrap.css\",\"public/cpan/black.css\",\"https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css\",\"public/datepicker/css/bootstrap-datepicker3.min.css\"],\"scripts\":[\"https://code.jquery.com/jquery-3.3.1.min.js\",\"public/cpan/js/script.js\",\"public/cpan/js/snowfall.min.js\",\"public/Engaging/js/bundle.js\",\"public/cpan/js/main.js\",\"public/ajax.js\",\"public/datepicker/js/bootstrap-datepicker.min.js\"]}');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `ticket_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `subject` varchar(225) NOT NULL,
  `time` datetime NOT NULL,
  `lastupdate_time` datetime NOT NULL,
  `client_new` enum('1','2') NOT NULL DEFAULT '2',
  `status` enum('pending','answered','closed') NOT NULL DEFAULT 'pending',
  `support_new` enum('1','2') NOT NULL DEFAULT '1',
  `canmessage` enum('1','2') NOT NULL DEFAULT '2'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_reply`
--

CREATE TABLE `ticket_reply` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp(),
  `support` enum('1','2') NOT NULL DEFAULT '1',
  `message` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `childpanels`
--
ALTER TABLE `childpanels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `clients_category`
--
ALTER TABLE `clients_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients_price`
--
ALTER TABLE `clients_price`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients_service`
--
ALTER TABLE `clients_service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_report`
--
ALTER TABLE `client_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kuponlar`
--
ALTER TABLE `kuponlar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kupon_kullananlar`
--
ALTER TABLE `kupon_kullananlar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`page_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `payments_bonus`
--
ALTER TABLE `payments_bonus`
  ADD PRIMARY KEY (`bonus_id`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refill_status`
--
ALTER TABLE `refill_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `serviceapi_alert`
--
ALTER TABLE `serviceapi_alert`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `service_api`
--
ALTER TABLE `service_api`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`ticket_id`);

--
-- Indexes for table `ticket_reply`
--
ALTER TABLE `ticket_reply`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `childpanels`
--
ALTER TABLE `childpanels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `clients_category`
--
ALTER TABLE `clients_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clients_price`
--
ALTER TABLE `clients_price`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `clients_service`
--
ALTER TABLE `clients_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_report`
--
ALTER TABLE `client_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `kuponlar`
--
ALTER TABLE `kuponlar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kupon_kullananlar`
--
ALTER TABLE `kupon_kullananlar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `payments_bonus`
--
ALTER TABLE `payments_bonus`
  MODIFY `bonus_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refill_status`
--
ALTER TABLE `refill_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `serviceapi_alert`
--
ALTER TABLE `serviceapi_alert`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_api`
--
ALTER TABLE `service_api`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `themes`
--
ALTER TABLE `themes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=293;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_reply`
--
ALTER TABLE `ticket_reply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
