-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               8.0.24 - MySQL Community Server - GPL
-- Операционная система:         Win64
-- HeidiSQL Версия:              11.3.0.6376
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Дамп структуры базы данных banya
DROP DATABASE IF EXISTS `banya`;
CREATE DATABASE IF NOT EXISTS `banya` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `banya`;

-- Дамп структуры для таблица banya.addresses
DROP TABLE IF EXISTS `addresses`;
CREATE TABLE IF NOT EXISTS `addresses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addresses_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AVG_ROW_LENGTH=1638 ROW_FORMAT=DYNAMIC;

-- Дамп данных таблицы banya.addresses: ~10 rows (приблизительно)
DELETE FROM `addresses`;
INSERT INTO `addresses` (`id`, `user_id`, `address`, `created_at`, `updated_at`) VALUES
	(11, 3, '237 Lee Drive\nMcKenzieport, KY 46393', '2023-11-16 01:31:00', '2023-11-16 01:31:00'),
	(12, 3, '812 Weimann Track\nMrazmouth, RI 24069', '2023-11-16 01:31:00', '2023-11-16 01:31:00'),
	(13, 3, '703 Cartwright Station\nNorth Emmymouth, NM 86767', '2023-11-16 01:31:00', '2023-11-16 01:31:00'),
	(14, 1, '5026 Isabelle Island\nKochtown, MA 59273-6265', '2023-11-16 01:31:00', '2023-11-16 01:31:00'),
	(15, 2, '447 Ford Streets\nSouth Levibury, FL 48109-3062', '2023-11-16 01:31:00', '2023-11-16 01:31:00'),
	(16, 1, '17453 Shields Falls\nZoeborough, OK 42642', '2023-11-16 01:31:00', '2023-11-16 01:31:00'),
	(17, 1, '6039 Schmidt Forest\nNew Katelynnton, SD 17245-6572', '2023-11-16 01:31:00', '2023-11-16 01:31:00'),
	(18, 3, '30713 Lennie Fort Suite 518\nKuvalismouth, IL 01614', '2023-11-16 01:31:00', '2023-11-16 01:31:00'),
	(19, 2, '3180 Houston Manor Apt. 147\nFeilstad, IA 80115', '2023-11-16 01:31:00', '2023-11-16 01:31:00'),
	(20, 1, '80192 Leanne Track\nPamelaside, IN 71926', '2023-11-16 01:31:00', '2023-11-16 01:31:00');

-- Дамп структуры для процедура banya.ClearOrderTime
DROP PROCEDURE IF EXISTS `ClearOrderTime`;
DELIMITER //
CREATE PROCEDURE `ClearOrderTime`()
BEGIN
  UPDATE time_tb tt
  SET tt.busy = FALSE,
      tt.order_time = '',
      tt.order_id = 0;
END//
DELIMITER ;

-- Дамп структуры для таблица banya.clients
DROP TABLE IF EXISTS `clients`;
CREATE TABLE IF NOT EXISTS `clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AVG_ROW_LENGTH=207 ROW_FORMAT=DYNAMIC;

-- Дамп данных таблицы banya.clients: ~74 rows (приблизительно)
DELETE FROM `clients`;
INSERT INTO `clients` (`id`, `first_name`, `last_name`, `email`, `address`, `phone`, `created_at`, `updated_at`) VALUES
	(2, 'Emilio', 'Harvey', 'dach.vidal@donnelly.com', '128 Ritchie Hill Apt. 738\nSanfordfurt, NM 22382-8341', '+1-539-226-0369', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(3, 'Beverli', 'Hills', 'lswaniawski@yahoo.com', '40935 Boyer Ports\nNorth Gabe, LA 03623-0614', '(248) 344-3127', '2023-11-16 01:44:06', '2023-11-18 14:45:20'),
	(7, 'Kaylee', 'DuBuque', 'joana.rohan@hotmail.com', '867 Kuphal Light\nBradtkeview, NH 76803-1696', '1-936-609-4746', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(8, 'Sonia', 'O\'Kon', 'natasha.thiel@yahoo.com', '15886 Louie Turnpike\nPort Christianbury, ND 72058-5537', '+1 (352) 909-4336', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(9, 'Michelle', 'Cummings', 'frogahn@yahoo.com', '70220 Grady Cliff\nWest Mabel, CT 76488', '+1 (475) 985-6072', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(11, 'Jana', 'Casper', 'amir37@sawayn.org', '223 Natalia Port Suite 188\nPort Bell, AZ 44174', '351.842.5090', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(13, 'Lurline', 'Schowalter', 'gretchen.steuber@gmail.com', '552 Schinner Route Suite 962\nPort Wilfredo, DE 22762', '669-487-0242', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(14, 'Desiree', 'Hagenes', 'elaina47@yahoo.com', '273 Ivory Centers Suite 772\nLebsackhaven, NH 62105', '765.357.2658', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(15, 'Horace', 'Witting', 'jesse08@wolf.com', '440 Rodrick Plaza Apt. 895\nLeonoraton, AZ 81410', '+12014161320', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(16, 'Barney', 'Veum', 'manuel75@gmail.com', '780 Anabel Park Suite 631\nReesemouth, OR 93308-8954', '+1.979.413.4197', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(17, 'Ted', 'Johnston', 'marvin.schmitt@hotmail.com', '241 Dayana Canyon\nShieldsfurt, TX 73428-5346', '+1.425.389.4906', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(18, 'Briana', 'Bartoletti', 'stoltenberg.camille@hotmail.com', '7382 Welch Hollow Apt. 450\nJohnsmouth, OR 89727-3225', '+13147441284', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(19, 'Jairo', 'Lebsack', 'ramon03@gmail.com', '3083 Raynor Park Apt. 515\nSouth Isaias, SD 03125', '1-630-908-4787', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(20, 'Marley', 'Spinka', 'block.hector@yahoo.com', '5133 Brown Ramp\nSouth Delbertside, KS 95872', '937-325-6331', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(22, 'Lorenz', 'Smith', 'roy.rempel@lockman.com', '16825 Bednar Valley\nEast Kassandra, KS 29245-1943', '774.762.4182', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(24, 'Alda', 'Veum', 'haylie67@satterfield.org', '97562 Considine Expressway Suite 136\nOkunevaview, GA 41197', '+19473198563', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(25, 'Mossie', 'Rogahn', 'baron.douglas@hermiston.com', '63060 Blick Center\nNienowfurt, AR 16188-1086', '573.542.4374', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(26, 'Leonel', 'Funk', 'ludwig.okeefe@gmail.com', '316 Sid Lake\nFadelfort, MI 59673', '361-209-9878', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(27, 'Dariana', 'Wintheiser', 'hosinski@boehm.com', '5149 Ayana Island\nFeiltown, WI 68041-3357', '629-207-8356', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(28, 'Raymond', 'Olson', 'champlin.oren@yahoo.com', '273 Satterfield Path\nFayview, AK 33856-1851', '+1-234-320-7467', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(29, 'Aliya', 'Ferry', 'prohaska.rowland@maggio.org', '58393 Tad Causeway\nWindlerton, KS 73845-4619', '386-898-2689', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(30, 'Cyrus', 'Beer', 'doyle77@cronin.com', '389 Hessel Forest\nWeldonberg, GA 49188-3106', '1-218-499-4252', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(31, 'Ed', 'Daniel', 'jacobi.andrew@yahoo.com', '37796 Hilpert Ramp Apt. 264\nAxelfort, DE 64229-6404', '(309) 615-7694', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(32, 'Rosanna', 'Mills', 'ajohns@moen.org', '385 Buckridge Vista Suite 216\nHaneborough, ME 57416-1173', '903.618.6675', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(33, 'Margaret', 'Welch', 'reilly.jackeline@yahoo.com', '51478 Vince Cove Suite 266\nWest Vito, KS 52621-7933', '1-540-776-2679', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(34, 'Denis', 'Durgan', 'ajenkins@okuneva.com', '6553 Nolan Stravenue\nWaelchiberg, MN 76115-2959', '+1.480.263.4019', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(35, 'Liam', 'Nikolaus', 'flarkin@yahoo.com', '59487 Lia Forest\nEmmettport, NM 57501', '816.562.2657', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(36, 'Adele', 'Kassulke', 'ogottlieb@tremblay.com', '7804 Wuckert Dale Apt. 316\nIsobelhaven, TX 30215-5412', '+1-361-822-6123', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(37, 'Gennaro', 'Wehner', 'xcummings@gmail.com', '7476 Terrence Underpass Apt. 468\nBudfort, OR 23513', '920.767.4706', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(38, 'Wendy', 'Kub', 'kayleigh.haag@marks.com', '1308 Marvin Hill\nLake Estellefort, WV 97802-2281', '(951) 505-1645', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(39, 'Kaelyn', 'Turcotte', 'greichert@gmail.com', '739 Jerde Lake Suite 972\nJamesonview, TN 75870', '(305) 568-0210', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(40, 'Pierre', 'Ruecker', 'madelyn29@hotmail.com', '1852 Vida Keys\nDibberthaven, UT 00141-5002', '1-785-794-5437', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(41, 'Estelle', 'Boyer', 'bradford.mitchell@gerhold.com', '9319 Dach Union\nGoyetteside, MT 58915', '(601) 583-7644', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(42, 'Ola', 'West', 'lkuhn@gmail.com', '890 Braun Trafficway Suite 072\nThompsonhaven, DE 90864-1381', '989.926.7517', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(43, 'Lysanne', 'Bernier', 'gladys47@rolfson.com', '2722 Dennis Ranch Suite 466\nWest Nataliemouth, TN 69487', '1-443-739-2216', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(44, 'Alexys', 'Frami', 'anderson.orin@hotmail.com', '458 Vandervort Circles Suite 426\nBertramborough, AR 32835', '440.578.7314', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(45, 'Katharina', 'Hamill', 'ghickle@rath.com', '534 Willms Corner Suite 051\nDooleyburgh, WY 58522-9067', '+1-802-914-0040', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(46, 'Kathryn', 'Kutch', 'easter.rodriguez@yahoo.com', '46276 Carmen Track\nWest Kailey, MN 09328', '+1.678.816.4611', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(47, 'Caleigh', 'Grady', 'zjohns@hammes.net', '391 Austyn Knolls Suite 143\nNorth Ellie, NJ 90965-4920', '754.576.8483', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(48, 'Raphael', 'Quigley', 'sharon.murray@hagenes.com', '1873 Stan Vista\nLake Eladio, AK 18236-5863', '320-390-5082', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(49, 'Geovanni', 'Dickinson', 'daniela67@yahoo.com', '633 Bridget View\nValentinland, NC 30452-9219', '+1-458-567-6771', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(50, 'Sidney', 'Sawayn', 'gbergstrom@mcclure.org', '14036 Hahn Burg Apt. 107\nLake Domingo, KY 42867-7946', '339.758.2779', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(51, 'Francisca', 'Balistreri', 'johnson.feil@powlowski.com', '820 Stark Pike Apt. 467\nSouth Joetown, OK 54527-7255', '620.269.9118', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(52, 'Levi', 'Grady', 'borer.verda@yahoo.com', '772 Zelda Plains\nEphraimhaven, VT 30696-8503', '+18313718173', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(53, 'Jany', 'Maggio', 'kayli.lubowitz@nikolaus.net', '3424 Waino Park\nTiaraport, NH 22458-6410', '480.470.5819', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(54, 'Roel', 'Denesik', 'flatley.amanda@roob.com', '43232 Nolan Burg Apt. 379\nPort Eldon, AZ 56477-5562', '339.255.1484', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(55, 'Judy', 'Wiegand', 'cmante@yahoo.com', '20926 Lela Roads\nLake Fred, AR 65637', '+1 (469) 798-9523', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(56, 'Moses', 'Hermiston', 'yschmidt@yahoo.com', '20745 Beer Locks Suite 507\nBoehmbury, GA 75245-6465', '+1-915-598-9009', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(57, 'Fleta', 'Smith', 'zieme.bridgette@hotmail.com', '9066 Jeanie Oval Suite 584\nLake Elzastad, IA 88247-4561', '(820) 829-3720', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(58, 'Odie', 'Gulgowski', 'mante.catalina@casper.com', '1932 Deckow Plains\nMarquardtmouth, HI 47594-3136', '+1.229.952.7732', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(59, 'Jade', 'Sauer', 'rheller@yahoo.com', '4118 Donna Land\nMosesberg, DC 42872', '+1-779-604-2318', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(60, 'Amos', 'Bernier', 'lottie.langworth@hotmail.com', '9970 Friesen Fords\nWest Reaganville, UT 96578', '+1 (860) 282-2635', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(61, 'Marguerite', 'Champlin', 'vreichel@gmail.com', '734 Jordy Mountains Apt. 109\nVandervortside, HI 24621', '+17547817799', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(62, 'Chauncey', 'Corwin', 'pbrown@yahoo.com', '5521 Gottlieb Circles\nSouth Vaughn, DE 02042', '386.445.3591', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(63, 'Santa', 'Swift', 'grimes.darius@corkery.com', '9802 Lesly Key Suite 198\nLake Ethanshire, TN 78357', '1-669-701-8199', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(64, 'Idella', 'Botsford', 'sydnie36@gmail.com', '930 Bogisich Summit Apt. 854\nDevenbury, CA 65593-3427', '+1-539-799-0315', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(65, 'Dorothy', 'Stracke', 'krystal36@yahoo.com', '156 Ewell Pike\nNew Cecil, IL 43602-1141', '+13218125919', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(66, 'Erich', 'Bogisich', 'harmony.gleichner@olson.com', '946 Kyla River\nThielhaven, MA 40140', '208.509.2093', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(67, 'Jarod', 'Keeling', 'larkin.okey@hotmail.com', '5765 Joana Hills Apt. 835\nNew Arashire, NH 77421', '1-440-209-3948', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(68, 'Lucy', 'Steuber', 'jtorphy@hotmail.com', '31956 Stracke Cape Apt. 231\nSouth Caterina, AR 76170-6380', '+1.480.356.8839', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(69, 'Elijah', 'Stanton', 'vandervort.leonard@yahoo.com', '83213 Graham Mall Suite 536\nMarisaview, CT 40763-1816', '1-770-650-4121', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(70, 'Avery', 'Batz', 'kmante@pagac.com', '6218 Hills Springs Apt. 287\nRempelmouth, WV 11094', '347.243.7287', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(71, 'Marlene', 'Hammes', 'aweissnat@hotmail.com', '717 Shaun Wells Suite 407\nBaumbachton, HI 44693-7660', '630-828-6255', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(72, 'Paula', 'Bergstrom', 'gkuphal@gmail.com', '9923 Rau Court\nKodyhaven, DE 38734-9832', '+1-740-786-2859', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(73, 'Isabelle', 'Lockman', 'albert92@dare.org', '20982 Trevion Club\nHuelsmouth, KS 10271-5685', '231-693-0301', '2023-11-16 01:44:06', '2023-11-16 01:44:06'),
	(85, 'Linda Schroeder', 'Rina', 'regumu@mailinator.com', 'Vel non ut expedita ', '+1 (408) 876-5159', '2023-12-24 07:56:15', '2023-12-24 07:56:15'),
	(86, 'Robin Silva', 'Samson', 'tiluv@mailinator.com', 'Suscipit qui quam ex', '+1 (903) 632-1939', '2023-12-24 08:02:00', '2023-12-24 08:02:00'),
	(87, 'Kalia Dunn', 'Darrel', 'xokadyhi@mailinator.com', 'Sed est inventore mo', '+1 (328) 514-6716', '2024-01-05 12:31:07', '2024-01-05 12:31:07'),
	(88, 'Kalia Dunn', 'Darrel', NULL, NULL, NULL, '2024-01-11 11:41:00', '2024-01-11 11:41:00'),
	(89, 'Ria Haley', 'Darrel', NULL, NULL, NULL, '2024-01-11 11:41:34', '2024-01-11 11:41:34'),
	(90, 'Robin Silva', 'Samson', NULL, NULL, '19036321939', '2024-01-11 11:42:42', '2024-01-11 11:42:42'),
	(91, 'Borielle', 'Schneider', NULL, NULL, '15187026755', '2024-01-11 11:44:32', '2024-01-11 11:44:32'),
	(92, 'Barclay', 'Ingram', NULL, NULL, '1545785546', '2024-01-11 11:45:27', '2024-01-11 11:45:27'),
	(93, 'Emmanuel', 'Vega', NULL, NULL, '9034598712', '2024-01-11 11:46:47', '2024-01-11 11:46:47');

-- Дамп структуры для таблица banya.departments
DROP TABLE IF EXISTS `departments`;
CREATE TABLE IF NOT EXISTS `departments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(19,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AVG_ROW_LENGTH=4096 ROW_FORMAT=DYNAMIC;

-- Дамп данных таблицы banya.departments: ~4 rows (приблизительно)
DELETE FROM `departments`;
INSERT INTO `departments` (`id`, `name`, `price`, `created_at`, `updated_at`) VALUES
	(1, 'Obshiy', 100.00, NULL, '2024-02-04 08:28:31'),
	(2, 'Sauna ', 125.00, NULL, '2024-02-04 08:34:24'),
	(3, 'Vip Sauna', 150.00, NULL, '2024-02-04 08:28:53'),
	(4, 'Basseynn', 70.00, NULL, '2024-02-10 06:44:26'),
	(6, 'Finskaya Sauna', 125.00, '2024-02-29 06:20:39', '2024-02-29 06:20:39');

-- Дамп структуры для таблица banya.discounts
DROP TABLE IF EXISTS `discounts`;
CREATE TABLE IF NOT EXISTS `discounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `percent` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Дамп данных таблицы banya.discounts: ~0 rows (приблизительно)
DELETE FROM `discounts`;

-- Дамп структуры для таблица banya.employes
DROP TABLE IF EXISTS `employes`;
CREATE TABLE IF NOT EXISTS `employes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` bigint unsigned DEFAULT NULL,
  `department_id` bigint unsigned NOT NULL DEFAULT '0',
  `jobtitle_id` bigint unsigned NOT NULL DEFAULT '1',
  `role_id` bigint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employes_address_foreign` (`address`),
  KEY `employes_department_id_foreign` (`department_id`),
  KEY `employes_jobtitle_id_foreign` (`jobtitle_id`),
  KEY `employes_role_id_foreign` (`role_id`),
  CONSTRAINT `employes_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employes_jobtitle_id_foreign` FOREIGN KEY (`jobtitle_id`) REFERENCES `job_titles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employes_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AVG_ROW_LENGTH=8192 ROW_FORMAT=DYNAMIC;

-- Дамп данных таблицы banya.employes: ~3 rows (приблизительно)
DELETE FROM `employes`;
INSERT INTO `employes` (`id`, `name`, `image`, `first_name`, `last_name`, `phone`, `address`, `department_id`, `jobtitle_id`, `role_id`, `created_at`, `updated_at`) VALUES
	(3, 'John', NULL, 'John', 'Velda', '123456', 16, 1, 1, 1, NULL, NULL),
	(4, 'Hebar Fay', NULL, 'Hebar', 'Fey', '123456', 38, 1, 1, 1, NULL, NULL),
	(6, 'Marylyne Crooks', NULL, 'Marylyne', 'Crooks', '12345', 18, 1, 1, 1, NULL, NULL);

-- Дамп структуры для таблица banya.events
DROP TABLE IF EXISTS `events`;
CREATE TABLE IF NOT EXISTS `events` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` bigint unsigned NOT NULL DEFAULT '1',
  `client_id` bigint(20) unsigned zerofill NOT NULL,
  `department_id` bigint unsigned NOT NULL,
  `startOrder` timestamp NOT NULL DEFAULT '2023-12-28 06:28:45',
  `endOrder` timestamp NOT NULL DEFAULT '2023-12-28 06:28:45',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_events_clients` (`client_id`),
  KEY `FK_events_departments` (`department_id`),
  CONSTRAINT `FK_events_clients` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_events_departments` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AVG_ROW_LENGTH=3276 ROW_FORMAT=DYNAMIC;

-- Дамп данных таблицы banya.events: ~6 rows (приблизительно)
DELETE FROM `events`;
INSERT INTO `events` (`id`, `title`, `start`, `end`, `order_id`, `client_id`, `department_id`, `startOrder`, `endOrder`, `created_at`, `updated_at`) VALUES
	(1, 'Booking', NULL, NULL, 1, 00000000000000000036, 1, '2024-01-02 20:00:00', '2024-01-02 20:15:00', '2024-01-05 13:13:33', '2024-01-05 13:13:33'),
	(2, 'Booking', NULL, NULL, 1, 00000000000000000016, 1, '2024-01-04 21:00:00', '2024-01-04 21:30:00', '2024-01-05 13:14:03', '2024-01-05 13:14:03'),
	(3, 'Booking', NULL, NULL, 1, 00000000000000000047, 3, '2024-01-05 22:00:00', '2024-01-05 22:15:00', '2024-01-05 13:15:03', '2024-01-05 13:15:03'),
	(4, 'Booking', NULL, NULL, 1, 00000000000000000029, 2, '2024-01-05 20:30:00', '2024-01-05 20:45:00', '2024-01-05 13:17:07', '2024-01-05 13:17:07'),
	(5, 'Booking', NULL, NULL, 1, 00000000000000000024, 2, '2024-01-04 21:45:00', '2024-01-04 22:15:00', '2024-01-05 13:30:38', '2024-01-05 13:30:38'),
	(6, 'Booking', NULL, NULL, 1, 00000000000000000027, 2, '2024-01-06 22:45:00', '2024-01-07 00:30:00', '2024-01-07 06:22:19', '2024-01-07 06:22:19');

-- Дамп структуры для таблица banya.failed_jobs
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Дамп данных таблицы banya.failed_jobs: ~0 rows (приблизительно)
DELETE FROM `failed_jobs`;

-- Дамп структуры для таблица banya.job_titles
DROP TABLE IF EXISTS `job_titles`;
CREATE TABLE IF NOT EXISTS `job_titles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employe_id` bigint DEFAULT NULL,
  `sum` decimal(10,2) DEFAULT NULL,
  `qty` decimal(10,2) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `job_titles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AVG_ROW_LENGTH=1820 ROW_FORMAT=DYNAMIC;

-- Дамп данных таблицы banya.job_titles: ~9 rows (приблизительно)
DELETE FROM `job_titles`;
INSERT INTO `job_titles` (`id`, `name`, `employe_id`, `sum`, `qty`, `price`, `desc`, `created_at`, `updated_at`) VALUES
	(1, 'Banya', 3, NULL, 1.00, 154.00, NULL, NULL, NULL),
	(2, 'Sauna', 3, NULL, 1.00, 62.00, NULL, NULL, NULL),
	(3, 'Basseyn', 4, NULL, 1.00, 56.00, NULL, NULL, NULL),
	(10, 'Fatima Koch', 4, NULL, 2.00, 575.00, 'Deleniti suscipit ne', '2023-11-18 16:58:44', '2023-11-18 17:10:54'),
	(11, 'Lydia Zimmerman', 6, NULL, 1.00, 162.00, 'Quia consectetur aut', '2023-11-18 16:58:49', '2023-11-18 17:10:05'),
	(12, 'Sauna Basseyn', 6, NULL, 1.00, 100.00, NULL, '2024-01-11 16:59:01', '2024-01-11 16:59:01'),
	(13, 'Danielle Oconnor', 3, NULL, 2.00, 405.00, 'Totam asperiores min', '2024-01-11 16:59:19', '2024-01-12 13:53:04'),
	(14, 'Basseyny', 6, NULL, 2.00, 43.00, '', '2024-01-12 13:52:05', '2024-01-12 13:52:05'),
	(15, 'Massazh', 4, NULL, 1.00, 125.00, NULL, '2024-02-03 15:29:35', '2024-02-03 15:29:35');

-- Дамп структуры для таблица banya.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AVG_ROW_LENGTH=910 ROW_FORMAT=DYNAMIC;

-- Дамп данных таблицы banya.migrations: ~23 rows (приблизительно)
DELETE FROM `migrations`;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2023_11_13_012630_create_departments_table', 1),
	(6, '2023_11_13_012704_create_roles_table', 1),
	(7, '2023_11_13_013437_create_permissions_table', 1),
	(8, '2023_11_13_013456_create_user_roles_table', 1),
	(9, '2023_11_13_013824_create_addresses_table', 1),
	(10, '2023_11_13_014444_create_job_titles_table', 1),
	(11, '2023_11_13_014625_create_employes_table', 2),
	(12, '2023_11_15_204639_create_clients_table', 2),
	(13, '2023_11_15_205131_create_orders_table', 3),
	(14, '2023_11_15_205141_create_order_details_table', 3),
	(15, '2023_11_15_212307_add_column_to_job_title_table', 4),
	(16, '2023_11_15_212621_add_image_column_to_employes_table', 4),
	(17, '2023_11_21_211924_create_discounts_table', 5),
	(20, '2023_12_24_141733_create_events_table', 6),
	(21, '2024_01_26_200248_create_numerators_table', 7),
	(22, '2024_02_29_105736_create_posts_table', 7),
	(23, '2024_02_29_110318_add_post_field_to_users_table', 7),
	(24, '2024_03_12_123930_alter_table_users_field_utype', 8),
	(26, '2024_03_13_112510_alter_table_users_add_status_field', 9);

-- Дамп структуры для таблица banya.newtable
DROP TABLE IF EXISTS `newtable`;
CREATE TABLE IF NOT EXISTS `newtable` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Дамп данных таблицы banya.newtable: ~0 rows (приблизительно)
DELETE FROM `newtable`;

-- Дамп структуры для таблица banya.numerators
DROP TABLE IF EXISTS `numerators`;
CREATE TABLE IF NOT EXISTS `numerators` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `prefix` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num` int NOT NULL,
  `postfix` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы banya.numerators: ~0 rows (приблизительно)
DELETE FROM `numerators`;

-- Дамп структуры для таблица banya.orders
DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `num` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` date NOT NULL,
  `employes_id` bigint unsigned NOT NULL,
  `clients_id` bigint unsigned NOT NULL,
  `department_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `start` time DEFAULT NULL,
  `end` time DEFAULT NULL,
  `sum` decimal(10,2) NOT NULL DEFAULT '0.00',
  `desc` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_num_unique` (`num`),
  KEY `FK_orders_department_id` (`department_id`),
  KEY `orders_clients_id_foreign` (`clients_id`),
  KEY `orders_employes_id_foreign` (`employes_id`),
  CONSTRAINT `FK_orders_department_id` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_clients_id_foreign` FOREIGN KEY (`clients_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `orders_employes_id_foreign` FOREIGN KEY (`employes_id`) REFERENCES `employes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AVG_ROW_LENGTH=16384 ROW_FORMAT=DYNAMIC;

-- Дамп данных таблицы banya.orders: ~47 rows (приблизительно)
DELETE FROM `orders`;
INSERT INTO `orders` (`id`, `num`, `data`, `employes_id`, `clients_id`, `department_id`, `user_id`, `start`, `end`, `sum`, `desc`, `created_at`, `updated_at`) VALUES
	(1, '1', '2024-01-07', 3, 3, 1, NULL, NULL, NULL, 0.00, NULL, NULL, NULL),
	(2, '2', '2024-02-03', 3, 44, 1, 22, '07:00:00', '08:00:00', 0.00, NULL, '2024-02-03 13:52:58', '2024-02-03 15:27:48'),
	(3, '3', '2024-02-04', 3, 60, 1, 22, '08:00:00', '09:00:00', 0.00, NULL, '2024-02-03 17:46:20', '2024-02-03 17:46:30'),
	(4, '4', '2024-02-02', 3, 92, 1, 22, '12:00:00', '12:45:00', 0.00, NULL, '2024-02-03 18:34:08', '2024-02-03 18:34:22'),
	(5, '5', '2024-02-02', 3, 60, 1, 22, '07:00:00', '07:30:00', 0.00, NULL, '2024-02-03 18:35:20', '2024-02-03 18:35:29'),
	(6, '6', '2024-02-01', 3, 60, 1, 22, '07:00:00', '07:30:00', 0.00, NULL, '2024-02-03 23:57:15', '2024-02-03 23:57:31'),
	(7, '7', '2024-02-04', 3, 44, 1, 22, '09:30:00', '09:45:00', 0.00, NULL, '2024-02-04 03:03:17', '2024-02-04 03:03:30'),
	(8, '8', '2024-02-04', 3, 9, 1, 22, NULL, '06:15:00', 0.00, NULL, '2024-02-04 03:04:39', '2024-02-04 03:04:45'),
	(9, '9', '2024-02-04', 3, 19, 1, 22, NULL, '06:15:00', 0.00, NULL, '2024-02-04 03:04:58', '2024-02-04 03:05:11'),
	(10, '10', '2024-02-01', 3, 2, 1, NULL, NULL, NULL, 0.00, NULL, '2024-02-04 07:06:23', '2024-02-04 07:06:23'),
	(11, '11', '2024-02-01', 3, 16, 1, 22, '10:00:00', '10:30:00', 0.00, NULL, '2024-02-04 07:06:38', '2024-02-04 07:06:49'),
	(18, '18', '2024-02-01', 3, 30, 2, 22, '06:00:00', '08:15:00', 0.00, NULL, '2024-02-04 10:39:10', '2024-02-04 13:44:19'),
	(21, '21', '2024-02-03', 3, 29, 2, 22, '08:00:00', '10:15:00', 0.00, NULL, '2024-02-04 14:00:31', '2024-02-04 14:14:09'),
	(26, '22', '2024-02-02', 3, 2, 2, NULL, NULL, NULL, 0.00, NULL, '2024-02-04 15:31:21', '2024-02-04 15:31:21'),
	(27, '27', '2024-02-01', 3, 2, 3, NULL, NULL, NULL, 0.00, NULL, '2024-02-04 15:53:14', '2024-02-04 15:53:14'),
	(28, '28', '2024-02-02', 3, 29, 2, 22, '07:00:00', '09:15:00', 0.00, NULL, '2024-02-05 00:07:07', '2024-02-05 00:23:21'),
	(29, '29', '2024-02-03', 3, 24, 3, 22, '06:00:00', '07:15:00', 0.00, NULL, '2024-02-05 00:23:57', '2024-02-05 06:21:58'),
	(30, '30', '2024-02-04', 3, 44, 2, 22, '07:15:00', '11:00:00', 343.75, NULL, '2024-02-05 06:23:58', '2024-02-05 14:00:07'),
	(31, '31', '2024-02-02', 3, 2, 2, NULL, NULL, NULL, 0.00, NULL, '2024-02-05 14:15:58', '2024-02-05 14:15:58'),
	(32, '32', '2024-02-02', 3, 92, 2, 22, '10:00:00', '10:45:00', 93.75, NULL, '2024-02-05 14:16:21', '2024-02-05 14:16:38'),
	(33, '33', '2024-02-29', 3, 2, 1, NULL, NULL, NULL, 0.00, NULL, '2024-02-29 07:36:09', '2024-02-29 07:36:09'),
	(34, '34', '2024-03-19', 3, 36, 1, 22, '08:00:00', '09:30:00', 150.00, NULL, '2024-03-19 06:44:49', '2024-03-19 06:45:15'),
	(35, '35', '2024-03-19', 3, 70, 1, 22, NULL, '06:45:00', 0.00, NULL, '2024-03-19 07:04:05', '2024-03-19 07:04:27'),
	(36, '36', '2024-03-19', 3, 70, 1, 22, NULL, '06:45:00', 0.00, NULL, '2024-03-19 07:04:50', '2024-03-19 07:05:00'),
	(37, '37', '2024-03-19', 3, 16, 1, 22, NULL, '06:30:00', 0.00, NULL, '2024-03-19 07:05:05', '2024-03-19 07:05:16'),
	(38, '38', '2024-03-19', 3, 16, 1, 22, '06:00:00', '06:45:00', 75.00, NULL, '2024-03-19 07:05:45', '2024-03-19 07:06:14'),
	(39, '39', '2024-03-20', 3, 18, 1, 22, '06:00:00', '07:00:00', 100.00, NULL, '2024-03-19 07:07:05', '2024-03-19 07:07:19'),
	(40, '40', '2024-03-19', 3, 2, 1, NULL, NULL, NULL, 0.00, NULL, '2024-03-19 07:34:00', '2024-03-19 07:34:00'),
	(41, '41', '2024-03-19', 3, 92, 1, 22, '13:00:00', '13:45:00', 75.00, NULL, '2024-03-19 07:56:21', '2024-03-19 07:56:47'),
	(42, '42', '2024-03-20', 3, 2, 1, NULL, NULL, NULL, 0.00, NULL, '2024-03-19 23:13:03', '2024-03-19 23:13:03'),
	(43, '43', '2024-03-20', 3, 18, 1, 22, '07:00:00', '07:45:00', 75.00, NULL, '2024-03-19 23:13:18', '2024-03-19 23:14:17'),
	(44, '44', '2024-03-19', 3, 2, 1, NULL, NULL, NULL, 0.00, NULL, '2024-03-19 23:14:54', '2024-03-19 23:14:54'),
	(45, '45', '2024-03-19', 3, 2, 1, NULL, NULL, NULL, 0.00, NULL, '2024-03-19 23:17:07', '2024-03-19 23:17:07'),
	(46, '46', '2024-03-19', 3, 34, 1, 22, '19:00:00', '20:00:00', 100.00, NULL, '2024-03-19 23:17:34', '2024-03-19 23:18:28'),
	(47, '47', '2024-03-20', 3, 2, 1, NULL, NULL, NULL, 0.00, NULL, '2024-03-19 23:33:41', '2024-03-19 23:33:41'),
	(48, '48', '2024-03-20', 3, 2, 1, NULL, NULL, NULL, 0.00, NULL, '2024-03-19 23:33:51', '2024-03-19 23:33:51'),
	(49, '49', '2024-03-20', 3, 34, 1, 22, '12:45:00', '16:15:00', 350.00, NULL, '2024-03-19 23:34:13', '2024-03-19 23:34:33'),
	(50, '50', '2024-03-19', 3, 2, 1, NULL, NULL, NULL, 0.00, NULL, '2024-03-20 03:50:24', '2024-03-20 03:50:24'),
	(51, '51', '2024-03-20', 3, 2, 1, NULL, NULL, NULL, 0.00, NULL, '2024-03-20 03:50:48', '2024-03-20 03:50:48'),
	(52, '52', '2024-03-20', 3, 2, 1, NULL, NULL, NULL, 0.00, NULL, '2024-03-20 03:54:57', '2024-03-20 03:54:57'),
	(53, '53', '2024-03-19', 3, 2, 1, NULL, NULL, NULL, 0.00, NULL, '2024-03-20 03:56:00', '2024-03-20 03:56:00'),
	(54, '54', '2024-03-20', 3, 2, 1, NULL, NULL, NULL, 0.00, NULL, '2024-03-20 04:00:43', '2024-03-20 04:00:43'),
	(55, '55', '2024-03-20', 3, 2, 1, NULL, NULL, NULL, 0.00, NULL, '2024-03-20 04:02:18', '2024-03-20 04:02:18'),
	(56, '56', '2024-03-20', 3, 2, 1, NULL, NULL, NULL, 0.00, NULL, '2024-03-20 06:43:35', '2024-03-20 06:43:35'),
	(57, '57', '2024-03-20', 3, 54, 1, 22, '17:00:00', '18:15:00', 125.00, NULL, '2024-03-20 06:48:17', '2024-03-20 06:48:34'),
	(58, '58', '2024-03-20', 3, 2, 1, NULL, NULL, NULL, 0.00, NULL, '2024-03-20 07:36:04', '2024-03-20 07:36:04'),
	(59, '59', '2024-03-20', 3, 3, 1, 22, '13:00:00', '13:45:00', 75.00, NULL, '2024-03-20 07:36:58', '2024-03-20 07:37:11');

-- Дамп структуры для таблица banya.order_details
DROP TABLE IF EXISTS `order_details`;
CREATE TABLE IF NOT EXISTS `order_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num` int DEFAULT NULL,
  `order_id` bigint unsigned NOT NULL,
  `jobtitle_id` bigint unsigned NOT NULL,
  `employes_id` bigint unsigned NOT NULL,
  `start` time DEFAULT NULL,
  `end` time DEFAULT NULL,
  `qty` decimal(10,2) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `sum` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_order_details_employes` (`employes_id`),
  KEY `FK_order_details_orders` (`order_id`),
  KEY `order_details_jobtitle_id_foreign` (`jobtitle_id`),
  CONSTRAINT `FK_order_details_employes` FOREIGN KEY (`employes_id`) REFERENCES `employes` (`id`),
  CONSTRAINT `FK_order_details_orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_details_jobtitle_id_foreign` FOREIGN KEY (`jobtitle_id`) REFERENCES `job_titles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AVG_ROW_LENGTH=4096 ROW_FORMAT=DYNAMIC;

-- Дамп данных таблицы banya.order_details: ~14 rows (приблизительно)
DELETE FROM `order_details`;
INSERT INTO `order_details` (`id`, `name`, `num`, `order_id`, `jobtitle_id`, `employes_id`, `start`, `end`, `qty`, `price`, `sum`, `created_at`, `updated_at`) VALUES
	(1, 'bir', 1, 39, 3, 4, '08:00:00', '10:30:00', 1.00, 100.00, NULL, NULL, NULL),
	(2, 'bi', 1, 39, 3, 4, '10:30:00', '12:45:00', 2.00, 120.00, NULL, NULL, NULL),
	(3, 'vcx', 1, 39, 1, 4, '14:00:00', '16:15:00', NULL, NULL, NULL, NULL, NULL),
	(4, 'fds', 1, 39, 3, 4, '00:00:00', '00:30:00', 1.00, 50.00, NULL, NULL, NULL),
	(5, 'gg', 1, 39, 3, 4, '01:00:00', '02:00:00', NULL, NULL, NULL, NULL, NULL),
	(6, 'Banya', 3, 39, 1, 3, NULL, NULL, 1.00, 154.00, NULL, '2024-02-03 17:46:36', '2024-02-03 17:46:36'),
	(7, 'Banya', 4, 39, 1, 4, NULL, NULL, 1.00, 154.00, NULL, '2024-02-03 18:34:30', '2024-02-03 18:34:30'),
	(8, 'Basseyny', 21, 39, 14, 6, NULL, NULL, 3.00, 43.00, NULL, '2024-02-04 14:04:46', '2024-02-04 14:04:46'),
	(9, 'Sauna', 21, 39, 2, 3, NULL, NULL, 2.00, 62.00, NULL, '2024-02-04 14:14:23', '2024-02-04 14:14:23'),
	(10, 'Banya', 30, 39, 1, 3, NULL, NULL, 1.00, 154.00, NULL, '2024-02-05 06:25:07', '2024-02-05 06:25:07'),
	(11, 'Fatima Koch', 30, 39, 10, 4, NULL, NULL, 2.00, 575.00, NULL, '2024-02-05 06:25:16', '2024-02-05 06:25:16'),
	(12, 'Massazh', 32, 39, 15, 4, NULL, NULL, 1.00, 125.00, NULL, '2024-02-05 14:16:54', '2024-02-05 14:16:54'),
	(13, 'Sauna', 34, 39, 2, 3, NULL, NULL, 1.00, 62.00, NULL, '2024-03-19 06:45:31', '2024-03-19 06:45:31'),
	(14, 'Banya', 43, 39, 1, 3, NULL, NULL, 1.00, 154.00, NULL, '2024-03-19 23:14:24', '2024-03-19 23:14:24');

-- Дамп структуры для таблица banya.password_reset_tokens
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Дамп данных таблицы banya.password_reset_tokens: ~0 rows (приблизительно)
DELETE FROM `password_reset_tokens`;

-- Дамп структуры для таблица banya.permissions
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` int unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Дамп данных таблицы banya.permissions: ~0 rows (приблизительно)
DELETE FROM `permissions`;

-- Дамп структуры для таблица banya.personal_access_tokens
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Дамп данных таблицы banya.personal_access_tokens: ~0 rows (приблизительно)
DELETE FROM `personal_access_tokens`;

-- Дамп структуры для таблица banya.posts
DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы banya.posts: ~0 rows (приблизительно)
DELETE FROM `posts`;
INSERT INTO `posts` (`id`, `title`, `salary`, `created_at`, `updated_at`) VALUES
	(1, 'Kassir', '100', '2024-02-29 11:12:04', '2024-02-29 11:12:05');

-- Дамп структуры для процедура banya.procedure2
DROP PROCEDURE IF EXISTS `procedure2`;
DELIMITER //
CREATE PROCEDURE `procedure2`()
BEGIN
  SET @i = 0;
  SET @j = 0;

  WHILE @i <= 24 DO
    WHILE @j <= 45 DO
      IF (LENGTH(@i) = 1)
        AND (LENGTH(@j) = 1) THEN
        INSERT INTO dc_time (data, time, order_id)
          VALUE (CURDATE(), CONCAT('0', @i, ':', '0', @j), 1);

        SET @t = CONCAT('0', @i, ':', '0', @j);
      ELSE
        INSERT INTO dc_time (data, time, order_id)
          VALUE (CURDATE(), CONCAT(@i, ':', @j), 1);
        SET @t = CONCAT(@i, ':', @j);
      END IF;
      SET @j = @j + 15;
    END WHILE;
    SET @i = @i + 1;

  END WHILE;
END//
DELIMITER ;

-- Дамп структуры для процедура banya.procGetOrderTime
DROP PROCEDURE IF EXISTS `procGetOrderTime`;
DELIMITER //
CREATE PROCEDURE `procGetOrderTime`(IN data date, IN department int)
BEGIN
  CALL ClearOrderTime();
  IF department IS NULL THEN
    SET department = 1;
  END IF;
  UPDATE time_tb tt, order_details od, orders o
  SET tt.busy = TRUE,
      tt.order_time = tt.time,
      od.order_id = o.id,
      tt.order_id = od.order_id
  WHERE tt.time >= o.start
  AND tt.time <= o.end
  AND o.data = data
  AND o.department_id = department;
-- Добавить время заказа в таблицу заказов
END//
DELIMITER ;

-- Дамп структуры для процедура banya.procTimeDiff
DROP PROCEDURE IF EXISTS `procTimeDiff`;
DELIMITER //
CREATE PROCEDURE `procTimeDiff`(IN num int)
BEGIN
  SELECT
    TIME_TO_SEC(TIMEDIFF(od.end, od.start)) / 3600 AS tDiff
  FROM orders od
  WHERE od.num = num;
END//
DELIMITER ;

-- Дамп структуры для процедура banya.procTimeList
DROP PROCEDURE IF EXISTS `procTimeList`;
DELIMITER //
CREATE PROCEDURE `procTimeList`(IN department_id int, IN data date)
BEGIN
  SELECT  tl.id, tl.time
  FROM time_list tl
  WHERE tl.time NOT IN (SELECT
      tl.time
    FROM time_list tl,
         (SELECT
             od.start,
             od.end
           FROM order_details od,
                orders o
           WHERE od.order_id = o.id
           AND o.department_id = department_id
           AND o.data = data) AS od

    WHERE tl.time >= od.start
    AND tl.time <= od.end - 900);
-- В модальном окне добавления/редактирования показывать только доступное время
-- Это свободное время которое не было заказано и можно заказать
END//
DELIMITER ;

-- Дамп структуры для таблица banya.roles
DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` int unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AVG_ROW_LENGTH=8192 ROW_FORMAT=DYNAMIC;

-- Дамп данных таблицы banya.roles: ~2 rows (приблизительно)
DELETE FROM `roles`;
INSERT INTO `roles` (`id`, `name`, `group`, `created_at`, `updated_at`) VALUES
	(1, 'Admin', 1, '2023-11-12 19:00:00', '2023-11-12 19:00:00'),
	(2, 'User', 2, '2023-11-12 19:00:00', '2023-11-12 19:00:00');

-- Дамп структуры для таблица banya.table1
DROP TABLE IF EXISTS `table1`;
CREATE TABLE IF NOT EXISTS `table1` (
  `id` int NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы banya.table1: ~0 rows (приблизительно)
DELETE FROM `table1`;

-- Дамп структуры для таблица banya.temp_orders
DROP TABLE IF EXISTS `temp_orders`;
CREATE TABLE IF NOT EXISTS `temp_orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `num` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` date NOT NULL,
  `employes_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `clients_id` bigint unsigned NOT NULL,
  `department_id` bigint unsigned DEFAULT NULL,
  `sum` decimal(10,2) NOT NULL DEFAULT '0.00',
  `desc` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AVG_ROW_LENGTH=16384 ROW_FORMAT=DYNAMIC;

-- Дамп данных таблицы banya.temp_orders: ~0 rows (приблизительно)
DELETE FROM `temp_orders`;
INSERT INTO `temp_orders` (`id`, `num`, `data`, `employes_id`, `user_id`, `clients_id`, `department_id`, `sum`, `desc`, `created_at`, `updated_at`) VALUES
	(1, '1', '2024-01-27', 1, 1, 1, 1, 0.00, NULL, NULL, NULL);

-- Дамп структуры для таблица banya.temp_order_details
DROP TABLE IF EXISTS `temp_order_details`;
CREATE TABLE IF NOT EXISTS `temp_order_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num` int DEFAULT NULL,
  `order_id` bigint unsigned NOT NULL,
  `jobtitle_id` bigint unsigned NOT NULL,
  `employes_id` bigint unsigned NOT NULL,
  `start` time DEFAULT NULL,
  `end` time DEFAULT NULL,
  `qty` decimal(10,2) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `sum` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Дамп данных таблицы banya.temp_order_details: ~0 rows (приблизительно)
DELETE FROM `temp_order_details`;

-- Дамп структуры для таблица banya.time_list
DROP TABLE IF EXISTS `time_list`;
CREATE TABLE IF NOT EXISTS `time_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `time` time DEFAULT NULL,
  `busy` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AVG_ROW_LENGTH=170 ROW_FORMAT=DYNAMIC;

-- Дамп данных таблицы banya.time_list: ~69 rows (приблизительно)
DELETE FROM `time_list`;
INSERT INTO `time_list` (`id`, `time`, `busy`) VALUES
	(25, '06:00:00', 0),
	(26, '06:15:00', 0),
	(27, '06:30:00', 0),
	(28, '06:45:00', 0),
	(29, '07:00:00', 0),
	(30, '07:15:00', 0),
	(31, '07:30:00', 0),
	(32, '07:45:00', 0),
	(33, '08:00:00', 0),
	(34, '08:15:00', 0),
	(35, '08:30:00', 0),
	(36, '08:45:00', 0),
	(37, '09:00:00', 0),
	(38, '09:15:00', 0),
	(39, '09:30:00', 0),
	(40, '09:45:00', 0),
	(41, '10:00:00', 0),
	(42, '10:15:00', 0),
	(43, '10:30:00', 0),
	(44, '10:45:00', 0),
	(45, '11:00:00', 0),
	(46, '11:15:00', 0),
	(47, '11:30:00', 0),
	(48, '11:45:00', 0),
	(49, '12:00:00', 0),
	(50, '12:15:00', 0),
	(51, '12:30:00', 0),
	(52, '12:45:00', 0),
	(53, '13:00:00', 0),
	(54, '13:15:00', 0),
	(55, '13:30:00', 0),
	(56, '13:45:00', 0),
	(57, '14:00:00', 0),
	(58, '14:15:00', 0),
	(59, '14:30:00', 0),
	(60, '14:45:00', 0),
	(61, '15:00:00', 0),
	(62, '15:15:00', 0),
	(63, '15:30:00', 0),
	(64, '15:45:00', 0),
	(65, '16:00:00', 0),
	(66, '16:15:00', 0),
	(67, '16:30:00', 0),
	(68, '16:45:00', 0),
	(69, '17:00:00', 0),
	(70, '17:15:00', 0),
	(71, '17:30:00', 0),
	(72, '17:45:00', 0),
	(73, '18:00:00', 0),
	(74, '18:15:00', 0),
	(75, '18:30:00', 0),
	(76, '18:45:00', 0),
	(77, '19:00:00', 0),
	(78, '19:15:00', 0),
	(79, '19:30:00', 0),
	(80, '19:45:00', 0),
	(81, '20:00:00', 0),
	(82, '20:15:00', 0),
	(83, '20:30:00', 0),
	(84, '20:45:00', 0),
	(85, '21:00:00', 0),
	(86, '21:15:00', 0),
	(87, '21:30:00', 0),
	(88, '21:45:00', 0),
	(89, '22:00:00', 0),
	(90, '22:15:00', 0),
	(91, '22:30:00', 0),
	(92, '22:45:00', 0),
	(93, '23:00:00', 0);

-- Дамп структуры для таблица banya.time_tb
DROP TABLE IF EXISTS `time_tb`;
CREATE TABLE IF NOT EXISTS `time_tb` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `order_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` bigint DEFAULT NULL,
  `busy` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AVG_ROW_LENGTH=170 ROW_FORMAT=DYNAMIC;

-- Дамп данных таблицы banya.time_tb: ~69 rows (приблизительно)
DELETE FROM `time_tb`;
INSERT INTO `time_tb` (`id`, `data`, `time`, `order_time`, `order_id`, `busy`) VALUES
	(25, '2024-01-07', '06:00:00', '06:00:00', 39, 1),
	(26, '2024-01-07', '06:15:00', '06:15:00', 39, 1),
	(27, '2024-01-07', '06:30:00', '06:30:00', 39, 1),
	(28, '2024-01-07', '06:45:00', '06:45:00', 39, 1),
	(29, '2024-01-07', '07:00:00', '07:00:00', 39, 1),
	(30, '2024-01-07', '07:15:00', '07:15:00', 39, 1),
	(31, '2024-01-07', '07:30:00', '07:30:00', 39, 1),
	(32, '2024-01-07', '07:45:00', '07:45:00', 39, 1),
	(33, '2024-01-07', '08:00:00', '', 0, 0),
	(34, '2024-01-07', '08:15:00', '', 0, 0),
	(35, '2024-01-07', '08:30:00', '', 0, 0),
	(36, '2024-01-07', '08:45:00', '', 0, 0),
	(37, '2024-01-07', '09:00:00', '', 0, 0),
	(38, '2024-01-07', '09:15:00', '', 0, 0),
	(39, '2024-01-07', '09:30:00', '', 0, 0),
	(40, '2024-01-07', '09:45:00', '', 0, 0),
	(41, '2024-01-07', '10:00:00', '', 0, 0),
	(42, '2024-01-07', '10:15:00', '', 0, 0),
	(43, '2024-01-07', '10:30:00', '', 0, 0),
	(44, '2024-01-07', '10:45:00', '', 0, 0),
	(45, '2024-01-07', '11:00:00', '', 0, 0),
	(46, '2024-01-07', '11:15:00', '', 0, 0),
	(47, '2024-01-07', '11:30:00', '', 0, 0),
	(48, '2024-01-07', '11:45:00', '', 0, 0),
	(49, '2024-01-07', '12:00:00', '', 0, 0),
	(50, '2024-01-07', '12:15:00', '', 0, 0),
	(51, '2024-01-07', '12:30:00', '', 0, 0),
	(52, '2024-01-07', '12:45:00', '12:45:00', 39, 1),
	(53, '2024-01-07', '13:00:00', '13:00:00', 39, 1),
	(54, '2024-01-07', '13:15:00', '13:15:00', 39, 1),
	(55, '2024-01-07', '13:30:00', '13:30:00', 39, 1),
	(56, '2024-01-07', '13:45:00', '13:45:00', 39, 1),
	(57, '2024-01-07', '14:00:00', '14:00:00', 39, 1),
	(58, '2024-01-07', '14:15:00', '14:15:00', 39, 1),
	(59, '2024-01-07', '14:30:00', '14:30:00', 39, 1),
	(60, '2024-01-07', '14:45:00', '14:45:00', 39, 1),
	(61, '2024-01-07', '15:00:00', '15:00:00', 39, 1),
	(62, '2024-01-07', '15:15:00', '15:15:00', 39, 1),
	(63, '2024-01-07', '15:30:00', '15:30:00', 39, 1),
	(64, '2024-01-07', '15:45:00', '15:45:00', 39, 1),
	(65, '2024-01-07', '16:00:00', '16:00:00', 39, 1),
	(66, '2024-01-07', '16:15:00', '16:15:00', 39, 1),
	(67, '2024-01-07', '16:30:00', '', 0, 0),
	(68, '2024-01-07', '16:45:00', '', 0, 0),
	(69, '2024-01-07', '17:00:00', '17:00:00', 39, 1),
	(70, '2024-01-07', '17:15:00', '17:15:00', 39, 1),
	(71, '2024-01-07', '17:30:00', '17:30:00', 39, 1),
	(72, '2024-01-07', '17:45:00', '17:45:00', 39, 1),
	(73, '2024-01-07', '18:00:00', '18:00:00', 39, 1),
	(74, '2024-01-07', '18:15:00', '18:15:00', 39, 1),
	(75, '2024-01-07', '18:30:00', '', 0, 0),
	(76, '2024-01-07', '18:45:00', '', 0, 0),
	(77, '2024-01-07', '19:00:00', '', 0, 0),
	(78, '2024-01-07', '19:15:00', '', 0, 0),
	(79, '2024-01-07', '19:30:00', '', 0, 0),
	(80, '2024-01-07', '19:45:00', '', 0, 0),
	(81, '2024-01-07', '20:00:00', '', 0, 0),
	(82, '2024-01-07', '20:15:00', '', 0, 0),
	(83, '2024-01-07', '20:30:00', '', 0, 0),
	(84, '2024-01-07', '20:45:00', '', 0, 0),
	(85, '2024-01-07', '21:00:00', '', 0, 0),
	(86, '2024-01-07', '21:15:00', '', 0, 0),
	(87, '2024-01-07', '21:30:00', '', 0, 0),
	(88, '2024-01-07', '21:45:00', '', 0, 0),
	(89, '2024-01-07', '22:00:00', '', 0, 0),
	(90, '2024-01-07', '22:15:00', '', 0, 0),
	(91, '2024-01-07', '22:30:00', '', 0, 0),
	(92, '2024-01-07', '22:45:00', '', 0, 0),
	(93, '2024-01-07', '23:00:00', '', 0, 0);

-- Дамп структуры для таблица banya.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `utype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USR' COMMENT 'ADM for Admin and USR for Normal user',
  `status` enum('Активирован','Не активирован') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Не активирован',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AVG_ROW_LENGTH=472 ROW_FORMAT=DYNAMIC;

-- Дамп данных таблицы banya.users: ~8 rows (приблизительно)
DELETE FROM `users`;
INSERT INTO `users` (`id`, `name`, `first_name`, `last_name`, `email`, `email_verified_at`, `password`, `remember_token`, `post_id`, `created_at`, `updated_at`, `utype`, `status`) VALUES
	(112, 'Dr. Tyree Effertz', 'Elliot', 'Kris', 'savanah.marks@example.com', '2023-11-16 01:25:28', '$2y$12$8gfsbNLiGLil5BEc7T1S1OBD9LPJMCx18FDZr8lVz8gbeMq3ov7YS', 'AmUHk5lgTx', NULL, '2023-11-16 01:25:28', '2024-03-19 06:44:34', 'KSS', 'Активирован'),
	(113, 'Quinten Moore', 'Icie', 'Cassin', 'clebsack@example.org', '2023-11-16 01:25:28', '$2y$12$8gfsbNLiGLil5BEc7T1S1OBD9LPJMCx18FDZr8lVz8gbeMq3ov7YS', 'R0V2BkHYsf', NULL, '2023-11-16 01:25:28', '2023-11-16 01:25:28', 'USR', 'Не активирован'),
	(114, 'Dahlia DuBuque', 'Casper', 'Langosh', 'jade.schamberger@example.org', '2023-11-16 01:25:28', '$2y$12$8gfsbNLiGLil5BEc7T1S1OBD9LPJMCx18FDZr8lVz8gbeMq3ov7YS', '2tz4oBinQg', NULL, '2023-11-16 01:25:28', '2023-11-16 01:25:28', 'USR', 'Не активирован'),
	(128, 'Bobo', 'Bobo', 'Develop', 'employe@tm.tm', NULL, '$2y$12$0xx8g9GAhO7CdUCz428av.OmZDZdANXYAVcjr99TJnOzj4PX3sb/i', NULL, NULL, '2024-03-12 07:34:54', '2024-03-12 07:34:54', 'ADM', 'Активирован'),
	(131, 'Quisquam', 'Quisquam', 'Praesentium', 'bikomo@mailinator.com', NULL, '$2y$12$xIgru6bnKPY.eJ7CJmWVr.nhHc2wlb.ax05ySW4EV8Wg4e7Ida1lq', NULL, NULL, '2024-03-12 07:38:27', '2024-03-19 06:25:41', 'KSS', 'Активирован'),
	(132, 'Aute', 'Aute', 'Autem', 'noro@mailinator.com', NULL, '$2y$12$LHilB23f3Id8m8pm.ltpRe86jg22DSEiAOaTEU2Ln81e9/drppPOe', NULL, NULL, '2024-03-12 07:44:42', '2024-03-13 06:44:18', 'KSS', 'Активирован'),
	(134, 'dsa', 'sdfs', 'sdfsd', 'fdsf@sdf.tn', NULL, '1231123', NULL, NULL, NULL, NULL, 'USR', 'Не активирован');

-- Дамп структуры для таблица banya.user_roles
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE IF NOT EXISTS `user_roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Дамп данных таблицы banya.user_roles: ~0 rows (приблизительно)
DELETE FROM `user_roles`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
