--
-- Скрипт сгенерирован Devart dbForge Studio 2019 for MySQL, Версия 8.1.22.0
-- Домашняя страница продукта: http://www.devart.com/ru/dbforge/mysql/studio
-- Дата скрипта: 04.02.2024 0:26:43
-- Версия сервера: 5.7.33
-- Версия клиента: 4.1
--

-- 
-- Отключение внешних ключей
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Установить режим SQL (SQL mode)
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 
-- Установка кодировки, с использованием которой клиент будет посылать запросы на сервер
--
SET NAMES 'utf8';

--
-- Установка базы данных по умолчанию
--
USE banya;

--
-- Удалить процедуру `procedure2`
--
DROP PROCEDURE IF EXISTS procedure2;

--
-- Удалить таблицу `addresses`
--
DROP TABLE IF EXISTS addresses;

--
-- Удалить таблицу `discounts`
--
DROP TABLE IF EXISTS discounts;

--
-- Удалить таблицу `failed_jobs`
--
DROP TABLE IF EXISTS failed_jobs;

--
-- Удалить таблицу `migrations`
--
DROP TABLE IF EXISTS migrations;

--
-- Удалить таблицу `newtable`
--
DROP TABLE IF EXISTS newtable;

--
-- Удалить таблицу `password_reset_tokens`
--
DROP TABLE IF EXISTS password_reset_tokens;

--
-- Удалить таблицу `permissions`
--
DROP TABLE IF EXISTS permissions;

--
-- Удалить таблицу `personal_access_tokens`
--
DROP TABLE IF EXISTS personal_access_tokens;

--
-- Удалить таблицу `temp_orders`
--
DROP TABLE IF EXISTS temp_orders;

--
-- Удалить таблицу `temp_order_details`
--
DROP TABLE IF EXISTS temp_order_details;

--
-- Удалить таблицу `time_list`
--
DROP TABLE IF EXISTS time_list;

--
-- Удалить таблицу `users`
--
DROP TABLE IF EXISTS users;

--
-- Удалить таблицу `user_roles`
--
DROP TABLE IF EXISTS user_roles;

--
-- Удалить процедуру `procGetOrderTime`
--
DROP PROCEDURE IF EXISTS procGetOrderTime;

--
-- Удалить процедуру `ClearOrderTime`
--
DROP PROCEDURE IF EXISTS ClearOrderTime;

--
-- Удалить таблицу `time_tb`
--
DROP TABLE IF EXISTS time_tb;

--
-- Удалить таблицу `events`
--
DROP TABLE IF EXISTS events;

--
-- Удалить таблицу `order_details`
--
DROP TABLE IF EXISTS order_details;

--
-- Удалить процедуру `procTimeList`
--
DROP PROCEDURE IF EXISTS procTimeList;

--
-- Удалить таблицу `orders`
--
DROP TABLE IF EXISTS orders;

--
-- Удалить таблицу `clients`
--
DROP TABLE IF EXISTS clients;

--
-- Удалить таблицу `employes`
--
DROP TABLE IF EXISTS employes;

--
-- Удалить таблицу `job_titles`
--
DROP TABLE IF EXISTS job_titles;

--
-- Удалить таблицу `departments`
--
DROP TABLE IF EXISTS departments;

--
-- Удалить таблицу `roles`
--
DROP TABLE IF EXISTS roles;

--
-- Установка базы данных по умолчанию
--
USE banya;

--
-- Создать таблицу `roles`
--
CREATE TABLE roles (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(255) NOT NULL,
  `group` int(10) UNSIGNED NOT NULL DEFAULT 1,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 3,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать индекс `name` для объекта типа таблица `roles`
--
ALTER TABLE roles
ADD UNIQUE INDEX name (name);

--
-- Создать таблицу `departments`
--
CREATE TABLE departments (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(255) NOT NULL,
  price decimal(19, 2) DEFAULT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 5,
AVG_ROW_LENGTH = 4096,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать таблицу `job_titles`
--
CREATE TABLE job_titles (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(255) NOT NULL,
  employe_id bigint(20) DEFAULT NULL,
  sum decimal(10, 2) DEFAULT NULL,
  qty decimal(10, 2) DEFAULT NULL,
  price decimal(10, 2) DEFAULT NULL,
  `desc` text DEFAULT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 15,
AVG_ROW_LENGTH = 1820,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать индекс `job_titles_name_unique` для объекта типа таблица `job_titles`
--
ALTER TABLE job_titles
ADD UNIQUE INDEX job_titles_name_unique (name);

--
-- Создать таблицу `employes`
--
CREATE TABLE employes (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(255) NOT NULL,
  image varchar(255) DEFAULT NULL,
  first_name varchar(255) DEFAULT NULL,
  last_name varchar(255) DEFAULT NULL,
  phone varchar(255) DEFAULT NULL,
  address bigint(20) UNSIGNED DEFAULT NULL,
  department_id bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  jobtitle_id bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  role_id bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 7,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать индекс `employes_address_foreign` для объекта типа таблица `employes`
--
ALTER TABLE employes
ADD INDEX employes_address_foreign (address);

--
-- Создать внешний ключ
--
ALTER TABLE employes
ADD CONSTRAINT employes_department_id_foreign FOREIGN KEY (department_id)
REFERENCES departments (id) ON DELETE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE employes
ADD CONSTRAINT employes_jobtitle_id_foreign FOREIGN KEY (jobtitle_id)
REFERENCES job_titles (id) ON DELETE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE employes
ADD CONSTRAINT employes_role_id_foreign FOREIGN KEY (role_id)
REFERENCES roles (id) ON DELETE CASCADE;

--
-- Создать таблицу `clients`
--
CREATE TABLE clients (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  first_name varchar(255) NOT NULL,
  last_name varchar(255) DEFAULT NULL,
  email varchar(255) DEFAULT NULL,
  address varchar(255) DEFAULT NULL,
  phone varchar(255) DEFAULT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 126,
AVG_ROW_LENGTH = 207,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать таблицу `orders`
--
CREATE TABLE orders (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  num varchar(255) NOT NULL,
  data date NOT NULL,
  employes_id bigint(20) UNSIGNED NOT NULL,
  clients_id bigint(20) UNSIGNED NOT NULL,
  department_id bigint(20) UNSIGNED DEFAULT NULL,
  start time DEFAULT NULL,
  end time DEFAULT NULL,
  sum decimal(10, 2) NOT NULL DEFAULT 0.00,
  `desc` text DEFAULT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 3,
AVG_ROW_LENGTH = 16384,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать индекс `orders_num_unique` для объекта типа таблица `orders`
--
ALTER TABLE orders
ADD UNIQUE INDEX orders_num_unique (num);

--
-- Создать внешний ключ
--
ALTER TABLE orders
ADD CONSTRAINT FK_orders_department_id FOREIGN KEY (department_id)
REFERENCES departments (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE orders
ADD CONSTRAINT orders_clients_id_foreign FOREIGN KEY (clients_id)
REFERENCES clients (id) ON DELETE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE orders
ADD CONSTRAINT orders_employes_id_foreign FOREIGN KEY (employes_id)
REFERENCES employes (id);

DELIMITER $$

--
-- Создать процедуру `procTimeList`
--
CREATE DEFINER = 'root'@'localhost'
PROCEDURE procTimeList (IN department_id int, IN data date)
BEGIN
  SELECT
    tl.id,
    tl.time
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
END
$$

DELIMITER ;

--
-- Создать таблицу `order_details`
--
CREATE TABLE order_details (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(255) DEFAULT NULL,
  num int(11) DEFAULT NULL,
  order_id bigint(20) UNSIGNED NOT NULL,
  jobtitle_id bigint(20) UNSIGNED NOT NULL,
  employes_id bigint(20) UNSIGNED NOT NULL,
  start time DEFAULT NULL,
  end time DEFAULT NULL,
  qty decimal(10, 2) DEFAULT NULL,
  price decimal(10, 2) DEFAULT NULL,
  sum decimal(10, 2) DEFAULT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 6,
AVG_ROW_LENGTH = 4096,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать внешний ключ
--
ALTER TABLE order_details
ADD CONSTRAINT FK_order_details_employes FOREIGN KEY (employes_id)
REFERENCES employes (id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Создать внешний ключ
--
ALTER TABLE order_details
ADD CONSTRAINT FK_order_details_orders FOREIGN KEY (order_id)
REFERENCES orders (id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Создать внешний ключ
--
ALTER TABLE order_details
ADD CONSTRAINT order_details_jobtitle_id_foreign FOREIGN KEY (jobtitle_id)
REFERENCES job_titles (id) ON DELETE CASCADE;

--
-- Создать таблицу `events`
--
CREATE TABLE events (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  title varchar(255) NOT NULL,
  start varchar(255) DEFAULT NULL,
  end varchar(255) DEFAULT NULL,
  order_id bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  client_id bigint(20) UNSIGNED ZEROFILL NOT NULL,
  department_id bigint(20) UNSIGNED NOT NULL,
  startOrder timestamp NOT NULL DEFAULT '2023-12-28 16:28:45',
  endOrder timestamp NOT NULL DEFAULT '2023-12-28 16:28:45',
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 7,
AVG_ROW_LENGTH = 3276,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать внешний ключ
--
ALTER TABLE events
ADD CONSTRAINT FK_events_clients FOREIGN KEY (client_id)
REFERENCES clients (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE events
ADD CONSTRAINT FK_events_departments FOREIGN KEY (department_id)
REFERENCES departments (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать таблицу `time_tb`
--
CREATE TABLE time_tb (
  id int(11) NOT NULL AUTO_INCREMENT,
  data date DEFAULT NULL,
  time time DEFAULT NULL,
  order_time varchar(50) DEFAULT NULL,
  order_id bigint(20) DEFAULT NULL,
  busy tinyint(1) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 97,
AVG_ROW_LENGTH = 170,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

DELIMITER $$

--
-- Создать процедуру `ClearOrderTime`
--
CREATE DEFINER = 'root'@'localhost'
PROCEDURE ClearOrderTime ()
BEGIN
  UPDATE time_tb tt
  SET tt.busy = FALSE,
      tt.order_time = '',
      tt.order_id = 0;
END
$$

--
-- Создать процедуру `procGetOrderTime`
--
CREATE DEFINER = 'root'@'localhost'
PROCEDURE procGetOrderTime (IN data date, IN department int)
BEGIN
  CALL ClearOrderTime();
  IF department IS NULL THEN
    SET department = 1;
  END IF;
  UPDATE time_tb tt, order_details od, orders o
  SET tt.busy = TRUE,
      tt.order_time = tt.time,
      tt.order_id = od.order_id
  WHERE tt.time >= od.start
  AND tt.time <= od.end
  AND o.data = data
  AND o.department_id = department;
-- Добавить время заказа в таблицу заказов
END
$$

DELIMITER ;

--
-- Создать таблицу `user_roles`
--
CREATE TABLE user_roles (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  user_id bigint(20) UNSIGNED NOT NULL,
  role_id bigint(20) UNSIGNED NOT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать таблицу `users`
--
CREATE TABLE users (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(255) NOT NULL,
  first_name varchar(255) DEFAULT NULL,
  last_name varchar(255) DEFAULT NULL,
  email varchar(255) NOT NULL,
  email_verified_at timestamp NULL DEFAULT NULL,
  password varchar(255) NOT NULL,
  remember_token varchar(100) DEFAULT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 128,
AVG_ROW_LENGTH = 472,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать индекс `users_email_unique` для объекта типа таблица `users`
--
ALTER TABLE users
ADD UNIQUE INDEX users_email_unique (email);

--
-- Создать таблицу `time_list`
--
CREATE TABLE time_list (
  id int(11) NOT NULL AUTO_INCREMENT,
  time time DEFAULT NULL,
  busy tinyint(1) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 97,
AVG_ROW_LENGTH = 170,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать таблицу `temp_order_details`
--
CREATE TABLE temp_order_details (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(255) DEFAULT NULL,
  num int(11) DEFAULT NULL,
  order_id bigint(20) UNSIGNED NOT NULL,
  jobtitle_id bigint(20) UNSIGNED NOT NULL,
  employes_id bigint(20) UNSIGNED NOT NULL,
  start time DEFAULT NULL,
  end time DEFAULT NULL,
  qty decimal(10, 2) DEFAULT NULL,
  price decimal(10, 2) DEFAULT NULL,
  sum decimal(10, 2) DEFAULT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать таблицу `temp_orders`
--
CREATE TABLE temp_orders (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  num varchar(255) NOT NULL,
  data date NOT NULL,
  employes_id bigint(20) UNSIGNED NOT NULL,
  user_id bigint(20) UNSIGNED NOT NULL,
  clients_id bigint(20) UNSIGNED NOT NULL,
  department_id bigint(20) UNSIGNED DEFAULT NULL,
  sum decimal(10, 2) NOT NULL DEFAULT 0.00,
  `desc` text DEFAULT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 2,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать таблицу `personal_access_tokens`
--
CREATE TABLE personal_access_tokens (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  tokenable_type varchar(255) NOT NULL,
  tokenable_id bigint(20) UNSIGNED NOT NULL,
  name varchar(255) NOT NULL,
  token varchar(64) NOT NULL,
  abilities text DEFAULT NULL,
  last_used_at timestamp NULL DEFAULT NULL,
  expires_at timestamp NULL DEFAULT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать индекс `personal_access_tokens_token_unique` для объекта типа таблица `personal_access_tokens`
--
ALTER TABLE personal_access_tokens
ADD UNIQUE INDEX personal_access_tokens_token_unique (token);

--
-- Создать индекс `personal_access_tokens_tokenable_type_tokenable_id_index` для объекта типа таблица `personal_access_tokens`
--
ALTER TABLE personal_access_tokens
ADD INDEX personal_access_tokens_tokenable_type_tokenable_id_index (tokenable_type, tokenable_id);

--
-- Создать таблицу `permissions`
--
CREATE TABLE permissions (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(255) NOT NULL,
  `group` int(10) UNSIGNED NOT NULL DEFAULT 1,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать индекс `name` для объекта типа таблица `permissions`
--
ALTER TABLE permissions
ADD UNIQUE INDEX name (name);

--
-- Создать таблицу `password_reset_tokens`
--
CREATE TABLE password_reset_tokens (
  email varchar(255) NOT NULL,
  token varchar(255) NOT NULL,
  created_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (email)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать таблицу `newtable`
--
CREATE TABLE newtable (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(50) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать таблицу `migrations`
--
CREATE TABLE migrations (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  migration varchar(255) NOT NULL,
  batch int(11) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 21,
AVG_ROW_LENGTH = 910,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать таблицу `failed_jobs`
--
CREATE TABLE failed_jobs (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  uuid varchar(255) NOT NULL,
  `connection` text NOT NULL,
  queue text NOT NULL,
  payload longtext NOT NULL,
  exception longtext NOT NULL,
  failed_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать индекс `failed_jobs_uuid_unique` для объекта типа таблица `failed_jobs`
--
ALTER TABLE failed_jobs
ADD UNIQUE INDEX failed_jobs_uuid_unique (uuid);

--
-- Создать таблицу `discounts`
--
CREATE TABLE discounts (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(255) NOT NULL,
  percent decimal(10, 2) NOT NULL DEFAULT 0.00,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать таблицу `addresses`
--
CREATE TABLE addresses (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  user_id bigint(20) UNSIGNED NOT NULL,
  address text DEFAULT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 21,
AVG_ROW_LENGTH = 1638,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать индекс `addresses_user_id_foreign` для объекта типа таблица `addresses`
--
ALTER TABLE addresses
ADD INDEX addresses_user_id_foreign (user_id);

DELIMITER $$

--
-- Создать процедуру `procedure2`
--
CREATE DEFINER = 'root'@'localhost'
PROCEDURE procedure2 ()
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
END
$$

DELIMITER ;

-- 
-- Вывод данных для таблицы roles
--
INSERT INTO roles VALUES
(1, 'Admin', 1, '2023-11-13 00:00:00', '2023-11-13 00:00:00'),
(2, 'User', 2, '2023-11-13 00:00:00', '2023-11-13 00:00:00');

-- 
-- Вывод данных для таблицы job_titles
--
INSERT INTO job_titles VALUES
(1, 'Banya', NULL, NULL, 1.00, 154.00, NULL, NULL, NULL),
(2, 'Sauna', NULL, NULL, 1.00, 62.00, NULL, NULL, NULL),
(3, 'Basseyn', NULL, NULL, 1.00, 56.00, NULL, NULL, NULL),
(10, 'Fatima Koch', NULL, NULL, 2.00, 575.00, 'Deleniti suscipit ne', '2023-11-18 21:58:44', '2023-11-18 22:10:54'),
(11, 'Lydia Zimmerman', NULL, NULL, 1.00, 162.00, 'Quia consectetur aut', '2023-11-18 21:58:49', '2023-11-18 22:10:05'),
(12, 'Sauna Basseyn', NULL, NULL, 1.00, 100.00, NULL, '2024-01-11 21:59:01', '2024-01-11 21:59:01'),
(13, 'Danielle Oconnor', NULL, NULL, 2.00, 405.00, 'Totam asperiores min', '2024-01-11 21:59:19', '2024-01-12 18:53:04'),
(14, 'авыаы', NULL, NULL, 2.00, 43.00, '', '2024-01-12 18:52:05', '2024-01-12 18:52:05');

-- 
-- Вывод данных для таблицы departments
--
INSERT INTO departments VALUES
(1, 'Obshiy', NULL, NULL, NULL),
(2, 'Sauna ', NULL, NULL, NULL),
(3, 'Vip Sauna', NULL, NULL, NULL),
(4, 'Basseyn', NULL, NULL, NULL);

-- 
-- Вывод данных для таблицы employes
--
INSERT INTO employes VALUES
(3, 'John', NULL, 'John', 'Velda', '123456', 16, 1, 1, 1, NULL, NULL),
(4, 'Hebar Fay', NULL, 'Hebar', 'Fey', '123456', 38, 1, 1, 1, NULL, NULL),
(6, 'Marylyne Crooks', NULL, 'Marylyne', 'Crooks', '12345', 18, 1, 1, 1, NULL, NULL);

-- 
-- Вывод данных для таблицы clients
--
INSERT INTO clients VALUES
(2, 'Emilio', 'Harvey', 'dach.vidal@donnelly.com', '128 Ritchie Hill Apt. 738\nSanfordfurt, NM 22382-8341', '+1-539-226-0369', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(3, 'Beverli', 'Hills', 'lswaniawski@yahoo.com', '40935 Boyer Ports\nNorth Gabe, LA 03623-0614', '(248) 344-3127', '2023-11-16 06:44:06', '2023-11-18 19:45:20'),
(7, 'Kaylee', 'DuBuque', 'joana.rohan@hotmail.com', '867 Kuphal Light\nBradtkeview, NH 76803-1696', '1-936-609-4746', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(8, 'Sonia', 'O''Kon', 'natasha.thiel@yahoo.com', '15886 Louie Turnpike\nPort Christianbury, ND 72058-5537', '+1 (352) 909-4336', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(9, 'Michelle', 'Cummings', 'frogahn@yahoo.com', '70220 Grady Cliff\nWest Mabel, CT 76488', '+1 (475) 985-6072', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(11, 'Jana', 'Casper', 'amir37@sawayn.org', '223 Natalia Port Suite 188\nPort Bell, AZ 44174', '351.842.5090', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(13, 'Lurline', 'Schowalter', 'gretchen.steuber@gmail.com', '552 Schinner Route Suite 962\nPort Wilfredo, DE 22762', '669-487-0242', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(14, 'Desiree', 'Hagenes', 'elaina47@yahoo.com', '273 Ivory Centers Suite 772\nLebsackhaven, NH 62105', '765.357.2658', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(15, 'Horace', 'Witting', 'jesse08@wolf.com', '440 Rodrick Plaza Apt. 895\nLeonoraton, AZ 81410', '+12014161320', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(16, 'Barney', 'Veum', 'manuel75@gmail.com', '780 Anabel Park Suite 631\nReesemouth, OR 93308-8954', '+1.979.413.4197', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(17, 'Ted', 'Johnston', 'marvin.schmitt@hotmail.com', '241 Dayana Canyon\nShieldsfurt, TX 73428-5346', '+1.425.389.4906', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(18, 'Briana', 'Bartoletti', 'stoltenberg.camille@hotmail.com', '7382 Welch Hollow Apt. 450\nJohnsmouth, OR 89727-3225', '+13147441284', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(19, 'Jairo', 'Lebsack', 'ramon03@gmail.com', '3083 Raynor Park Apt. 515\nSouth Isaias, SD 03125', '1-630-908-4787', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(20, 'Marley', 'Spinka', 'block.hector@yahoo.com', '5133 Brown Ramp\nSouth Delbertside, KS 95872', '937-325-6331', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(22, 'Lorenz', 'Smith', 'roy.rempel@lockman.com', '16825 Bednar Valley\nEast Kassandra, KS 29245-1943', '774.762.4182', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(24, 'Alda', 'Veum', 'haylie67@satterfield.org', '97562 Considine Expressway Suite 136\nOkunevaview, GA 41197', '+19473198563', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(25, 'Mossie', 'Rogahn', 'baron.douglas@hermiston.com', '63060 Blick Center\nNienowfurt, AR 16188-1086', '573.542.4374', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(26, 'Leonel', 'Funk', 'ludwig.okeefe@gmail.com', '316 Sid Lake\nFadelfort, MI 59673', '361-209-9878', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(27, 'Dariana', 'Wintheiser', 'hosinski@boehm.com', '5149 Ayana Island\nFeiltown, WI 68041-3357', '629-207-8356', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(28, 'Raymond', 'Olson', 'champlin.oren@yahoo.com', '273 Satterfield Path\nFayview, AK 33856-1851', '+1-234-320-7467', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(29, 'Aliya', 'Ferry', 'prohaska.rowland@maggio.org', '58393 Tad Causeway\nWindlerton, KS 73845-4619', '386-898-2689', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(30, 'Cyrus', 'Beer', 'doyle77@cronin.com', '389 Hessel Forest\nWeldonberg, GA 49188-3106', '1-218-499-4252', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(31, 'Ed', 'Daniel', 'jacobi.andrew@yahoo.com', '37796 Hilpert Ramp Apt. 264\nAxelfort, DE 64229-6404', '(309) 615-7694', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(32, 'Rosanna', 'Mills', 'ajohns@moen.org', '385 Buckridge Vista Suite 216\nHaneborough, ME 57416-1173', '903.618.6675', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(33, 'Margaret', 'Welch', 'reilly.jackeline@yahoo.com', '51478 Vince Cove Suite 266\nWest Vito, KS 52621-7933', '1-540-776-2679', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(34, 'Denis', 'Durgan', 'ajenkins@okuneva.com', '6553 Nolan Stravenue\nWaelchiberg, MN 76115-2959', '+1.480.263.4019', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(35, 'Liam', 'Nikolaus', 'flarkin@yahoo.com', '59487 Lia Forest\nEmmettport, NM 57501', '816.562.2657', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(36, 'Adele', 'Kassulke', 'ogottlieb@tremblay.com', '7804 Wuckert Dale Apt. 316\nIsobelhaven, TX 30215-5412', '+1-361-822-6123', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(37, 'Gennaro', 'Wehner', 'xcummings@gmail.com', '7476 Terrence Underpass Apt. 468\nBudfort, OR 23513', '920.767.4706', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(38, 'Wendy', 'Kub', 'kayleigh.haag@marks.com', '1308 Marvin Hill\nLake Estellefort, WV 97802-2281', '(951) 505-1645', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(39, 'Kaelyn', 'Turcotte', 'greichert@gmail.com', '739 Jerde Lake Suite 972\nJamesonview, TN 75870', '(305) 568-0210', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(40, 'Pierre', 'Ruecker', 'madelyn29@hotmail.com', '1852 Vida Keys\nDibberthaven, UT 00141-5002', '1-785-794-5437', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(41, 'Estelle', 'Boyer', 'bradford.mitchell@gerhold.com', '9319 Dach Union\nGoyetteside, MT 58915', '(601) 583-7644', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(42, 'Ola', 'West', 'lkuhn@gmail.com', '890 Braun Trafficway Suite 072\nThompsonhaven, DE 90864-1381', '989.926.7517', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(43, 'Lysanne', 'Bernier', 'gladys47@rolfson.com', '2722 Dennis Ranch Suite 466\nWest Nataliemouth, TN 69487', '1-443-739-2216', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(44, 'Alexys', 'Frami', 'anderson.orin@hotmail.com', '458 Vandervort Circles Suite 426\nBertramborough, AR 32835', '440.578.7314', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(45, 'Katharina', 'Hamill', 'ghickle@rath.com', '534 Willms Corner Suite 051\nDooleyburgh, WY 58522-9067', '+1-802-914-0040', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(46, 'Kathryn', 'Kutch', 'easter.rodriguez@yahoo.com', '46276 Carmen Track\nWest Kailey, MN 09328', '+1.678.816.4611', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(47, 'Caleigh', 'Grady', 'zjohns@hammes.net', '391 Austyn Knolls Suite 143\nNorth Ellie, NJ 90965-4920', '754.576.8483', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(48, 'Raphael', 'Quigley', 'sharon.murray@hagenes.com', '1873 Stan Vista\nLake Eladio, AK 18236-5863', '320-390-5082', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(49, 'Geovanni', 'Dickinson', 'daniela67@yahoo.com', '633 Bridget View\nValentinland, NC 30452-9219', '+1-458-567-6771', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(50, 'Sidney', 'Sawayn', 'gbergstrom@mcclure.org', '14036 Hahn Burg Apt. 107\nLake Domingo, KY 42867-7946', '339.758.2779', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(51, 'Francisca', 'Balistreri', 'johnson.feil@powlowski.com', '820 Stark Pike Apt. 467\nSouth Joetown, OK 54527-7255', '620.269.9118', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(52, 'Levi', 'Grady', 'borer.verda@yahoo.com', '772 Zelda Plains\nEphraimhaven, VT 30696-8503', '+18313718173', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(53, 'Jany', 'Maggio', 'kayli.lubowitz@nikolaus.net', '3424 Waino Park\nTiaraport, NH 22458-6410', '480.470.5819', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(54, 'Roel', 'Denesik', 'flatley.amanda@roob.com', '43232 Nolan Burg Apt. 379\nPort Eldon, AZ 56477-5562', '339.255.1484', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(55, 'Judy', 'Wiegand', 'cmante@yahoo.com', '20926 Lela Roads\nLake Fred, AR 65637', '+1 (469) 798-9523', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(56, 'Moses', 'Hermiston', 'yschmidt@yahoo.com', '20745 Beer Locks Suite 507\nBoehmbury, GA 75245-6465', '+1-915-598-9009', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(57, 'Fleta', 'Smith', 'zieme.bridgette@hotmail.com', '9066 Jeanie Oval Suite 584\nLake Elzastad, IA 88247-4561', '(820) 829-3720', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(58, 'Odie', 'Gulgowski', 'mante.catalina@casper.com', '1932 Deckow Plains\nMarquardtmouth, HI 47594-3136', '+1.229.952.7732', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(59, 'Jade', 'Sauer', 'rheller@yahoo.com', '4118 Donna Land\nMosesberg, DC 42872', '+1-779-604-2318', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(60, 'Amos', 'Bernier', 'lottie.langworth@hotmail.com', '9970 Friesen Fords\nWest Reaganville, UT 96578', '+1 (860) 282-2635', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(61, 'Marguerite', 'Champlin', 'vreichel@gmail.com', '734 Jordy Mountains Apt. 109\nVandervortside, HI 24621', '+17547817799', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(62, 'Chauncey', 'Corwin', 'pbrown@yahoo.com', '5521 Gottlieb Circles\nSouth Vaughn, DE 02042', '386.445.3591', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(63, 'Santa', 'Swift', 'grimes.darius@corkery.com', '9802 Lesly Key Suite 198\nLake Ethanshire, TN 78357', '1-669-701-8199', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(64, 'Idella', 'Botsford', 'sydnie36@gmail.com', '930 Bogisich Summit Apt. 854\nDevenbury, CA 65593-3427', '+1-539-799-0315', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(65, 'Dorothy', 'Stracke', 'krystal36@yahoo.com', '156 Ewell Pike\nNew Cecil, IL 43602-1141', '+13218125919', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(66, 'Erich', 'Bogisich', 'harmony.gleichner@olson.com', '946 Kyla River\nThielhaven, MA 40140', '208.509.2093', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(67, 'Jarod', 'Keeling', 'larkin.okey@hotmail.com', '5765 Joana Hills Apt. 835\nNew Arashire, NH 77421', '1-440-209-3948', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(68, 'Lucy', 'Steuber', 'jtorphy@hotmail.com', '31956 Stracke Cape Apt. 231\nSouth Caterina, AR 76170-6380', '+1.480.356.8839', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(69, 'Elijah', 'Stanton', 'vandervort.leonard@yahoo.com', '83213 Graham Mall Suite 536\nMarisaview, CT 40763-1816', '1-770-650-4121', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(70, 'Avery', 'Batz', 'kmante@pagac.com', '6218 Hills Springs Apt. 287\nRempelmouth, WV 11094', '347.243.7287', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(71, 'Marlene', 'Hammes', 'aweissnat@hotmail.com', '717 Shaun Wells Suite 407\nBaumbachton, HI 44693-7660', '630-828-6255', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(72, 'Paula', 'Bergstrom', 'gkuphal@gmail.com', '9923 Rau Court\nKodyhaven, DE 38734-9832', '+1-740-786-2859', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(73, 'Isabelle', 'Lockman', 'albert92@dare.org', '20982 Trevion Club\nHuelsmouth, KS 10271-5685', '231-693-0301', '2023-11-16 06:44:06', '2023-11-16 06:44:06'),
(85, 'Linda Schroeder', 'Rina', 'regumu@mailinator.com', 'Vel non ut expedita ', '+1 (408) 876-5159', '2023-12-24 12:56:15', '2023-12-24 12:56:15'),
(86, 'Robin Silva', 'Samson', 'tiluv@mailinator.com', 'Suscipit qui quam ex', '+1 (903) 632-1939', '2023-12-24 13:02:00', '2023-12-24 13:02:00'),
(87, 'Kalia Dunn', 'Darrel', 'xokadyhi@mailinator.com', 'Sed est inventore mo', '+1 (328) 514-6716', '2024-01-05 17:31:07', '2024-01-05 17:31:07'),
(88, 'Kalia Dunn', 'Darrel', NULL, NULL, NULL, '2024-01-11 16:41:00', '2024-01-11 16:41:00'),
(89, 'Ria Haley', 'Darrel', NULL, NULL, NULL, '2024-01-11 16:41:34', '2024-01-11 16:41:34'),
(90, 'Robin Silva', 'Samson', NULL, NULL, '19036321939', '2024-01-11 16:42:42', '2024-01-11 16:42:42'),
(91, 'Borielle', 'Schneider', NULL, NULL, '15187026755', '2024-01-11 16:44:32', '2024-01-11 16:44:32'),
(92, 'Barclay', 'Ingram', NULL, NULL, '1545785546', '2024-01-11 16:45:27', '2024-01-11 16:45:27'),
(93, 'Emmanuel', 'Vega', NULL, NULL, '9034598712', '2024-01-11 16:46:47', '2024-01-11 16:46:47'),
(122, 'Eleanor', 'Darrel', NULL, '', '12121212121212', '2024-01-12 15:49:44', '2024-01-12 15:49:44'),
(123, 'ytr', NULL, NULL, '', '432423', '2024-01-12 21:00:58', '2024-01-12 21:00:58'),
(124, 'jhg', 'hgfh', NULL, 'hgfhf', '4324', '2024-01-12 21:11:30', '2024-01-12 21:11:30'),
(125, 'fds', 'fds', NULL, '', '213', '2024-01-12 21:12:18', '2024-01-12 21:12:18');

-- 
-- Вывод данных для таблицы orders
--
INSERT INTO orders VALUES
(1, '1', '2024-01-07', 3, 3, 1, NULL, NULL, 0.00, NULL, NULL, NULL),
(2, '2', '2024-02-03', 3, 2, 1, NULL, NULL, 0.00, NULL, '2024-02-03 18:52:58', '2024-02-03 18:52:58');

-- 
-- Вывод данных для таблицы user_roles
--
-- Таблица banya.user_roles не содержит данных

-- 
-- Вывод данных для таблицы users
--
INSERT INTO users VALUES
(12, 'Ms. Sylvia Stiedemann DDS', 'Yasmeen', 'Conroy', 'pbayer@example.org', '2023-11-13 12:21:32', '$2y$12$eawtB0SrWuaxQcL163zMh.iWvzXSqNKgHlyjwhddt2ZALWJUG4UlK', 'nkTnYIeCRq', '2023-11-13 12:21:32', '2023-11-13 12:21:32'),
(13, 'Fredrick Breitenberg', 'Murray', 'Feest', 'ratke.russell@example.com', '2023-11-13 12:21:32', '$2y$12$eawtB0SrWuaxQcL163zMh.iWvzXSqNKgHlyjwhddt2ZALWJUG4UlK', 'A4Pa8YwGMB', '2023-11-13 12:21:32', '2023-11-13 12:21:32'),
(14, 'Dr. Garnet Friesen', 'Alessia', 'Corwin', 'pcarter@example.net', '2023-11-13 12:21:32', '$2y$12$eawtB0SrWuaxQcL163zMh.iWvzXSqNKgHlyjwhddt2ZALWJUG4UlK', 'dsVlwFUChg', '2023-11-13 12:21:32', '2023-11-13 12:21:32'),
(15, 'Kurt Dooley', 'Gonzalo', 'Lehner', 'lang.clinton@example.com', '2023-11-13 12:21:32', '$2y$12$eawtB0SrWuaxQcL163zMh.iWvzXSqNKgHlyjwhddt2ZALWJUG4UlK', '4rIgApm7sL', '2023-11-13 12:21:32', '2023-11-13 12:21:32'),
(16, 'Alexys Cronin', 'Rossie', 'Nienow', 'carmel09@example.com', '2023-11-13 12:21:32', '$2y$12$eawtB0SrWuaxQcL163zMh.iWvzXSqNKgHlyjwhddt2ZALWJUG4UlK', 'yrgIPKRMUf', '2023-11-13 12:21:32', '2023-11-13 12:21:32'),
(17, 'Delphine West', 'Cristobal', 'Kohler', 'nella38@example.net', '2023-11-13 12:21:32', '$2y$12$eawtB0SrWuaxQcL163zMh.iWvzXSqNKgHlyjwhddt2ZALWJUG4UlK', 'NuHgWQ2o5Z', '2023-11-13 12:21:32', '2023-11-13 12:21:32'),
(18, 'Claire Kirlin', 'Jacinto', 'Langosh', 'ygulgowski@example.org', '2023-11-13 12:21:32', '$2y$12$eawtB0SrWuaxQcL163zMh.iWvzXSqNKgHlyjwhddt2ZALWJUG4UlK', 'wj2qgj5tnO', '2023-11-13 12:21:32', '2023-11-13 12:21:32'),
(19, 'Jett Gerhold', 'Celestine', 'Bruen', 'rlockman@example.net', '2023-11-13 12:21:32', '$2y$12$eawtB0SrWuaxQcL163zMh.iWvzXSqNKgHlyjwhddt2ZALWJUG4UlK', '9uCi2ERjMb', '2023-11-13 12:21:32', '2023-11-13 12:21:32'),
(20, 'Grady Sporer', 'Kasandra', 'O''Conner', 'obergstrom@example.net', '2023-11-13 12:21:32', '$2y$12$eawtB0SrWuaxQcL163zMh.iWvzXSqNKgHlyjwhddt2ZALWJUG4UlK', '7zUHuYeOB5', '2023-11-13 12:21:32', '2023-11-13 12:21:32'),
(21, 'Herman Miller Sr.', 'Kane', 'Johns', 'boehm.cristobal@example.org', '2023-11-13 12:21:32', '$2y$12$eawtB0SrWuaxQcL163zMh.iWvzXSqNKgHlyjwhddt2ZALWJUG4UlK', 'TrSJgS5snd', '2023-11-13 12:21:32', '2023-11-13 12:21:32'),
(22, 'Dovie Maggio', 'Clifton', 'Kub', 'kayleigh49@example.com', '2023-11-13 12:21:52', '$2y$12$31JVDlUY4MQgGGP.8wr9ROyziixDGfRLvCw7MpTKNEfIbsqNr3Sg2', 'M4e4hzspgb', '2023-11-13 12:21:53', '2023-11-13 12:21:53'),
(23, 'Ms. Nedra Witting', 'Bennett', 'Bednar', 'luisa.crist@example.net', '2023-11-13 12:21:53', '$2y$12$31JVDlUY4MQgGGP.8wr9ROyziixDGfRLvCw7MpTKNEfIbsqNr3Sg2', 'V2nf10lwMh', '2023-11-13 12:21:53', '2023-11-13 12:21:53'),
(24, 'Marion Gutmann', 'Oceane', 'Wilderman', 'iokuneva@example.org', '2023-11-13 12:21:53', '$2y$12$31JVDlUY4MQgGGP.8wr9ROyziixDGfRLvCw7MpTKNEfIbsqNr3Sg2', 'gni55GGViS', '2023-11-13 12:21:53', '2023-11-13 12:21:53'),
(25, 'Ernest Harber', 'Sydni', 'Howell', 'vpaucek@example.org', '2023-11-13 12:21:53', '$2y$12$31JVDlUY4MQgGGP.8wr9ROyziixDGfRLvCw7MpTKNEfIbsqNr3Sg2', 'aqZAyv2XfJ', '2023-11-13 12:21:53', '2023-11-13 12:21:53'),
(26, 'Walker Windler', 'Ahmed', 'Runolfsdottir', 'oreichel@example.net', '2023-11-13 12:21:53', '$2y$12$31JVDlUY4MQgGGP.8wr9ROyziixDGfRLvCw7MpTKNEfIbsqNr3Sg2', 'FBhz51irNb', '2023-11-13 12:21:53', '2023-11-13 12:21:53'),
(27, 'Elissa Gibson', 'Glenna', 'Witting', 'curt57@example.com', '2023-11-13 12:21:53', '$2y$12$31JVDlUY4MQgGGP.8wr9ROyziixDGfRLvCw7MpTKNEfIbsqNr3Sg2', 'gMu2UxgEqT', '2023-11-13 12:21:53', '2023-11-13 12:21:53'),
(28, 'Elsa Hammes DDS', 'Cassie', 'Boyer', 'jon12@example.org', '2023-11-13 12:21:53', '$2y$12$31JVDlUY4MQgGGP.8wr9ROyziixDGfRLvCw7MpTKNEfIbsqNr3Sg2', '2C71gQTWVk', '2023-11-13 12:21:53', '2023-11-13 12:21:53'),
(29, 'Mrs. Annetta Cartwright IV', 'Belle', 'Cruickshank', 'jacquelyn23@example.com', '2023-11-13 12:21:53', '$2y$12$31JVDlUY4MQgGGP.8wr9ROyziixDGfRLvCw7MpTKNEfIbsqNr3Sg2', 'ReltmXwAYu', '2023-11-13 12:21:53', '2023-11-13 12:21:53'),
(34, 'Ashlee Bednar', 'Sigrid', 'Spencer', 'boyer.gladyce@example.org', '2023-11-13 12:26:21', '$2y$12$k7pXwdtorPrRDN37AFMUHujlZigLLWommqWeVJtNby9LKoIHckl4C', 's4ObZ3TZiC', '2023-11-13 12:26:21', '2023-11-13 12:26:21'),
(36, 'Thad Kerluke', 'Elian', 'Champlin', 'harvey.alayna@example.com', '2023-11-13 12:26:21', '$2y$12$k7pXwdtorPrRDN37AFMUHujlZigLLWommqWeVJtNby9LKoIHckl4C', '2PsHSGSoqn', '2023-11-13 12:26:21', '2023-11-13 12:26:21'),
(37, 'Vilma Witting', 'Tania', 'Brown', 'ada31@example.org', '2023-11-13 15:12:03', '$2y$12$vkBXs2yp1RMgBEYJ0OmoyevFTaA/Hx5oUHVpCCBhF//Q.EGPc2aIW', '14RvWn6v1y', '2023-11-13 15:12:04', '2023-11-13 15:12:04'),
(38, 'Ashlynn Marquardt', 'Josefa', 'Thompson', 'dawson08@example.net', '2023-11-13 15:12:04', '$2y$12$vkBXs2yp1RMgBEYJ0OmoyevFTaA/Hx5oUHVpCCBhF//Q.EGPc2aIW', '1YT8wzrw7z', '2023-11-13 15:12:04', '2023-11-13 15:12:04'),
(39, 'Jeff Kuphal', 'Maryjane', 'Gerhold', 'okulas@example.org', '2023-11-13 15:12:04', '$2y$12$vkBXs2yp1RMgBEYJ0OmoyevFTaA/Hx5oUHVpCCBhF//Q.EGPc2aIW', 'IU1S0Y0Gfs', '2023-11-13 15:12:04', '2023-11-13 15:12:04'),
(41, 'Keagan Abbott', 'Joana', 'Ondricka', 'nakia24@example.net', '2023-11-13 15:12:04', '$2y$12$vkBXs2yp1RMgBEYJ0OmoyevFTaA/Hx5oUHVpCCBhF//Q.EGPc2aIW', 'XgXAOKVa5U', '2023-11-13 15:12:04', '2023-11-13 15:12:04'),
(42, 'Marilyne Crooks', 'Clotilde', 'Wolf', 'alana98@example.org', '2023-11-13 15:12:04', '$2y$12$vkBXs2yp1RMgBEYJ0OmoyevFTaA/Hx5oUHVpCCBhF//Q.EGPc2aIW', 'NiqXjYx8gq', '2023-11-13 15:12:04', '2023-11-13 15:12:04'),
(43, 'Dixie Hessel', 'Jailyn', 'Maggio', 'yvette25@example.com', '2023-11-13 15:12:04', '$2y$12$vkBXs2yp1RMgBEYJ0OmoyevFTaA/Hx5oUHVpCCBhF//Q.EGPc2aIW', 'Igu4u9H4Ll', '2023-11-13 15:12:04', '2023-11-13 15:12:04'),
(44, 'Prof. Jayden Gerhold', 'Torey', 'Prohaska', 'schuppe.susanna@example.net', '2023-11-13 15:12:04', '$2y$12$vkBXs2yp1RMgBEYJ0OmoyevFTaA/Hx5oUHVpCCBhF//Q.EGPc2aIW', 'rkKJYJjIV3', '2023-11-13 15:12:04', '2023-11-13 15:12:04'),
(45, 'Charlie Miller', 'Velda', 'Davis', 'kristoffer.dicki@example.net', '2023-11-13 15:12:04', '$2y$12$vkBXs2yp1RMgBEYJ0OmoyevFTaA/Hx5oUHVpCCBhF//Q.EGPc2aIW', 'KT1CVeDHdB', '2023-11-13 15:12:04', '2023-11-13 15:12:04'),
(46, 'Dr. Deondre Koch III', 'Nelda', 'Bauch', 'clarissa.kirlin@example.com', '2023-11-13 15:12:04', '$2y$12$vkBXs2yp1RMgBEYJ0OmoyevFTaA/Hx5oUHVpCCBhF//Q.EGPc2aIW', 'z3toCPUsh5', '2023-11-13 15:12:04', '2023-11-13 15:12:04'),
(47, 'Heber Fay', 'Tyrese', 'Langworth', 'jacobson.pearline@example.org', '2023-11-13 15:12:04', '$2y$12$vkBXs2yp1RMgBEYJ0OmoyevFTaA/Hx5oUHVpCCBhF//Q.EGPc2aIW', 'Jr0o3Iuc9M', '2023-11-13 15:12:04', '2023-11-13 15:12:04'),
(48, 'Adella Herman', 'Mortimer', 'Roob', 'mmckenzie@example.org', '2023-11-13 15:12:04', '$2y$12$vkBXs2yp1RMgBEYJ0OmoyevFTaA/Hx5oUHVpCCBhF//Q.EGPc2aIW', 'TPFOy5uA1e', '2023-11-13 15:12:04', '2023-11-13 15:12:04'),
(49, 'Prof. Isaac Lemke MD', 'Tatyana', 'McDermott', 'krista.bosco@example.org', '2023-11-13 15:12:04', '$2y$12$vkBXs2yp1RMgBEYJ0OmoyevFTaA/Hx5oUHVpCCBhF//Q.EGPc2aIW', 'OmsWc8eWb5', '2023-11-13 15:12:04', '2023-11-13 15:12:04'),
(50, 'Santa Langosh', 'Francisco', 'Gulgowski', 'darian05@example.org', '2023-11-16 06:23:32', '$2y$12$muSrlqY1Xk/Smoi3c.3YtuSxK.ZOZ071BRQWmBRbgly4u2J71.Bli', 'tyVuUky3Ve', '2023-11-16 06:23:32', '2023-11-16 06:23:32'),
(51, 'Miss Florida Kohler', 'Tomasa', 'Crona', 'stehr.ethan@example.net', '2023-11-16 06:23:32', '$2y$12$muSrlqY1Xk/Smoi3c.3YtuSxK.ZOZ071BRQWmBRbgly4u2J71.Bli', 'U2lkBI9q9R', '2023-11-16 06:23:32', '2023-11-16 06:23:32'),
(52, 'Roslyn Aufderhar', 'Dakota', 'Reinger', 'trisha81@example.com', '2023-11-16 06:23:32', '$2y$12$muSrlqY1Xk/Smoi3c.3YtuSxK.ZOZ071BRQWmBRbgly4u2J71.Bli', 'HjQzM0xnsl', '2023-11-16 06:23:32', '2023-11-16 06:23:32'),
(53, 'Conner Little', 'Jeramie', 'Larkin', 'yundt.bertram@example.org', '2023-11-16 06:23:32', '$2y$12$muSrlqY1Xk/Smoi3c.3YtuSxK.ZOZ071BRQWmBRbgly4u2J71.Bli', 'kqPIakA0NF', '2023-11-16 06:23:32', '2023-11-16 06:23:32'),
(54, 'Mr. Justice Rogahn', 'Coleman', 'Dickinson', 'ewald51@example.net', '2023-11-16 06:23:32', '$2y$12$muSrlqY1Xk/Smoi3c.3YtuSxK.ZOZ071BRQWmBRbgly4u2J71.Bli', 'sxQsBINuWY', '2023-11-16 06:23:32', '2023-11-16 06:23:32'),
(55, 'Wilhelmine Corkery', 'Zane', 'Koch', 'willa.pfannerstill@example.com', '2023-11-16 06:23:32', '$2y$12$muSrlqY1Xk/Smoi3c.3YtuSxK.ZOZ071BRQWmBRbgly4u2J71.Bli', 'uZWb56y9NI', '2023-11-16 06:23:32', '2023-11-16 06:23:32'),
(56, 'Osvaldo Cummerata', 'Adelia', 'O''Kon', 'zella65@example.com', '2023-11-16 06:23:32', '$2y$12$muSrlqY1Xk/Smoi3c.3YtuSxK.ZOZ071BRQWmBRbgly4u2J71.Bli', 'rcUaHIWfPs', '2023-11-16 06:23:32', '2023-11-16 06:23:32'),
(57, 'Mr. Tristian Halvorson DVM', 'Greg', 'Upton', 'rico.abbott@example.com', '2023-11-16 06:23:32', '$2y$12$muSrlqY1Xk/Smoi3c.3YtuSxK.ZOZ071BRQWmBRbgly4u2J71.Bli', '41JJP2OLew', '2023-11-16 06:23:32', '2023-11-16 06:23:32'),
(58, 'Wilhelm Lang', 'Mariane', 'Toy', 'effertz.gregg@example.net', '2023-11-16 06:23:32', '$2y$12$muSrlqY1Xk/Smoi3c.3YtuSxK.ZOZ071BRQWmBRbgly4u2J71.Bli', 'D5jq3h8edJ', '2023-11-16 06:23:32', '2023-11-16 06:23:32'),
(59, 'Lula Yundt', 'Lemuel', 'Ratke', 'jlehner@example.com', '2023-11-16 06:23:32', '$2y$12$muSrlqY1Xk/Smoi3c.3YtuSxK.ZOZ071BRQWmBRbgly4u2J71.Bli', 'f84zq03b1G', '2023-11-16 06:23:32', '2023-11-16 06:23:32'),
(60, 'Dr. Heidi Wintheiser', 'Brain', 'Reilly', 'sbergstrom@example.com', '2023-11-16 06:23:32', '$2y$12$muSrlqY1Xk/Smoi3c.3YtuSxK.ZOZ071BRQWmBRbgly4u2J71.Bli', 'xfG3AQEkR9', '2023-11-16 06:23:32', '2023-11-16 06:23:32'),
(61, 'Mr. Gerhard Shields I', 'Itzel', 'Skiles', 'alessandro.beahan@example.com', '2023-11-16 06:23:32', '$2y$12$muSrlqY1Xk/Smoi3c.3YtuSxK.ZOZ071BRQWmBRbgly4u2J71.Bli', 'ZTmtDAelOo', '2023-11-16 06:23:32', '2023-11-16 06:23:32'),
(62, 'Norma Collier', 'Albert', 'Wiza', 'joana.eichmann@example.com', '2023-11-16 06:23:32', '$2y$12$muSrlqY1Xk/Smoi3c.3YtuSxK.ZOZ071BRQWmBRbgly4u2J71.Bli', 'F227j13zGL', '2023-11-16 06:23:32', '2023-11-16 06:23:32'),
(63, 'Leopold Goyette', 'Sabrina', 'Dach', 'ernesto.hyatt@example.net', '2023-11-16 06:24:16', '$2y$12$uTOb6NDYwg95PdsfClqug.UndjesOr5yf0IWurAW0.vEi5czYAdim', 'lso1VTOubj', '2023-11-16 06:24:17', '2023-11-16 06:24:17'),
(64, 'Prof. Buford Hyatt I', 'Camilla', 'Miller', 'imelda.raynor@example.org', '2023-11-16 06:24:17', '$2y$12$uTOb6NDYwg95PdsfClqug.UndjesOr5yf0IWurAW0.vEi5czYAdim', 'bq1PIHYO4B', '2023-11-16 06:24:17', '2023-11-16 06:24:17'),
(65, 'Nona Reynolds Sr.', 'Raven', 'Mante', 'jaden26@example.com', '2023-11-16 06:24:17', '$2y$12$uTOb6NDYwg95PdsfClqug.UndjesOr5yf0IWurAW0.vEi5czYAdim', 'oLafzlHYGo', '2023-11-16 06:24:17', '2023-11-16 06:24:17'),
(66, 'Prof. Braeden Larkin MD', 'Loyal', 'Gislason', 'quinton.crona@example.net', '2023-11-16 06:24:17', '$2y$12$uTOb6NDYwg95PdsfClqug.UndjesOr5yf0IWurAW0.vEi5czYAdim', 'sYwTeScIzZ', '2023-11-16 06:24:17', '2023-11-16 06:24:17'),
(67, 'Eliza Monahan', 'Stefanie', 'Schuster', 'magnus98@example.org', '2023-11-16 06:24:17', '$2y$12$uTOb6NDYwg95PdsfClqug.UndjesOr5yf0IWurAW0.vEi5czYAdim', '6kPkiQKIZ1', '2023-11-16 06:24:17', '2023-11-16 06:24:17'),
(68, 'Amiya Brekke Sr.', 'Madelyn', 'Kris', 'josh.walter@example.com', '2023-11-16 06:24:17', '$2y$12$uTOb6NDYwg95PdsfClqug.UndjesOr5yf0IWurAW0.vEi5czYAdim', 'Sl7Dkzhock', '2023-11-16 06:24:17', '2023-11-16 06:24:17'),
(69, 'Ms. Patience Hansen Jr.', 'Eddie', 'Rath', 'sydnee42@example.org', '2023-11-16 06:24:17', '$2y$12$uTOb6NDYwg95PdsfClqug.UndjesOr5yf0IWurAW0.vEi5czYAdim', 'NDdN3KKX6o', '2023-11-16 06:24:17', '2023-11-16 06:24:17'),
(70, 'Rosamond Cronin III', 'Asha', 'Weber', 'mueller.haven@example.org', '2023-11-16 06:24:17', '$2y$12$uTOb6NDYwg95PdsfClqug.UndjesOr5yf0IWurAW0.vEi5czYAdim', 'xB8lCCmBcg', '2023-11-16 06:24:17', '2023-11-16 06:24:17'),
(71, 'Rory Hoeger', 'Frederik', 'Rogahn', 'effertz.rico@example.com', '2023-11-16 06:24:17', '$2y$12$uTOb6NDYwg95PdsfClqug.UndjesOr5yf0IWurAW0.vEi5czYAdim', 'zuR3yKcLuf', '2023-11-16 06:24:17', '2023-11-16 06:24:17'),
(72, 'Lukas Streich', 'Giovanny', 'Bode', 'velma16@example.net', '2023-11-16 06:24:17', '$2y$12$uTOb6NDYwg95PdsfClqug.UndjesOr5yf0IWurAW0.vEi5czYAdim', 'G8P8XRYUaP', '2023-11-16 06:24:17', '2023-11-16 06:24:17'),
(73, 'Katharina King', 'Alexzander', 'Crooks', 'ambrose96@example.net', '2023-11-16 06:24:17', '$2y$12$uTOb6NDYwg95PdsfClqug.UndjesOr5yf0IWurAW0.vEi5czYAdim', 'XOvHXGwLpQ', '2023-11-16 06:24:17', '2023-11-16 06:24:17'),
(74, 'Triston Quigley DVM', 'Mandy', 'Schultz', 'elias03@example.com', '2023-11-16 06:24:17', '$2y$12$uTOb6NDYwg95PdsfClqug.UndjesOr5yf0IWurAW0.vEi5czYAdim', 'i3rY3LY3mH', '2023-11-16 06:24:17', '2023-11-16 06:24:17'),
(75, 'Carmen Hahn', 'Norwood', 'Russel', 'paula.langworth@example.net', '2023-11-16 06:24:17', '$2y$12$uTOb6NDYwg95PdsfClqug.UndjesOr5yf0IWurAW0.vEi5czYAdim', 'yoGI6RtP2I', '2023-11-16 06:24:17', '2023-11-16 06:24:17'),
(76, 'Miss Ila Kohler MD', 'Tristin', 'Pollich', 'xzemlak@example.net', '2023-11-16 06:24:40', '$2y$12$kwX46oDucRXpRMFBGTocT.nirogXXkPgNR66Zq4oGwmr3p6a06t8m', 'A1b3cA3cL2', '2023-11-16 06:24:40', '2023-11-16 06:24:40'),
(78, 'Mr. Oliver Hodkiewicz', 'Alayna', 'Towne', 'schneider.sydni@example.org', '2023-11-16 06:24:40', '$2y$12$kwX46oDucRXpRMFBGTocT.nirogXXkPgNR66Zq4oGwmr3p6a06t8m', '1KdmS3ZBhv', '2023-11-16 06:24:40', '2023-11-16 06:24:40'),
(79, 'Prof. Keara Goldner I', 'Sadie', 'Kshlerin', 'schamberger.brady@example.net', '2023-11-16 06:24:40', '$2y$12$kwX46oDucRXpRMFBGTocT.nirogXXkPgNR66Zq4oGwmr3p6a06t8m', 'MJcANuqSqD', '2023-11-16 06:24:40', '2023-11-16 06:24:40'),
(80, 'Carmine Nienow', 'Astrid', 'Gulgowski', 'judge52@example.com', '2023-11-16 06:24:40', '$2y$12$kwX46oDucRXpRMFBGTocT.nirogXXkPgNR66Zq4oGwmr3p6a06t8m', 'NOe4Zf3HNO', '2023-11-16 06:24:40', '2023-11-16 06:24:40'),
(81, 'Camila Brekke', 'Ronaldo', 'Mann', 'qschmidt@example.org', '2023-11-16 06:24:40', '$2y$12$kwX46oDucRXpRMFBGTocT.nirogXXkPgNR66Zq4oGwmr3p6a06t8m', 'REnW0clKiq', '2023-11-16 06:24:40', '2023-11-16 06:24:40'),
(82, 'Otho Hartmann I', 'Robb', 'Kihn', 'konopelski.jaylan@example.com', '2023-11-16 06:24:40', '$2y$12$kwX46oDucRXpRMFBGTocT.nirogXXkPgNR66Zq4oGwmr3p6a06t8m', 't7fM2FuM9b', '2023-11-16 06:24:40', '2023-11-16 06:24:40'),
(83, 'Molly Bogisich', 'Elisa', 'Ortiz', 'shany59@example.org', '2023-11-16 06:24:40', '$2y$12$kwX46oDucRXpRMFBGTocT.nirogXXkPgNR66Zq4oGwmr3p6a06t8m', '8P76tiD5cY', '2023-11-16 06:24:40', '2023-11-16 06:24:40'),
(84, 'Sidney Heller', 'Demetris', 'Abshire', 'xjenkins@example.net', '2023-11-16 06:24:40', '$2y$12$kwX46oDucRXpRMFBGTocT.nirogXXkPgNR66Zq4oGwmr3p6a06t8m', 'GonpaigT4t', '2023-11-16 06:24:40', '2023-11-16 06:24:40'),
(85, 'Amara Boyle', 'Damaris', 'Williamson', 'efrain.kertzmann@example.net', '2023-11-16 06:24:40', '$2y$12$kwX46oDucRXpRMFBGTocT.nirogXXkPgNR66Zq4oGwmr3p6a06t8m', 's0cuNoER3x', '2023-11-16 06:24:40', '2023-11-16 06:24:40'),
(86, 'Miss Trinity Powlowski Sr.', 'Darwin', 'Wyman', 'ed69@example.com', '2023-11-16 06:24:40', '$2y$12$kwX46oDucRXpRMFBGTocT.nirogXXkPgNR66Zq4oGwmr3p6a06t8m', '9WPRSYwDh4', '2023-11-16 06:24:40', '2023-11-16 06:24:40'),
(87, 'Dr. Randy King V', 'Alice', 'Ferry', 'jaquelin77@example.com', '2023-11-16 06:24:40', '$2y$12$kwX46oDucRXpRMFBGTocT.nirogXXkPgNR66Zq4oGwmr3p6a06t8m', 'TpopNOrGtr', '2023-11-16 06:24:40', '2023-11-16 06:24:40'),
(88, 'Mariela Schroeder III', 'Iva', 'Schoen', 'leonardo69@example.net', '2023-11-16 06:24:40', '$2y$12$kwX46oDucRXpRMFBGTocT.nirogXXkPgNR66Zq4oGwmr3p6a06t8m', 'PxTziNooNg', '2023-11-16 06:24:40', '2023-11-16 06:24:40'),
(89, 'Prof. Liana McKenzie', 'Doug', 'Crooks', 'block.diana@example.net', '2023-11-16 06:25:06', '$2y$12$fTx3X17expNMlzRDJYKr9uOjdBANumVeEfTrUSYDyCXp.gFxj.2tO', 'EIcSKyEYN0', '2023-11-16 06:25:07', '2023-11-16 06:25:07'),
(90, 'Prof. Raoul Grady MD', 'Brendon', 'Hermann', 'johnson08@example.net', '2023-11-16 06:25:06', '$2y$12$fTx3X17expNMlzRDJYKr9uOjdBANumVeEfTrUSYDyCXp.gFxj.2tO', 'SMdCXDVRAC', '2023-11-16 06:25:07', '2023-11-16 06:25:07'),
(91, 'Katheryn Kirlin', 'Major', 'Kuvalis', 'idella91@example.com', '2023-11-16 06:25:06', '$2y$12$fTx3X17expNMlzRDJYKr9uOjdBANumVeEfTrUSYDyCXp.gFxj.2tO', 'nZSOMUYavw', '2023-11-16 06:25:07', '2023-11-16 06:25:07'),
(92, 'Nicklaus Kiehn', 'Rahul', 'Kautzer', 'stracke.kadin@example.org', '2023-11-16 06:25:06', '$2y$12$fTx3X17expNMlzRDJYKr9uOjdBANumVeEfTrUSYDyCXp.gFxj.2tO', 'eq9ZQ5wwBB', '2023-11-16 06:25:07', '2023-11-16 06:25:07'),
(93, 'Mr. Rahul Bergnaum', 'Thurman', 'Rosenbaum', 'dillon28@example.com', '2023-11-16 06:25:06', '$2y$12$fTx3X17expNMlzRDJYKr9uOjdBANumVeEfTrUSYDyCXp.gFxj.2tO', 'Cvl3vaQDgP', '2023-11-16 06:25:07', '2023-11-16 06:25:07'),
(94, 'Rashawn Casper', 'Bryce', 'Ernser', 'kilback.raegan@example.com', '2023-11-16 06:25:06', '$2y$12$fTx3X17expNMlzRDJYKr9uOjdBANumVeEfTrUSYDyCXp.gFxj.2tO', 'Xr1mOJGv2B', '2023-11-16 06:25:07', '2023-11-16 06:25:07'),
(95, 'Andy Heidenreich', 'Kamille', 'Runolfsdottir', 'daugherty.morgan@example.org', '2023-11-16 06:25:06', '$2y$12$fTx3X17expNMlzRDJYKr9uOjdBANumVeEfTrUSYDyCXp.gFxj.2tO', 'AsfUQdBmGU', '2023-11-16 06:25:07', '2023-11-16 06:25:07'),
(96, 'Miss Deborah Gerhold II', 'Danika', 'Bruen', 'manuela33@example.com', '2023-11-16 06:25:06', '$2y$12$fTx3X17expNMlzRDJYKr9uOjdBANumVeEfTrUSYDyCXp.gFxj.2tO', 'KhDx9EXgcU', '2023-11-16 06:25:07', '2023-11-16 06:25:07'),
(97, 'Giovanny Sipes', 'Nora', 'Champlin', 'gfeeney@example.org', '2023-11-16 06:25:06', '$2y$12$fTx3X17expNMlzRDJYKr9uOjdBANumVeEfTrUSYDyCXp.gFxj.2tO', 'RZYPOrz0As', '2023-11-16 06:25:07', '2023-11-16 06:25:07'),
(98, 'Mr. Cicero Gottlieb V', 'Owen', 'Zboncak', 'charley78@example.com', '2023-11-16 06:25:06', '$2y$12$fTx3X17expNMlzRDJYKr9uOjdBANumVeEfTrUSYDyCXp.gFxj.2tO', 'quWcuPKdHb', '2023-11-16 06:25:07', '2023-11-16 06:25:07'),
(99, 'Griffin Von DDS', 'Frank', 'Schroeder', 'gweber@example.net', '2023-11-16 06:25:06', '$2y$12$fTx3X17expNMlzRDJYKr9uOjdBANumVeEfTrUSYDyCXp.gFxj.2tO', 'C3wgQr0V3L', '2023-11-16 06:25:07', '2023-11-16 06:25:07'),
(100, 'Selina Runte', 'Dennis', 'Douglas', 'dianna91@example.net', '2023-11-16 06:25:06', '$2y$12$fTx3X17expNMlzRDJYKr9uOjdBANumVeEfTrUSYDyCXp.gFxj.2tO', 'vHbmajdfSt', '2023-11-16 06:25:07', '2023-11-16 06:25:07'),
(101, 'Matteo Gulgowski', 'Arno', 'Marvin', 'demond31@example.com', '2023-11-16 06:25:06', '$2y$12$fTx3X17expNMlzRDJYKr9uOjdBANumVeEfTrUSYDyCXp.gFxj.2tO', 'CBU5Ex2ri5', '2023-11-16 06:25:07', '2023-11-16 06:25:07'),
(102, 'Dariana Swift', 'Katarina', 'Osinski', 'mlindgren@example.com', '2023-11-16 06:25:28', '$2y$12$8gfsbNLiGLil5BEc7T1S1OBD9LPJMCx18FDZr8lVz8gbeMq3ov7YS', 'Nw4YIcSMKb', '2023-11-16 06:25:28', '2023-11-16 06:25:28'),
(103, 'Prof. Jammie Cruickshank', 'Caterina', 'Ankunding', 'deonte90@example.com', '2023-11-16 06:25:28', '$2y$12$8gfsbNLiGLil5BEc7T1S1OBD9LPJMCx18FDZr8lVz8gbeMq3ov7YS', 'ARg5CByqvi', '2023-11-16 06:25:28', '2023-11-16 06:25:28'),
(104, 'Consuelo Koss', 'Osborne', 'Barrows', 'nichole24@example.com', '2023-11-16 06:25:28', '$2y$12$8gfsbNLiGLil5BEc7T1S1OBD9LPJMCx18FDZr8lVz8gbeMq3ov7YS', 'rpXYHxxK8I', '2023-11-16 06:25:28', '2023-11-16 06:25:28'),
(105, 'Walton Windler', 'Danyka', 'Lehner', 'faustino.cassin@example.net', '2023-11-16 06:25:28', '$2y$12$8gfsbNLiGLil5BEc7T1S1OBD9LPJMCx18FDZr8lVz8gbeMq3ov7YS', 'tIssQpVCzf', '2023-11-16 06:25:28', '2023-11-16 06:25:28'),
(106, 'Jammie Ruecker', 'Abigail', 'Abbott', 'era.crona@example.net', '2023-11-16 06:25:28', '$2y$12$8gfsbNLiGLil5BEc7T1S1OBD9LPJMCx18FDZr8lVz8gbeMq3ov7YS', 'vmray5c8Ho', '2023-11-16 06:25:28', '2023-11-16 06:25:28'),
(107, 'Dr. Lucinda Johnson', 'Fleta', 'Yundt', 'dubuque.osbaldo@example.net', '2023-11-16 06:25:28', '$2y$12$8gfsbNLiGLil5BEc7T1S1OBD9LPJMCx18FDZr8lVz8gbeMq3ov7YS', 'c9VkkpTy19', '2023-11-16 06:25:28', '2023-11-16 06:25:28'),
(108, 'Prof. Lew Schumm', 'Laisha', 'Schuppe', 'nathanael.damore@example.net', '2023-11-16 06:25:28', '$2y$12$8gfsbNLiGLil5BEc7T1S1OBD9LPJMCx18FDZr8lVz8gbeMq3ov7YS', '82INyp1SDN', '2023-11-16 06:25:28', '2023-11-16 06:25:28'),
(109, 'Cary Williamson IV', 'Lexus', 'Walsh', 'myrna.upton@example.org', '2023-11-16 06:25:28', '$2y$12$8gfsbNLiGLil5BEc7T1S1OBD9LPJMCx18FDZr8lVz8gbeMq3ov7YS', '31k51fgFxn', '2023-11-16 06:25:28', '2023-11-16 06:25:28'),
(110, 'Favian Jaskolski', 'Maximillian', 'Torphy', 'runte.curtis@example.org', '2023-11-16 06:25:28', '$2y$12$8gfsbNLiGLil5BEc7T1S1OBD9LPJMCx18FDZr8lVz8gbeMq3ov7YS', 'dP2eppyr2G', '2023-11-16 06:25:28', '2023-11-16 06:25:28'),
(111, 'Ramona Murazik', 'Carole', 'Gottlieb', 'everette96@example.com', '2023-11-16 06:25:28', '$2y$12$8gfsbNLiGLil5BEc7T1S1OBD9LPJMCx18FDZr8lVz8gbeMq3ov7YS', 'bY5OcwdsKX', '2023-11-16 06:25:28', '2023-11-16 06:25:28'),
(112, 'Dr. Tyree Effertz', 'Elliot', 'Kris', 'savanah.marks@example.com', '2023-11-16 06:25:28', '$2y$12$8gfsbNLiGLil5BEc7T1S1OBD9LPJMCx18FDZr8lVz8gbeMq3ov7YS', 'AmUHk5lgTx', '2023-11-16 06:25:28', '2023-11-16 06:25:28'),
(113, 'Quinten Moore', 'Icie', 'Cassin', 'clebsack@example.org', '2023-11-16 06:25:28', '$2y$12$8gfsbNLiGLil5BEc7T1S1OBD9LPJMCx18FDZr8lVz8gbeMq3ov7YS', 'R0V2BkHYsf', '2023-11-16 06:25:28', '2023-11-16 06:25:28'),
(114, 'Dahlia DuBuque', 'Casper', 'Langosh', 'jade.schamberger@example.org', '2023-11-16 06:25:28', '$2y$12$8gfsbNLiGLil5BEc7T1S1OBD9LPJMCx18FDZr8lVz8gbeMq3ov7YS', '2tz4oBinQg', '2023-11-16 06:25:28', '2023-11-16 06:25:28'),
(117, 'Jalen Kohler', 'Esta', 'Wilkinson', 'tamara.murphy@example.org', '2023-11-16 06:27:06', '$2y$12$g54Cu0LMYHeZcAnDiEhr..WJ/2SvQnry8N77du9690MtOaVPgrtcu', 'KoLO2fSWaF', '2023-11-16 06:27:06', '2023-11-16 06:27:06'),
(118, 'Kaitlyn Stiedemann', 'Doris', 'Kuhn', 'damore.zelma@example.com', '2023-11-16 06:27:06', '$2y$12$g54Cu0LMYHeZcAnDiEhr..WJ/2SvQnry8N77du9690MtOaVPgrtcu', '4C7cp5xzJZ', '2023-11-16 06:27:06', '2023-11-16 06:27:06'),
(120, 'Anabel Mraz', 'Magdalen', 'Brown', 'alessia.baumbach@example.org', '2023-11-16 06:27:06', '$2y$12$g54Cu0LMYHeZcAnDiEhr..WJ/2SvQnry8N77du9690MtOaVPgrtcu', 'CyVpCVTbel', '2023-11-16 06:27:06', '2023-11-16 06:27:06'),
(122, 'Davion Bosco', 'Arturo', 'Bahringer', 'sydney17@example.net', '2023-11-16 06:27:06', '$2y$12$g54Cu0LMYHeZcAnDiEhr..WJ/2SvQnry8N77du9690MtOaVPgrtcu', 'EhsR2lSZ8u', '2023-11-16 06:27:06', '2023-11-16 06:27:06'),
(123, 'Theodora Heaney IV', 'Dovie', 'Mayer', 'wwehner@example.org', '2023-11-16 06:27:06', '$2y$12$g54Cu0LMYHeZcAnDiEhr..WJ/2SvQnry8N77du9690MtOaVPgrtcu', 'iMGpZv0IYf', '2023-11-16 06:27:06', '2023-11-16 06:27:06'),
(124, 'Arianna Pouros', 'Jordane', 'Tremblay', 'abernathy.adrien@example.org', '2023-11-16 06:27:06', '$2y$12$g54Cu0LMYHeZcAnDiEhr..WJ/2SvQnry8N77du9690MtOaVPgrtcu', 'kVshbQg1GS', '2023-11-16 06:27:06', '2023-11-16 06:27:06'),
(125, 'Sebastian Kemmer', 'Chandler', 'Hyatt', 'frederique.gislason@example.org', '2023-11-16 06:27:06', '$2y$12$g54Cu0LMYHeZcAnDiEhr..WJ/2SvQnry8N77du9690MtOaVPgrtcu', 'dfl2vEvxXa', '2023-11-16 06:27:06', '2023-11-16 06:27:06'),
(126, 'Morris Torp', 'Cicero', 'Stiedemann', 'dare.greg@example.org', '2023-11-16 06:27:06', '$2y$12$g54Cu0LMYHeZcAnDiEhr..WJ/2SvQnry8N77du9690MtOaVPgrtcu', '9oe6R4KILS', '2023-11-16 06:27:06', '2023-11-16 06:27:06'),
(127, 'Dr. Annetta Morissette', 'Sasha', 'Kemmer', 'haven35@example.com', '2023-11-16 06:27:06', '$2y$12$g54Cu0LMYHeZcAnDiEhr..WJ/2SvQnry8N77du9690MtOaVPgrtcu', 'GSDkliyEVQ', '2023-11-16 06:27:06', '2023-11-16 06:27:06');

-- 
-- Вывод данных для таблицы time_tb
--
INSERT INTO time_tb VALUES
(1, '2024-01-07', '00:00:00', '', 0, 0),
(2, '2024-01-07', '00:15:00', '', 0, 0),
(3, '2024-01-07', '00:30:00', '', 0, 0),
(4, '2024-01-07', '00:45:00', '', 0, 0),
(5, '2024-01-07', '01:00:00', '', 0, 0),
(6, '2024-01-07', '01:15:00', '', 0, 0),
(7, '2024-01-07', '01:30:00', '', 0, 0),
(8, '2024-01-07', '01:45:00', '', 0, 0),
(9, '2024-01-07', '02:00:00', '', 0, 0),
(10, '2024-01-07', '02:15:00', '', 0, 0),
(11, '2024-01-07', '02:30:00', '', 0, 0),
(12, '2024-01-07', '02:45:00', '', 0, 0),
(13, '2024-01-07', '03:00:00', '', 0, 0),
(14, '2024-01-07', '03:15:00', '', 0, 0),
(15, '2024-01-07', '03:30:00', '', 0, 0),
(16, '2024-01-07', '03:45:00', '', 0, 0),
(17, '2024-01-07', '04:00:00', '', 0, 0),
(18, '2024-01-07', '04:15:00', '', 0, 0),
(19, '2024-01-07', '04:30:00', '', 0, 0),
(20, '2024-01-07', '04:45:00', '', 0, 0),
(21, '2024-01-07', '05:00:00', '', 0, 0),
(22, '2024-01-07', '05:15:00', '', 0, 0),
(23, '2024-01-07', '05:30:00', '', 0, 0),
(24, '2024-01-07', '05:45:00', '', 0, 0),
(25, '2024-01-07', '06:00:00', '', 0, 0),
(26, '2024-01-07', '06:15:00', '', 0, 0),
(27, '2024-01-07', '06:30:00', '', 0, 0),
(28, '2024-01-07', '06:45:00', '', 0, 0),
(29, '2024-01-07', '07:00:00', '', 0, 0),
(30, '2024-01-07', '07:15:00', '', 0, 0),
(31, '2024-01-07', '07:30:00', '', 0, 0),
(32, '2024-01-07', '07:45:00', '', 0, 0),
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
(52, '2024-01-07', '12:45:00', '', 0, 0),
(53, '2024-01-07', '13:00:00', '', 0, 0),
(54, '2024-01-07', '13:15:00', '', 0, 0),
(55, '2024-01-07', '13:30:00', '', 0, 0),
(56, '2024-01-07', '13:45:00', '', 0, 0),
(57, '2024-01-07', '14:00:00', '', 0, 0),
(58, '2024-01-07', '14:15:00', '', 0, 0),
(59, '2024-01-07', '14:30:00', '', 0, 0),
(60, '2024-01-07', '14:45:00', '', 0, 0),
(61, '2024-01-07', '15:00:00', '', 0, 0),
(62, '2024-01-07', '15:15:00', '', 0, 0),
(63, '2024-01-07', '15:30:00', '', 0, 0),
(64, '2024-01-07', '15:45:00', '', 0, 0),
(65, '2024-01-07', '16:00:00', '', 0, 0),
(66, '2024-01-07', '16:15:00', '', 0, 0),
(67, '2024-01-07', '16:30:00', '', 0, 0),
(68, '2024-01-07', '16:45:00', '', 0, 0),
(69, '2024-01-07', '17:00:00', '', 0, 0),
(70, '2024-01-07', '17:15:00', '', 0, 0),
(71, '2024-01-07', '17:30:00', '', 0, 0),
(72, '2024-01-07', '17:45:00', '', 0, 0),
(73, '2024-01-07', '18:00:00', '', 0, 0),
(74, '2024-01-07', '18:15:00', '', 0, 0),
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
(93, '2024-01-07', '23:00:00', '', 0, 0),
(94, '2024-01-07', '23:15:00', '', 0, 0),
(95, '2024-01-07', '23:30:00', '', 0, 0),
(96, '2024-01-07', '23:45:00', '', 0, 0);

-- 
-- Вывод данных для таблицы time_list
--
INSERT INTO time_list VALUES
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

-- 
-- Вывод данных для таблицы temp_order_details
--
-- Таблица banya.temp_order_details не содержит данных

-- 
-- Вывод данных для таблицы temp_orders
--
INSERT INTO temp_orders VALUES
(1, '1', '2024-01-27', 1, 1, 1, 1, 0.00, NULL, NULL, NULL);

-- 
-- Вывод данных для таблицы personal_access_tokens
--
-- Таблица banya.personal_access_tokens не содержит данных

-- 
-- Вывод данных для таблицы permissions
--
-- Таблица banya.permissions не содержит данных

-- 
-- Вывод данных для таблицы password_reset_tokens
--
-- Таблица banya.password_reset_tokens не содержит данных

-- 
-- Вывод данных для таблицы order_details
--
INSERT INTO order_details VALUES
(1, 'bir', 1, 1, 3, 4, '08:00:00', '10:30:00', 1.00, 100.00, NULL, NULL, NULL),
(2, 'bi', 1, 1, 3, 4, '10:30:00', '12:45:00', 2.00, 120.00, NULL, NULL, NULL),
(3, 'vcx', 1, 1, 1, 4, '14:00:00', '16:15:00', NULL, NULL, NULL, NULL, NULL),
(4, 'fds', 1, 1, 3, 4, '00:00:00', '00:30:00', 1.00, 50.00, NULL, NULL, NULL),
(5, 'gg', 1, 1, 3, 4, '01:00:00', '02:00:00', NULL, NULL, NULL, NULL, NULL);

-- 
-- Вывод данных для таблицы newtable
--
-- Таблица banya.newtable не содержит данных

-- 
-- Вывод данных для таблицы migrations
--
INSERT INTO migrations VALUES
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
(20, '2023_12_24_141733_create_events_table', 6);

-- 
-- Вывод данных для таблицы failed_jobs
--
-- Таблица banya.failed_jobs не содержит данных

-- 
-- Вывод данных для таблицы events
--
INSERT INTO events VALUES
(1, 'Booking', NULL, NULL, 1, 00000000000000000036, 1, '2024-01-03 01:00:00', '2024-01-03 01:15:00', '2024-01-05 18:13:33', '2024-01-05 18:13:33'),
(2, 'Booking', NULL, NULL, 1, 00000000000000000016, 1, '2024-01-05 02:00:00', '2024-01-05 02:30:00', '2024-01-05 18:14:03', '2024-01-05 18:14:03'),
(3, 'Booking', NULL, NULL, 1, 00000000000000000047, 3, '2024-01-06 03:00:00', '2024-01-06 03:15:00', '2024-01-05 18:15:03', '2024-01-05 18:15:03'),
(4, 'Booking', NULL, NULL, 1, 00000000000000000029, 2, '2024-01-06 01:30:00', '2024-01-06 01:45:00', '2024-01-05 18:17:07', '2024-01-05 18:17:07'),
(5, 'Booking', NULL, NULL, 1, 00000000000000000024, 2, '2024-01-05 02:45:00', '2024-01-05 03:15:00', '2024-01-05 18:30:38', '2024-01-05 18:30:38'),
(6, 'Booking', NULL, NULL, 1, 00000000000000000027, 2, '2024-01-07 03:45:00', '2024-01-07 05:30:00', '2024-01-07 11:22:19', '2024-01-07 11:22:19');

-- 
-- Вывод данных для таблицы discounts
--
-- Таблица banya.discounts не содержит данных

-- 
-- Вывод данных для таблицы addresses
--
INSERT INTO addresses VALUES
(11, 3, '237 Lee Drive\nMcKenzieport, KY 46393', '2023-11-16 06:31:00', '2023-11-16 06:31:00'),
(12, 3, '812 Weimann Track\nMrazmouth, RI 24069', '2023-11-16 06:31:00', '2023-11-16 06:31:00'),
(13, 3, '703 Cartwright Station\nNorth Emmymouth, NM 86767', '2023-11-16 06:31:00', '2023-11-16 06:31:00'),
(14, 1, '5026 Isabelle Island\nKochtown, MA 59273-6265', '2023-11-16 06:31:00', '2023-11-16 06:31:00'),
(15, 2, '447 Ford Streets\nSouth Levibury, FL 48109-3062', '2023-11-16 06:31:00', '2023-11-16 06:31:00'),
(16, 1, '17453 Shields Falls\nZoeborough, OK 42642', '2023-11-16 06:31:00', '2023-11-16 06:31:00'),
(17, 1, '6039 Schmidt Forest\nNew Katelynnton, SD 17245-6572', '2023-11-16 06:31:00', '2023-11-16 06:31:00'),
(18, 3, '30713 Lennie Fort Suite 518\nKuvalismouth, IL 01614', '2023-11-16 06:31:00', '2023-11-16 06:31:00'),
(19, 2, '3180 Houston Manor Apt. 147\nFeilstad, IA 80115', '2023-11-16 06:31:00', '2023-11-16 06:31:00'),
(20, 1, '80192 Leanne Track\nPamelaside, IN 71926', '2023-11-16 06:31:00', '2023-11-16 06:31:00');

-- 
-- Восстановить предыдущий режим SQL (SQL mode)
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Включение внешних ключей
-- 
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;